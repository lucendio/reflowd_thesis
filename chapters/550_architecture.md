## Architecture



By taking all previous sections, their discussions and the requirements as well into account, this 
section serves the sole purpose of figuring out how all the different concepts and conclusions 
discussed before can fit together in an overall system architecture that is organized in either a 
distributed or a monolithic manner. This type of changes should not impact how the system's 
interfaces behave from a user perspective.

The foundation of this project is a server-client Architecture, which is chosen for a) providing 
availability ([S.A.05](#sa05)) and b) separating some concerns 
[@web_2016_wikipedia_separation-of-concerns]. Such a distributed system provides various locations
to place these concerns, which are in fact different environments with different properties.
Those combinations of locations and environments are herein after called *platforms*. To further 
describe these *platforms* characteristics such as architectural layer and access possibilities to 
it's internals are taken into account. This results in the following three types of *platforms*:


+---------+---------+---------------+---------------+-----------+----------------------------------+
| Type    | trusted | private       | controlled by | Layer     | Purpose                          |
+:========+:=======:+:=============:+:=============:+:=========:+:=================================+
| Server  | yes     | yes           | data subject  | back end  | -    business logic              |
|         |         |               |               |           | -    third-party interfaces      |
|         |         |               |               |           | -    data storage                |
+---------+---------+---------------+---------------+-----------+----------------------------------+
| Desktop | no      | no            | data subject  | front end | -    based on web technologies   |
+---------+---------+---------------+---------------+-----------+----------------------------------+
| Mobile  | no      | conditionally | data subject  | front end | -    typically mobiles devices   |
|         |         |               |               |           | -    based on host-specific      |
|         |         |               |               |           |      native technologies         |
|         |         |               |               |           | -    data storage                |
+---------+---------+---------------+---------------+-----------+----------------------------------+

Table: All platform types where components of the *PDaaS* architecture can be placed 


The next step is to determine those components, that are required in order to cover most of the 
defined use cases. The conglomeration below highlights all major components, including the platforms
in which they could be positioned, in addition to further details about their purpose(s) and 
relation(s) to each other.

##### Web server

*Platform:* Server

*Purpose:*
+   serve web-based user interface(s)
+   handle all in- & outgoing traffic (outmost layer)
+   revers proxying certain traffic to different components
+   en- & decrypt HTTPS traffic, thus authenticate *consumers*
+   load balancing (if necessary)
+   web client notification

*Technologies:*
+   HTTP
+   TLS
+   WebSockets


##### Permission Manager

*Platform:* Server

*Purpose:*
*   creating *permission profiles*
+   permission validation
+   examine data queries 
+   queue *consumer* requests

*Technologies:*

    
##### PKI

*Platform:* Server

*Purpose:*
+   CA
+   manage keys and certificates per *endpoint*
+   obtain trusted certificates from public CAs

*Technologies:*
+   X.509
+   ACME [@web_spec_acme] (Let's Encrypt)


##### Storage Connector

*Platform:* Server

*Purpose:*
+   abstracts to system agnostic Query Language
+   queries personal data, regardless of where it's located

*Technologies:*
+   driver for used database 


##### Operator API

*Platform:* Server

*Purpose:*
+   authenticates *operator*
+   writes personal data through Storage Connector 
+   provides relevant data, such as history
+   system configuration

*Technologies:*
+   JWT


##### Code Execution Environment

*Platform:* Server

*Purpose:*
+   isolated runtime (sandbox) for computations/programs provided by *consumers*
+   restrict interaction with outer environment to absolute minimum (e.g. no shared filesystem 
    or network)
+   one-time use
+   monitor sandbox during computation 
+   examine and test the provided software

*Technologies:*
+   Virtualization
+   Container (OCI)


##### Tracker

*Platform:* Server

*Purpose:*
+   log all changes made with *Storage Connector*
+   tracks states for ongoing consumer requests
+   log all *access requests*

*Technologies:*


##### Personal Data Storage

*Platform:* Server, Mobile

*Purpose:*
+   stores the *operator's* personal data

*Technologies:*
+   non relational database
+   depending on host environment


##### Persistence Layer

*Platform:* Server

*Purpose:*
+   stores Permission Profiles, History, Tokens, Configurations and other application data
+   cache runtime data and information
+   holds keys

*Technologies:*
+   non relational database
+   Filesystem


##### Notification Infrastructure

*Platform:* Server

*Purpose:*
+   notifies about everything that needs *operator's* approval (e.g. new registrations, new 
    *permission requests*)

*Technologies:*
+   WebSockets for web UIs via local web server
+   mobile device manufacturer's Push Notification server for mobile apps 


##### User Interface

*Platform:* Desktop, Mobile

*Purpose:*
+   access restricted to *operator* only
+   access & permission management
+   data management (editor, types & import)
+   history and log viewer
+   system monitoring

*Technologies:*
+   HTML, CSS, Javascript
+   Java
+   Swift, Objective-C


After outlining all different components while keeping the aspect of portability ([S.A.02](#sa02))
in mind, it needs to be figured out which arrangements make sense and what variations might be 
possible. The result are two, more or less, distinct designs that are proposed. As stated above, one 
is a more monolithic approach and the other involve more platform types and demonstrates the
flexibility.

![PDaaS Architecture, monolithic composition](./assets/figures/TODO_pdaas_component-composition_monolithic.jpg){#fig:composition-monolithic}

![PDaaS Architecture, distributed composition](./assets/figures/TODO_pdaas_component-composition_distributed.jpg){#fig:composition-distributed}


The main difference between the two compositions is the lack of the mobile platform in the more
monolithic approach (Figure @fig:composition-monolithic). Although *monolithic* refers only to the 
components arrangement on the *server* platform. It is also imaginable that all server components 
not necessarily have to be placed into one server environment, but being distribute over several 
virtual machines or containers, so that they can scale and run more independently. This can improve 
*redundancy* as well.

In theory, a possible version of the arrangement would be to move all components to either the 
client or the mobile platform. This comes along with some downsides and major issues that are 
anything but trivial to solve. Aside from ensuring a nearly 100% uptime and localization in a
landscape where NAT [^abbr_nat] and dynamic IPs are still common practice, not only on the mobile
platform but on the client platform as well, all component, but the user interface, needs to be 
implemented with native technologies. Nevertheless, from a *operator's* perspective it would mean 
having all components at hand and therefore full control over the *PDaaS*, it still would lack of 
major requirements, though.

Aside from providing the *operator* with a non-stationary and instantly accessible interface to her 
*PDaaS*, involving a *mobile platform* has the purpose of enabling the *data subject* to carry all 
her sensitive data along. This is considered a major advantage over the monolithic approach, were
all the personal data is located in the *"cloud"*. Depending on the perspective, it can either be 
seen as a *singe source of truth* or a *single point of failure*. Regardless of that, it introduces 
the demand of a backup or some redundancy concept, which has briefly been touched on in the 
discussion about database system requirements within the [*data* section](#data). 
A mobile platform being part of the system makes it more easier for the *data subject* to establish 
a security concept, in which the relation the between personal data storage and the rest of the 
system is much more liberated, so that all access attempts only happen under full supervision.
It is debatable whether to place the *permission profiles* in the *persistence layer* among all 
other domain-related information, or put it into the *personal data storage* as well or define it as 
an own storage component, in order to be flexible regarding it's location.

Authenticating *consumers* is performed based on TLS by the web server and it's configured 
subdomains including their individual keys and certificates provided by the *PKI*. The *operator* 
authentication is either done by the *Operator API* or by the *web server*, depending on the *web 
server's* capabilities. Though, it makes more sense, to entrust the *web server* with that task, 
because it's the outmost component and it would prevent unauthorized and potential malicious 
requests from getting further into the system. And since a native client on a mobile platform is 
considered *private*, it is reasonable to change the *operator* authentication from JWT-based to 
TLS-based *two-way authentication*, which would otherwise be inconvenient when using web-based 
clients.
 
If there are components that are only placed on the server and that have to communicate between each 
other, but are separated into independent processes, then some inter-process communication need to 
be established (e.g. sockets). It is also conceivable that inter-communication between server 
components could be unidirectional only. Approaches like changing configuration files by writing to 
the filesystem can therefor be feasible in some cases. Components that can vary in terms of their 
platform, have to communicate to the other components via *HTTPS*.

The architecture implicitly distinguishes between two different groups of endpoints. These endpoints
are made available by the *web server*, which reverse-proxys incoming connections to role-related 
(*operator* or *data consumer*) components. Starting from that, this separation can be further 
brought simply by encapsulating those components into services, that either are related to one of
the roles or used by both. This basically results in the *web server* communicating with the two 
role services in a bidirectional manner.
The group of endpoints for *data consumers* mainly consists of those were *access requests* and 
*permission requests* are coming in and the public one, that is used for *consumer* registrations.
The other one is a small group of endpoints required for all the tools the *operator* might need;
from data API or notification through to authentication and web-based user interface.


Considering the rapid growth of emerging website and applications, which all require user 
registration, users are getting tired of creating new accounts. Hence they tend to reuse their 
password(s). Providers started outsource that sensitive topic of user management by integrating 
third party authentication services, which not only makes is almost effortless to implement, but 
also leaves the responsibility as well as the accessibility to those service owners. Whereas users
get the benefit of just using one account for all her apps - a universal key so to say, but only 
one exemplar. So the downside here is, only a handful of third parties 
[@web_2009-success-of-facebook-connect] provide those authentication services.  
OpenID is designed with a very specific type of scenarios in mind, namely the one just described - 
bringing decentralisation to the market of authentication services - which differs from those 
addressed by the *PDaaS*; at least, when it comes to *data consumer* interactions. Although, the 
*PDaaS* has the ability to become the digital representation of it's *operator*. Hence it can and 
also should be used to authenticate that individual against an external parties.  



*Conclusions:*
Considering amount of effort a single-platform version, namely client or mobile, would take to get 
fully operational with respect to the specification, it is not only reasonable but also more secure 
to involve a server environment with proper security measures, static IP and high availability. Even
if that server is a local machine connected to the *data subject's* private network. That said, it 
is sufficient to start with the *monolithic* approach and as suitable mobile applications emerge 
that are supporting major administration features, notifications and *personal data storage*, it 
should be possible to migrate effortlessly towards the *distributed* approach that comes with a 
higher level , because all the sensitive personal data somewhere on a computer machine.
As of the proposed architecture all components (or group of components) are portable and therefore
relocatable among the suggested platforms; and with the introduced authentication method for 
*operators* using multiple clients the for the same *PDaaS* are thereby supports and can be 
implemented with almost no effort, which covers more use cases.
As a supplement, an *identity provider* based on the OpenID standard would fit nicely into the 
existing arrangement and not interfering with the other components. However, it is beyond the scope 
of this work to make elaborate on this topic. For now it is stated as a feasible and logical 
addition to the *PDaaS*.



[^abbr_nat]: Network Address Translation; practice of routing traffic between and through distinct 
    networks address spaces by remapping IPs from those different networks onto each other  

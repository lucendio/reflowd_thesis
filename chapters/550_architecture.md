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

*Technologies:*
+   X.509


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
+   notify about everything that needs *operator's* approval (e.g. new registrations, new 
    *permission requests*)

*Technologies:*
+   WebSockets for web UIs via local web server
+   mobile device manufacturer's Push Notification server for mobile apps 


##### User interface

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
is a more monolithic approach and the other enables the *data subject* to carry all her personal 
data along.

![PDaaS Architecture, monolithic composition](./assets/figures/TODO_pdaas_component-composition_monolithic.jpg){#fig:composition-monolithic}

![PDaaS Architecture, distributed composition](./assets/figures/TODO_pdaas_component-composition_distributed.jpg){#fig:composition-distributed}


The main difference between the two compositions is the lack of the mobile platform in the more
monolithic approach (Figure @fig:composition-monolithic). Although *monolithic* only refers to the 
platform type *server*. It is imaginable as well that all server components are not necessarily have 
to be placed into one server environment, but being distribute over several virtual machines or 
containers, so that they can scale and run more independently. This can improve *redundancy* as 
well. 

TODO: where are reasonable places to locate the storage that holds the operators's personal data

+ It is debatable whether to place the *permission profiles* in the *persistence layer* among 
all other domain-related information, put it into the *personal data storage* or define it as an
own storage component, in order to be flexible regarding it's location.

If components that are only placed on the server, have to communicate between each other but are 
separated into independent processes, then some inter-process communication need to be established 
(e.g. sockets). It is also conceivable that other interactions might only be unidirectional, 
therefor approaches like changing configuration files by writing to the filesystem can be feasible
in some cases.
These components that are vary in terms of the platform where can be placed, has to communicate to 
the other components via *HTTPS*.

Authenticating *consumers* is done by the web server based on TLS, the assigned subdomains and
the keys and certificates provided by the PKI. The *operator* authentication is either done by
the *Operator API* or by the *web server*, depending on the *web server's* capabilities. Although,
it makes more sense to entrust the *web server* with that task, because it is the outmost 
component and it would prevent unauthorized and potential malicious requests from getting further
into the system.






TODO: OpenID as auth services (like fb for other platforms)
As discussed in previous sections the *PDaaS* has it's qualities to be seen and valued as a digital 
representation of the individual that operates that system. Hence it could also be used to 
authenticate the individual against an external platform. Although it is priorly argued, that for 
authentication and security reasons the system is designed to be self-contained. But providing 
those OpenID capabilities isn't something the *PDaaS* depends on, instead external platforms would 
depend on the *PDaaS* supporting that feature. It is imaginable, that an OpenID instance mapping on 
a single individual would simplify the authentication procedure provided by that technology.
However, it is beyond the scope of this work to either do further investigations regarding that 
topic, nor elaborate on how this might look integrate with the currently developed feature-set.


+   regarding oAuth as authentication:
Priorly users tended to reuse their password for
different account, nowadays they but also
tend to get tired of creating new accounts and profiles over and over again instead of having
just one account for everything [@web_2009-success-of-facebook-connect].

Thus the platform owners leave the responsibility of 

Many websites and platforms
understand those *login-with $platformName* mechanisms as an outsourced service that handles all
security- and user-related tasks.









*Conclusions:*
+   distributed architecture (e.g. notification/queue server + mobile device for persistence
    and administration)
+   the previously proposed authentication concept for the *operator* role supports multiple  
    clients and with the suggested technologies it can be implemented with almost no effort

## Architecture



By taking all requirements in previous sections and their discussions into account, this section has 
the purpose of figuring out how all the different concepts and conclusions from this chapter can fit 
together in an overall system architecture that is organized in either a distributed or a 
centralized manner. The outcome of this section should not impact results or conclusions from other 
topics related to the behaviour of the system's interfaces from a user point of view. 

The foundation of this project is a server-client Architecture, which is chosen for providing 
availability ([S.A.05](#sa05)) and separating concerns [@web_2016_wikipedia_separation-of-concerns].
Such a distributed system provides various locations to place these concerns, which are, in fact,
different environments with different properties.
Those combinations of locations and environment properties are herein after called *platforms*. To
further describe these *platforms*, characteristics such as architectural layer and access
possibilities to its host environment are taken into account. The resulting three *platform* types
are shown in Table @tbl:platforms-characteristics. All platforms are considered to be controlled by
the data subject. Here, *trusted* refers to how likely it is that the host environment, and maybe
even the platform, is unintentionally accessed by third parties, whereas *host access* describes the 
possibilities to access the host environment from within the platform (e.g. filesystem to store 
data).


| Platform Type    | trusted | Host Access |  Layer   | Purpose                        |
|:---------|:-------:|:-------:|:--------|:--------------------------------------------|
| Server   | yes     | yes     | back    | - business logic                            |
|   $\ $   |   $\ $  |   $\ $  | end     | - third-party interfaces                    |
|   $\ $   |   $\ $  |   $\ $  |   $\ $  | - data storage                              |
|   $\ $   |   $\ $  |   $\ $  |   $\ $  | $\ $                                        |
| Mobile   | cond.   | yes     | front   | - based on host-specific native             |
|   $\ $   |   $\ $  |   $\ $  | end     | $\ $ technologies                           |
|   $\ $   |   $\ $  |   $\ $  |   $\ $  | - graphical user interface                  |
|   $\ $   |   $\ $  |   $\ $  |   $\ $  | - data storage                              |
|   $\ $   |   $\ $  |   $\ $  |   $\ $  | $\ $                                        |
| Web      | no      | rest.   | front   | - browser                                   |
|   $\ $   |   $\ $  |   $\ $  | end     | - based on web technologies                 |
|   $\ $   |   $\ $  |   $\ $  |   $\ $  | - graphical user interface                  |

Table: Architecture - available platform types for system components {#tbl:platforms-characteristics}


The next step is to determine all the components that are required in order to cover most of the 
defined use cases. The conglomeration below highlights all major components, including information 
about which platforms they could be in, as well as further details about their major task(s), 
underlying technologies, and relation(s) to each other.


#### Web Server {-}

Platform: Server

Tasks:
+   serve web-based user interface(s)
+   handle all in- & outgoing traffic (outmost layer)
+   revers proxying certain traffic to different components
+   en- & decrypt HTTPS traffic, thus authenticate consumers
+   load balancing (if necessary)
+   web notification
+   spam protection

Relations:
+   operator, consumers, third parties
+   any front end platform (Mobile, Web)

Technologies:
+   HTTP
+   TLS
+   WebSockets


#### Permission Manager {-}

Platform: Server

Tasks:
*   creating *permission profiles*
+   access verification
+   examine data queries 
+   queue *consumer* requests

\newpage

Relations:
+   Storage Connector
+   Notification Infrastructure
+   Persistence Layer
+   Tracker
+   Code Execution Environment

Technologies:
+   any modern language/framework capable of parallel computing 


#### PKI {-}

Platform: Server

Tasks:
+   CA
+   manage keys and certificates per *endpoint*
+   obtain trusted certificates from public CAs

Relations:
+   Web Server

Technologies:
+   X.509
+   ACME [@web_spec_acme] (Let's Encrypt)


#### Storage Connector {-}

Platform: Server

Tasks:
+   abstracts to system agnostic query language
+   queries personal data, regardless of where it's located

Relations:
+   Personal Data Storage

Technologies:
+   driver for used database 


#### Operator API {-}

Platform: Server

Tasks:
+   authenticates operator
+   writes personal data through Storage Connector 
+   provides relevant data, such as history
+   system configuration
+   automated data inflow

Relations:
+   Storage Connector
+   Notification Infrastructure
+   PKI
+   Tracker
+   Permission Manager

Technologies:
+   JWT


#### Code Execution Environment {-}

Platform: Server

Tasks:
+   isolated runtime (sandbox) for computations/programs provided by consumers
+   restrict interaction with outer environment to absolute minimum (e.g. no shared filesystem 
    or network)
+   one-time use
+   monitor sandbox during computation 
+   examine and test the provided software

Relations:
+   Permission Manager

Technologies:
+   Hypervisor
+   Container (OCI)


#### Tracker {-}

Platform: Server

Tasks:
+   log all changes made with *Storage Connector*
+   tracks states for ongoing consumer requests
+   log all *access requests*

Relations:
+   Persistence Layer

Technologies:
+   any modern language/framework capable of parallel computing


#### Personal Data Storage {-}

Platform: Server, Mobile

Tasks:
+   stores the *operator's* personal data

Relations:
+   Storage Connector

Technologies:
+   non relational database
+   depending on host environment


#### Persistence Layer {-}

Platform: Server

Tasks:
+   stores Permission Profiles, History, Tokens, Configurations and other application data
+   cache runtime data and information
+   holds keys

Relations:
+   Operator API
+   Permission Manager


Technologies:
+   non relational database
+   Filesystem


#### Notification Infrastructure {-}

Platform: Server

Tasks:
+   notifies about everything that needs operator's approval (e.g. new registrations, new 
    *permission requests*)
    
Relations:
+   Web Server

Technologies:
+   WebSockets for web UIs via local Web Server
+   mobile device manufacturer's Push Notification Service for mobile apps 

\newpage

#### User Interface {-}

Platform: Mobile, Web

Tasks:
+   access restricted to operator only
+   access & permission management
+   data management (editor, types & import)
+   history and log viewer
+   system monitoring

Relations:
+   Web Server
+   Push Notification Service

Technologies:
+   HTML, CSS, Javascript
+   Java
+   Swift, Objective-C

\ \

After outlining all different components, while keeping the aspect of portability ([S.A.02](#sa02))
in mind, it becomes apparent which arrangements make sense and what variations might be possible. As 
a result, two more or less distinct designs are proposed. One is a rather centralized approach and 
the other involves more platform types and outlines a certain flexibility.


![ReFlowd Architecture, centralized composition](./assets/figures/reflowd_component-composition_centralized.png){#fig:composition-centralized}

![ReFlowd Architecture, distributed composition](./assets/figures/reflowd_component-composition_distributed.png){#fig:composition-distributed}


The main difference between the two compositions is the non-existence of the mobile platform in the 
centralized approach (Figure @fig:composition-centralized). Although *centralized* (or monolithic) 
only refers to the components arrangement on a *server* platform, originally consisting of a single
process that contains all components and is thus is responsible for every task.   
It is also imaginable that all server components are note necessarily placed into one server 
environment, but being distributed over several virtual machines or containers, so that they can 
scale and run more independently. This can improve *redundancy* as well.

In theory, it's indeed possible to arrange the components in such a way that they are all located on 
the mobile platform, or even to a desktop device, which are henceforth considered equally in their 
platform properties (as of Table @tbl:platforms-characteristics). However, this comes with downsides
and major issues that are far from trivial to solve. Nevertheless, to not only ensure nearly 100%
uptime and discovery in a landscape where NAT [^abbr_nat] and dynamic IPs are still common practice,
for mobile platforms as well as on the desktop, all components except the user interface are
therefore required to be implemented natively. From an operator's perspective, that would mean to
have all components at hand and, therefore, full control over the *ReFlowd*. It would still raise
security concerns, though, because the devices mentioned before might serve various distinct 
purposes and would therefore introduce potentially vulnerabilities. 

Aside from providing the operator with a non-stationary and instantly accessible interface to her 
*ReFlowd*, involving a *mobile* platform primarily has the purpose of enabling the data subject to 
carry all her sensitive data along. This is considered a major advantage over the centralized 
approach, were all the personal data is located in the *'cloud'*. Depending on the perspective, it 
can either be seen as a *single source of truth* or a *single point of failure*. Regardless of that, 
it introduces the demand of a backup or some redundancy concept, which has briefly been touched on 
in the discussion about database system requirements within the [section on *data*](#data)
*(Chapter 5)*. A *mobile* platform as part of the system makes it more easy for the data subject to 
establish a security concept in which the relation between *Personal Data Storage (PDS)* and the
rest of the system is much more liberated, so that all access attempts only happen under full
supervision. It is debatable whether to place the *permission profiles* in the *Persistence Layer*
among all other domain-related information, put it into the *PDS* too, or define it as having its
own storage component, in order to be flexible in its placing.

The process of obtaining personal data determines that the *PDS* only is accessed by a component
located on the server (*Storage Connector*). Now, moving the *PDS* away form the *server* makes it
more difficult to access. Assuming the host environment provides a simple mechanism to configure its
firewall and listen on a port for incoming connections, which is not very likely, because of 
host-wide security policies, the *Storage Connector* would still need the IP form the device, and 
even then, the already mentioned practice of NAT and dynamic IPs would require a signaling process,
through which a connection to the *Storage Connector* is established.  
Two approaches are proposed to circumvent this issue. Either an ongoing bidirectional connection 
(e.g. WebSockets) can be utilized to push data queries from the *server* platform, or the 
*Storage Connector* queues the queries and informs the operator via Push Notification on pending
attempts to access the *PDS* located on her mobile device, so that she can then actively pull the
queries and push the results back to the *Storage Connector*. Those are two distinct general 
approaches, details may vary.

Authenticating consumers is performed based on TLS by the Web Server and its configured subdomains 
including their individual keys and certificates provided by the *PKI*. The operator authentication
is done either by the *Operator API* or by the *Web Server*, depending on the *Web Server's* 
capabilities. Though, it makes more sense to entrust the *Web Server* with that task, because it's
the outermost component and it would prevent unauthorized and potentially malicious requests from 
getting further into the system. And as mentioned in the conclusion of 
*[Chapter 5 - Authentication](#authentication)* it is reasonable for *mobile* platforms to change
the operator authentication from JWT-based to TLS-based *two-way authentication*, which would
otherwise be inconvenient when using web-based front ends.
 
If components are placed only on the server and require communication with each other but are 
separated into independent processes, then some inter-process communication need to be established 
(e.g. sockets). It is also conceivable that inter-communication between server components could just 
be unidirectional. Approaches like changing configuration files by writing to the filesystem can 
therefore be feasible in some cases. Components that can vary in terms of their platform have to 
communicate to other components via *HTTPS*.

The architecture implicitly distinguishes between two different groups of endpoints. These endpoints
that are made available by the *Web Server*, which reverse-proxys incoming connections to 
role-related (operator or data consumer) components. Starting from that, this separation can be 
driven further by simply encapsulating those components into services, that are related to one of
the roles or used by both. This basically results in the *Web Server* communicating with the two 
role-grouped services in a bidirectional manner.  
The group of endpoints for data consumers mainly consists of those through which *access requests* 
and *permission requests* are coming in and the public one, that is used for when consumers apply 
for registration. The other one is a small group of endpoints required for all tools the operator 
might need; from data API or notification to authentication and web-based user interface.  
Furthermore, it might be considered to partially apply the principles of a RESTful design. However, 
this makes the API potentially more complicated and insufficient, since the *Operator API* does not
follow the concept of resources. Instead, it requires a rather functional design, which makes, for 
example, *Remote Procedure Calls* or a *Publish-Subscribe* pattern more appropriate to use.

Considering the rapid growth of emerging website and applications, which all require user 
registration, users are getting tired of creating new accounts. Hence they tend to reuse their 
password(s). Providers started outsourcing that sensitive topic of user management by integrating 
third party authentication services, which not only makes that feature almost effortless to 
implement, but also leaves the responsibility as well as the accessibility to those service owners. 
Whereas users get the benefit of just using one account for all their apps - a universal key so to 
say, but only one exemplar. So the downside here is, in reality only a handful of third parties 
[@web_2009-success-of-facebook-connect] provide those authentication services.  
*OpenID* is designed with a very specific type of scenarios in mind, namely the one just described - 
bringing decentralization to the market of authentication services - which differs from the ones 
addressed by the *ReFlowd*; at least when it comes to data consumer interactions. The *ReFlowd* has 
the ability to become the digital representation of its operator, therefore it can and should also 
be used to authenticate that individual against external parties.



*__Conclusions:__*
\ \
Considering the amount of effort a single-platform composition, namely on a desktop or mobile
device, would take to get fully operational with respect to the specification, it is not only
reasonable but also more secure to involve a server platform with proper security measures, a static
IP, and high availability, even if that server is a local machine connected to the operator's
private network. That said, it is sufficient to start with the *centralized* approach and as
suitable mobile applications emerge that are supporting major administration features,
notifications, and *Personal Sata Storage*, it should be possible to migrate effortlessly towards
the *distributed* approach that brings a higher level of confidence because all the sensitive
personal data is not on some computer machine somewhere on the internet, but right in the hands of
its owner.  
By the proposed architecture, all components (or groups of components) are portable and therefore
relocatable among the suggested platforms; and with the introduced authentication methods for 
operators, multiple front ends for the same *ReFlowd* are thereby supported and can be implemented 
with almost no effort, which, in return, covers more use cases.  
As a supplement, an *identity provider* based on the OpenID standard would fit nicely into the 
existing arrangement and does not interfere with the other components. However, it is beyond the 
scope of this work to elaborate on this topic. For now it is stated as a feasible and logical 
addition to the *ReFlowd*.



[^abbr_nat]: Network Address Translation; practice of routing traffic between and through distinct 
    networks address spaces by remapping IPs from those different networks onto each other (e.g. by
    utilizing ports)

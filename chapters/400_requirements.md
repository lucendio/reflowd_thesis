Requirements
==========================================



Derived from the [Core Principles](#core-principles), the subsequent requirements shall be served as 
a list of features on the one hand, to get an idea of how the open specification and thus the 
resulting software might look like, and on the other hand to give an overview about priorities 
(can/could, may/might, should, must/have to). 
Other chapters may contain references to specific requirements listed below.



#### Architecture & Design:

__*[S.A.01]{#sa01}* - Accessibility & Compatibility__\
Since the internet is one of the most widely used infrastructure for data transfer and 
communication, it is assumed that all common platforms support underlying technologies, such as 
HTTP and TLS. Thus the emerging system must implement a service based on web technologies, that
provides supervised access to personal data.

__*[S.A.02]{#sa02}* - Portability__\
All major components should be designed and therefore communicate with each other in a way so that 
individual components are able to get relocated while the system has to remain fully functional. It 
must be possible to build a distributed system, that may require to place certain components into 
different environments/devices/platforms. 

__*[S.A.03]{#sa03}* - Roles__\
The system has to define two types of roles (see also [Terminologies](#terminologies)). The first 
one is the [operator](#terminologies--operator), who is in control of the system and, depending on 
the architecture, must be at least one individual but could be more. The operator maintains all the 
data that gets provided trough the system, and decides which third party gets access to what data. 
The second type is a [consumers](#terminologies--consumer). These consumers are external third 
parties that desire to access certain data about or from the operator. 
While the consumer has to interact with the system only via plain HTTP requests, the operator must 
be provided with graphical user interfaces for possibly multiple platforms.

__*[S.A.04]{#sa04}* - Authenticity__\
Since they have to rely on the data, both entities - everyone who belongs to one of the 
*[roles](#sa03)* - have to be able able to verify the authenticity of the opposite' identity as well 
as of the received data, in order to be certain that this data is real and belongs to the sender.
It should be possible to opt out to that level of reliability if it's not necessary, or to opt-in 
selectively for certain types of data. However, if one of the parties demands the other one to 
provide such level, but the other doesn't, then the access attempt has to fail.

__*[S.A.05]{#sa05}* - Availability__\
When third parties are requesting data, it's very likely that those procedures are triggered 
automatically or at least machine-supported. Hence those requests can arrive at the *PDaaS* at any 
point in time. Therefore the *PDaaS*, or at least parts of it, should be available all the time. 
Even if the request can't be processed completely, the system is still able to inform the 
*data subject* about that event; somewhat like an answering machine. This also enhances the *PDaaS* 
as a serious and reliable data source. It also relates to the topic of 
*failure safety and redundancy*.

__*[S.A.06]{#sa06}* - Communication__\
In order to elaborate on [S.A.01](#sa01) and [S.A.02](#sa02), to ensure internal interoperability, 
all communication between components has to happen on HTTPS, if they don't run in the same 
environment.


#### Persistence:

__*[S.P.01]{#sp01}* - Data Outflow__\
Data may leave the system only if it's absolutely necessary and no other option exists to retain 
the goal of the relating process. But if data still has to get transferred, no other than the data 
consumer must be able to access that data. Confidentiality has to be preserved at all cost.

__*[S.P.02]{#sp02}* - Data Relationship__\
Data structures and data models must show high flexibility and may not consist of strong relations 
and serration. If the syntax of the data representation also provides structure elements then it 
should be utilized to also embed semantics.

__*[S.P.03]{#sp03}* - Schema and Structure__\
The operator can create new data types (based on a schema) in order to extend the capabilities of
the data API. Structures and schemas can change over time ([S.P.04](#sp04)). 
Every dataset and data point has to relate to a corresponding type, whether it's a simple type 
(string, integer, boolean, etc.) or a structured composition based on a schema.

__*[S.P.04]{#sp04}* - Write__\
Primarily the operator is the one who has permissions to add, change or remove data. This is done 
either by using the appropriate forms provided by a graphical user interface or with the help of 
other import mechanisms. The latter could be enabled by (A) supporting the upload of files that 
containing supported formats, (B) data APIs restricted to the operator or (C) defining an external 
resource reachable via http (e.g. *RESTful URI*) in order to (semi-)automate further ongoing data 
imports from multiple data resources (e.g. IoT, browser plugin).
Additionally, it might be possible in the future to allow *data consumers* making some data to flow
back into the operator's system, after she is certain that this data is valid and useful for her.

__*[S.P.05]{#sp05}* - Data Redundancy__\
Providing and managing data is the core task here. Hence the system needs to make backups or at 
least provide mechanisms and tools for the *operator* to do that. Different strategies are 
conceivable but have to respect related requirements ([S.P.01](#sp01), [S.A.03](#sa03)) and 
specific environment conditions though. The least feasible solution would be a manual backup only
allowed by the *operator*.

__*[S.P.06]{#sp06}* - Data Precision__\
As stated in the previous chapter about *[Data as a Product](#personal-data-as-a-product)*, the 
level of precision of data has a significant impact on the *data subject's* privacy. Therefore the 
*data subjects* must be provided with the ability to configure how precise certain data should be 
when it is provided to *data consumers* somehow. Those adjustments must have no impact on the actual 
stored data. That is, adjustments have to be made after the data is fetched but before it is further 
processed.


#### Interfaces:

__*[S.I.01]{#si01}* - Documentation__\
The interfaces from all components have to be documented and well specified so that the components 
themselves could be individually replaced without any impact to the rest of the system. This also 
involves comprehensive information on how to communicate and what endpoints are provided, including 
required arguments and result structure.

__*[S.I.02]{#si02}* - External Data Query__\
Data consumer can request a schema, in order to know how the response data will actually look like,
since certain parts of the data structure might change over time (see [S.P.03](#sp03), 
[S.P.04](#sp04)).
In order to check if the access request is permitted, the system first parses and validates the 
query, and eventually proceeds to execution. When querying data from the system, the *data consumer* 
might be required to provide a schema, which should force him to be as precise as possible about 
what data exactly needs to be accessed. In addition to that, the consuming entity must provide some 
*meaningful* text, describing the purpose of the requested data. He should not be allowed to place 
wildcard selectors for sets of data into the query. Instead he must always define a more specific 
filter or a maximum number of items, if the query retrieves more then one element.

__*[S.I.03]{#si03}* - Formats__\
When components communicate between each other or interactions with the system from the outside 
take place, all data send back and forth should be serialized/structured in a JSON or JSON-like
structure.


#### Graphical User Interface:

__*[P.VIU.01]{#pviu01}* - Responsive user interface__\
The graphical user interface has to be responsive to the available space, in order to acknowledge
the divers market of available screen sizes.

__*[P.VIU.02]{#pviu02}* - Platform support__\
All graphical user interfaces must be implemented at least based on web technologies, which are then 
provided by a server and available on any system that comes with a modern browser. To enable 
additional features and deeper integration with the surrounding environment, it is recommended - at 
least for mobile devices - to build user interfaces upon natively supported technologies, such as 
*Swift* and *Java*. The operator would benefit from capabilities such as *push notifications* and 
storing data on that device.

__*[P.VIU.03]{#pviu03}* - Permission Profiles__\
The operator should be capable of filtering, sorting and searching through a list of *permission 
profiles*; for a better administration experience and to easily find certain entries in a 
continuously growing list of profiles.
 
__*[P.VIU.04]{#pviu04}* - Access History__\ 
The operator must be provided with a list of all past *permission and access requests*, in order to 
monitor who is accessing what data and when, and thus being capable of evaluating and eventually 
stopping certain access and data usage. Such tool should have filter, search and sort capabilities. 
It is build upon and therefore requires the [access logging](#pb01) functionality.


#### Interactions:
    
__*[P.I.01]{#pi01}* - Effort__\
Common interactions for use cases, such as changing *profile data*, importing datasets or managing
*permission requests* have to require as little effort as possible. This means short UI response 
time on the one hand and as less single input and interaction steps as possible to complete a task.
Given the circumstances (e.g. distributed architecture, involvement of mobile devices), the 
*permission request review* and *permission profile creation* might become a special challenge to
hide certain complexity.

__*[P.I.02]{#pi02}* - Design__\
Graphical user interfaces must be designed and structured in such a way that is is highly intuitive
for the user to operate. Thus, it is important for example to use meaningful icons and appropriate 
labels. This also refers to a flat and not crammed menu navigation. Context related interaction 
elements should be positioned within the area related to that context.

__*[P.I.03]{#pi03}* - Notifications__\
The user should be notified about every interaction with the system originated by a third party 
immediately after its occurrence, but she has to be notified at least about every *permission
request*. This behaviour should be configurable; depending on the *permission type* and on every 
*permission profile*. Regardless of the configuration, notifications themselves must show up 
decently and pending user interactions must be indicated in the user interface. Notifications do not 
necessarily require a reaction by the operator. 

__*[P.I.04]{#pi04}* - Permission Request & Review__\
A process involving data transaction must be always initiated by the data subjects. So, before a 
*data consumer* is able to access data, first the *operator* needs to *invite* that specific third 
party by either telling him (per URI) where to register or asking him to provide all information 
required for a registration process upfront encoded in QR-Code. Both solutions need a secure channel
for transport, which refers to *TLS*. The latter has to be ensured by the applying third party 
alone, whereas the first option requires the *PDaaS* to provide a TLS-supporting endpoint as well.
After a successful registration, the consumer can submit a *request permission*, which has to 
include information about the *consumer*, what data he wants to access, for what purpose and how 
long or how often the data needs to be accessed. The operator then reviews these information and 
creates an *permission profile* based on that information. A verz important attribute in such a 
profile has to be the definition of when this permission expires. The operator should be able to 
decide between three *permission types*:
+   *one-time-only*
+   *expires-on-date*
+   *until-further-notice*
After creating the profile, a response must be send to the *data consumer*, which should contain
the review result and the determined permission type. 

__*[P.I.05]{#pi05}* - Templating__\
The operator should be able to create templates for *permission profiles* and *permission rules* in 
order to (A) apply a set of configurations in advance before a *permission request* arrives and 
(B) reduce recurring redundant configurations and interactions.


#### Behaviour:

__*[P.B.01]{#pb01}* - Access Logging__\
All interactions and changes in the persistence layer should be logged. At data request must be 
logged. Such log is the foundation of the *access history*, so that the user is able to keep track 
of occurring accesses and look up past ones.

__*[P.B.02]{#pb02}* - Real time__\
Real time communication might be essential for time-critical data transaction. Hence graphical
user interfaces should be communicating with the server through an ongoing connection to enable
real time support. 
Assuming the following example scenario: permission request got reviewed on mobile device, but 
notification indicator in the desktop browser still reflects 'pending'. 
If just one of the user interfaces has no real-time capabilities but all the others do, the user 
interface might get into an undefined state presenting the user with wrong information, which will 
decrease user experience dramatically. This mean, either all user interfaces have to provide 
real-time feedback or non. 

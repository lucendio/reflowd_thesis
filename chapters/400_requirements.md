Requirements
==========================================



Derived from the [Core Principles](#core-principles), the subsequent requirements shall be served as 
a list of features on the one hand, to get an idea about how the open specification and thus the 
resulting software might look like, and to give an overview about priorities (can/could, may/might, 
should, must/have to) on the other hand. 
Other chapters may contain specific references to the requirements listed below.



#### Architecture/Design:

__*[S.A.01]{#sa01}* - Portability__\
All major components should be designed and communicate between each other in a way to be able to 
get relocated while the system has to remain fully functional. It has to be possible to build a
distributed system, that may require to place certain components into different environments/devices. 

__*[S.A.02]{#sa02}* - Roles__\
The system has to define two types of roles. The first one is the 
[operator](#terminologies--operator), who is in control of the system and, depending on the 
architecture, must be at least on individual but can be more. The operator takes care of all the 
data that then get's provided and decides about which third party get's access to what data. The second 
type are the [consumers](#terminologies--consumer). These are external third parties that desire 
certain data about or from the operator.
(see [Terminologies](#terminologies))

__*[S.A.03]{#sa03}* - Authenticity__\
Since they have to rely on the data, both entities - everyone belonging to one of the 
*[roles](#sa02)* - should be able to ensure the authenticity of it's opponent and the data in 
question. It should be possible to opt out, if that level of reliability is not necessary. Whereas 
if one of the parties demanding the other one of providing such level, but the other doesn't, then
the access attempt will fail.


#### Persistence:

__*[S.P.01]{#sp01}* - Data Outflow__\
Data may only leave the system if it's absolutely necessary and no other option exists to preserve 
the goal of that process.

__*[S.P.02]{#sp02}* - Data Relationship__\
Data structures and data models must show high flexibility and may not consist of strong relations 
and serration.

__*[S.P.03]{#sp03}* - Schema and Structure__\
The *Operator* can create new data types (based on a schema) in order to extend the capabilities of
the data API. Structures and schemas can change over time ([S.P.04](#sp04)). 
Every data set and data point has to relate to a corresponding and existing type, whether it's a 
simple type (string, integer, boolean, etc.) or a structured composition based on a schema.

__*[S.P.04]{#sp04}* - Write__\
Primarily the operator is the only one who has the permissions to add, change or remove data. This
is done either by using the appropriate forms provided by visual user interface or import 
mechanisms. The later could be enabled through (A) support for file upload containing supported 
formats, (B) data API restricted to the operator or (C) defining an external source reachable via 
http (e.g. *RESTful URI*) in order to (semi-)automate additional an ongoing data import from 
multiple data sources (e.g. IoT, browser plugin).
Additionally, it might be possible in the future to allow *data consumers* letting some data to flow
back into the operator's system, after she is certain about it's validity and usefulness.


#### Interfaces:

__*[S.I.01]{#si01}* - Documentation__\
The interfaces of all components have to be documented; in a way that the components themselves can 
be replaced without any impact to the rest of the system. This also involves comprehensive 
information on how to communicate and what endpoints are provided, including required arguments and 
result structure.

__*[S.I.02]{#si02}* - External Data Query__\
Data consumer can request a schema, in order to know how the response data will actually look like,
since certain parts of the data structure might change over time (see [S.P.03](#sp03), 
[S.P.04](#sp04)).
After checking if the access request is permitted, the system first parses and validates the query 
and eventually proceeds to actually execute the included query. When querying data from the system, 
the *data consumer* might be required tp provide a schema, which should force him to be as precise 
as possible about what data is exactly needed. In addition to that, the consuming entity must 
provide some *meaningful* text, describing the purpose of the requested data. He should not be 
allowed to place wildcard selectors for data points in the query. Instead he must always define
a more specific filter or a maximum number of items, if the query retrieves more then one element.

__*[S.I.03]{#si03}* - Formats__\
When components communicating between each other or interactions with the system from the outside 
take place, all data send back and forth should be serialized/structured in a JSON or JSON-like
structure.


#### Visual User Interface:

__*[P.VIU.01]{#pviu01}* - Responsive user interface__\
The visual user interface has to be responsive to the available space, because of the diversity of
screen sizes nowadays.

__*[P.VIU.02]{#pviu02}* - Platform support__\
The user interface must be at least implemented based on web technologies, that is provided by a
server and is thus available on any platform that comes with a modern browser.
To enable additional features and behavior, at least for mobile devices it is recommended to build 
a user interface upon native supported technologies, such as *Swift* and *Java*. The operator would 
benefit from capabilities such as *push notifications* and storing data on that device.

__*[P.VIU.03]{#pviu03}* - Access Profiles__\
The operator should be capable of filtering, sorting and searching through the list of *access 
profiles*; for a better administration experience and to easily find certain entries while the 
overall amount increases over time.
 
__*[P.VIU.04]{#pviu04}* - Access History__\ 
The operator must be provided with a list of all past permission requests and data accesses, in 
order to monitor who is accessing what data and when, and thus being capable of evaluating and 
eventually stopping certain access and data usage. This tool should have filter, search and sort 
capabilities. It is build upon and therefore requires the [access logging](#pb01) functionality.


#### Interactions:
    
__*[P.I.01]{#pi01}* - Effort__\
Common interactions processes, like changing *profile data*, importing data sets or manage 
*permission request* have to require as little effort as possible. This means short UI response 
time on the one hand and as less single input and interaction steps as possible to complete a task.
Given these circumstances, the *permission request review* and *access profile creation* might 
become a special challenge. 

__*[P.I.02]{#pi02}* - Design__\
The visual user interface must be designed and structured in such a way that is is highly intuitive
for the user to operate. Thus, it is important e.g. to use meaningful icons and appropriate labels.
It also means a flat and not crammed menu navigation. Context related interaction elements should be
positioned within the area designated for that context.
TODO: maybe emphasize more UI aspects (or not)

__*[P.I.03]{#pi03}* - Notifications__\
The user should be notified about every interaction with the *PDaaS* originated by a third party 
immediately after it's occurrence, but she must get notified at least about every *permission 
request*. This behaviour should be configurable; depending on the *permission type* and on every 
*access profile*. Regardless of the configuration the notifications themselves must show up and
pending user interactions must be indicated in the user interface. 

__*[P.I.04]{#pi04}* - Permission Request & Review__\
A process involving data transaction must always be initiated by the data subjects. So before a 
*data consumer* is able to access data, first the *operator* need to *invite* him and tell him 
whereto address his requests. This has to be done by sending him a URI leading to an endpoint, that 
needs to be unique among all *data consumers* interacting with the same instance of the system.
When a *data consumer* makes the first attempt to connect to the system, it must be a well formed
*permission request*, which has to include information about the *consumer*, what data he wants to
get access to, for what purpose and how log or how often the data need to be requested. The operator
then reviews these information and creates an access profile based on that information. A key
configuration in such a profile has to be what defines when this permission expires. The operator
should be able to decide between three *permission types*:
+   *one-time-only*
+   *expires-on-date*
+   *until-further-notice*
After creating the profile, a response must be send to the *data consumer*, which should contain
the review result and permission type set by the operator. 

__*[P.I.05]{#pi05}* - Templating__\
The operator should be able to create templates for *access profiles* nad *permission rules* in 
order to (A) apply a set of configuration in advance before the *permission request* arrives and 
(B) reduce recurring redundant configurations.


#### Behaviour:

__*[P.B.01]{#pb01}* - Access Logging__\
All interactions and changes in the persistence layer should be logged. At least all data request 
must be logged. Such log is the foundation of the *access history*, with this the user is able to 
keep track of and look up past accesses.

__*[P.B.02]{#pb02}* - Real time__\
Real time communication might be essential for time-critical data transaction. Hence at least one
user interfaces should be connected to the server through an ongoing connection to enable
real time support (example scenario: permission request got reviewed on mobile device, but 
notification indicator reflects "still pending"). But if just one client is associated to the 
system, real time (in the sense of keeping UI state up to date) would not be necessary.
(see [P.VIU.02](#pviu02}))

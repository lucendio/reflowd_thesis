Requirements
==========================================



The subsequent requirements shall be served as a list of features on the on hand, to get an idea 
about what the end result might look like, and to give an overview about priorities (can/could, 
may/might, should, must/have to) on the other hand. Following chapters may contain specific 
references to the requirements listed below.



## The System

The system perspective includes the overall architecture, fundamental building blocks, such as
storage & persistence layer, business logic and outmost interfaces.


#### Architecture:

__*[S.A.01]{#sa01}* - Portability__\
+   all components should be relocatable and function independently
+   the different components from the system should be able to get relocated and remain 
to be fully functional


#### Persistence:

*[S.P.01]{#sp01}*:  data may only leave the system if it's absolutely necessary and no other option
    exists to preserve the goal of that process
     
*[S.P.02]{#sp02}*:  the data structure and data models must show high flexibility and must not
    consist of strong relations
     
*[S.P.03]{#sp03}*:  the storage (engine) should be supported on different platforms (incl. mobile 
    devices)


#### Interfaces:

__*[S.I.01]{#si01}* - Documentation__\
All interfaces between components have to be documented, in a way that the components themselves can 
be replaced without any impact to the rest of the system
  


## The User

Not only humans that are using the resulting software are seen as a *user*. Also developers and
other contributors may use the software, documentations or program code from a technical standpoint. 


#### Administration:

*[U.A.01]{#ua01}*:


#### Management & Organisation:

*[U.MO.01]{#umo01}*:



## The Software


#### Visual User Interface:

__*[P.VIU.01]{#pviu01}* - Responsive user interface__\
The visual user interface has to be responsive to the available space


__*[P.VIU.02]{#pviu02}* - Platform support__\
+   must at least web UI (provided by the server)
+   should mobile to benefit from notifications and storing data on that device


__*[P.VIU.03]{#pviu03}* - Access Profiles__\
The user should be capable of filtering, sorting and searching through that list of profiles 
 
 
__*[P.VIU.04]{#pviu04}* - Access History__\ 
The user must be provided with a list of all past permission requests and data accesses. This tool 
should have filter, search and sort mechanisms.
+  requires [access logging](#pb01)



#### Interactions:
    
__*[P.I.01]{#pi01}* - Effort__\
Common interactions processes, like changing *profile data*, importing data sets or manage 
*permission request* have to be require as little effort as possible. This means short UI response 
time on the one hand and and as less single inputs as possible to complete a task.


__*[P.I.02]{#pi02}* - Design__\
The visual user interface must be designed and structured in such a way that is is highly intuitive
for the user to operate. Thus, it is important e.g. to use meaningful icons and appropriate labels.
TODO: emphasize more UI aspects (or not)


__*[P.I.03]{#pi03}* - Notifications__\
The user should be notified about every interaction with the *PDaaS* originated by a third party 
immediately after it's occurrence, but she must get notified at least about every *permission 
request*. This behaviour should be configurable; depending on the *permission type* and on every 
*access profile*. Regardless of the configuration the notifications themselves must show up and
pending user interactions must be indicated in the user interface.


__*[P.I.04]{#pi04}* - Permission Request Review__\


#### Behaviour:

__*[P.B.01]{#pb01}* - Access Logging__\
All interactions and changes in the persistence layer should be logged. At least all data request 
must be logged. Such log is the foundation of the *access history*, with this the user is able to 
keep track of and look up past accesses. 

__*[P.B.02]{#pb02}* - Real time__\
+   web ui in browser on desktop should be connected to the server through websockets to support 
real time (e.g. permission request got reviewed on mobile device, but notification indicator 
reflects "still pending")
+   if just one client is associated to the system, real time (in the sense of keeping UI state up 
to date) would not be required


## The Functionality


*[F.01]{#f01}*: The system 






 





the process of granting access to certain data points has to be effortless and intuitive

data owners

data consumers

data owners can use permission templates to predefine rules for later application to data consumer requests

a process involving data transaction must always be initiated by the data owner

the data owner should be able to (semi-)automate additional an ongoing data imports from multiple data sources (e.g. IoT, browser plugin)

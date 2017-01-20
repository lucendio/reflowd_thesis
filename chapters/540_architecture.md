## Architecture



Taking all discussions in previous sections into account, the following components might be 
feasible and would cover most use cases.


+   which components can go where?
+   how can data be provided to a a data consumer without the data ever leaving the system?
+   where are reasonable places to locate the storage that holds the operators's personal data

__Webserver__
+   to serve UI
+   relay to mobile device

__UI__
+   data editor and importer
    -   data type editor
+   permission management
    -   access history and permission profile
    
__Storage/Persistence__
+   regardless of the platform
+   connector
+   al least two storage: one for the actual data, the other for permission profiles, history and
    all the other application data
-   where to place the storage? local (e.g. mobile device) or cloud (e.g. hoster's infrastructure)
    +   requires 24/7 uptime
    
__Notification Infrastructure__
+   websockets for web UIs
+   Google/Apple Notification server compatible connection for mobile apps

__Data API__
+   essentially consists of two parts: 
    1)  checking permissions of the request
    2)  persistence layer abstraction (graphql)
+   for external consumers
    -   incoming permission requests and data access attempts
    -   outgoing data ()
+   for internal clients (web UI, mobile device)


__OpenID__
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

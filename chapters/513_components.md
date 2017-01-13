## Components

+   which components can go where?

__Webserver__
+   to serve UI
+   relay to mobile device

__UI__
+   data editor and importer
    -   data type editor
+   permission management
    -   access history and access profile
    
__Storage/Persistence__
+   regardless of the platform
+   connector
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



*Conclusions:*
+   distributed architecture (e.g. notification/queue server + mobile device for persistence
    and administration)

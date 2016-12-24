## Architecture



+   showing possible directions, e.g.:
    -   cloud or local storage
    -   which components can go where
    -   remote execution, to prevent data from leaving the system



### Overview

+   distributed architecture (e.g. notification/queue server + mobile device for persistence
    and administration)



### Components

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
    
    



### Plugins

+   but for what? and not harm security at the same time?
    maybe just for data types and admin UI to display analytical (time based) data in other ways
+   what about extensions (see iOS 10) to let other apps consume data; only on a mobile device and 
    only if the data is stored there


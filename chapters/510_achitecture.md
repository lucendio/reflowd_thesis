## Architecture



+   showing possible directions, e.g.:
    -   cloud or local storage
    -   which components can go where
    -   remote execution, to prevent data from leaving the system



### Verification / Authentication

+   maybe go with a Signing/verifying Authority (aka CA)
    -   do I trust the gov or certain companies more? Which interests do these Role/Stakeholder 
        have?
    -   revoking the cert which provides the authenticity of the individual's digital identity 
        should only be possible with a two-factor secret. One part of this secret is owned by 
        the CA and the other half has the individual behind the personal API
        
+   TODO: look into
    -   PKI
    -   ePerso
    -   E-Post/de-mail
    
+   Authentication 



### Data Exchange/Access Process Design

A)  just requesting and responding with pure data
B)  provide executable and input schema; run on the PDaaS environment in a sandbox; return result
B)  DRM for personal data: provide a piece of software to the data consumer, which does the licence 
    checking, key obtaining and encryption of the data, he has requested, in order to work 
    with / compute that data



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



### *Conclusions*

+   distributed architecture (e.g. notification/queue server + mobile device for persistence
    and administration)

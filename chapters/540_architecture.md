## Architecture



By taking all previous sections, their discussions and the requirements as well into account, this 
section serves the sole purpose of figuring out how all the different concepts and conclusions 
discussed before can fit together in an overall system architecture that is organized in either a 
distributed or a monolithic manner. This type of changes should not impact how the system's 
interfaces behave from a user perspective.

The conglomeration below highlights all major components, that are required in order to cover most 
of the defined use cases. It includes further details about their purpose(s) and relation(s) to each 
other.

###### Web server
*Purpose:*
    +   serve web-based user interface(s)
    +   handle all in- & outgoing traffic (outmost layer)
    +   revers proxying certain traffic to different components
    +   en- & decrypt HTTPS traffic, thus authenticate *consumers*
    +   load balancing (if necessary)
    +   web client notification
*Platform:* server
*Technologies:*
    +   HTTP
    +   TLS
    +   WebSockets
*Explanation/argumentation:*


###### Permission Manager
*Purpose:*
    *   creating *permission profiles*
    +   permission validation
    +   examine data queries 
    +   queue *consumer* requests
*Platform:* server
*Technologies:*
    
###### PKI
*Purpose:*
    +   CA
    +   manage keys and certificates per *endpoint*
*Platform:* server
*Technologies:*
    +   X.509

###### Storage Connector
*Purpose:*
    +   abstracts to system agnostic Query Language
    +   queries personal data, regardless of where it's located
*Platform:* server
*Technologies:*
    +   driver for used database 

###### Operator API
*Purpose:*
    +   authenticates *operator*
    +   writes personal data through Storage Connector 
    +   provides relevant data, such as history
    +   system configuration
*Platform:* server
*Technologies:*
    +   JWT


###### Code Execution Environment
*Purpose:*
    +   isolated runtime (sandbox) for computations/programs provided by *consumers*
    +   restrict interaction with outer environment to absolute minimum (e.g. no shared filesystem 
        or network)
    +   one-time use
    +   monitor sandbox during computation 
    +   examine and test the provided software
*Platform:*    
*Technologies:*
    +   Virtualization
    +   Container (OCI)


###### Tracker
*Purpose:*
    +   log all changes made with *Storage Connector*
    +   tracks states for ongoing consumer requests
    +   log all *access requests*
*Platform:* server
*Technologies:*


###### Personal Data Storage
*Purpose:*
    +   stores the *operator's* personal data
*Platform:* server, mobile
*Technologies:*
    +   non relational database
    +   depending on host environment

###### Persistence Layer
*Purpose:*
    +   stores Permission Profiles, History, Tokens, Configurations and other application data
    +   cache runtime data and information
*Platform:* server 
*Technologies:*
    +   non relational database
    +   Filesystem


###### Notification Infrastructure
*Purpose:*
    +   notify about everything that needs *operator's* approval (e.g. new registrations, new 
        *permission requests*)
*Platform:* server
*Technologies:*
    +   WebSockets for web UIs via local web server
    +   mobile device manufacturer's Push Notification server for mobile apps 


###### User interface
*Purpose:*
    +   access restricted to *operator* only
    +   access & permission management
    +   data management (editor, types & import)
    +   history and log viewer
    +   system monitoring
*Platform:* desktop, mobile
*Technologies:*
    +   HTML, CSS, Javascript
    +   Java
    +   Swift, Objective-C






After defining all different components
portability ([S.A.02](#sa02))
+   which components can go where?
+   where are reasonable places to locate the storage that holds the operators's personal data

TODO: does every component need to provide HTTP as their components? how does auth/security work 
then? 


TODO: it is debatable whether to place the *permission profiles* in the *persistence layer* among 
all other domain-related information, put it into the *personal data storage* or define it as an
own storage component, in order to be flexible regarding it's location.


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

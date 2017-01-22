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
    +   en- & decrypt HTTPS traffic, thus client authentication
    +   load balancing (if necessary)  
*Platform:*
    +   server
*Technologies:*
    +   HTTP
    +   TLS
    +   WebSockets
*Explanation/argumentation:*
    
###### PKI
*Purpose:*
    +   CA
    +   manage keys and certificates per *data consumer*
*Platform:*
    +   server
*Technologies:*
    +   X.509

###### User interface
*Purpose:*
    +   access & permission management
    +   data management (editor, types & import)
    +   history log
*Platform:*
    +   desktop
    +   mobile
*Technologies:*
    +   HTML, CSS, Javascript
    +   Java
    +   Swift, Objective-C
    
###### Personal Data Storage
*Purpose:*
*Platform:*    
*Technologies:*
    +   regardless of the platform
    +   connector
    +   al least two storage: one for the actual data, the other for permission profiles, history and
        all the other application data
    -   where to place the storage? local (e.g. mobile device) or cloud (e.g. hoster's infrastructure)
        +   requires 24/7 uptime
        
###### Persistence
*Purpose:*
    +   stores Permission Profiles, History, Tokens, Configurations and other meta data
*Platform:*    
*Technologies:*
    
###### Domain Logic
*Purpose:*
    +   permission verification
*Platform:*    
*Technologies:*
    
###### Notification Infrastructure
*Purpose:*
*Platform:*    
*Technologies:*
    +   websockets for web UIs
    +   Google/Apple Notification server compatible connection for mobile apps

###### Data API
*Purpose:*
*Platform:*    
*Technologies:*
    +   essentially consists of two parts: 
        1)  checking permissions of the request
        2)  persistence layer abstraction (graphql)
    +   for external consumers
        -   incoming permission requests and data access attempts
        -   outgoing data ()
    +   for internal clients (web UI, mobile device)



After defining all different components
portability ([S.A.02](#sa02))
+   which components can go where?
+   where are reasonable places to locate the storage that holds the operators's personal data

TODO: does every component need to provide HTTP as their components? how does auth/security work 
then? 


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

## Attack Scenarios



+   impersonate, identity theft

+   man-in-the-middle attacks:
    transport way secured, and if the endpoint certificate is provided to the third party before it
    is requested during connection establishment (because at that point connection is still 
    unencrypted), it can be detected if the original cert is not being used


+   measurements, already touched on:
    -   container encapsulation
    -   distributed system, especially relocating PDS (onto mobile)
    
    
+   The general mindset for this project is to prefer long standing, proven libraries and technologies  
    instead of writing new implementations of cryptographic concepts and algorithms.
    
    
+   SCE is considered a weakness, but

+   open source development: vulnerabilities can easy be disclosed and immediately be addressed



+   single point of failure (data-wise),
    -   but considering what data users already put into their 
        social networks (or: thE social network: fb), they/it has already become a de facto data silo and is 
        thus a single point of failure. If that service breaks or goes down, the data from all users might be
        lost or worse (stolen). The aspect of data decentralization achieved by individual data stores can 
        be valued as positive.

+   what about token stealing when using jwt?

+   future work: add/activate an intrusion detection system

+   PDS is on mobile platform and server platform is corrupted: storage connector must queue 
    requests and regularly provide the server with a JWT, triggered by the operator when interacting
    with the mobile app.

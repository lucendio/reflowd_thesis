## Attack Scenarios




+   measurements, already touched on:
    -   container encapsulation
    -   distributed system, especially relocating PDS (onto mobile)
    
    
    
+   SCE is considered a weakness



+   single point of failure (data-wise),
    -   but considering what data users already put into their 
        social networks (or: thE social network: fb), they/it has already become a de facto data silo and is 
        thus a single point of failure. If that service breaks or get down, the data from all users might be
        lost or worse (stolen). The aspect of data decentralization achieved by individual data stores can 
        be valued as positive.

+   what about token stealing when using jwt?

+   future work: add/activate an intrusion detection system

+   PDS is on mobile platform and server platform is corrupted: storage connector must queue 
    requests and regularly provide the server with a JWT, triggered by the operator when interacting
    with the mobile app.

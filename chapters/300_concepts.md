Concepts
==========================================


NOTE: here we discuss a variety of possibilities --> conceptual work



## Data Ownership

+   user-centric, full control



## Identity Verification

+   maybe go with a CA
    -   revoking the cert which provides the authenticity of the individual's digital identity 
        should only be possible with a two-factor secret. One part of this secret is owned by 
        the CA and the other half has the individual behind the personal API



## Authentication

+   NOTE: does not mean this tool authenticates it's owner against third party platforms like 
    OpenID does. but it could play the role of the 2n factor in a multi-factor authentication 
    process (if the mobile-device-architecture was chosen)
+   refers primarily to the process of a data consumer (third party, which needs the data for 
    whatever reason) verifies her admission to request



## Data Reliability

+   is this data (in this case identity) certified or not (results in higher value)



## Exposing Data

+   pure/plain data request/resonse 
+   remote computation/execution (assuming there is no client for the consumer) 
    like https://webtask.io/



## Encapsulation

+   containerization (coreos, rkt, mirageos aka unikernal)



## Open Standards

+   what standards can be used for which tasks



## Hosting

+   DYI
+   Usability




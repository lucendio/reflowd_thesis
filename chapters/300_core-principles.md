Core Principles
==========================================



In the following chapter the certain core principles of the system will be examined 

NOTE: here we discuss a variety of possibilities --> conceptual work



## Data Ownership

+   user-centric, full control



## Identity Verification

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



## Authorisation (remove in favour of data access?)

+   NOTE: does not mean this tool authenticates it's owner against third party platforms like 
    OpenID does. but it could play the role of the 2n factor in a multi-factor authentication 
    process (if the mobile-device-architecture was chosen)
+   refers primarily to the process of a data consumer (third party, which needs the data for 
    whatever reason) verifies her admission to request



## Authentic Data

+   is this data (in this case identity) certified or not (results in higher value)



## Supervised Data Access

+   pure/plain data request/resonse 
+   remote computation/execution (assuming there is no client for the consumer) 
    like https://webtask.io/



## Encapsulation

+   containerization (coreos, rkt, mirageos aka unikernal)



## Open Development

+   which and why open standards
+   why open source
+   collaborative transparent development 

+   Hosting & Administration
    -   DYI
    -   Usability

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

+   NOTE: does not mean this tool authenticates it's assiciated data subject against third party 
    platforms like OpenID does. but it could play the role of the 2n factor in a multi-factor 
    authentication process (if the mobile-device-architecture was chosen)
+   refers primarily to the process of a data consumer (third party, which needs the data for 
    whatever reason) verifies her admission to request



## Authentic (TODO: or reliable) Data

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
    
When developing an *Open Specification* it comes naturally to build upon open technologies, 
which is understood as open standards and open source; *open* in the sense of *unrestricted 
accessible by everybody*; not to be confused with free - as in *freedom* - software. In this case, 
advocating such a an openness enables not only to develop implementations of the specification in 
a collaborative way, but also the specification itself, and makes it possible for anyone who is 
interested to participate or even to contribute. For everyone who just want to use open 
technologies, a license defining rules and conditions is typically enclosed somehow. But regardless 
of the motivation everybody who is interested in getting to know how these hard- or software 
blackboxes-by-design are actually working, is thus able to look into it. 

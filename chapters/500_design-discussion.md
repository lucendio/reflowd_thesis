Design Discussion
==========================================



The following chapter documents the processes of some design decision makings, examines possible 
issues emerging alongside and discuses different solutions obtained from several perspectives 
in order to evaluate their advantages and disadvantages. Probably not every issue will get it's  
deserved rome , but major aspects will be addressed. 

NOTE: here we discuss a variety of possibilities --> conceptual work



## Data Exchange/Access Process Design

A)  just requesting and responding with pure data
B)  provide executable and input schema; run on the PDaaS environment in a sandbox; return result
B)  DRM for personal data: provide a piece of software to the data consumer, which does the licence 
    checking, key obtaining and encryption of the data, he has requested, in order to work 
    with / compute that data



## Verification / Authentication

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

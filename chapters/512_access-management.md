## Access Management



In the previous section [Authentication] has been addressed. The Subsequent section discusses how 
the mentioned technologies has to be assembled in order to meet the requirements (TODO), so that
personal data can be accessed by external *data consumers*.



While in OAuth the authorisation procedure strictly involves an authentication, the previous 
proposed design separates authentication and authorisation from each other so they can run 
completely independent. Additionally this approach would require almost no effort to support
the case where multiple *data consumers* access the same *endpoint*.
by just disabling the client authentication for the HTTPS connection establishment.


A)  just requesting and responding with pure data
B)  provide executable and input schema; run on the PDaaS environment in a sandbox; return result
B)  DRM for personal data: provide a piece of software to the data consumer, which does the licence 
    checking, key obtaining and encryption of the data, he has requested, in order to work 
    with / compute that data

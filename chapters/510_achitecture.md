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
    -   Where?
        +   direct at a Meldestelle
        +   with the eID-Function (data check: as long as the contents of the relevant fields are 
            equal) of the Personalausweis --> no, because every PDaaS need its own permission cert
            from the authorities
        
+   TODO: look into
    -   PKI: concept consists of CAs and stuff used for HTTPS 

    
+   Authentication 

__ePerso, E-Post/de-mail__\
In the past years different states around the world introduced *information technology* into the
day-to-day processes, interactions and communications between public services and citizens, for 
example like changing residence information or tax filing, which can be summarized under the term 
*E-government* [^abbr_egov]. Those development can be seen in germany as well. With the introduction
of an electronic ID card [^abbr_npa], hereinafter *eID card*, in 2010 an important step was made 
towards that direction, that provides the core functionality of authenticating a person by herself 
without being physically present. Aside from minor flaws [@web_2013_npa-sicherheitsdefizit] and 
disadvantages [@web_2014_test-qes-support-in-npa], the question would be, how such *eID card* could 
be integrated with this project and if it makes sense to do so. 

Several ideas might come to mind, (A) to authenticate with the *eID card* on the management UI of 
the *PDaaS*. (B) authorize access request or data access attempts. (C) sign the responding data,
in order to not only preserve data integrity but also to prove the authenticity of the data.

Since the signing procedure requires the operators private key, every time data get accessed by
a consumer, she is forced to interact withe the system. Otherwise the operators private key need to 
be stored somewhere in the system. No matter where, this approach would introduce a new group of 
attack scenarios. Apart from that, it is very likely that it's the *eID card* does not allow to
extract the private key, Thus introducing a inconvenience is inevitable.

An *e ID card* as an official document has one major advantage over self-configured authentication 
mechanisms like password, fingerprints or second factor tokens. It is *signed* by design, because 
by creating this document and handing it over to the related citizen, it has verified then 
authenticity of that individual.  


[^abbr_egov]: Electronic government

[^abbr_npa]: in german so called *elektronische Personalausweis (nPA)*


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

## Architecture


Within this sections questions such as 
+   how can a communication process with a third party be modeled and what technologies can be used 
    to 
(A) trust the system and
(B) trust the communication partner
+   how many and what kind of authentication mechanisms are required?
+   how can data be provided to a a data consumer without the data ever leaving the system?
+   where are reasonable places to locate the storage that holds the operators's personal data




### Authentication


First of all, the system has to support two [roles]({#sa03). Any entity can be assigned to either 
one of them, hence entities that are trying to authenticate to the system might have different 
intentions. The *operator* for example wants to review *permission requests* in real time, so 
accessing the system from different devices is a common scenario. When inheriting the *operator 
role* an entity gains further capabilities to interact with the system, such as data manipulation.
Whereas a *data consumer* always uses just one origin and processes requests sequentially. Those 
very distinct groups of scenarios would make it possible to apply different authentication 
mechanisms that do not necessarily have a lot in common.

With respect to the requirements ([S.A.01](#sa01), the post appropriate technology for 
communicating with the *PDaaS* over the internet is *[HTTP](#link_http)*. This comprehensive and 
flexible protocol enables a variety of applications. 



First of all, two different types of motivations for authenticating to the system have to be distinguished.
First of all, two different types of motivations have to be distinguished for authenticating to the system. 
One, originated by an external third party (data consumer), is to make a permission request or to 
access data, the other is 

In other words, it would make sense to distinguish the authentication process of the two different 
[roles](#sa03), because the way these two are interacting with the system is different, otherwise
there would be no two roles
 
 
In a public-key-based authentication when a receiver is able to decrypt the incoming request itself
it implies that the requester's identity is valid and the integrity of the containing data is given.
Whereas on a token-based authentication every incoming request has to carry the token so that the
system can verify and associate the request with an account and the data it not automatically 
encrypted and thus integrity is not preserved.


Only at the beginning the relies 
        
+   TODO: look into
    -   PKI: concept consists of CAs and stuff used for HTTPS 
    
where the system is a certificate authority

    
Since there are no time constrains when it comes to communication with a payload that contains 
personal data, parameters of encryption procedures can chosen as costly as the system resources 
allow them to be, thus the level of security can be increased.



#### Asymmetric Cryptographic Techniques

##### ePerso, E-Post/de-mail as part of a PKI solution?__\
In the past years different countries around the world recently started to introduced *information 
technology* to the day-to-day processes, interactions and communications between public services and 
their citizens, for example changing residence information or filing tax report, which is summarized 
under the term *E-government* [^abbr_egov]. One of those developments is the so called *electronic 
ID card*, hereinafter called *eID card*. Equipped with storage, logic and interfaces for wireless 
communication, those *eID cards* can be used to store certain information and digital keys or to 
authenticate the owner electronically to a third party without being physically present.
Such an *eID card* was also introduced in Germany in 2010. The so called *nPA* [^abbr_npa] was an 
important step towards an operational *e-government*.

Aside from minor flaws [@web_2013_npa-sicherheitsdefizit] and disadvantages [@web_2014_test-qes-support-in-npa] 
an *eID card* can have, the question here is, how can this technology be usefully integrated in this 
project and does it even makes sense. 
As an official document the card has one major advantage over self-configured authentication 
mechanisms like password, fingerprints or second factor tokens. It is *signed* by design, meaning 
by creating this document and handing it over to the related citizen, the third party - in this 
case the government - has verified the authenticity of that individual. 

As a result, several ideas can be proposed:
(A) authenticate with the *eID card* to the management UI of the *PDaaS*
(B) authorize/approve *access requests* or *data access* attempts 
(C) sign the responding data, in order to not only preserve data integrity but also to prove the 
    authenticity of the data.

With regards to (A), partially depending on the *eID card*'s implementation, but in general this use case 
would make sense. When considering the german implementation (nPA), accessing the management UI via desktop 
would require just a card reader - preferable with a hardware keypad attached. Accessing the UI via 
mobile device could be achieved with the card's RFID-capabilities, as long as the used device is 
able to communicate with the RFID-chip. Both cases need the *nPA* to have enabled the *eID* feature. If a
service wants to provide *nPA*-based online authentication (*eID-Service*), which is defined as a non-sovereign 
("nicht hoheitlich") feature, it has to comply with several requirements [@web_bsi-eid]
starting with making an application in order to get permission for sending a certificate signing 
request to a BerCA [^abbr_berca]. This request is originated from an *eID-Server* [@web_2017_npa-eid-server] to sign a public key generated on 
a dedicated and certified 
hardware, which is also required through the officials. This key pair - re-generated and re-signed
every three days - is needed to establish a connection with the *nPA*, which then is used to
authenticated the owner of that *ID card*. 
The described appears to be highly expensive (effort, hardware costs), especially because every 
single operator needs to go through the whole process in order to provide this authentication 
method; not mentioning the uncertainty of the official's decision about the motion filing. Another
approach would be to integrate an external authentication provider supporting the *nPA*, which
would not only add an additional dependency, but could also weaken the system.
(A) and (B) are fairly similar, insofar as they would use the same mechanism to authenticate, but
to approve different actions.

As of (C), as mentioned above the *nPA* is able to store data required for creating a *QES* 
[^abbr_qes] (e.g. private keys and certificates). Thus this procedure could be used to sign 
arbitrary data, normally messages within communications like emails. But since a signing procedure 
involves the operators private key, every time data get accessed by
a consumer, she is forced to interact withe the system. Otherwise the operators private key need to 
be stored somewhere within the system. No matter where, this approach would potentially expose a 
highly confidential part of a cryptographic procedure, which not only reduces the overall system's 
security level. It also makes every process this procedure is involved with vulnerable to certain 
attacks. Apart from that, it is highly unlikely that a *eID card* does allow to extract private 
keys. Thus increasing inconvenience is inevitable for such a use case.

Another technology emerging as part of the *e-government* development is the *DE-Mail* 
[@web_2017_about-de-mail]. It's an
eMail-Service that is meant to provides infrastructure and mechanisms to exchange legally binding 
electronic documents. One would expect public-key-based cryptography procedures all the way from 
sender through to the recipient (end-to-end) [@statement_2013_de-mail], maybe even with taking advantage of the *nPA's* 
capability to create *QES*. Instead, the creators of the corresponding 
law decided that it's sufficient prove about the documents author if the provider signs the document 
on the email server and that this implementation results in a legally binding document by definition 
of that law. 
This technology tries to embed a legal foundation into email-based communication, thus has no 
relevance to this project, other then letting a server sign outgoing data, which might be the only 
solution to avoid an overhead in user interaction caused by recurring events.


[^abbr_egov]: Electronic government

[^abbr_npa]: in german so called *elektronische Personalausweis (nPA)*

[^abbr_berca]: Berechtigungszertifikate-Anbieter

[^abbr_qes]: Qualified Electronic Signatures [@paper_2013-keymanangement-fuer-qes-mit-npa]


#### Sessions

authenticated state related to a user account and hold by the server, 

+   basic auth, cookies
+   JSON Web Token




### Data Exchange/Access Process Design

A)  just requesting and responding with pure data
B)  provide executable and input schema; run on the PDaaS environment in a sandbox; return result
B)  DRM for personal data: provide a piece of software to the data consumer, which does the licence 
    checking, key obtaining and encryption of the data, he has requested, in order to work 
    with / compute that data



### Components

+   which components can go where?

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
-   where to place the storage? local (e.g. mobile device) or cloud (e.g. hoster's infrastructure)
    +   requires 24/7 uptime
    
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
+   currently no other imaginable then data type schemas



### *Conclusions*

+   distributed architecture (e.g. notification/queue server + mobile device for persistence
    and administration)
    
+   Based on the several requirements and distinct advantages of the two authentication mechanisms, 
it would make sense to use asymmetric cryptography in combination with *HTTPS* for the communication 
between the system and *data consumers*, where the system provides it's own *PKI*
and a token-based authentication on top of *HTTPS* and public CAs for communication between the 
system and the *operator*, preferable based on *[JSON Web Tokens](#link_jwt)*, because the session 
state is preserved within the token rather then having the system itself keeping track of it.

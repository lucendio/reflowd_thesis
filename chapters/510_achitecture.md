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

With respect to the requirements ([S.A.01](#sa01)), the most appropriate way to communicate with the 
*PDaaS* over the internet would be by using *[HTTP](#link_http)*. Furthermore, to preserve
confidentiality on every in- and outgoing data ([S.P.01](#sp01)) the most convenient solution is to 
use *HTTP* on top of *TLS*. *TLS* relies i.a. on [asymmetric cryptography](#link_asym-crypto). 
During the connection establishment the initial 
handshake requires a certificate, issued and signed by a CA [^abbr_ca], which has to be provided by 
the server. This ensures at the same time a seasonable level of identity authentication, almost 
effortless. If the certificate is not installed, it can be installed manually on the client. If 
the certificate is not trusted (e.g. it is self-signed), it can either be ignored or the process 
fails to establish a connection, depending on the server configurations. The identity 
verification in TLS works in both directions, which means not only the client has to verify the 
server's identity by checking the certificate. If the server insists on, the client has to 
provide a certificate as well, which then the server tries to verify. Only if the outcome is 
positive, the connection establishing succeeds. According to the specification 
[@web_spec_tls-12_client-auth] it is still optional though.

*HTTP* as a comprehensive and flexible protocol enables to use several technologies for 
server-client authentication purposes. 
Within the scope of this work, those technologies are categorized in the following types 
(TODO: maybe find other labels): (A) stateful and (B) stateless authentication. The first one (A) 
includes vor example *Basic access Authentication* (or *Basic Auth*) and authentication based on 
*Cookies*. Whereas the *two-way authentication* in TLS mentioned above and 
[authentication based on web-token](#link_jwt) are associated with the latter (B). 
*Basic Auth* is natively provided by the *http-agent* and requires in it's original form 
(*user:password*) some sort of state on the server; at least when the system has to 
provide multitenancy. If instead just a general access restriction for certain requests would 
suffice, no state is required. One of the most common implementations of user-specific states is a 
*session* on the server, that contains one or more values representing the state and a unique 
identifier, by which an entity can be associated with. A client has to provide that session ID in 
order to get provided with all the session-related data hold by the server. This is typically done 
in a HTTP header, whether as *Basic Auth* value, a *Cookie*, which is domain-specific, or in some 
other custom header. 
Since the *two-way authentication* (or *mutual authentication* [@web_2017_wikipedia_mutual-auth]) is
done based on files containing keys and certificates, which are typically not very fluctuant in
it's contents or state, this procedure is categorized as stateless. Order or origin of incoming 
requests have no impact on the result of the actual authentication process. The same applies to TLS 
features such as *Session \[ID, Ticket\] Resumption* 
[@book_2013_networking-101_tls-session-resumption], thus they are left aside, because they serve the 
sole purpose of performance optimization.
Similar to the *Session Ticket Resumption* [@web_spec_tls-session-ticket-resumption] a web token, 
namely the [JSON Web Token](#link_jwt), also moves the state towards the client, but that's about 
all they have in common. A *JWT* carries everything with it that's worth knowing, including possible 
states, and if necessary the token is symmetrical encrypted by the server. This is, only the server 
is able to obtain data from it and reacting accordingly.

Keeping track of a state (or multiple states) on the server and keeping data that is involved  
synchronized between server and client is expensive and by fare trivial. Expensive in the sense of 
additional resources a server would require to remember all the data for those states, that 
otherwise won't be needed. And it's not trivial, because this pattern requires the server to be 
aware of all current states (sessions) and has to have them accessible at all time. This also means, 
that the contents responses for certain requests might depend on preceding requests and their 
incoming order. Furthermore those session data has to be safely stored from time to time. Otherwise 
if the server fails to run at some point, data only existing in the memory would be gone without 
any possibility to get recovered.
To stateless authentications non of those aspects apply. Certificates and keys as well as web 
tokens are both carry the information that might be necessary with them. Thus, considering those
disadvantages, *public key cryptography* and web tokens are the preferred technologies for all
authentication processes.

Because of it's simplicity the concept of web tokens are fairly straightforward to implement into 
the *PDaaS*. And since web tokens ensure integrity and perhaps also the confidentiality only of 
their own carriage and not the entire HTTP payload, both requirements need to be addressed 
separately. Serving HTTP over *TLS* solves this issue, but using TLS or *asymmetric cryptography*
properly - place value on integrity, confidentiality, authenticity - requires additional 
infrastructure. Such an infrastructure is known as *Public Key Infrastructure* (or *PKI*)
[@book_2014_chapter-14-5-pki]. It manages and provides public keys in a directory, including related 
information to the entities those certificates belong to. A Certificate Authority (or *CA*), as part 
of that infrastructure, issues, maintains and revokes digital certificates.
The infrastructure that is needed to provide secure HTTP connections for the internet can be seen as 
a large, if not the largest, public *PKI*. It is based on the widely used IETF [^abbr_ietf] standard 
*X.509* [@web_spec_x509].
For connections that use a web token, it is sufficient to rely on the public PKI
that drives *HTTP* over *TLS*, because unlike the *two-way authentication*, authentication is 
provided by the token itself. The situation is different, if instead *two-way authentication* is
used. For this the system has to provide it's own *PKI* including a Certificate Authority that 
issues certificates for *data consumers*.


+   maybe place "eperso + de-mail" here

An advantage of token-based authentication over TLS-based *mutual authentication* is that the token 
can be used on multiple clients at the same time or the account a token is associated 
with can actually have more than one token. Whereas during the asymmetric cryptography-based *mutual 
authentication* the client's private key is required. Such key should not leave it's current place 
in order to prevent exposure, which implies any action of duplication. 

If a public-key-based connection, performing a *mutual authentication*, establishes successfully, it
implies that the requester's identity is valid and the integrity of the containing data is given.
Whereas on a token-based authentication every incoming request has to carry the token so that the
system can verify and associate the request with an account. Data it not automatically encrypted and 
thus integrity is not preserved.

+   CA might be part of a chain of trusted CAs


To hardening an authentication procedure often one ore more factors are added. This makes the 
procedure more complex and thus increases the effort that's needed for succeeding attacks.
Using multi-factor authentication is generally valued and will be briefly noted as an 
optional security enhancement for the *operator role*. However detailed discussions regarding this 
topic are left to follow-up work on the specification.




An endpoints is defined as the part of the URI that is unique to every *data consumer*, or to be 
more precise, unique to every *access profile*.



Since there are no time constrains when it comes to communication with a payload containing 
personal data, parameters for encryption procedures can chosen as costly as the system resources 
allow them to be, thus the level of security can be increased.


 
[^abbr_ietf]: Internet Engineering Task Force; non-profit organisation that develops and releases 
    standards mainly related to the Internet protocol suite




### ePerso, E-Post/de-mail as part of a PKI solution?__\

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
("nicht hoheitlich") feature, it has to comply with several requirements [@web_bsi-spec_eid]
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

Another technology, emerging as part of the *e-government* development, is the *DE-Mail* 
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


*Conclusions:* 
Based on the several requirements and distinct advantages of the two authentication mechanisms, 
it would make sense to use asymmetric cryptography in combination with *HTTPS* for the communication 
between the system and *data consumers*, where the system provides it's own *PKI*
and a token-based authentication on top of *HTTPS* and public CAs for communication between the 
system and the *operator*, preferable based on *[JSON Web Tokens](#link_jwt)*, because the session 
state is preserved within the token rather then having the system itself keeping track of it.


[^abbr_egov]: Electronic government

[^abbr_npa]: in german so called *elektronische Personalausweis (nPA)*

[^abbr_berca]: Berechtigungszertifikate-Anbieter

[^abbr_qes]: Qualified Electronic Signatures [@paper_2013-keymanangement-fuer-qes-mit-npa]

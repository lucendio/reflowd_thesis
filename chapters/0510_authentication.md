## Authentication



Following the [*Requirements* in *Chapter 4*](#requirements), the system has to support two 
[roles (S.A.03)](#sa03). Only one of these roles is assigned to an entity, hence entities that are 
trying to authenticate to the system might have different intentions depending on the 
characteristics of those roles. When inheriting the *operator role*, an entity gains further 
capabilities to interact with the system, such as data manipulation. Another common scenario for the 
operator is to access the system from different devices in order to review *permission requests* in 
real time. Whereas a *data consumer* always uses just one origin and processes requests 
sequentially. Those very distinct groups of scenarios would make it possible to apply different 
authentication mechanisms that don't necessarily have a lot in common.

With respect to the requirements ([S.A.01](#sa01)), the most appropriate way to communicate with the 
*ReFlowd* over the internet would be by using *[HTTP](#def--http)*. Thus, to preserve confidentiality 
on all in- and outgoing data ([S.P.01](#sp01)) the most convenient solution in this case is to use 
*HTTP* on top of the asymmetric cryptography based *TLS* (HTTPS).  
During connection establishment, the initial handshake requires a certificate issued and signed by a 
CA, which has to be provided by the server. This also ensures a reasonable level of identity 
authentication, rather effortless. If the certificate is not installed, it can be installed manually
on the client. If the certificate is not trusted (e.g. it is self-signed), it can either be ignored
or the process fails to establish a connection, depending on the client configurations. The identity
verification in TLS works in both directions, which means not only the client has to verify the
server's identity by checking the certificate. If the server insists, the client has to provide a
certificate as well, which the server then tries to verify. Only if the outcome is positive, the
connection establishment succeeds. According to the TLS specification [@web_spec_tls-12_client-auth] 
it is still optional though.

*HTTP*, as a comprehensive and flexible protocol, enables the use of several technologies for 
server-client authentication purposes. Some of them are built-in, others can simply be implemented 
on top of it.  
Within the scope of this work, those technologies are categorized as the following types: (A) 
stateful and (B) stateless authentication. The first one (A) includes, for example, 
*Basic Access Authentication* (or *Basic Auth*) [@web_spec_basic-auth] and authentications based on 
*Cookies* [@web_spec_cookie]. Whereas the *two-way authentication* (or *mutual authentication* 
[@web_2017_wikipedia_mutual-auth]) in TLS and [authentication based on web-token](#def--jwt) are 
associated with the latter (B).  
*Basic Auth* is natively provided by the *http-agent* and requires, in its original form, username 
and password, and a state on the server; at least when the system has to provide multitenancy. If, 
instead, common access restriction for certain requests would suffice, no state is required, because
no user-related data have to exist on the server. One of the most common implementations of a 
user-specific state is a *session* on the server, that contains one or more values representing the
state and a unique identifier, with which an entity can be associated. A client has to provide that
session ID in order to be provided with all session-related data hold by the server. This is 
typically done in a HTTP header, whether as *Basic Auth* value, a *Cookie*, which is 
domain-specific, or in some other custom header.  
The *two-way authentication* is performed based on files containing keys and certificates, whose 
contents rarely change and don't typically require their state to be tracked in order to 
authenticate a user. Therefore this procedure is categorized as stateless. Order or origin of 
incoming requests have no impact on the result of the actual authentication process. The same 
applies to TLS features such as *Session ID Resumption* and *Session Ticket Resumption* 
[@book_2013_networking-101_tls-session-resumption], therefore they are left aside, because they 
serve the sole purpose of performance optimization. Similar to the *Session Ticket Resumption* 
[@web_spec_tls-session-ticket-resumption] a web token, namely the [JSON Web Token](#def--jwt), also 
moves the state towards the client. A *JWT* carries all context relevant information, including 
possible states, and, if necessary, the token is symmetrically encrypted by the server. That is, 
only the server is able to see the actual data contained by JWT and therefore react accordingly.

Keeping track of one or multiple states on the server and maintaining the synchronization of 
involved data between server and client is, in regards to the additional required resources, 
expensive and far from trivial, because this pattern requires the server to be aware of all current 
states (sessions) and has to have them accessible at all times. A request might depend on preceding 
requests and their incoming order, which thus can have an impact on its response. Furthermore, those
session data have to be stored from time to time. Otherwise, if the server fails to run at some 
point, data only existing in the memory would be gone with no chance to be recovered.  
With stateless authentication, none of those aspects applies. Certificates and keys as well as web 
tokens are both carrying all necessary information with them. Even though stateless authentications,
similar to stateful authentications, require an initial step to obtain some sort of token used to
authenticate all subsequent requests, which can be considered a disadvantage.  
Another aspect of resources are the computations based on asymmetric cryptography, which are usually 
slower than the ones based on symmetric cryptography 
[@book_2014_chapter-10-5-asym-random-number-gen], but since there are no timing constraints when 
interacting with the *ReFlowd*, regardless of whether it's external communication with data consumers 
or internal between components, parameters, that influence the level of security the underlying
cryptographic procedures provide, can be as costly as the system resources allow them to be, thus
the level of security can be increased.  
So, when considering the disadvantages of stateless authentication, *public key cryptography* and 
web tokens are the preferred technologies for all authentication processes.

Except for *two-way authentication*, the initial step in all authentication technologies, as 
mentioned before, is a one-time procedure to obtains a token, which is used to authenticate all 
subsequent requests. This step lasts as long as the token is valid. The reason for such an approach 
is to increase convenience. Otherwise, the user is required to provide credentials on any request, 
which is, in terms of user experience, an unacceptable solution. Even though the 
*two-way authentication* also requires an initial step, that step is different to the one just 
mentioned. Instead of obtaining a token that proves the possession of the credentials, a certificate
is obtained that is used to prove the identity of the communicating partner.  
The step to obtain a token is commonly known as *sign in* and requires the entity to be 
authenticated to provide some credentials consisting of at least two parts. One part that uniquely 
relates to the entity but doesn't have to be private, and another part that only the entity knows or
has. Typically that's a username or email address and a password or some other secret bit sequence 
(e.g. stored on and provided by a USB stick).  
An *[eID card](#def--eid-card)* could possibly be used as secret (or private key) as well. Suitable
use cases for such cards are (A) to let the operator login to the *ReFlowd* management tool or (B)
to authorize *access requests*. How the actual login process (A) would look like partially depends
on the *eID card*'s implementation, but in general, both are reasonable scenarios to utilize an 
*eID card*.
When considering the german implementation *(nPA)* as an example, authenticating to the management
tool requires either a card reader, preferably with an integrated hardware keypad, or a device able
to communicate with the RFID-chip, which would reduce the interaction duration to a minimum. Both
scenarios (A and B) require the *nPA* to have the *eID* feature enabled. If a service wants to
provide *nPA*-based online authentication *(eID-Service)*, which is defined as a *non-sovereign*
[^trans_non-sov] feature, it has to comply with several requirements [@web_bsi-spec_eid] starting
with applying for a permission to send a certificate signing request to a BerCA [^abbr_berca]. This
request is sent from an *eID-Server* [@web_2017_npa-eid-server] in order to get the certificate
signed, which has been previously generated on dedicated and certified hardware. This hardware is
requested by the officials as part of an *eID-Server*. The key pair - re-generated and re-signed
every three days - is needed to establish a connection to the *nPA*, which is then used to
authenticate the owner of that *eID card*.  
The described procedure appears to be highly expensive (regarding effort, hardware costs etc.), 
especially because every single operator would need to go through the whole process in order to 
support this authentication method; not mentioning the uncertainty of the official's decision on the 
permission application. Another approach could be to integrate an external authentication provider 
supporting the *nPA*, which would not only add an additional dependency, but also weaken the system.
Both scenarios are fairly similar, insofar as they would use the same token (eID card) to initially 
authenticate to the system.

The concept of web tokens is fairly straightforward to integrate into the *ReFlowd*. But since web
tokens ensure integrity and optional confidentiality only of their own carriage, not for the entire
HTTP payload, the two requirements need to be addressed separately. Serving HTTP over *TLS* solves
that issue though.  
For connections that use a web token, it should be sufficient to rely on the public HTTPS PKI. All
information required for the actual authentication are provided by the token itself. However, the
situation is different if *two-way authentication* is used instead. In this case, the system has to
provide its own *PKI* including a Certificate Authority that issues certificates for data consumers,
because not only the *endpoints* on the *ReFlowd* (server) need to be certified, all data consumers 
(clients) need to present a certificate as well. Only the *ReFlowd* verifies and thus determines 
(supervised by the *operator*) who is authorized to get access to the system. Hence the *PKI* needs
to be self-contained and private in order to function independently so that only invited parties can
be involved.  
Referring to the statement mentioned above, data consumers also have to be able to verify the 
identity of the *ReFlowd*, in order to prevent man-in-the-middle attacks. Addressing this issue 
basically means, data consumers have to verify the certificate presented by the *ReFlowd*. This can
be done in two ways. One way is by a certificate having been installed on the *ReFlowd* that is 
certified by a trustworthy public CA, as mentioned above. Then consumers use the CA's certificate to
verify the *ReFlowd* certificate. The other way is to let the *ReFlowd* create an asymmetric
key-pair including a certificate and sign it by itself. Before *consumers* are presented with the
self-signed certificate of the *ReFlowd* during the initiation of the TLS connection, they already
have to be aware of that certificate. That is, *consumers* need to be provided with that certificate
on a private channel upfront. Otherwise the process would still be vulnerable to man-in-the-middle
attacks. 

In summary, if a certificate-based connection, performing a *two-way authentication*, establishes 
successfully, it implies that not only the identity of the requested source but also the identity 
originating the request is valid, and through additional features of *TLS* including integrity and
confidentiality of the containing data is provided. Whereas on a token-based authentication every
incoming request has to carry the token so that the system can verify and associate the request with
an account. Furthermore data is not automatically encrypted and thus integrity and confidentiality
is not preserved.

An advantage of token-based authentication over TLS-based *two-way authentication* is that the token 
can be used on multiple clients at the same time. Or an account that a token is associated with, can 
actually have more than one token. Whereas during the asymmetric cryptography-based 
*two-way authentication* the client's private key is required, which results in one-to-one relation. 
So if it's likely that an *operator* has several clients, the same private key has to be on those 
clients. A private key typically should not leave its current system or exist in multiple systems at
the same time in order to prevent exposure, which any action of duplication implies. To reduce those
risks, it's common practice to generate a private key at the location where it's going to be used.

An already existing specification explicitly addressing user authentication is *OpenID*, which could 
be adapted to integrate operator as well as consumer authentication. Although it utilizes 
(sub)domains as entity identifiers, which is similar to how the relation between data consumer and
*ReFlowd* in *two-way authentication* works, OpenID is underpinned by another motivation, which is
providing decentralized authentications as a service, and that is contrary to the independent and 
self-contained model this project follows. Trying to adopt the standard might result in various 
adjustments to *OpenID* leading to an implementation that shares not much compliance to its 
origin, which is not the intention of a standard.



*__Conclusions:__*
\ \
Based on the several requirements ([S.A.03](#sa03), [S.A.04](#sa04), [S.A.06](#sa06), 
[P.I.04](#pi04)) and distinct advantages of the two authentication mechanisms, it is preferred to 
use *HTTPS* for the communication between the system and data consumers, where the system provides 
its own *PKI*. Whereas a token-based authentication on top of *HTTPS* and public CAs should be 
suitable for communication between the system and the operator, preferably based on 
*[JSON Web Tokens](#def--jwt)*, because the session state is preserved within the token rather then
having the system itself keeping track of it.  
Furthermore, authenticating the operator is also doable on the TLS layer; but this approach on a web
platform (browser) is rather inconvenient, if even possible, because a client certificate not only
needs to be transferred to the server and probably signed before it and the corresponding private
key gets installed manually by the operator. For a mobile platform this approach might be more
feasible because this step can be automated during the application installation.  
Addressing the requirement of consumers to verify whether the certificate presented by the *ReFlowd*
can be trusted or not, both solutions, providing a self-signed certificate on a secure channel 
upfront, or using certificates certified by publicly trusted entities, are legitimate. However, the
latter requires an automation depending on an external service that provides a new signed 
certificate whenever a new data consumer registers, such external dependencies should be kept to an
absolute minimum.  
To strengthen an authentication procedure, one or more factors are often added, such as an 
*eID card* or one-time password. This adds complexity to the procedure and thus increases the effort 
that is needed to perform a successful attack. But equally it also increases the effort to support 
those factors in the first place. Using multi-factor authentication is generally valued and will be 
briefly noted as an optional security enhancement for the *operator role*. However detailed 
discussions regarding this topic are left to follow-up work on the specification.



[^abbr_berca]: (german) Berechtigungszertifikate-Anbieter

[^trans_non-sov]: in ger. "nicht hoheitlich"

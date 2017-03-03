## Authentication



First of all, the system has to support two [roles](#sa03). Either one or none of these roles is 
assigned to an entity, hence entities that are trying to authenticate to the system might have 
different intentions depending on the characteristics of those roles. The *operator* for example 
wants to review *permission requests* in real time, so accessing the system from different devices 
is a common scenario. When inheriting the *operator role* an entity gains further capabilities to 
interact with the system, such as data manipulation. Whereas a *data consumer* always uses just one 
origin and processes requests sequentially. Those very distinct groups of scenarios would make it 
possible to apply different authentication mechanisms that don't necessarily have a lot in common.

With respect to the requirements ([S.A.01](#sa01)), the most appropriate way to communicate with the 
*PDaaS* over the internet would be by using *[HTTP](#def--http)*. Thus, to preserve confidentiality 
on all in- and outgoing data ([S.P.01](#sp01)) the most convenient solution in this case is to use 
*HTTP* on top of *TLS*. *TLS* relies i.a. on [asymmetric cryptography](#def--asym-crypto). 
During connection establishment, the initial handshake requires a certificate issued and signed by a 
CA, which has to be provided by the server. This also ensures a reasonable level of identity 
authentication, almost effortlessly. If the certificate is not installed, it can be installed 
manually on the client. If the certificate is not trusted (e.g. it is self-signed), it can either be 
ignored or the process fails to establish a connection, depending on the server configurations. The 
identity verification in TLS works in both directions, which means not only the client has to verify
the server's identity by checking the certificate. If the server insists, the client has to provide 
a certificate as well, which the server then tries to verify. Only if the outcome is positive, the 
connection establishment succeeds. According to the specification [@web_spec_tls-12_client-auth] it 
is still optional though.

*HTTP*, as a comprehensive and flexible protocol, enables the use of several technologies for 
server-client authentication purposes. Some of them are built-in, others can simply be implemented 
on top of it.
Within the scope of this work, those technologies are categorized as the following types: (A) 
stateful and (B) stateless authentication. The first one (A) includes, for example, 
*Basic access Authentication* (or *Basic Auth*) and authentications based on *Cookies*. Whereas the 
*two-way authentication* in TLS mentioned above and [authentication based on web-token](#def--jwt) 
are associated with the latter (B). 
*Basic Auth* is natively provided by the *http-agent* and requires, in its original form 
*(user:password)*, some sort of state on the server; at least when the system has to provide 
multitenancy. If instead just a general access restriction for certain requests would suffice, 
no state is required. One of the most common implementations of user-specific states is a *session* 
on the server, that contains one or more values representing the state and a unique identifier, with 
which an entity can be associated. A client has to provide that session ID in order to be provided 
with all session-related data hold by the server. This is typically done in a HTTP header, whether 
as *Basic Auth* value, a *Cookie*, which is domain-specific, or in some other custom header. 
Since the *two-way authentication* (or *mutual authentication* [@web_2017_wikipedia_mutual-auth]) is
performed based on files containing keys and certificates, which are typically not very fluctuant in
its contents or state, this procedure is categorized as stateless. Order or origin of incoming 
requests have no impact on the result of the actual authentication process. The same applies to TLS 
features such as *Session \[ID, Ticket\] Resumption* 
[@book_2013_networking-101_tls-session-resumption], therefore they are left aside, because they 
serve the sole purpose of performance optimization. Similar to the *Session Ticket Resumption* 
[@web_spec_tls-session-ticket-resumption] a web token, namely the [JSON Web Token](#def--jwt), also 
moves the state towards the client, but that's about all they have in common. A *JWT* carries 
everything with it that's worth knowing, including possible states, and if necessary the token is 
symmetrical encrypted by the server. That is, only the server is able to see the actual data 
contained by JWT and therefore reacting accordingly.

Keeping track of one or multiple states on the server and maintaining the synchronization of 
involved data between server and client is expensive and far from trivial, because this pattern 
requires the server to be aware of all current states (sessions) and has to have them accessible at 
all times. The additional resources required for such an approach are referred to as being 
expensive. It also means that requests, ultimately resulting in responses that contain contents, 
might depend on preceding requests and their incoming order. Furthermore those session data have to 
be in a consistent state in order to be safely stored from time to time. Otherwise, if the server 
fails to run at some point, data only existing in the memory would be gone with no chance to be 
recovered. With stateless authentication, none of those aspects applies. Certificates and keys as 
well as web tokens are both carrying all necessary information with them.
Computations based on asymmetric cryptography are usually slower than the ones based on symmetric
cryptography [@book_2014_chapter-10-5-asym-random-number-gen], but since there are no timing 
constraints when interacting with the *PDaaS*, regardless of whether it's external communication 
with *data consumers* or internal between components, parameters for cryptographic procedures can be 
as costly as the system resources allow them to be, thus the level of security can be increased.
So, when considering the disadvantages of stateless authentication, *public key cryptography* and 
web tokens are the preferred technologies for all authentication processes.

Except for *two-way authentication*, all authentication technologies mentioned above require an 
initial step from the client to obtain some sort of token that is used to authenticate all 
subsequent requests. This step is commonly known as *sign in* and requires the 
entity to be authenticated to provide some credentials consisting of at least two parts. One part that 
uniquely relates to the entity but doesn't have to be private, and another part that only the entity 
knows or has. Typically that's a username or email address and a password or some other secret bit 
sequence (e.g. stored on and provided by a USB stick).
An *[eID card](#def--eid-card)* could possibly be used as secret (or unique object) as well. 
Suitable use cases are (A) to let the *operator* login to the *PDaaS* management tool or (B) to 
approve or authorize *access requests*. How the actual login process (A) would look like partially 
depends on the *eID card*'s implementation, but in general, both are reasonable scenarios to utilize
an *eID card*. When considering the german implementation *(nPA)*, for example, 
accessing the management tool via desktop requires a card reader, preferably with an integrated 
hardware keypad. Whereas authenticating to the tool with a mobile device could be achieved with the 
card's RFID-capabilities, as long as the device used is able to communicate with the RFID-chip. This 
would reduce the interaction duration to a minimum. 
Both scenarios (A+B) require the *nPA* to have the *eID* feature enabled. If a service wants to 
provide *nPA*-based online authentication *(eID-Service)*, which is defined as a non-sovereign 
*("nicht hoheitlich")* feature, it has to comply with several requirements [@web_bsi-spec_eid] 
starting with applying for a permission to send a certificate signing request to a BerCA 
[^abbr_berca]. This request is sent from an *eID-Server* [@web_2017_npa-eid-server] in order to get 
a public key signed, which has been previously generated on dedicated and certified hardware. This 
hardware is requested by the officials as part of a *eID-Server*. The key pair - re-generated and 
re-signed every three days - is needed to establish a connection to the *nPA*, which is then used to 
authenticate the owner of that *eID card*. 
The described procedure appears to be highly expensive (regarding effort, hardware costs etc.), 
especially because every single *operator* would need to go through the whole process in order to 
support this authentication method; not mentioning the uncertainty of the official's decision on 
the permission application. Another approach could be to integrate an external authentication 
provider supporting the *nPA*, which would not only add an additional dependency, but also weaken 
the system.
Both scenarios are fairly similar, insofar as they would use the same mechanism to initially 
authenticate to the system, but with different intentions.

Because of its simplicity, the concept of web tokens is fairly straightforward to implement into 
the *PDaaS*. But since web tokens ensure integrity and optional confidentiality only of their own 
carriage, not for the entire HTTP payload, the two requirements need to be addressed separately. 
Serving HTTP over *TLS* solves that issue though.
For connections that use a web token, it should be sufficient to rely on the public PKI that drives 
the internet with *HTTP* over *TLS*. All information required for the actual authentication are 
provided by the token itself. However, the situation is different if *two-way authentication* is 
used instead. In this case, the system has to provide its own *PKI* including a Certificate 
Authority that issues certificates for *data consumers*, because not only the *endpoints* on the 
*PDaaS* (server) need to be certified, all *data consumers* (clients) need to present a certificate 
as well. Only the *PDaaS* verifies and thus determines (supervised by the *operator*) who is 
authorized to get access to the system. Hence the *PKI* needs to be self-contained and private in 
order to function independently so that only invited parties can be involved.
Referring to the statement mentioned above, *data consumers* also have to be able to verify the 
identity of the *PDaaS*, in order to prevent man-in-the-middle attacks. Addressing this issue 
basically means, *data consumers* have to verify the certificate presented by the *PDaaS*. This can
be done in two ways. One way is by a certificate having been installed on the *PDaaS* that is 
certified and therefore trusted by a trustworthy public CA, as mentioned above. Then *consumers* use 
the CA's certificate to verify the *PDaaS* certificate. The other way is to let the *PDaaS* create 
and sign a public key by itself. Before *consumers* are presented with the self-signed certificate 
of the *PDaaS* during the initiation of the TLS connection, they already have to be aware of that 
certificate. That is, *consumers* need to be provided with that certificate on a private channel
upfront. Otherwise the process would still be vulnerable to man-in-the-middle attacks. 

In summary, if a public-key-based connection, performing a *two-way authentication*, establishes 
successfully, it implies that the identity originating the request is valid and the integrity of the 
containing data is given. Whereas on a token-based authentication every incoming request has to 
carry the token so that the system can verify and associate the request with an account. Furthermore 
data is not automatically encrypted and thus integrity is not preserved.

An advantage of token-based authentication over TLS-based *two-way authentication* is that the token 
can be used on multiple clients at the same time. Or an account that a token is associated with, can 
actually have more than one token. Whereas during the asymmetric cryptography-based 
*two-way authentication* the client's private key is required, which results in 1:1 relation. So if 
it's likely that a *operator* has several clients, regardless of why, the same private key has to be 
on those clients. A private key typically should not leave its current system or exist in multiple 
systems at the same time in order to prevent exposure, which any action of duplication implies. To 
reduce those risks, it's common practice to generate a private key at the location where it is going 
to be used.

OpenID, an open standard for decentralized user authentication, also uses subdomains as unique 
identifiers to associate with entities that need to be authenticated, similar to the approach 
proposed in this work. But since it originates in a very distinct scenario it is also very related 
and therefore restricted to that. Trying to adopt the standard might result in various adjustments 
to this project leading to an implementation that shares not much compliance, which is not the 
intention of a standard.



*__Conclusions:__*
Based on the several requirements and distinct advantages of the two authentication mechanisms, 
it is preferred to use asymmetric cryptography in combination with *HTTPS* for the communication 
between the system and *data consumers*, where the system provides its own *PKI*. Whereas a 
token-based authentication on top of *HTTPS* and public CAs should be suitable for communication 
between the system and the *operator*, preferably based on *[JSON Web Tokens](#def--jwt)*, because 
the session state is preserved within the token rather then having the system itself keeping track 
of it. Though, it is worth mentioning, that a JSON Web Token implementation is feasible as well to 
fully replace the approach of *two-way authentication* and private *PKI*. The disadvantage here 
would be, whether *data consumers* are able to authenticate themselves or not, a HTTPS connection 
will establish in any case. At the same time, authenticating the *operator* is also doable on the 
TLS layer; but this approach is restricted only to environments considered at least *private*, like 
native mobile applications, because browser-based applications are neither *trusted* nor *private* 
and thus missing certain capabilities in terms of accessing the host environment (see 
*Chapter 5 - Architecture*).
Addressing the requirement of *consumers* to verify whether the 
certificate presented by the *PDaaS* can be trusted or not, both solutions, providing a 
self-signed certificate on a secure channel upfront, or using certificates certified by publicly 
trusted entities, are legitimate. However, the latter requires a service or an automation that 
provides a new signed certificate whenever a new *data consumer* registers, such dependencies should 
be kept to an absolute minimum.
To strengthen an authentication procedure, one or more factors are often added, such as an 
*eID card* or one-time password. This adds complexity to the procedure and thus increases the effort 
that is needed to perform a successful attack. But equally it also increases the effort to support 
those factors in the first place. Using multi-factor authentication is generally valued and will be 
briefly noted as an optional security enhancement for the *operator role*. However detailed 
discussions regarding this topic are left to follow-up work on the specification.



[^abbr_berca]: (german) Berechtigungszertifikate-Anbieter

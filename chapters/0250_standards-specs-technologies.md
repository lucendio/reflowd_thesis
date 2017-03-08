## Standards, Specifications and related Technologies



This project strives to involve well known and commonly used standards, instead of reinventing 
technologies that already exist, to acknowledge the work that's been done, to increase the chances 
of interoperability, and to lower the required effort to integrate with third parties or other APIs.
The following section briefly describes potential technologies and outlines the purposes they might
serve and why.



As it is assumed that data is transferred over a non-private channel, several features might be 
desired in order to provide trustworthy and secure communication. One important aspect might be 
that no one except sender and receiver are able to know and see what the actual data are.
Utilizing cryptographic technologies can provide such properties.  
__Symmetrical Cryptography__, as one option, provides a possible solution. It states that sender 
and receiver arrange a common secret, which is used to encrypt as well as to decrypt the data. 
Anyone who is not allowed to access that information must not be in possession of the secret. 
To agree on a secret without compromising it during that process, both entities either need to 
switch to a private medium (e.g meet physically and exchange) or have to use a procedure in which 
the entire key is not exposed to others at any single point in time.   
Such a procedure could be, among others, the __Diffie-Hellman-Key-Exchange__ 
[@paper_1976_d-h-key-exchange], which is based on the mathematical discrete logarithm problem. It 
allows two parties to agree on a common *secret* while using a non-private channel. The data 
exchanged during the process alone cannot be used to exploit the secret.  
The possibility to securely communicate on a non-private channel is also one of the strengths of
__[Asymmetrical Cryptography]{#def--asym-crypto}__ *(or public-key cryptography)* 
[@book_2014_chapter-9-1-public-key-crypto], which is underpinned by a *key-pair* for every 
communication participant; one key is *public* and the other one must be kept strictly *private*. 
The *public* key is used to *encrypt* the data, and only the *private* key can be used for 
*decrypting* the cipher. With __RSA__ [@web_spec_rsa], one of the *cryptographic systems* used in 
asymmetrical cryptography, it's even possible to switch the roles of the keys, meaning regardless of 
which key is used to encrypt the data, only the corresponding part is able to decrypt the cipher. If 
this technique is combined with the concept of digital signatures (encrypted fingerprints from 
data), the result is a so called certificate, that provides integrity and authentication. It
consists of the *public key* attached with owner information and a digital signature of that key.

*Hypertext Transfer Protocol (__[HTTP]{#def--http}__)* [@web_spec_http1], commonly known as part of 
the *Application Layer* in the *Open Systems Interconnection model (OSI model)* 
[@web_2017_wikipedia_osi-model], is one of key technologies the *World Wide Web* is based on. This 
stateless protocol is mainly used to transfer any media type reliably between internet endpoints.
It most likely will fulfill the same purpose in the context of this work, because it implements a
server-client pattern at its very core. This results in a communication scenario with a one-to-one
relationship. Whether internal components, locally on the same host or as part of a distributed
system, talk to each other or data consumers interact with the system, this protocol transfers the
data that needs to be exchanged. The relevance and use cases of features introduced with Version 2 
[@web_spec_http2] of the protocol are not yet explored.

Putting *HTTP* on top of the __Transport Layer Security (TLS)__ protocol [@web_spec_tls] results in 
secure *HTTP*, also know as *[HTTPS]{#def--https}*.
TLS provides encryption during data transport, which reduces the vulnerability to 
*man-in-the-middle* attacks and thus ensures not only confidentiality, but data integrity too. 
*Asymmetric cryptography* is the foundation for the connection establishment in *TLS*, hence it also 
allows to verify the relation between the identity of the communicating party and the presented 
certificate. This procedure can be performed by both parties. Depending on the integration, it could 
even be used to authenticate that party.
Though relying on those cryptographic concepts requires additional infrastructure. Such an 
infrastructure is known as *Public Key Infrastructure (PKI)* [@book_2014_chapter-14-5-pki]. It 
manages and provides keys and certificates for a dedicated scope of entities in a directory, 
including information related to their owners. *PKI*s commonly utilize a hierarchical chain of 
trust, although cross-signing is possible as well. A *Certificate Authority (CA)*, as part of that 
infrastructure, issues, maintains and revokes digital certificates. The infrastructure that is
needed to provide secure HTTP connections for the internet is one of those *PKI*s - a public one and
probably one of the largest. It is based on the IETF [^abbr_ietf] standard *X.509* [@web_spec_x509].

Unlike *HTTP*, __WebSockets__ [@web_spec_websockets] provide the concept of ongoing bidirectional 
connections on top of a TCP [^abbr_tcp] connection, though connection establishment is happening
via HTTP(S). The result is a connection *upgrade*, which enables both protocols running side by side 
on the same server port. This makes it also possible to use TLS for encrypting connections. So,
instead of mimic real-time data exchange and pending remote procedure call responses with 
long-polling over HTTP, the secure WebSocket protocol (*wss*) provides such patterns as well, but in 
a more efficient way. It is conceivable to use *WebSockets* as the transport technology to
communicate between the system's components and even with external parties.

While the transport of email-based communication is also underpinned by *TLS*, the emails themselves 
still exist in plain text at all times. Utilizing end-to-end encryption for such communication is 
another example of applying *public-key cryptography*.  
Here, a more decentralized and liberal approach of a *PKI* is enforced. Instead of a *trust chain* 
structure, public keys are typically signed or cross-signed with no hierarchical order, such as 
known from the *PKIX (or PKI based on X.509)*. This approach, known as __web of trust__, consists of 
multiple *public key servers*, in which all entities (user; senders and recipients) are signing each
other's public keys. The more users have signed a public key, the higher the level of trust is that
the encrypted content can only be read by whom the signed key-pair belongs to. Public keys are
simply uploaded by its owners to the key servers mentioned before. If someone wants to write an
email to others, for every recipient the relating public key can be obtained from these public
servers, so that the email is then encrypted with those keys - for every recipient individually.
Therefore the email is only readable by the owner of the key's private part.

In the past years different countries around the world started to introduce information technology 
to the day-to-day processes, interactions and communications between public services and their 
citizens. Processes like changing residence information or filing tax reports, are all summarized 
since then under the name *E-government* [^abbr_egov]. One of those developments is the so called 
__[Electronic ID Card]{#def--eid-card}__, hereinafter called *eID card*. Equipped with storage,
logic and interfaces for wireless communication, those *eID cards* can be used to store certain 
information and digital keys, or to authenticate the owner electronically to a third party without 
being physically present.  
Such an *eID card* was introduced also in Germany in 2010. The so called *nPA* [^abbr_npa] has been
an important step towards an operational *e-government*. Aside from minor flaws 
[@web_2013_npa-sicherheitsdefizit] and disadvantages [@web_2014_test-qes-support-in-npa] an 
*eID card* might come along with, the question here is, how can such technology be usefully
integrated in this project and is it plausible to do so.  
As an official document, the card has one major advantage over inherent, self-configured or 
generated secrets like passwords, fingerprints or TANs [^abbr_tan]. It is *signed* by design, which 
means, by creating this document and handing it over to the related citizen, the third party 
(or *'authority'*) - in this case the government - has verified the authenticity of that individual.
Although, this procedure does not guarantee that the third party has no copy of the private key(s) 
stored on the *eID card*.

Another technology emerging as part of the *e-government* development, is the german 
__[De-Mail]{#def--de-mail}__ [@web_2017_about-de-mail]. It's an email service that is meant to 
provide digital infrastructure and mechanisms to exchange legally binding electronic documents.   
When registering for a De-Mail account, the provider is compelled to verify the identity of the 
applicant (e.g. government-issued identification document) in order to ensure sender and receiver's 
authenticity, whereas for sending a De-Mail, only the account credentials (identifier, password) are 
required. A successful authentication is considered sufficient to prove the user's identity. The 
De-Mail itself is not encrypted at any time, only the transport layer, on which the document is 
transferred, is based on TLS and thereby encrypted.  
Upon arrival at the providers De-Mail Server, only the provider signs the De-Mail and then sends it
to the server of the receiver's provider. That is, only De-Mail providers are able to sign their
users De-Mails. It is optional and up to every user to utilize *end-to-end* for complete 
confidentiality, or *Qualified Electronic Signatures (QES)* [@web_2017_wikipedia_qes], which is a
capability of the *nPA* and can be used to verify the author's identity.

__JSON__ [^abbr_json] is an alternative to the *Extensible Markup Language (XML)*, which in this 
context it is only referred to as another text-based data serialization format. The JSON-syntax is 
inspired by the JavaScript object-literal notation and is therefore more readable compared to XML. 
It's heavily used in web contexts to transfer data via *HTTP*. Like XML, its structuring mechanisms
allow i.a. type preservation and nesting, which enable the representation of more complex data
structures, including relations.

If, due to being part of a distributed software, some components are required to not maintain any 
state, either that software architecture needs to be changed so that the state is no longer needed
in that component, or the state needs to be embedded into the process communication so that it's
passed from one component to the other. This is a common use case for a
__[JSON Web Token (JWT)]{#def--jwt}__ [@web_spec_json-web-token]. A *JWT* is formatted as *JSON*, 
but URL-safe encoded with *base64url* [@web_spec_base64url], a version of the widely used *Base64* 
encoding, before it gets transferred.  
The token itself contains the state. Here is where the use of *HTTP* comes in handy because the 
token can be stored within the HTTP header, which consists of additional meta information about the 
HTTP connection and data that is exchanged between client and server. Therefore the token can be 
passed through all communication points, where the data can then be extracted and verified. Such a 
token typically consists of three parts: (A) information about itself *(header)*, (B) a *payload*, 
which can be arbitrary data such as user or state information, and (C) the so called *signature*, 
which effectively is a *hash-based message authentication code (HMAC)* [@web_spec_hmac] preserving
the integrity of header and payload. All three parts are separated with a period. Additional
standards define encryption *(JWE [^abbr_jwe])* to ensure confidentiality, and digital signatures
*(JWS [^abbr_jws])*, which enables others than only the signer to validate the *signature*.  
Using a *JWT* for authentication purposes is described as *stateless authentication*, because the 
verifying entity doesn't need to be aware of session IDs nor any other information about a session. 
So, instead of the backend interface being burdened to check a state on every incoming request in 
order to verify permissions, which required to maintain a state in the first place, it just needs 
to decrypt the token and proceed according to the contained information.

Furthermore, the open standard __[OAuth]{#def--oauth}__ defines a process flow for authorizing third
parties to access externally hosted resources, such as the user's profile image on a social media
platform.   
The authorization validation is done by the help of a previously generated token. However, 
generating and supplying such tokens can be initiated in a variety of ways depending on the 
underlying architecture and design, for example, with the user entering her credentials. This design 
seems to misleadingly encourage developers to integrate *OAuth* as an authentication service
[@web_2012_problem-with-oauth-for-authentication] rather then an authorization service, whether as
an alternative or as an addition to existing in-house solutions. In doing so, the application 
authors pass the responsibility on to the OAuth-supporting data providers.  
OAuth *version 1.0a* [@web_spec_oauth-1a], which is rather considered a protocol, provides 
confidentiality by encrypting data before it gets transferred, and integrity of transferred data by 
using signatures. Whereas *Version 2.0* [@web_spec_oauth-2], labeled as a framework, requires a 
*TLS* encrypted communication channel and thus passes on the responsibility for confidentiality and
integrity to the transport layer below. It also supports additional process flows for scenarios
involving specific platforms such as 
*"web applications, desktop applications, mobile phones, and living room devices"* 
[@web_2016_oauth-2, para. 1].

__OpenID__ on the other hand, as another open standard, is explicitly designed to validate the 
authenticity of a requesting user. An in-depth description of the whole process can be found in the
protocol's same-titled specifications [@web_spec_openid-spec-index].
With decentralization in mind, the protocols's nature encourages to design a distributed application
architecture, similar to the idea behind a *microservice* [^desc_microservice], but without owning
all services involved - *decentralized authentication as a service* so to say. An application owner
doesn't have to write or implement its own user authentication and management system, instead it is
sufficient to merely integrate those parts that are needed to support signing in with *OpenID*,
which is typically a client interacting with the Identity Provider.  
Equally the user is not required to register an account for every new app, instead she can use her 
*OpenID*, already created with an Identity Provider, to authenticate with the application. The 
extension *OpenID Attribute Exchange* allows the importing of additional profile data, similar to 
what OAuth is meant to be used for. *OpenID Connect* [@web_spec_openid-connect-1] is the third
iteration of the OpenID technology.  
While *facebook login* [@web_docs_facebook-login] (formerly *facebook connect* 
[@web_2017_wikipedia_facebook-connect]), for example, uses OAuth also for authentication 
(known as pseudo-authentication [@web_2017_wikipedia_openid-vs-pseudo-oauth]) instead of just
authorising entities, *OpenID connect* on the other hand, provides authentication in an additional
layer built upon *OAuth2.0* and *JWT*. Previous versions of OpenID have provided the concept of
extension in order to add functionality such as accessing profile information. This ability is now
part of the core facilitated by OAuth, so that a user's identity can share certain data with third
parties via *REST* interface. 

The concept, known as *Representational State Transfer*, or __REST__ [^abbr_rest], refers to a 
common set of principles on how to design web resources and their interaction. It primarily defines
server-client communication in a more generic and therefore interoperable way. Aside from
hierarchically structured URLs, which can reflect semantic relations or hierarchical order between
data items, it involves a rudimentary vocabulary [^http_methods] for HTTP requests to provide basic
CRUD-operations [^abbr_crud] across distributed systems. The entire request needs to contain
everything that is required to be processed on the REST-server, for example state information and
possibly authentication parameters.   
A RESTful API typically has the purpose of exposing certain features provided through the platform 
or service to third parties in order to synergistically integrate with them. But utilizing these
principals for all internal server-client interaction is also very common.
This concept can also be understood as a proxy to the actual business logic in the back end.

The concept of an application (or software) __[container]{#def--container}__ is about encapsulating 
runtime environments by introducing an additional layer of abstraction. A container bundles just 
those software dependencies (e.g. binaries) that are absolutely necessary so that the enclosed 
program is able to run properly. The actual separation from the host system is done, aside from 
other technologies, with the help of two features provided by the Linux kernel. *Cgroups* 
[^abbr_cgroups], which defines or restricts how much of the existing resources can be used by a 
group of processes (e.g. CPU, memory or network). Whereas *namespaces* [@web_2016_kernel-namespace] 
defines or restricts what parts of the system can be accessed or seen by a process (e.g. filesystem, 
user, other processes).  
The idea of encapsulating programs from the operating system-level is not new. Technologies, such as 
*[libvirt](https://libvirt.org)*, 
*[systemd-nspawn](https://wiki.archlinux.org/index.php/Systemd-nspawn)*, 
*[Jails](https://www.freebsd.org/doc/handbook/jails.html)*, 
or *hypervisors* (e.g. 
[VMware](https://www.vmware.com), 
[KVM](https://www.linux-kvm.org), 
[VirtualBox](https://www.virtualbox.org)) 
have been used for years, but some of them were usually too cumbersome and never reached a great 
level of convenience, so that only people with expertise have been able to handle systems built upon 
virtualization, whereas people with other backgrounds couldn't and weren't very interested, at least 
until *[Docker](https://www.docker.com)* and *[rkt](https://coreos.com/rkt)* emerged.  
After some years of separated work, both authors, accompanied by additional parties, recently joined
forces in the *Open Container Initiative* [@web_2016_open-container-initiative], which promises to
harmonize the diverged landscape and start building common ground to ensure a higher
interoperability. That, in turn, started to raise the demand for sophisticated orchestration. It 
also marks the initial draft of specifications for runtime [@web_oci-spec_runtime] and image 
[@web_oci-spec_image] definition for *application container*, which are still under heavy 
development. This concept of *containerization* also has the side-effect of making the application 
platform-agnostic, because it allows a certain set of software to run on a system which might 
otherwise not support that software (e.g. mobile devices); it just requires the runtime to be 
supported.

The *query language (QL)* __[GraphQL]{#def--graphql}__ [@web_spec_graphql], developed by Facebook 
Inc., abstracts multiple data sources into an unified API or resource. The additional abstraction 
layer allows different storage technologies to be seamlessly queryable without using their native 
*query languages*. The result is provided in JSON format, which naturally supports graph-like data
structures. This is utilized in GraphQL and implicitly embraced through its purpose of abstraction.
Data items that might be somehow related but stored in different locations, can be obtained so that
both end up in the same object through which they are related or indirectly linked to each other.
The shape of a query is later mirrored by the result. GraphQL is not only an abstraction towards a
more generic query language. It also separates almost any operation and the flow control from the
the *QL* and moves it into a second layer. The so called *GraphQL* server is responsible for
resolving and executing queries. 

The term __[Semantic Web]{#def--semantic-web}__ bundles a conglomerate of standards released by the 
*World Wide Web Consortium (W3C)* [^abbr_w3c]. It is based on an idea called *web of linked data*, 
which aims to *"enable people to create data stores on the Web, build vocabularies, and write rules 
for handling data"* [@web_2016_w3c_semantic-web-activity, para. 1]. The standards address syntax,
schemas, formats, access control and integrations for several scopes and contexts. Among others, the
following three technologies are essential for the *Semantic Web*. *RDF* [^abbr_rdf] basically
defines the syntax. *OWL* [^abbr_owl] provides the guidelines on how the semantics and schemas
(vocabulary) should be defined and with [SPARQL]{#def--sparql} [@web_w3c-tr_sparql], the query
language, data can be retrieved.    
The idea of the *Semantic Web* tries to utilize the web as a database of queryable data with URIs
that are embedded in arbitrary websites. Imagine a person's email address, which is available under
a specific domain (preferably owned by that person) - or to be more precise, a URI *(WebID)
[@web_w3c-draft_webid]* - and provided in a certain syntax *(RDF)*, tagged with the semantic
*(OWL)* of a email address, all together embedded in an imprint of a website. This information can
then be queried *(SPARQL)*, if the unique identifier of that person *(URI)* is known.   
While defining the standards, a main focus was to design a syntax that is at the same time valid 
markup. The vision behind this: embracing the concept of a single source of truth (per entity) and 
embedding or linking data items rather then creating new instances of the same data that might be
only valid at that point in time - in short, preventing redundant work and outdated data.  
Related to the *Semantic Web* is the a project called __Solid__ [^abbr_solid]. Backed by the 
*WebAccessControl* [@web_2016_wiki_webaccesscontrol] system and based on the *Linked Data* 
principles including the standards just mentioned, the project focuses on decentralization and
personal data management while developing a specification around this. A reference implementation 
called *databox* [@web_2016_demo_databox] follows the specification process. 



[^abbr_json]: The JavaScript Object Notation (JSON) Data Interchange Format; ECMA Standard  
    [@web_spec_json] and Internet Engineering Task Force RFC 7159 [@web_rfc_json]

[^abbr_jwe]: JSON Web Encryption, Internet Engineering Task Force RFC 7516 
    [@web_spec_json-web-encryption]

[^abbr_jws]: JSON Web Signature, Internet Engineering Task Force RFC 7515 
    [@web_spec_json-web-signature]
    
[^abbr_ietf]: Internet Engineering Task Force; non-profit organisation that develops and releases 
    standards mainly related to the Internet protocol suite
    
[^abbr_tcp]: *Transmission Control Protocol*, provides a reliable host-to-host connection; part of 
    the Internet Protocol Suite (see RFC 761)
    
[^desc_microservice]: a pattern to split a monolithic application into smaller, independent, parts 
    that are easier to maintain but still communicating with each other  

[^abbr_rest]: *Representational State Transfer*, introduces by Roy Fielding in his doctoral 
    dissertation [@web_spec_rest] 

[^http_methods]: HTTP Methods or Verbs [@web_spec_http-methods] (e.g. GET, OPTIONS, PUT, DELETE)
    
[^abbr_crud]: Create, Read, Update, Delete
    
[^abbr_w3c]: international community that develops standards for the web  
    
[^abbr_rdf]: Resource Description Framework [@web_w3c-tr_rdf]

[^abbr_owl]: Web Ontology Language [@web_w3c-tr_owl]

[^abbr_solid]: social linked data [@web_spec_solid]

[^abbr_cgroups]: control groups [@web_2015_cgroup-doc]

[^abbr_egov]: Electronic government

[^abbr_npa]: in german so called *elektronische Personalausweis (nPA)*

[^abbr_tan]: Transaction authentication number

[^abbr_ccc]: Chaos Computer Club e.V.

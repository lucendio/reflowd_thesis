## Access Management



The subsequent section will discuss how several processes surrounding the topic of *data 
consumers accessing data on the PDaaS* can be modeled, what consequences certain variations might 
have, and what issues need to be addressed.
  
Below, a general design is proposed of how *data consumers* get authorized and thereby are able to 
access the *data subject's* personal data, and how 
[previous mentioned technologies](#standards-specifications-and-related-technologies) can be 
assembled in order to meet the specified [requirements](#requirements).

 
### Part One: consumer registration {-}

0)  The *operator* creates a new, unique URI in the system

1)  __Prepare registration__; the *operator* has to tell the third party where and how to register as 
a *data consumer* by handing over a URI uniquely associated to the current registration process. 
*Several things need to be noted here. First, the operator 'pulls' consumers into the system. This 
is the only way for a consumer to establish a relation. If consumers were able initiate this 
process on their own without the operator's involvement, it would be much harder for the system to 
detect spam or fraudulent requests. Second, handing over the URI must be done over a secure 
channel.*

2)  __Send registration attempt__; the third party then makes the actual attempt to register as a 
*data consumer* by providing required information. With this information, some kind of 
feedback channel (e.g. URI)  has to be included so that the system can get back to that third party. They also may 
contain a first *permission request*. 

*NOTICE: the two initial steps can be skipped if the third party would rather present the 
information mentioned in step 2), as a QR-Code so that the *operator* can obtain it and thereby is 
able to proceed. This approach would shortcut and hence simplify the process.*

3)  __Review registration attempt__; the operator gets notified about a new registration attempt, 
which she then has to review and decide whether or not to accept it.

4)  __Create permission profile__; if a *permission request* is enclosed in the registration, it 
has to be reviewed as well. If it's not, the next step follows immediately. 
If permissions are granted, a new *permission profile* is created. Optionally, it could also be 
created if the permissions were refused. It's just meant for the *operator* to keep track of her 
decisions.
 
5)  __Respond to third party__; regardless of the decision, the third party is then informed via the
feedback channel about the decisions and is also provided with further details required to obtain 
actual data.


### Part Two: obtain data {-}

0)  A successful registration as a *data consumer* is required.

1)  __Send request__; the *data consumer* sends the *access request* to the system, containing all 
information about what data is needed, how to process the data, and what the response should contain.

2)  __Parse and check request__; after the system has received an *access request*, it first  
authenticates the *data consumer* and checks related *permission profiles*. According to the 
defined *access rules*, the system decides how to proceed. Either it pauses, because it needs 
further attention from the *operator*, or it can start to process and create the response.

3)  __Compute response__; how the computation would look like mainly depends on the contents of the 
*access request* and also on what a *permission profile* determines (see 'types of access requests'
below).

3)  __Respond to consumer__; handover of the computed response back to the requester by proceeding with 
one of the two following options. Either the system responds with the current status of the process 
and where the *consumer* will/can find the demanded data, or the *consumer* includes a callback URI, 
which the system has to invoke with the demanded response.


With respect to the requirements ([S.P.01](#sp01)), personal data should not leak into the outside. 
To tackle this issue, the following three types of *access requests* are defined, starting with the 
most sufficient solution:

a) __Supervised Code Execution__; *access requests* additionally come with an executable program - 
binary or source code - potentially including information about provisioning. After the required 
data is retrieved from the storage, the program gets invoked with the data locally on the system but 
within a completely separated environment *(sandbox)*. The result of that invocation gets returned 
to the system.
b) __Data DRM [^abbr_drm]__; after data is retrieved from the storage it gets encrypted. The cipher 
is included in the response. Upfront, *data consumers* are equipped with a small program that can 
connect to the *PDaaS* and has to wrap the *consumer's* own software that is planned to process the 
requested data. Now, when *consumers* receive the response, the program needs to get invoked with the 
cipher, so that, by priorly fetching the key from the *PDaaS*, the cipher can be decrypted from 
within the invocation. Thus the data is made available to the wrapped software and only during 
runtime. After the invocation has finished, the program needs to propagate the results that are 
returned by the software back to the outer environment.
c) __Plain Forwarding [default]__; retrieve data from the storage, quick-checking the result, then 
c) __Plain Forwarding [default]__; retrieve data from the storage, quick-checking the result, adding 
an expiration date and forwarding it directly into response.

So that the data won't leave, unless the *PDaaS* doesn't support any of the proposed request types or the 
*data consumer* provides no alternative, the fallback type must be applied. If that's the 
case, the overall confidentiality of all personal data is still preserved, because all 
communications to and from the *PDaaS* are generally happening over HTTPS anyway, so that the data 
is encrypted during the transport.


The concept of authorizing a data consumer for the ability to access personal data is fairly
trivial. During (or after) the *registration*, consumers have to provide detailed information about 
their intentions so that the operator is confident about the required permissions when reviewing them. 
The created *permission profile* reflects the result of that review. Such a permission profile 
defines what data points are permitted to access, how often they can be accessed, how long those 
permissions last and when responded data expires. The latter is defined as *permission type* and is
either one of the following:

*one-time-only*
: access permissions are hereby granted for just a single *access request* (tolerating certain 
errors regarding the communication layer)

*expires-on-date*
: access permissions are hereby granted until the defined point in time has arrived

*until-further-notice*
: access permissions are hereby granted until the *permission type* has changed or the *permission
profile* has been deleted

*NOTICE: The default permission type should be configurable. The operator can change all permission 
profiles at any point in time.*

Among other information, an access request contains the *data query* that shows very precisely 
what data points are affected by that request. So if an *access request* arrives at the *PDaaS*,
assuming the *data consumer* has been authenticated sufficiently, the system (0) searches for a
permission profile that corresponds to the *data consumer* and the requested data points. If it 
fails to find one, the access request is refused. But if it does, then it checks (1) if the 
permission type suffices at that moment and (2) if the query only contains data points that are 
enabled in the profile as well. Here, the order matters because it is imaginable that the 
operation behind (1) is less complex then operation (2). Running (1) before (2) can 
result in a faster response-time, if operation (1) already results negative. If all operations have a 
positive result, access is granted.

As stated in the section about [data reliability](#data-reliability), the *data subject* is able to
add, change, or remove all her data or even the *permission profiles* at any point in time. This 
raises the question of how to solve the situation were *access requests* are being processed while 
those changes are happening and might affect the result of those requests. The first and simplest 
approach would be to not address this issue at all, but that would be unreasonable because 
providing data to the *consumer* normally means for the *data subject* to get something in return or 
to somehow benefit from that. So that approach is not an option. Using a failure of reliability 
verifications as a mechanism to re-request data won't work either in that case, because it would be 
based on a wrong assumption, since that failure can have multiple causes, not only the issue here in 
question.
A stateless solution seems to not fit due to the time-related dependency. So the only 
currently perceivable way is to keep track of all momentarily processing or pending *access 
requests* to detect those who are affected by the changes so that each of them can be aborted and
processed again. Here it is important to determine the right moment, when all changes are done, 
otherwise the system might end up restarting those computations repeatedly within a short amount of 
time. The described issue relates to both *personal data* and *permission profiles* because either
can impact the response that is returned to the *data consumer*.
Furthermore, it needs to be ensured that only after *permission requests* are reviewed and 
*permission profiles* are created, the *data consumers* receive their credentials or a 
notification to get started.

It is up to *data consumers* to decide which data they are requesting to access, but how do they 
know what data can be requested? The only option is to expose information about data availability
([S.I.02](#si02)), which can be done in a variety of ways. First, that information can be made 
publicly available via URI, providing a Machine-readable format so that information can be 
processed automatically by consumers. It is also feasible to restrict that access to registered 
*consumers* only, in order to prevent that information from being crawled. They could be valuable 
as meta data and therefore used in undesired processing that could raise privacy concerns. It is 
imaginable to allow *operators* to restrict the access to such availability information on an 
individual consumer-basis or system-wide, and furthermore, to set default configurations for this 
behaviour. Depending on those configurations a request might fail, thus the requester needs to be provided 
with meaningful errors. Http error codes [@web_spec_http-error-codes] might be a sufficient fit for 
this purpose.

An already standardized way to implement authorization is the [OAuth](#def--oauth) Specification. 
And since the TLS layer is already in place to handle authentication, the choice would be to use 
version 2 of the standard, because it relies on HTTPS.
Only two of the four *grant types* provided by OAuth would match with the process design introduced 
earlier. The types are `password` and `client_credentials`, which basically require identifier(s) and 
secret or credentials to directly obtain a `token`. The other two types define additional steps 
and interactions involving consumer and operator before getting the `token` because they
are intended to be used for processes involving untrusted environments (e.g. browser, third 
party apps). Aside from not fitting into such scenarios it would also make the proposed process 
undesirably more complicated. Although the proposal includes user interactions like selecting and 
confirming requested permissions.
According to the documentations [@web_spec_oauth-1a_client-reg] [@web_spec_oauth-2_client-reg], 
both OAuth versions (1.0a and 2) require the client (here *data consumer*) to register to the 
authorization server upfront (to obtain a `client_id`), before initializing the authorization 
process. However, as stated earlier, the concept of the *data subject* 'pulling' a *data consumer* 
towards the *PDaaS* is preferred over letting *data consumers* try to 'push' themselves towards the 
system. The reason to prevent undesired registration attempts is that they all have to be
reviewed by the *data subject*. Furthermore, it is not within the scope of the OAuth Specification 
to define how this should be accomplished. Thus, such step needs to be added in addition to an 
entire OAuth-Flow, which might cause otherwise avoidable overhead in user interactions. Moreover,
the proposed design does not include that specific registration process either. Instead, this 
process is not needed at all because, according to the proposal, client identification happens implicitly 
as a result of how the resource owner (operator) obtains the registration request from the client
(see *Part One: consumer registration, step 0 to 2*).
Further investigations show that the semantic of an `access_token` from the perspective of a 
resource server consists of (A) authentication [does this token exist?] and (B) authorization 
[Is this token valid and what does it permit?]. Those aspects are in part already provided by the 
proposed way of using the TLS layer. Because every data consumer has its own endpoint to connect 
with the *PDaaS* and the certificate used by the *consumer* is signed by a signature only used for 
that endpoint. This means the consumer is already authenticated when the TLS connection has been
successfully established. And since *permission profiles* relate to a specific endpoint, it would 
make providing an `access_token` obsolete.
To summarize, implementing OAuth would introduce several mechanisms that otherwise can be provided
by the combination of *two-way authentication* in TLS, dedicated endpoints and certification.



*__Conclusions:__* 
In the preceding text, various solutions were examined, resulting in the following three 
available options:
a)  OAuth 1.0a and HTTP
b)  OAuth 2 and HTTPS (public Certification and PKI)
c)  HTTP over TLS with *two-way authentication*, private PKI, sub-domains as dedicated endpoints

The solutions a) and b) require an extra step in which data consumers need to register themselves at 
the *PDaaS*. This already must be done on a secure channel to prevent man-in-the-middle attacks. 
Furthermore, in that step, option a) obtain a symmetric key for creating signatures used to ensure 
confidentiality and integrity in subsequent steps. All those cryptographic procedures need to be 
adopted when implementing the here proposed specification and also when interacting with those 
implementations. While this can cause much more harm, it is proposed to leave as many of these 
sensitive parts as possible to existing implementations who have already proven themselves. Thus 
HTTPS is mandatory, which makes b) more suitable over a), because it's also more flexible and easier 
to implement.
Solution c) moves the complete authentication procedure to a different layer. Hence, it 
results in separating authentication and authorization from each other. This opens the authorization design up to other implementations that might 
be more suitable for certain *data types*. In addition, it would require little effort to 
support the case where multiple *data consumers* share the same *endpoint* and thereby the same 
*permission profiles*.
Combining b) and c) would result in significant redundancy, since both solutions have much overlap 
in their provided features, even though b) aims to be a framework for authorization. The process 
description in the beginning of this section is used as the foundation of *access management* in the 
*PDaaS*. Implementing OAuth based on this design would leave nothing from the framework but a 
simple request returning an identifier associated with permissions. 
And even these identifiers are obsolete when combining TLS with dedicated *consumer*-specific 
endpoints, as c) states. So there is not much benefit in using OAuth, other than developers might 
be familiar with the API. This can be addressed by a detailed specification for this 
project, hence c) is preferred over b). 
In the end, the only suitable use case from this work would consists of just a request that obtains 
a token after authenticating with the provided credentials. OAuth only provides a 
framework for how to authorize third parties to access external resources, leaving the procedure 
of how to actually verify those access attempts up to its implementers 
[@web_spec_oauth-1a_access-verification] [@web_spec_oauth-2_access-verification].
In the context of this project OAuth does not comply with the rest of the design aspects.

How the first steps of a registration look like, is up to the *consumer*, though the 
option involving a QR-Code might result in a nicer user experience from the perspective of a data 
subject. In any case, a secure channel is vital.

When accessing personal data, preventing those data from leakage is almost 
impossible, which originates in the nature of digital data being able to be effortlessly copied.
Nevertheless, it is possible to make it much more difficult, so that it becomes inefficient to bypass 
those mechanisms. At the same time it requires some effort to establish, run, and maintain the 
infrastructure needed for those mechanisms. In case of the *Data DRM* proposal, that effort is not 
proportionate, because it requires additional infrastructure, interfaces, and cryptographic 
procedures and therefore introduces  new attack scenarios. For now the only approach being 
considered is *Supervised Code Execution*, aside from defaulting to simple forwarding. When 
implementing this approach, two directions might need to be considered. Alongside the executable 
program, *data consumers* either provide all dependencies so that everything is bundled up, or don't 
provide any dependencies at all. The latter is preferred, because it reduces the amount of potentially 
malicious, flawed, or needless components, so that the data subject, supported by her *PDaaS*, has 
more supervising capabilities and thus more control over her personal data.
Since the overall goal here is to prevent the data subject from losing control over her data, it is conceivable that certain categories of personal data, representing a higher level of 
sensitivity, require a limited *access type*. If the data consumer does not comply, 
access will be refused.
Also, depending on which category the personal data relates to, the *PDaaS* might  
somehow anonymize certain types of data, if it is even capable of doing so, because the *consumer* 
at least supposedly knows what individual is behind the *PDaaS* it is currently interacting with. 
The field of *data anonymization* is a large research area on its own, which recently started to 
gain a lot of traction due to emerging privacy concerns about *Big Data*. Thus it will be left for 
future work.



[^abbr_drm]: *Digital Rights Management* - set of technologies, that are used to control access to
    data or content that is restricted in certain ways (e.g. content provided by video streaming)

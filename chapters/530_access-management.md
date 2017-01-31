## Access Management



In the subsequent section it will be discussed, how several processes around the topic of *data 
consumers obtaining data from the PDaaS* can be modeled, what consequences certain variations might 
have and what issues need to be addressed.
  
Below it is proposed what a general design might look like for the process of how *data consumers* 
get authorized and thereby access the *data subject's* personal data and how 
[previous mentioned technologies](#standards-specifications-and-related-technologies) can be 
assembled in order to meet the specified [requirements](#requirements).
OR
Based on the [outlined technologies](#standards-specifications-and-related-technologies) and 
specified [requirements](#requirements) the general design for a process in which a *data consumer* 
gets authorized and thereby access the *operator's* personal data is proposed as followed.
 
__Part One: consumer registration__\
0)  The *operator* creates a new unique URI in the system

1)  __Prepare registration__; the *operator* has to tell third party were and how to register as a 
*data consumer* by handing over a URI that is unique to the current registration process. 
*Several things need to be noted here. First, the operator "pulls" consumers into the system. This 
is the only way for a consumer to establish a relation. If consumers were able initiate this 
process on their own without the operator's involvement, it would be much harder for the system to 
detect spam or fraudulent requests. Second, handing over that URI must be done over a secure 
channel.*

*NOTICE: the two initial steps could also be made from the opposite direction. Third parties
put all information and data required for a registration together and present them to the *operator*
in form of a QR-Code, so that the *operator* can obtain it and whereby is able to proceed. This 
approach would short cut and hence simplify the process.*

2)  __Send permission request__; The third party then makes the actual attempt to register as a 
*data consumer* by providing required information. Those information have to be include some kind of 
feedback channel (e.g. URI) so that the system can get back to that third party.

3)  __Review permission request__; the operator gets notified about new registration attempts, which 
she then has to review and decide whether to grant or refuse the requested data access.

4)  __Create permission profile__; if access has been granted a new *permission profile* is going to 
be created. Optionally, a new *permission profile* could also be created if the access has been 
refused. It's just meant for the *operator* to keep track of her decisions.
 
5)  __Respond to third party__; regardless of the decision, the third party get's then informed via 
feedback channel about that decision and is also provided with further details required to obtain 
actual data.


__Part Two: obtain data__\
0)  A successful registration as a *data consumer* is required

1)  __Send request__; *data consumer* sends *access request* to the system, containing a all 
information about what data is needed, how to process the data and what the response should contain.

2)  __Parse and check request__; after the system has received an *access request*, first it  
authenticates the *data consumer* and checks the related *permission profile*. According to the 
defined *access rules*, the system decides how to proceed. Either it pauses, because it needs 
further attention from the *operator*, or it can start to process and create the response.

3)  __Compute response__; How that would look like mainly depends on what the *access request* 
contains and also what the *permission profile* determines (see *access request types* below).

3)  __Respond to consumer__; handover the computed response back to the requester. There are two 
ways of responding to an *access request*. Either the system respond with a state of the process and 
where the *consumer* will/can find the demanded data, or the *consumer* includes a callback URI, 
which the system has to invoke with data in demand.


With respect to the requirements ([S.P.01](#sp01)), personal data should not leak into the outside. 
To tackle this issue, the following three types of *access requests* are defined, starting with the 
most sufficient solution:
(A) __Supervised Code Execution__; *access requests* additionally come with an executable program - 
binary or source code - potentially including information about provisioning. After the required 
data is retrieved from the storage, the program gets invoked with the data locally on the system but 
within a completely separated environment (*sandbox*). The result of that invocation gets returned 
to the system.
(B) __Data DRM [^abbr_drm]__; after data is retrieved from the storage it gets encrypted. 
The cipher is included in the response. Upfront, *data consumers* are equipped with a small program, 
that can connect to the *PDaaS* and has to wrap the *consumer's* own software that is planned to 
proceed the requested data. Now when *consumers* receive the response, the program needs to get 
invoked with the cipher, so that, by priorly fetching the key from the *PDaaS*, the cipher gets 
decrypted from within the invocation. Thus the data is made available to the wrapped software
and only during runtime. After the invocation has finished the program needs to propagate the 
results returned by the software back to the outer environment.
(C) __Plain Forwarding (default)__; retrieve data from the storage, quick-checking the result and 
forwarding it directly into response.

So the data won't leave, unless the *PDaaS* doesn't support any of the proposed request types or the 
*data consumer* provides no alternative, so that the fallback type has to be applied.
If that's the case, the confidentiality of all personal data is already preserved, because all 
communications from and to the *PDaaS* are generally happening over HTTPS anyway, so that the data 
is encrypted during the transport.


The concept of authorizing a *data consumer* to get the ability of accessing personal data is fairly
simple. During the *registration* consumers have to provide detailed information about their 
intentions, so that the *operator* is confident about their permissions when reviewing them. The 
created *permission profile* reflects the result of that review. Such a *permission profile* defines 
what data points are requested to access and how long those permissions last. The later is defined
as *permission type* and can be one of the following:

*one-time-only*
: access permissions are hereby granted for just a single *access request* (with respect to certain 
errors regarding the communication layer)

*expires-on-date*
: access permissions are hereby granted until the defined point in time has arrived

*until-further-notice*
: access permissions are hereby granted until the *permission type* has changed or the *permission
profile* has been deleted

*NOTICE: The default *permission type* should be configurable. The *operator* can change all 
*permission profiles* at any point in time.*

Among other information, an *access request* contains the *data query* that shows very precisely 
what data points are affected by that request. So if an *access request* arrives at the *PDaaS*,
assuming the *data consumer* has been authenticated sufficiently, the systems (0) searches for a
*permission profile* that correspond to the *data consumer* and the requested data points. If it 
fails to find one, the access request gets refused. But if it does, then it checks (1) if the 
permission type suffices at that moment and (2) if the query only contains data points that are also 
enabled in the *profile*. Here the order does matter, because it is imaginable that the operation 
behind (1) is less complex then operation (2). So, at the end running (1) before (2) can result in a 
lower response-time, if operation (1) already results negative. If all operations have a positive 
result, access is granted.

As stated in the section about [data reliability](#data-reliability), the *data subject* is able to
add, change or remove all her data or even the *permission profiles* at any point in time. This 
raises the question of how to solve the situation were *data requests* are being processed, while 
those changes are happening and might affect the result of those requests. The first and simplest 
approach would be to not address this issue at all, but that would be unreasonable, because 
providing data to the *consumer* normally means for the *data subject* get something in return or to 
somehow benefit from that. So that approach is no option. Using a failure of reliability 
verifications as a mechanism to re-request data won't work either in that case, because it would be 
based on a wrong assumption, since that failure can have multiple causes, not only the issue here in 
question.
A stateless solution seems to be not fitting due to the time-related dependency. So the only 
currently perceivable way is to keep track of all momentarily processing or pending *access 
requests*, to detect those who are affected by that changes so that each of them can be aborted and
processed again. Here it is important to determine the right moment, when all changes are done, 
otherwise the system might end up restarting those computations repeatedly within a short amount of 
time. The described issue relates to both, *personal data* and *permission profiles*, because either
can impact the response send to t *data consumer*.
Furthermore, it needs to be ensured that only after the *permission requests* are being reviewed and 
the *permission profiles* are being created, the *data consumers* receive their credentials or a 
notification to get started.

It is up to the *data consumers* to decide which data they are requesting to access, but how do they 
know what data can be requested? The only option is to expose information about data availability, 
which can be done in a variety of ways. First, those information can be made publicly available via 
URI, providing a Machine-readable format, so that it can be processed automatically by *data 
consumers*. It is also feasible to restrict that access to only registered *consumers*, in order to 
prevent those information from being crawled. They might be valued as meta data and therefore used 
in unwanted computations that could raise privacy concerns. It is imaginable to let the *operator* 
restrict the access to these availability information on the level of individual *data consumers* or 
system-wide, and to set a default configuration for that behaviour. Depending on that configurations
request might fail, thus requester need to be provided with meaningful errors. Http error codes 
[@web_spec_http-error-codes] might be a a sufficient fit for that purpose.

An already standardized way to implement authorization would be [OAuth](#link_oauth) Specification, 
and since the TLS layer is already in place to handle authentication, the choice would be to use 
version 2 of the standard, because it relies on HTTPS.
Only two of the four *grant types* provided by OAuth would match with process design introduced 
above. The types are `password` and `client_credentials`, which basically require identifier(s) and 
secret or credentials to directly request the `token`. The other two types define additional steps 
and interactions involving client *(consumer)* and user *(operator)* before getting the`token`. This 
would make the proposed process undesirably more complicated. Although the proposal includes user 
interactions like selecting and confirming requested permissions as well.
According to the documentations [@web_spec_oauth-1a_client-reg] [@web_spec_oauth-2_client-reg], 
both OAuth versions (1.0a and 2) require the client *(data consumer)* to register to the 
authorization server upfront (to obtain a `client_id`), before initializing the authorization 
process. However, as stated before, the concept of the *data subject* "pulling" a *data consumer* 
towards the *PDaaS* is preferred over letting *data consumers* try to "push" themselves towards the 
system. The reason is to prevent unwanted applications for data access, because they all have to get
reviewed by the *data subject*. Furthermore, it is not within the scope of the OAuth Specification 
to define how this should be accomplished. Thus, such step needs to be added in addition to an 
entire OAuth-Flow, which might cause otherwise avoidable overhead in user interactions. Moreover,
the proposed design does not include that step either. Instead, it is not needed process at all,
because according to the former proposed process, identifying the client happens implicitly as a
result of how the resource owner *(operator)* obtains the registration request from the client
(Part One: consumer registration, step 0 and 1).
Further investigations show that the `access_token` semantic as from the perspective of a resource 
server, which are a) authentication (does this token exist?) and b) authorization (is this token 
valid and what does it permit?), have in part already been provided by the proposed way of using the 
TLS layer. Because every *data consumer* has it's own endpoint to connect with the *PDaaS* and the 
certificate used by the *consumer* is singed by a signature that is only used for that endpoint. 
This means, the *consumer* is already authenticated, when the TLS connection has successfully 
established. And since the endpoints relates to the *permission profiles* it would make providing 
an `access_token` to become obsolete.
To summarize, implementing OAuth would introduce several mechanisms that otherwise can be provided
by the combination of *two-way authentication* in TLS, dedicated endpoints and certification.



*__Conclusions:__* 
In the preceding text, various solutions were developed, based on which the following three 
solutions are at disposal:
a)  OAuth 1.0a and HTTP
b)  OAuth 2 and HTTPS (public Certification and PKI)
c)  HTTP over TLS with *two-way authentication*, private PKI, sub-domains as dedicated endpoints

The solutions a) and b) require an extra step were *data consumers* would register themselves at the 
*PDaaS*. This already needs a secure channel to prevent man-in-the-middle attacks. Furthermore does 
option a) obtain a symmetric key for creating signatures used to ensue confidentiality and integrity 
in the subsequent steps. All those cryptographic procedures need to be adopted when implementing the
specification emerging from this work and when interacting with those implementations. While this
can cause much more harm, is is proposed to leave as much of these sensitive parts as possible to 
existing implementations that already have proven themselves. Thus HTTPS is mandatory, which makes 
b) more suitable over a), because it's also more flexible and easier to implement.
Whereas solution c) moves the complete authentication procedure to a different layer. It hence 
results in separating authentication and authorization from each other, leaving no remains of 
relation. This opens the authorization design up to for example other implementations that might be 
more suitable for certain *data types*. In addition, it would only require little effort to support
the case where multiple *data consumers* share the same *endpoint* and thereby the same *permission
profiles*.
And combining b) and c) would result in significant redundancy, since both solutions have much 
overlap in the features they are providing, even though b) aims to be a framework for authorization.
The process description from the beginning of this section will be used as the foundation of *access
management* in the *PDaaS*. Implementing OAuth based on this design would leave nothing from the 
framework, but a simple request returning an identifier for it's permissions. 
And even these identifiers are obsolete when combining TLS with dedicated *consumer*-specific 
endpoint, as c) states. So there is not much benefit in using OAuth, other then developers might be 
somewhat familiar with the API. This can be addressed by a detailed specification for this project, 
hence c) is preferred over b). At the end, the only suitable use case from the specification would 
consists of just a request that obtains a token after authenticating with the provided credentials. 
And since OAuth only provides a framework for how to authorize third parties to access external 
resources, but leaves the procedure of how to actually verify those access attempts up to it's 
implementers [@web_spec_oauth-1a_access-verification] [@web_spec_oauth-2_access-verification].
In the context of this project OAuth doesn't really match with the rest of the design aspects.

How the first steps of a *consumer registration* are look like, is up to the *consumer*, even though
the version involving a QR-Code might result in a nicer user experience from the *data subject's*
perspective. In any case, the secure channel is vital.

When obtaining personal data, at the same time preventing those data from leakage is almost 
impossible, because of the nature of digital data being able to get effortlessly copied. 
Nevertheless it is possible to make it much more difficult, so that it becomes inefficient to bypass 
those mechanism. At the same time it requires also some effort to establish, run and maintain the 
infrastructure needed for those mechanisms. In case of the *Data DRM* proposal that effort is not 
proportionate, because it requires additional infrastructure, interfaces and cryptographic 
procedures, thus introduces new attack scenarios. For now the only approach being considered, is 
the *Supervised Code Execution*, aside from the default forwarding. When implementing this approach,
two directions might need to be considered. Alongside the executable program *data consumers* either
provide all dependencies so that everything is bundled up, or don't provide any dependency at all.
The latter is preferred, because it reduces the amount of potentially malicious, flawed or needless 
components, so that the *data subject*, supported by her *PDaaS*, gains more supervising 
capabilities and thus more control over her personal data.
Since the overall goal here is to prevent the *data subject* from loosing control over her data, it 
might also be conceivable, that certain categories of personal data with a higher level of 
sensitivity also require a least sufficient *request type*. If the *data consumer* does not comply, 
access will be refused.
Also, depending on which category the personal data relates to, the *PDaaS* might be able to 
anonymize certain types of data somehow, if it's capable of doing so all, because the *consumer* at 
least supposedly knows what individual is behind that *PDaaS* it currently interacts with. The field
for *data anonymization* is a large research area on its own, which recently started to gains a lot 
of traction due to emerging privacy concerns about *big data*. Thus it will be left for future work.



[^abbr_drm]: *Digital Rights Management* - set of technologies, that are used to control access to
    data or content that is restricted in certain ways (e.g. content provided by video streaming)

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

*NOTICE:* the two initial steps could also be made from the opposite direction. Third parties
put all information and data required for a registration together and present them to the *operator*
in form of a QR-Code, so that the *operator* can obtain it and whereby is able to proceed. This 
approach would short cut and hence simplify the process.

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

*NOTICE:* The default *permission type* should be configurable. The *operator* can change all 
*permission profiles* at any point in time.

Among other information, an *access request* contains the *data query* that shows very precisely 
what data points are affected by that request. So if an *access request* arrives at the *PDaaS*,
assuming the *data consumer* has been authenticated sufficiently, the systems (0) searches for the
appropriate *permission profile* that correspond to the *data consumer*. If it fails to find one, 
the access request gets refused. But if it does, then it checks (1) if the permission type suffices 
at that moment and (2) if the query only contains data points that are also enabled in the 
*profile*. Here the order does matter, because it is imaginable that the operation behind (1) is 
less complex then operation (2). So, at the end running (1) before (2) can result in a lower 
response-time, if operation (1) already results negative. If all operations have a positive result,
access is granted.



TODO: argument against oAuth:
While in OAuth the authorisation procedure strictly involves an authentication, the previous 
proposed design separates authentication and authorisation from each other so that they can run 
completely independent. Additionally this approach would require almost no effort to support
the case where multiple *data consumers* share the same *endpoint*.
by just disabling the client authentication for the HTTPS connection establishment.



As mentioned before, this result is a complete separation of authenticating a *consumers* and
authorizing their access


    
oAuth (1.0a and 2) requires consumers to register upfront. But since the proposed flow-design 
indicates that the initial step has to be done by the *operator*, it would cause an overhead in user 
interactions. Although the *operator* has already authorized the *consumer* simply by submitting a 
unique URI (`pdaas-server.tld/register?crt=CONSUMER_REGISTER_TOKEN`, of which the `crt` 
is considered private).
Even though the registration provides the consumer with mandatory information such as a 
consumer identifier (v1: `oauth_consumer_key`, v2: `client_id`) and, depending on the client 
type, a secret (see https://tools.ietf.org/html/rfc6749#section-2), this process is not 
part the specification (https://oauth.net/core/1.0a/#rfc.section.4.2, 
https://tools.ietf.org/html/rfc6749#section-2). This enables the possibility of integrating 
oAuth into the consumer registration flow by using the `CONSUMER_REGISTRATION_TOKEN` as
oAuth's *client identifier*. The lack of credentials (v1: `auth_consumer_secret`, 
v2: `client_secret`) would require transferring the consumer identifier done over
a secure channel (e.g. TLS). That would leave *oAuth2* as the version of choice, since it
relies on *HTTPS* adn therefore makes the *secret* optional. Where on the other side
oAuth 1.0a requires a *secret* to create a signature in order to support insecure connections..

Both OAuth versions (1.0a and 2) seem 
Even though it might be possible to integrate *OAuth* without needing to change much in the proposed 
process design, it seems to make not much sense to introduce an additional authentication procedure 
while not gaining any benefit from that or from the whole authorization flow.

OAuth requires authentication in order to authorize, it has a dependency to that authentication 
process by design. However






TODO: how to solve the situation were an external request is processed and during that moment 
the operator is changing some personal data?

TODO: expose information about what personal data is available?
should there be a way to somehow request information about what data is available/queryable,
or would this be result in spam/crawler and security issues (also a question for the topic of
permissions/sensibility level of certain data)




*Conclusions:* 

, because they wont require additional infrastructure and interfaces to the *PDaaS*

It might also be conceivable, that certain categories of personal data with a higher sensitivity 
level also require a least sufficient *request type*. If the *data consumer* does not comply, access
wont be permitted.

Q: need the *consumer* provide the program with or without all dependencies?



Also, depending on which category the personal data relates to, the *PDaaS* might be able to 
anonymize certain types of data somehow, if it's capable of doing so all, because the *consumer* at 
least supposedly knows what individual is behind that *PDaaS* it currently interacts with. The field
for *data anonymization* is a large research area on its own, which recently started to gains a lot 
of traction due to emerging privacy concerns about *big data*. Thus it will be left for future work.








[^abbr_drm]: *Digital Rights Management* - set of technologies, that are used to control access to
    data or content that is restricted in certain ways (e.g. content provided by video streaming)

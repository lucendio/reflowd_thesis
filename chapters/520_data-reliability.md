## Data Reliability



The section [about authentication](#authentication) contained a discussion about how to preserve 
data integrity - referring to possible man-in-the-middle attacks and alike. Furthermore, it 
contained a description of how to authenticate the different user roles so that their identities are 
ensured, although authenticity of the actual data a *PDaaS* provides has yet to be provided. Data 
authenticity here refers to authentic and reliable ([S.A.04](#sa04)) data, which means (A) the data 
really represent the entity that is associated to the originating *PDaaS* and is thus owned by that 
entity, and (B) the data are true at that moment when the data being accessed are queried from 
within the system.

Since the *operator* can change the data at any point in time, this property requires a process 
where a trustworthy third party has to be able somehow to verify the reliability of the data in 
question. That process, on the other hand, is in direct contrast to the discussion about the 
[authentication system](#authentication) and why it should be designed to be self-contained. But if
providing information on data reliability is not required, this won't be an issue anymore. The 
information can be defined in a response as an optional property. Within the request the 
*data consumer* has to indicate whether the response should contain information about its 
reliability or not. Depending on what data is requested, the *PDaaS* then decides to test the 
reliability. Based on the procedures that are available, the data reliability gets verified somehow.

But how should this reliability check look like? It comes down to two general steps. The first is 
matching the actual data involved in that request against a reference dataset. The second is 
optional, although important for the *data consumer* in order to evaluate the sufficiency of the 
provided level of reliability. It involves the party, that also runs the first step, to confirm the 
result of that audit. The result of that evaluation then gets included in the response.

The following proposed methods vary in the provided level of reliability as well as in the amount of 
effort to support them and in the possible impact to their surrounding systems. Not all data points 
are necessary to test for reliability. Profile data for example are more likely to be tested, 
whereas consumption lists or location histories are more difficult to verify, because currently 
there is no reliable way to verify the origin of those datasets, and they are also not a primary 
focus here. 

(1) __Local Verification by matching__\
Probably the simplest and, at the same time, least reliable method is to just look at the existing 
data that are stored in the database and match them against those data that are used to create a 
response.

(2) __Local Verification and signing__\
An electronic ID card can serve as an authentication token for the *operator*, but it can also be 
utilized to verify the reliability of certain data. Using the german implementation *(nPA)* as an 
example, the *eID* feature would provide access to the owner's basic profile data, which can then
be used to match against those data points that are both, held by that *nPA* and going to be used 
to create the response originating in the *PDaaS* persistence layer. If the result of that matching 
procedure is positive, the related data then gets signed with a *QES* courtesy of the 
*data subject's* *nPA*. That signature also gets included in the response, so that the recipient can 
verify the reliability of the data.

(3) __Remote Verification and signing__\
Another method involves a third party who also has the same data that need to be tested. The idea 
is to hand the data in question over to that party, who then tries to match against all those data 
points available in that context. The party also has the ability to sign data, which is what's 
happening, if the matching procedure has a positive outcome. Signing the whole response, or at least 
a replicable dataset that contains the data that were initially needed, is required. The party then 
hands everything back to the *PDaaS* for further processing.

(4) __Recurring Certification__\
The following method describes a modification of (3). This method involves no matching procedure. 
The external third party, verifies whether the data in question are correct and whether they relate 
to the *data subject* by either literally looking at the data or by automatically processing and
matching against their databases. If that party is satisfied, a certificate will be issued. This 
certificate contains an expiration date, which implies the consequence of going through this process 
again in the future, much like an issuing process of a common *Certificate Authority*. This 
certificate is then served as part of a response, which enabled the *data consumer* to verify the 
data's reliability on its own. This is done by hashing the data in question, decrypting the hash 
embedded in the certificate and matching one against the other. If they are equal, the data has not 
changed since the party's review and is therefore reliable. 
Although if data has changed in the *PDaaS* and data points  that are also included in this 
verification process are affected, then a new certificate needs to be issued, because the contained 
hash is now invalid.

Only one method per request should be used to verify data reliability, because every method can 
imply a different level of confidence. As described above, the response sent back to the 
*data consumer* has to indicate the method used. Based on that, the *data consumer* is then able to 
evaluate that level of confidence and can act accordingly (e.g. verify a signature).

Expanding those verification procedures is reasonable, but to keep it simple for now this aspect 
won't receive further attention, since the current requirements are sufficiently met. It will be 
left to future work, however.


*__Conclusions:__*
The signing procedure as part of local verification method involves private key and certificate 
storage on the operator's *eID card*. Every time the *PDaaS* verifies data reliability that method 
has to be performed. Thus the *operator* is forced to interact wit the *PDaaS*. Otherwise, the 
operator's private key needs to be stored somewhere within the *PDaaS*. No matter where or how, 
this would potentially expose a highly confidential part of a cryptographic procedure. 
Not only would this reduce the overall security level of the system, it also makes every task this 
method is involved in vulnerable to certain attacks. Aside from that, it's highly unlikely that an 
*eID card* would allow extraction of the private keys it contains. This all results in increased 
inconvenience which is inevitable for this proposed method. The *Local Verification and signing* 
method has the same dependencies mentioned in the discussion about requirements for using the 
(german) *eID card* as an authentication token. And since it was rejected because of those 
dependencies and because of the inconvenience mentioned before, that verification method ultimately 
is not going to be supported in the specification.

The *Remote Verification and signing (3)* method would require the external party to be an official
authority, because no other entity has (A) the data in question (primarily profile data), which
makes them (B) legally binding; and they are commonly trusted. 
The same goes for The *Recurring Certification (4)*, but while the *Remote Verification and signing* 
method introduces a very strong dependency to that external party, the *Recurring Certification*  
offers a simple, loosely linked dependency. Whose design would make it possible to obtain such a 
certificate manually, but also automatically. Nevertheless, both provide a trustworthy 
certification. 

Finally, the first method, *Local Verification by matching (1)*, which just performs a matching of 
two datasets against each other. Those datasets are obtained from the same *PDaaS* storage, but at 
different times; right before the request finally is sent on, though. 
The primary purpose of addressing the issue of data reliability rests on the *data consumer's* 
concern of accessing data that is intentionally tampered with (e.g. by the *data subject*), since 
integrity during transport is already ensured. In this light, even if the whole system would be 
compromised, which in that case might need more urgent addressing then ensuring data reliability,
it won't mitigate the fact that the *operator* is the only one able to change data. Hence it 
provides the lowest level of reliability.

Certain fields of application of a *PDaaS* as a data resource might already impose constraints 
about the level of reliability and maybe even how it can be provided. Violation of relevant 
legislation or other rules might prevent the *PDaaS* from being put in use. Others - depending on 
their guidelines and business model - don't rely on a certain level of confidence. In general, 
*data consumers* are expected to already have a basic confidence in a *PDaaS* and in the data 
originating there.
Regardless of that, providing an indication on the authenticity of data is valued as a first and 
important step towards a fully working feature. All of the proposed verification methods have some 
downsides, though, the *Recurring Certification* method would be the least invasive and therewith 
an adequate choice.

A primary goal for the *PDaaS* is to preserve all data owned by the *data subject* and giving her
control over where the data might go; not providing sufficient proof for the data authenticity.  
Although it is still important to provide *data consumers* with an information about the level of 
reliability, it is up to them how to rate that information and how to act on that.

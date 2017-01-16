## Data Reliability



Whether it's the *operator* or a *data consumer*, not only the party's identity has to be 
authenticated when communicating with the system, which is handled by the technologies proposed 
in the [authentication](#authentication) section. The actual personal data that's being used 
also has to be authentic and reliable ([S.A.04](#sa04)). But since the *operator* can change the
data at any point in time, this property requires a process where a trustworthy third party has to 
somehow verify the reliability of the data in question. That process on the other hand, is 
in direct contrast to the discussion about the [authentication system](#authentication) and why 
it should be designed so that it is self-contained. If instead it's not required to provide 
information on the data being reliable or not, it won't be an issue anymore. 
The information can be defined in a response as an optional property. Within the request the *data 
consumer* has to indicate whether the response should contain information about it's reliability or 
not. Depending on what data is requested, the *PDaaS* decides whether it's necessary to test for 
reliability or not. Based on the procedures that are available, the data reliability gets verified 
somehow.

But how does this reliability check exactly should look like? It comes down to two general steps. 
The first one is matching the actual data involved in that request against a reference data set. 
The second step is optional, although important for the *data consumer* in order to evaluate the 
sufficiency of the provided level of reliability. It involves the party, that also runs the first 
step, to confirm the result of that audit. The result of that evaluation then gets included in the 
response.

The following proposed methods are distinguish in the provided level of reliability as well 
as in the amount of effort to support them and in the possible impact to its surrounding system. Not 
all data points are necessary to test for reliability. Profile data for example are more likely to 
be tested, whereas consumption lists or location histories are more or less hard to verify, because 
currently there is no reliable way to verify the origin of those data sets.

(1) __Local Verification by matching__\
The probably simplest and at the same time least reliable method is to just look at the existing 
data stored in the database and matches them against those data that is used to create a response.

(2) __Local Verification and signing__\
An electronic ID card can serve as an authentication token for the *operator*, but it can also be 
utilized to verify the reliability of certain data. Using the german implementation *(nPA)* as an 
example, the *eID* feature would provide access to the owner's basic profile data, which thus can 
be used to match against those data points that are both, hold by that *nPA* and going to be used 
to create the response. If the result of that matching procedure is positive, the related data
then gets signed with a *QES* courtesy of the *data subject's* *nPA*. That signature also gets 
included in the response, so that the recipient can verify the reliability of the data.

(3) __Remote Verification and signing__\
Another method involves a third party who also has the same data that needs to be tested. The idea 
is to hand the data in question over to that party, who then tries to match against all those data 
points available in that context. The party also has the ability to sign data. Which is what she 
does, if the matching procedure has a positive outcome. It is required to sign the whole response
or at least a replicable data set that contains the data that  were initially required. The party 
then hands everything back to the *PDaaS* for further processing.

(4) __Recurring Certification__\
The following method describes a modification of (3). In this method involved no matching procedure. 
The external third party, verifies if the data in question are correct and if they relate to the 
*data subject* by either literally looking at the data or by automatically processing a matching 
against their databases. If that party is satisfied, a certificate will be issued. This certificate 
contains an expiration date, which implies the consequence of going through this process again in 
the future, much like an issuing process of a common *Certificate Authority*. This certificate is 
then served as part of a response, which enabled the *data consumer* to verify the data reliability 
on its own. This is done by hashing the data in question, decrypting the hash embedded in the 
certificate and matching one against the other. If they are equal, the data has not changed since
the party's review and is therefore reliable. 
If data has changed in the *PDaaS* and data points are affected, that are also included in this 
verification process, then a new certificate created, because the containing hash is now invalid.

Only one method per request should be used to verify data reliability, because every method can 
imply a different level of confidence. As described above the response send back to the *data 
consumer* has to indicate the method that has been used. Based on that the *data consumer* is then 
able evaluate that level und can act accordingly (e.g. verify a signature).

Expanding those verification procedures is reasonable, but to keep it simple for now this aspect 
won't receive further attention, since the current requirements are sufficiently met. It will left 
to future work, though.



*Conclusions:* 

The signing procedure as part of local verification method involve private key and 
certificate stored on the operator's *eID card*. Every time when the *PDaaS* verifies data
reliability that method has to runs. Thus the *operator* is forced to interact wit the *PDaaS*. 
Otherwise the operators private key need to be stored somewhere within the *PDaaS*. No matter where
or when, that would potentially expose a highly confidential part of a cryptographic procedure. 
Not only would this reduces the overall security level of the system, it also makes every task 
this method is involved vulnerable to certain attacks. Aside from that, it's highly unlikely that 
an *eID card* would allow to extract it's containing private keys. This is, increasing inconvenience 
is inevitable for this proposed method. The *Local Verification and signing* method also has the 
same dependencies mentioned in the discussion about the requirements for using the (german) *eID 
card* as an authentication token. And since it was rejected because of those dependencies and
because of the inconvenience mentioned before, this verification method eventually will not being
supported in the specification.

The *Remote Verification and signing* method would require the external party to be an official
authority, because no other entity has a) the data in question (primarily profile data), which
makes them b) legally binding. They are commonly trusted. 
The same goes for The *Recurring Certification*, but while the *Remote Verification and signing* 
method introduces a very strong dependency to that external party, the *Recurring Certification*  
offers a simple loosely linking dependency. Whose design would make it even possible to obtain such 
a certificate manually but automate it on the other side. Nevertheless, both provide a trustworthy 
certification. 

Finally the first method, which does just a matching of two data sets against each other. Those
data sets are obtained from the same *PDaaS* storage, but at a different time; right before the 
request finally gets proceeded, though. The method is not very useful - in general and specifically 
to this issue, because not much happens within the system during that time (case were data in the 
storage changes during request processing are discussed in the section on 
*[Access Management](#access-management)*). Even if the whole system would be compromised, this 
method has no use in that case, because a) if that's the situation, other issues might need more 
urgent addressing then ensuring data reliability for *data consumers* and b) even then, the chances 
are insignificant that this method result is negative. Hence it provides the lowest level of 
reliability.

Certain fields of application of a *PDaaS* as a data resource might already impose some constraints 
about the level of reliability and maybe even how that can be provide. Determined by legislation
or other rules, violation might prevent the *PDaaS* from being used. Others instead - depending on 
their guidelines and business model - don't rely on any kind of confidence. In general, *data 
consumers* are expected to already have a basic confidence in a *PDaaS* and the data coming from 
there.
Regardless of that, providing an indication about the data's authenticity is valued as a first and 
important step towards a fully working feature. All of the proposed verification methods have some 
downsides, Though, the *Recurring Certification* method would be the least invasive and therewith 
an adequate choice.

For the *PDaaS* a primary goal is to preserve all data owned by the *data subject* and giving her
control over where the data might go; not providing sufficient proof for the data authenticity.  
Though, it is still important, to provide *data consumers* with an information about the level of 
reliability, but it is up to them how to rate that information and how to proceed with the obtained
data.

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
The information can be defined in a response as an optional property and it carries one of several 
states. Within the request the *data consumer* has to indicate whether the response should contain 
information about it's reliability or not. Depending on what data is requested, the *PDaaS* decides 
whether it's necessary to test for reliability or not. Based on the procedures that are available, 
the data reliability gets verified somehow.

But how does this reliability check exactly look like? It comes down to two general steps. The first 
one is matching the actual data involved in that request against a reference data set. The second
step is optional, although important for the *data consumer* in order to evaluate the sufficiency 
of the provided level of reliability. It involves the party, that also runs the first step, to 
confirm the result of that audit. The result of that evaluation then gets included in the response.

The following proposed methods are distinguish in the provided level of reliability as well 
as in the amount of effort to support them and the possible impact to its surrounding system. Not 
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


 

The response then indicates to the *data consumer* that 
state of reliability, which is determined by that third party.



The majority of applications for a *PDaaS* as a data resource might involve some constraints anyway,
e.g. laws or other rules that imply certain consequences if not complying.
Regardless of that, providing an indication about the data's authenticity state is generally a first
and sufficient approach towards a fully working feature.



The technology behind *De-Mail* tries to embed a legal foundation into email-based communication. 
But instead of providing real data authenticity so that a recipient can truly rely on that data, 
it only goes as far as legal definition and legislation reaches. Thus it has no relevance to this 
work, other then the concept of letting a server sign outgoing data, which might be the only 
solution to avoid an overhead in user interaction caused by recurring events.

Expanding those verification procedures is reasonable, but to keep it simple for now this aspect 
won't receive further attention, since the current requirements are sufficiently met. It will left 
to future work, though.



*Conclusions:* 

The signing procedure as part of *Local Verification and signing* method involves private key and 
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
because of the inconvenience mentioned before, this verification method eventually will no being
supported in the specification.

The *Remote Verification and signing* method would require the external party to be an official
authority, because no other entity has a) the data in question (primarily profile data), which
makes them b) legally binding. 
 




Non of the proposed verification procedures are very sufficient in terms of providing real proof
for the reliability of the data that's being used.



For the *PDaaS* a primary goal is to preserve all data owned by the *data subject* and giving her
control over where the data might go; not providing sufficient proof for the data authenticity.  
It is still important, though, to provide *data consumers* with an information about the level of 
reliability, but it is up to them how to value that information and how to proceed with the obtained
data.


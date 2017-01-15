## Data Reliability



Whether it's the *operator* or a *data consumer*, not only the party's identity has to be 
authenticated when communicating with the system, which is handled by the technologies proposed 
in the [authentication](#authentication) section. The actual personal data that's being used 
also has to be authentic and reliable ([S.A.04](#sa04)). But since the *operator* can change the
data at any point in time, this property requires a process where a trustworthy third party has to 
has to somehow verify the reliability of the data in question. That process on the other hand, is 
in direct contrast to the discussion about the [authentication system](#authentication) and why 
it should be designed so that it is self-contained. If it's instead not required to provide 
information on the data being reliable or not, it won't be an issue anymore. 
The information can be defined as an optional property in a response and it carries one of several 
states. Within the request the *data consumer* has to indicate whether the response must contain 
information about it's reliability or not. Depending on what data is requested, the *PDaaS* decides 
whether it's necessary to test for reliability or not. Based on the procedures that are available, 
the data reliability gets verified somehow.

But how does this reliability check exactly look like? It comes down to two general steps. The first 
one is to match the actual data involved in that request against a reference data set. The second
step is optional, but is important for the *data consumer* to evaluate the sufficiency of the 
provided level of reliability. It involves the party, that also runs the first step, to confirm
the result of that computation.


All of the implementations to verify data reliability provide a different level of reliability.

(1) local verification

(2) 

(3) 

verify data simply by 
...testing equality between database and right before usage
... using a electronic ID card to match the data stored on the card against data 
stored in the system; on positive outcome sign with *QES*
... having a third party who also has those data, to take a look at the data in question and try to 
match against the ones their have; on positive outcome sign (would require to sign the whole request
or at least replicable data set that contains the data in question)

Not all data points are necessary to test for reliability. Profile data is more likely to be tested, 
because, whereas consumption lists or location history are mor eor less hard to verify.


look at the existing data stored in the database 
and then compare those with the actual data that's used to create a response as a consequence of a 
request made by a *data consumer*. If the outcome is positive - meaning both data sets are equal - 
the verifying party has to present this somehow. The response then indicates to the *data consumer* that 
state of reliability, which is determined by that third party.



otherwise every response containing profile data (Stammdaten) has to get signed by an official party





The majority of applications for a *PDaaS* as a data resource might involve some constraints anyway,
e.g. laws or other rules that imply certain consequences if not complying.
Regardless of that, providing an indication about the data's authenticity state is generally a first
and sufficient approach towards a fully working feature.


Extending those verification procedures is reasonable, but to keep it simple for now this field 
won't receive further attention for now, since the current requirements are sufficiently met as 
well.



#### Digression: ePerso, E-Post/DE-mail

As a result, several ideas can be proposed:

(C) sign the responding data, in order to not only preserve data integrity but also to prove the 
    authenticity of the data.

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




This technology behind DE-Mail tries to embed a legal foundation into email-based communication, 
thus it has no relevance to this project, other then the concept of letting a server sign outgoing 
data, which might be the only solution to avoid an overhead in user interaction caused by recurring 
events.





[^abbr_berca]: (german) Berechtigungszertifikate-Anbieter 

[^abbr_qes]: Qualified Electronic Signatures [@paper_2013-keymanangement-fuer-qes-mit-npa]


*Conclusions:* 
two ways:
(1) use *eID* and the *nPA* to check if the profile data (Stammdaten) in the database and the data 
used to create a response are still the same. If so, set an authenticity state in the repsonse 
accordingly
(2) use the *QES* and the *nPA* (and it's RFID capabilities) to sign the response

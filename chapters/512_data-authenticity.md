## Data Authenticity



Whether it's the *operator* or a *data consumer*, not only the entity's identity has to be 
authenticated when communicating with the system. The actual personal data being used has to be 
authentic and correct as well ([S.A.04](#sa04)). This results in the following required scenario: 
an trustworthy third party has to look at the existing data in the database and then compare them 
with the actual data that's used to create a response to a request made by a *data consumer*. If the 
result is positive, meaning both data sets are equal, the entity has to verifies this somehow. The 
response then indicates to the *data consumer* that authenticity state, which is determined by that 
third party.

The described scenario is the direct opposite to the previous argumentation.

otherwise every response containing profile data (Stammdaten) has to get signed by an official party




The majority of applications for a *PDaaS* as a data resource might involve some constraints anyway,
e.g. laws or other rules that imply certain consequences if not complying.
Regardless of that, providing an indication about the data's authenticity state is generally a first
and sufficient approach towards a fully working feature.



### ePerso, E-Post/de-mail as part of a PKI solution?__\

In the past years different countries around the world recently started to introduced *information 
technology* to the day-to-day processes, interactions and communications between public services and 
their citizens, for example changing residence information or filing tax report, which is summarized 
under the term *E-government* [^abbr_egov]. One of those developments is the so called *electronic 
ID card*, hereinafter called *eID card*. Equipped with storage, logic and interfaces for wireless 
communication, those *eID cards* can be used to store certain information and digital keys or to 
authenticate the owner electronically to a third party without being physically present.
Such an *eID card* was also introduced in Germany in 2010. The so called *nPA* [^abbr_npa] was an 
important step towards an operational *e-government*.

Aside from minor flaws [@web_2013_npa-sicherheitsdefizit] and disadvantages [@web_2014_test-qes-support-in-npa] 
an *eID card* can have, the question here is, how can this technology be usefully integrated in this 
project and does it even makes sense. 
As an official document the card has one major advantage over self-configured authentication 
mechanisms like password, fingerprints or second factor tokens. It is *signed* by design, meaning 
by creating this document and handing it over to the related citizen, the third party - in this 
case the government - has verified the authenticity of that individual. 

As a result, several ideas can be proposed:
(A) authenticate with the *eID card* to the management UI of the *PDaaS*
(B) authorize/approve *access requests* or *data access* attempts 
(C) sign the responding data, in order to not only preserve data integrity but also to prove the 
    authenticity of the data.

With regards to (A), partially depending on the *eID card*'s implementation, but in general this use case 
would make sense. When considering the german implementation (nPA), accessing the management UI via desktop 
would require just a card reader - preferable with a hardware keypad attached. Accessing the UI via 
mobile device could be achieved with the card's RFID-capabilities, as long as the used device is 
able to communicate with the RFID-chip. Both cases need the *nPA* to have enabled the *eID* feature. If a
service wants to provide *nPA*-based online authentication (*eID-Service*), which is defined as a non-sovereign 
("nicht hoheitlich") feature, it has to comply with several requirements [@web_bsi-spec_eid]
starting with making an application in order to get permission for sending a certificate signing 
request to a BerCA [^abbr_berca]. This request is originated from an *eID-Server* [@web_2017_npa-eid-server] to sign a public key generated on 
a dedicated and certified 
hardware, which is also required through the officials. This key pair - re-generated and re-signed
every three days - is needed to establish a connection with the *nPA*, which then is used to
authenticated the owner of that *ID card*. 
The described appears to be highly expensive (effort, hardware costs), especially because every 
single operator needs to go through the whole process in order to provide this authentication 
method; not mentioning the uncertainty of the official's decision about the motion filing. Another
approach would be to integrate an external authentication provider supporting the *nPA*, which
would not only add an additional dependency, but could also weaken the system.
(A) and (B) are fairly similar, insofar as they would use the same mechanism to authenticate, but
to approve different actions.

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

Another technology, emerging as part of the *e-government* development, is the *DE-Mail* 
[@web_2017_about-de-mail]. It's an
eMail-Service that is meant to provides infrastructure and mechanisms to exchange legally binding 
electronic documents. One would expect public-key-based cryptography procedures all the way from 
sender through to the recipient (end-to-end) [@statement_2013_de-mail], maybe even with taking advantage of the *nPA's* 
capability to create *QES*. Instead, the creators of the corresponding 
law decided that it's sufficient prove about the documents author if the provider signs the document 
on the email server and that this implementation results in a legally binding document by definition 
of that law. 
This technology tries to embed a legal foundation into email-based communication, thus has no 
relevance to this project, other then letting a server sign outgoing data, which might be the only 
solution to avoid an overhead in user interaction caused by recurring events.


*Conclusions:* 
two ways:
(1) use *eID* and the *nPA* to check if the profile data (Stammdaten) in the database and the data 
used to create a response are still the same. If so, set an authenticity state in the repsonse 
accordingly
(2) use the *QES* and the *nPA* (and it's RFID capabilities) to sign the response


[^abbr_egov]: Electronic government

[^abbr_npa]: in german so called *elektronische Personalausweis (nPA)*

[^abbr_berca]: Berechtigungszertifikate-Anbieter

[^abbr_qes]: Qualified Electronic Signatures [@paper_2013-keymanangement-fuer-qes-mit-npa]

Core Principles
==========================================



Right from the start a set of principles have build the cornerstones and orientation marks of
the idea behind the *PDaaS*. Those, who meant to be reflected also by the arising *Open 
Specification*, will be explained further within the following sections.



## Data Ownership

Depending on the standpoint, the question about ownership of certain data might not that trivial to 
answer. As stated in the [previous section](#digital-identity-personal-data-and-ownership), 
ownership requires a certain amount of originality to become intellectual property, which is not the
case for personal data - at least for all the non-creative content. Thus there is no legal ground 
for an individual to license those data, that obviously belongs to her. Switching the perspective 
from the *data subject* to the data *consumer*; for them, several laws exist addressing conditions 
and rules regarding data acquisition, processing and usage.
Leaving aside the absence of any legislation regarding data ownership, it can not be denied, that
is seems unnatural not being the owner of all the data that reflects her identity and her as an 
individual. So instead of defining those rules meant to protect data subjects, but demanding data 
consumers to comply with, the proposal here is to put the entity, to whom the data is related to, in 
control of defining, who can access her data and what accessor is allowed to do with it. This would 
make the *data subject*, [per definition](#def-ownership) and effectively, to the owner of those 
data. Although, it is to be noted, that the legal rulebook for data consumers mentioned before, 
remains a highly important, since this project is not able to cover every use case, that might 
occur.

Promoted from the data subject to the data owner, being the center of the *PDaaS*, the operator gains 
abilities to have as much control over all the data related to her as possible, to determine in a 
very precise ways what data of hers can be accessed by third parties and to literally carry all her 
personal data with her. 



## Identity Verification

When an instance of this system is going to be the digital counterpart of an individuals identity or 
it's *personal agent* [@book_2015_ethical-it-innovation], then everyone who relies on the 
information that agent is providing, must also be able to trust the source from where that data 
is coming from and vice versa; the *operator* must be able to verify the authenticity
of the requesting source, too; regardless if it's the initial *permission request* or further 
*access attempts*.
Based on these mechanisms, the system can also provide an authentication services to all sorts of 
generic or restricted platforms for the associated identity, including second factor abilities.



## Reliable Data

Being able to verify the authenticity of a communication partner means only to be half-way through.
Data consumers also need to trust the data itself, which is attributed to the following properties. 
(A) *integrity* - which means the recipient can verify, that the data, sent to her, is still the 
same, or if someone has tampered with the obtained data. (B) *authenticity* - it is somehow ensured, 
or the recipient must be certain, that the received data belongs to the individual from whom the 
data comes from.
A negative result of that check should not cause a termination of the process, but instead should 
warn the recipient about the lack of authenticity, so that she, herself, can decide if and how to 
proceed. 
 


## Authorisation

Controlling it's own data might probably be the most important ability of such a system, because the 
data owner gets enabled to grant permission to any entity who want to obtain certain information 
about her in a semi-automated way. She can authorise as precise as desired how long and what data 
(sets, points or fields) is accessible by a single entity. Thereby, the data owner is able to change 
the *access permissions* for any entity at any point in time, for example motivated by a noticed 
incident. 



## Supervised Data Access

Rules and constraints might be one way to handle *personal data* accesses by *third parties*.
But this plain *query and response data* approach could be replaced by a more supervised concept, 
that prevents data from leaving the system. This, instead, allows to execute a small program within 
a locally defined environment, computing just a fraction of bigger computation, initiated by the 
*data consumer*; image a distributed Map-Reduce concept [@paper_2004_distributed-mapreduce].




It is not very likely that *data consumers*, who already got granted certain access, would renounce
their privileges. Thus it is vital that the *data owner* is in position of canceling the the *access 
permissions* or applying appropriate changes.



## Encapsulation

+   containerization (coreos, rkt, mirageos aka unikernal)



## Flexible Application

+   using and fitting into all kinds of scenarios: e.g. storing cara data, providing sensitive 
profile data, being patient file
+   without increasing system complexity (!



## Open Development

+   which and why open standards
+   why open source
+   collaborative transparent development 

+   Hosting & Administration
    -   DYI
    -   Usability
    
When developing an *Open Specification* it comes naturally to build upon open technologies, 
which is understood as open standards and open source; *open* in the sense of *unrestricted 
accessible by everybody*; not to be confused with free - as in *freedom* - software. In this case, 
advocating such a an openness enables not only to develop implementations of the specification in 
a collaborative way, but also the specification itself, and makes it possible for anyone who is 
interested to participate or even to contribute. For everyone who just want to use open 
technologies, a license defining rules and conditions is typically enclosed somehow. But regardless 
of the motivation everybody who is interested in getting to know how these hard- or software 
blackboxes-by-design are actually working, is thus able to look into it. 

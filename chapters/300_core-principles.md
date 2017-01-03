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

Rules and constraints might be one way to handle *personal data* demands of *third parties*.
But this plain *query and response data* approach could be replaced by a more supervised concept, 
that prevents data from leaving the system. It allows to execute a small program within a locally 
defined environment, computing  only a fraction of a larger computation that was initiated by 
the *data consumer* beforehand; similar to a distributed Map-Reduce concept 
[@paper_2004_distributed-mapreduce]. The opposite approach, to provide some software to the *data 
consumer* that is necessary to access the contents of a response or provides a runtime environment
querying the system by itself, would be conceivable, too.
In general, it is not very likely that *data consumers*, who already got granted certain access, 
would renounce their privileges. Thus it is vital that the *data owner* is the one who is able of 
cancel the *access permissions* or applying appropriate changes. Supervising methods provide an 
appropriate ways to make data available to those who are eager to consume them. 



## Containerization

Abstracting an operating system by moving the bare minimum of required parts into a virtualization
results into an environment that can be, depending on the configuration, fully encapsulate it's 
internals from the host environment. This approach yields to some valuable features. Such as:
(A) Effortless portability, which reduces the requirements on environment and hardware to a minimum.
(B) Thereby gaining higher flexibility in placing components, through which advantages can be made
    out of other devices characteristics.
    while not necessarily increasing the overall complexity of the system
(C) Isolation and reduction of shared spaces and scopes, which for example can prevent side effects.  
All these in conjunction lead also to an overall security improvement or at least it enables new 
patterns to improve such aspects. Furthermore, it allows to suit more versatile and diverse 
scenarios, like storing data about a using data, providing sensitive profile data or getting used as 
a patient file. The convenience of a precise resource assignment might also become relevant for case 
where device's hardware specification might be somewhat low.
Building a system upon a container-based philosophy and enclosing components in their own 
environment brings a variety of design and architectural possibilities without the necessity of 
increasing the overall system complexity.



## Open Development

When developing an *Open Specification* it only comes natural to build upon open technologies, 
which are understand as *open standards* and *open source*; *open* in the sense of *unrestricted 
accessible by everybody* and not to be confused with free - as in *freedom* - software. Advocating 
such a philosophy permits not only to develop implementations in a collaborative way, but enables  
also to work fully transparent on the specification itself. Such an open environment makes it 
possible for anyone who is interested, to participate or even to contribute to the 
project. Thus, to lower the barrier, usable and meaningful documentation is vital. Such an openness 
ensures the possibility of looking into the source code and getting a picture of what the program 
actually does and how it works. Thus, source code reviews become possible as well. Those might 
reveal certain security flaws, which then are able to get fixed very quickly.
Furthermore, this approach allows data subjects to setup their own infrastructure and host such a 
system, which gains even more control over the data and increases the level of trust, instead of 
using a *SaaS* [^app_saas] solution that is host by another provider. It also encourages any kind of 
adjustments or customization to the system in order to serve the own's needs.
Enabling an open development allows users and contributors working together and thus improve the 
outcome in a variety of ways.  



[^app_saas]: Software as a Service

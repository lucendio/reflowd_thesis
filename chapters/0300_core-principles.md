Core Principles
==========================================



Right from the start, a set of principles have been built as the cornerstones and orientation marks
of the idea behind the *PDaaS*. These are meant to be reflected by the upcoming *Open Specification* 
and will be explained further within the following sections.



## Data Ownership

Depending on the perspective, the question about ownership of certain data might not be trivial to 
answer. As stated in 
*[Chapter 3 - Digital Identity, Personal Data and Ownership](#digital-identity-personal-data-and-ownership)*, 
[ownership](#def--ownership) requires a certain amount of originality to become intellectual 
property, which is not the case for personal data - at least for all the non-creative content. Thus, 
there is no legal ground for an individual to license those data that obviously belong to her. 
Switching the perspective from the *data subject* to the *data consumer*; for them, several laws 
exist addressing conditions and rules regarding data acquisition, processing and usage.  
Putting aside the absence of legislation regarding data ownership, it cannot be denied that it seems 
unnatural to not be the owner of all the data that reflect a person's identity and the person as an 
individual. So instead of defining rules meant to protect data subjects but demand data consumers to 
comply, the proposal here is to put the entity to whom the data is related, in control of defining 
who can access her data and what accessors are allowed to do with it. This would make the 
*data subject*, per definition (see [Ownership](#def-ownership)), the effective owner of those data. 
Although, it is to be noted, that the legislation for data consumers mentioned before, remains 
highly important since this project is not able to cover every single use case that might occur.

Promoted from the data subject to the data owner and therefore being the center of the *PDaaS*, the 
*operator* of the *PDaaS* gains the ability to have as much control as possible over all the data 
related to her, in order to determine, in a very precise way, what data of hers can be accessed by 
third parties at any point in time and also to literally carry all her personal data with her. 



## Identity Verification

If an instance of such a system *(PDaaS)* is going to be the digital counterpart of an individuals 
identity or her *"personal agent"* [@book_2015_ethical-it-innovation, p. 46], then everyone who 
relies on the information that agent provides must also be able to trust the source from where that 
data originates and vice versa; the *operator* too need to verify the authenticity of the requesting
source; regardless of whether it's during initial registration or further *access attempts*.
Based on these mechanisms, the system can also provide an authentication services that third parties 
might utilize to outsource the authentication of its owner, including enabling additional security 
factor steps.



## Reliable Data

Being able to verify the authenticity of a communication partner is only half of the task. Data 
consumers also need to trust the data itself, according to the following criteria. (A) *integrity* - 
meaning the recipient can verify that the received data is still the same or if someone has tampered 
with the obtained data. (B) *authenticity* - meaning it is somehow ensured, or the recipient must be 
certain that the received data actual belongs to the individual, meaning the data truly reflects 
attributes of the individual from whom the data come from. A negative result of that check should 
not cause a termination of the process, but instead should warn data consumers unverified 
authenticity, so that they themselves can decide if and how to proceed. 
 


## Authorization

Controlling its own data might be the most important ability of such a system, because the data 
owner is enabled to grant permission to any entity who wants to obtain certain information, in a 
potentially automated way, about her. She can authorize, as precisely as desired, how long and what 
data (sets, items or fields) are accessible by a single entity. Thereby, the data owner is able to 
change the *access permissions* for any entity at any point in time, for example, when motivated by 
a noticed incident. 



## Supervised Data Access

Rules and constraints might be one way to handle personal data demands of third parties. But a plain 
*query-and-respond-data* approach could be replaced by a more goal-driven concept that prevents data 
from leaving the system. It allows the execution of a small program within a locally defined 
environment, computing only a fraction of a larger computation initiated by the *data consumer* 
beforehand; similar to a distributed Map-Reduce concept [@paper_2004_distributed-mapreduce]. The 
opposite, but also conceivable, approach would be to provide either some software to the 
*data consumer*, which is required in order to access the contents of a response, or a runtime 
environment that queries the system by itself.  
In general, it is not very likely that data consumers, who have been granted certain access, would 
renounce their privileges. Thus it is vital that the data owner is the one in charge of canceling 
access permissions or applying appropriate changes to them. Supervising methods provide an 
appropriate way to make data available to those who are eager to consume them. 



## Containerization

Abstracting an operating system by moving the bare minimum of required parts into virtualizations
results in an environment setup that can, depending on the configuration, fully encapsulate its 
internals from the host environment. This approach yields some valuable features, such as
(A) Effortless portability, which reduces the requirements on environment and hardware
(B) Higher flexibility in placing components, through which advantages can be made out of 
    characteristics that other devices might bring with them
(C) Isolation and reduction of shared spaces and scopes, which, for example, can prevent side 
    effects.  
Together, these lead also to an overall security improvement, or at least it enables new patterns to 
improve those aspects. Furthermore, allows for more versatile and diverse scenarios, like storing 
data decentralized, scaling during unexpected workloads, or getting used as a medical record due to 
higher security precautions. The convenience of precisely assigned environment resources might also 
become relevant for cases where a device's hardware specification are poor. Building a system upon a 
container-based philosophy and enclosing components in their own environment offers a variety of 
design and architectural possibilities without the necessity of increasing the overall system 
complexity.



## Open Development

When developing an *Open Specification* it is natural to build upon open technologies that are 
recognized as *open standards*, *open source* and *free software*; *open* in the sense of 
*unrestricted accessible by everybody*, and *free* as in *freedom of use*.
Advocating such a philosophy allows not only the development of implementations in a collaborative 
way, but also enables working transparently on the specification itself. Such an open environment 
makes it possible for anyone who is interested to participate or even to contribute to the project. 
Thus, to lower the barrier, usable and meaningful documentation is vital. Such an openness ensures 
the possibility of people looking into the source code and getting a picture of what the program 
actually does and how it works. This allows source code review to become feasible, and any security 
flaw thus uncovered can be fixed immediately.
Furthermore, this approach allows data subjects to setup their own infrastructure and host such a 
system by themselves, which gains even more control over the data and increases the level of trust, 
instead of using a *SaaS* [^app_saas] solution that is hosted by a possibly untrusted entity. It 
also encourages any kind of adjustments or customization to the software in order to serve 
operator's own needs.
Enabling an open development enables users and contributors working together and collectively 
improve the project in a variety of ways.



[^app_saas]: Software as a Service

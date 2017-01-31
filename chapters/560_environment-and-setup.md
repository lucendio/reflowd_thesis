## Environment and Setup



As stated in the project's core principles *Open Development* is vital for the project to gain 
trust. Interestingly, this has a significant impact on how a *PDaaS* might be deployed or installed. 
All its components can just get taken and used as it suits everyone's needs; of cause, while 
respecting their licenses. Furthermore, enforcing *portability* leads to a more simplified and 
independent development process that can be organized in a way so that the primary division into 
components can be leveraged. 

The range of environment systems for *server* platforms is highly diverse but the main shares belong
to either the UNIX or LINUX family, even though almost every platform is POSIX-compliant 
[^abbr_posix]. When it comes to *mobile* platforms the market is fare less divers. Native 
applications are either developed in *Java* (for Google's Android) or in Swift (for Apple's iOS).
Whereas the environment systems has nearly no relevance for the *client*, other then the screen size 
and maybe which browser and version the environment system runs. But that's probably something the
user can change.

As a result, being able to use certain components on a *server* platform depends on what *server* 
environment is provided. And vice versa, in order to decide on what implementation of a component is 
suitable, it's crucial in what environment that component has to run in. Either way, not to forget 
all the dependencies a component might have.
Such constraints can be avoided by abstracting the runtime of those components and either embed 
every required software dependency or provide them in separate runtimes, if that's possible. 
Depending on the technologies used, this concept is commonly known as *virtualization* or 
*containerization*. It isolates software by putting them into so called *container*. But since 
those container-wrapped components still have to interact with each other, they need to be 
supervised or at least managed. This is done by an orchestration software, which not only allocates 
system resources but also emulates a whole network infrastructure (e.g. DNS, TCP/IP, routing).
Thereby, it is used to determine how certain container (and its containing component) are allowed 
to communicate and what resource are accessible from inside (e.g. filesystem). This complete 
abstraction to the surrounding environment means it quasi is the only dependency the *PDaaS* would
have, regardless of how its components are implemented. They just have to be *"containerizable"* - 
satisfy the *[container image specification](#link-container)* [@web_oci-spec_image].
This concept can be utilized for the *[supervised code execution](#supervised-data-access)* 
([S.A.01](#sa01)) mentioned before without any restraints.
 
Migrating from a server-located *personal data storage* to the *mobile* based version introduces 
another challenge. The subsequent approach is a first and more general solution to that problem.

1.  TODO



*__Conclusions:__*

Installing a *PDaaS* should be straightforward with the least possible effort being used for 
preparations. Package manager of all popular operating systems should offer (semi-)automated 
installations. Additionally, components themselves and the project as whole have to provide detailed 
documentations for various ways of how those parts or the entire system need to be installed.
Alternatively, *data subjects* might be are willing to entrust external third parties with hosting 
a *PDaaS* instance for them. In that case the distributed approach involving a *mobile* 
platform might come in handy, so that the actual data is not stored somewhere beyond their reach.
THe *PDaaS* as an open source development encourages anybody who is interested or even wants to 
contribute to checkout the source code of the various implementations, get it to run and play around 
with it. But for that at least the components of the *server* platform are required to have 
documented on what other software they depend on, so that the target environment can be prepared 
accordingly.
Aside from hardware on which the *PDaaS* needs to run, the only other requirement is owning a
internet domain that is registered on a public DNS [^abbr_dns] server and has no subdomains 
configured yet.

If a component needs to get segregated from its host environment, *containerization* is the 
recommended technique, since it causes less overhead compared to *virtualization* and is generally 
a lightweight approach. Though, additional abstraction might also introduce new problems instead of 
solving them.



[^abbr_posix]: Portable Operating System Interface; a collection of standards released by the IEEE 
    Computer Society to preserve compatibility between operating systems.
    
[^abbr_dns]: Domain Name System; decentralized open directory that associates readable names with IP 
    addresses

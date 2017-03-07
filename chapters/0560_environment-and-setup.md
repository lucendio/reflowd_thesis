## Environment and Setup



As stated in the project's [core principles](#core-principles), *Open Development* is vital for the 
project to gain trust. Interestingly, this has a significant impact on how a *PDaaS* might be 
deployed or installed. All its components can just be grabbed and used as it suits everyone's needs, 
while respecting their licenses. Furthermore, enforcing *portability* ([S.A.02](#sa02)) leads to a
more simplified and independent development process that can be organized in a way so that the 
primary division into components can be leveraged. 

The range of host systems for *server* platforms is highly diverse but the main shares
[@web_2017_wikipedia_os-market-share] belong to either the UNIX or LINUX family, even though almost 
every platform is POSIX-compliant [^abbr_posix]. When it comes to *mobile* platforms the market is 
far less diverse. Native applications are either developed in *Java* (for Google's Android) or in 
Swift (for Apple's iOS). Whereas the host systems have nearly no relevance for *web* platforms, 
other then the screen size and maybe which browser and version the environment system runs. But 
that's a condition the user can change if necessary.

As a result, being able to use certain components on a *server* platform depends on what *server* 
environment is available and vice versa. In order to decide what implementation of a component is 
suitable, it's crucial to know in which environment that component has to run. Either way, it is 
also important not to forget all the dependencies a component itself might have.
Such constraints can be avoided by abstracting the runtime of those components and either embed 
every required software dependency or provide them in separate runtimes, if possible. 
Depending on the used technologies, this concept is commonly known as *virtualization* or 
*containerization*. It isolates software by putting them into a so called *container*. But since 
those container-wrapped components still have to interact with each other, they need to be 
supervised or at least managed. This is done by an orchestration software, which not only allocates 
system resources but is also capable of emulating a whole network infrastructure (e.g. DNS, TCP/IP, 
routing). Thereby, it is utilized to determine how certain containers (and their contained 
components) are allowed to communicate and what resource are accessible from the inside (e.g. 
filesystem). This complete abstraction to the surrounding environment effectively means it's the 
only dependency the *PDaaS* would have, regardless of how its components are implemented. They just 
have to be *'containerizable'* - by satisfying the 
*[container image specification](#def--container)* [@web_oci-spec_image]. This concept can also be 
utilized for the *[supervised code execution](#supervised-data-access)* ([S.A.01](#sa01)) mentioned 
before without any restraints.
 
Migrating from a server-located *personal data storage* to a *mobile* based version introduces 
another challenge. The subsequent approach is a first and more general solution to that problem.

*NOTICE: it is assumed that a running instance of a *PDaaS* is in place, the *operator* owns a 
modern mobile device and on this device a *PDaaS* mobile application is installed.*

1.  After starting the app, the operator needs to establish a connection between server and mobile 
    application. Therefore, the operator has to scan a QR-Code with the help of that app. The 
    QR-Code is presented to the operator within the management tool of the *PDaaS* running in a 
    browser. Alternatively, the operator inserts her credentials into a form presented by the mobile 
    application.

2.  After the connection is established, the operator can trigger a progress that duplicates all her 
    personal data to the device that has just been associated with the *PDaaS*.
    
3.  At this point, one of two paths can follow, depending on whether a complete write log for the 
    *personal data* ([see discussion about backup strategies](#data) exists or not.
    a)  If *[LOG-EXISTS]*, query by query the whole log is obtained from the existing storage and is
        then again executed in chronological order by the query language abstraction, starting with 
        the oldest. The only difference here is that the target storage, on which that query is 
        actually performed on, is located on that newly introduced platform.
    b)  If *[LOG-NOT-EXISTS]*, the situation is more complicated if the database systems are not 
        based on exactly the same technology. This would mean additional migration software is 
        required. If both database systems provide import and export mechanisms that support at 
        least one interoperable data format, the migration software can leverage these features 
        simply by exporting all the data and saving it to the filesystem. The software then 
        transfers the dump to the target environment and triggers the import process.
        When this is not the case, the software not only needs to be aware of both database systems 
        and their native query language, it also has to have a comprehensive understanding of how 
        their data structuring concepts work, in order to reliably transform one into the another. 
        So, to be more specific, at first the software has to analyse the structure of the source 
        database. Based on this result it might need to perform some configuration on the target 
        database before actually obtaining the data from there. Received data then needs to be 
        transformed into queries that are supported by the target database system. Those transformed 
        queries are transferred to the target environment, where those incoming queries get executed 
        until all data is migrated.

5.  After the duplication process has finished, the operator can decide which PDS the *PDaaS* should 
    use to serve *access requests* and what should happen with the other storage(s).

To conclude, a migration process like moving *personal data* from one platform instance to another
can be further simplified and robust if a complete query log would exist. It is also worth 
mentioning that the migration process described above is not restricted to exactly this source or 
migration direction. As long as target and source are either a *server* or a *mobile* platform, 
any variant is imaginable.
 


*__Conclusions:__*
Installing a *PDaaS* should be straightforward with the least possible effort being spent for 
preparations. Package managers of all popular operating systems should offer (semi-)automated 
installations. Additionally, components themselves and the project as whole have to provide detailed 
documentations for various ways of how those parts or the entire system need to be installed.
Alternatively, *data subjects* might be willing to entrust external third parties with hosting a 
*PDaaS* instance for them. In that case, the distributed approach involving a *mobile* platform 
might come in handy, so that the actual data is not stored somewhere beyond their reach.
The *PDaaS* as an open source development encourages anybody who is interested or even wants to 
contribute to checkout the source code of the various implementations, get it to run, and play 
around with it. Therefore, at least the components of the *server* platform are required to document 
what other software they depend on, so that the target environment can be prepared properly.
Aside from hardware, on which the *PDaaS* needs to run, the only other requirement is owning an
internet domain that is registered on a public DNS [^abbr_dns] server and has no subdomains 
configured yet.

If a component needs to get segregated from its host environment, *containerization* is the 
recommended technique since it causes less overhead compared to *virtualization* and is generally 
a lightweight approach. Although additional abstraction might also introduce new problems instead of 
solving them.



[^abbr_posix]: Portable Operating System Interface; a collection of standards released by the IEEE 
    Computer Society to preserve compatibility between operating systems
    
[^abbr_dns]: Domain Name System; decentralized open directory that associates readable (domain) 
    names with IP addresses

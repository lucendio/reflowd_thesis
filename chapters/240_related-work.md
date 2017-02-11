## Related Work



*NOTICE: All research, projects, studies and work mentioned in this section represents only a 
fraction of what's already been done in this field and should be therefore seen as an excerpt 
containing selected, most related and relevant approaches.* 



The idea of a digital vault, controlled and maintained by the data subject, is not new. Holding her 
most sensitive and valuable collections of bits and bytes, protected from all the data brokers, 
collectors and authorities, while interacting with the digital and physical world, opening and 
closing its door from time to time to either put something important to her inside or releasing an 
information important for someone else.
While in the mid and late 2000s the growth of computer performance and capacity has crossed its 
zenith (see Moore's Law [@paper_1965_moors-law]), at that same time the internet has started to 
become a key part in many people's lives and in the society as a whole. Facilitated by these 
circumstances, *cloud computing* has been on the rise ever since, causing the shift towards 
distributed processing and patterns alike, thereby making it possible to rethink solutions from 
the past and try to go new ways, namely a breakthrough 2007 in *neuronal networks* cutesy of G. 
Hinton [@podcast_2015_cre-neuronale-netze]. As a result, fields like *data mining*, *machine 
learning*, *artificial intelligence* and most recently combined under the collective term called 
*Big Data*, have gained a wide range of attention as tools for knowledge discovery. In almost any 
industry a greater amount of resources is invested in these areas 
[@web_2016_industries-intention-to-invest-in-big-data]. 

The initial motivation for this project can be understand as a counter-movement away from all the 
data silos in the cloud, starting to focus again on privacy, the individual and its digital alter 
ego.

From simple middleware-solutions, on to full-fledged software-based platforms, through to embedded
hardware devices, a great variety of approaches have started to appear in the mid 2000s to this day. 
A side effect, though, was, over time various research teams and projects have invented and coined 
different terms, which at the end all refer to the same, or at least similar, concept. The following 
list shows some of them *(alphabetical order)*:

+   Databox
+   Identity Manager
+   Personal ...
    -   Agent
    -   Container
    -   Data Store/Service/Stream (PDS)
    -   Data Vault
    -   Information Hub
    -   Information Management System (PIMS)
+   Vendor Relationship Management (VRM)

One of the first occurring research projects was *ProjectVRM*, which originated from *Berkman Center 
for Internet & Society* at *Harvard University*. As its name suggests, it was inspired by the idea 
of turning the concepts of a *Customer Relationship Management* (CRM) upside down. This puts the 
vendor's customers back in charge of their data priorly managed by vendors. It also solves the 
problem of unintended data redundancy - from the customers perspective. Over time the project has 
growing to the largest and most influential one in this research field. It has transformed into an 
umbrella and hub for all kinds of projects and research related to that topic 
[@web_2016_projectvrm_development-work], whether it's frameworks or standards, services offering 
(e.g. privacy protection), reference implementations, applications, software or hardware components. 
*VRM* became more and more a synonym for a set of principles [@web_2016_projectvrm_principles], 
for example *"Customers must have control of data they generate and gather. [They] must be able to 
assert their own terms of engagement."* These principles can be found in various ways across many 
work done within this research area.

Another work of research worth mentioning, because of the foundational work it has been done, is 
the european funded project called *Trusted Architecture for Securely Shared Service* (TAS3)
[@web_2011_tas3-project]. This project has led to an open source reference implementation called 
*ZXID* [^more-infos_zxid]. The major goal has been to develop an architecture, that generalizes 
various approaches towards a non context-agnostic solution fitting into more sophisticated and 
dynamic scenarios, while still respecting commercial businesses (vendors) as well as users 
(customers), but at the same time facilitating a high level of user-centric security and privacy 
i.a. by a developed policy framework. Due to these requirements the architecture ended up being 
rather complex [@graphic_2011_architecture_components-of-organization-domain]. *ZXID* as its 
implementation involves several standards, like SAML 2.0 [^abbr_saml2] and XACML [^abbr_xacml], has 
just three third-party dependencies, *OpenSSL*, *cURL (libcurl)* and *zlib*, and as of now it
supports Java, PHP and Perl.
The project has lasted for a period of 4 years. After it has been finished in 2011, the research 
work has continued i.a. by the *Liberty Alliance Project*. It is now part of the *Kantara 
Initiative* [@web_kantara-initiative], including all documents and results. These results are 
references occasionally, recently by the IEEE [@paper_2014_personal-data-store-approach].

A research project, which is probably the closest to what this work aims to create, bears the name 
*openPDS* [@paper_2012_openpds_on-trusted-use-of-large-scale-personal-data] and is done by 
*Humans Dynamics Lab* [@web_mit_openpds-safeanswers-project-page], which again is part of *MIT Media 
Laboratories*. Despite the usual concepts of a *PDS*, it introduces multi-platform components and 
user interfaces including a mobile devices, and also separates the persistence layer physically. 
This approach enables place- and time-independent administrative access for the data subject.
Moreover, with their idea of *SafeAnswers* 
[@paper_2014_openpds_protecting-privacy-of-meta-data-through-safeanswers], the team goes even a step 
further. The concept behind that idea is based around *remote code execution*, briefly described 
in [one of the user stories in the first chapter](#header-applying-for-a-loan-and-checking-creditworthiness). 
It abstracts the concept of a data request to a more human-understandable level, a simple question.
This question consists of two representations: (A) a human-readable question of a third party, 
and (B) a code-based representation of that question, which gets executed in a sandbox on the data 
subjects's *PDS* system with the required data as arguments. The data, used as arguments, is 
implicitly defined trough (A). The output of that execution represents both, answer and response. 

Aside from all the research projects done within the academic context, applications with a 
commercial interest have also started to occur in a variety of sectors. Microsoft's HealthVault
[@web_microsoft_healthvault], for example, which aims to replace the patient's paper-based medical 
records and combine them in one digital version. This results in a patient-centered medical data and 
document archive, helping doctors to make a more accurate decisions on medical treatment, because
they have more knowledge obtained for example from a personal medical history.

*Meeco* [@web_meeco_how-it-works] [@slides_2015_meeco-case-study], based on the MyData-Project 
[whitepaper_2014_mydata-a-nordic-model-for-human-centered-personal-data-management-and-processing], 
essentially just replaces platform-agnostic advertisement service providers with a closed 
environment and serves ads on its own. Though, within this environment data subjects are provided 
with more control over what information they reveal, but this approach doesn't take the so eagerly 
demanded next step to get rid of the advertisement market as revenue stream and instead find a 
suitable business model that focuses on the data subject, not surrounding them with just another 
walled garden.

A recently announced project, sponsored by Germany's *Federal Ministry of Education and Research*, 
but developed and maintained primarily by *Fraunhofer-Gesellschaft* in cooperation with several 
private companies like *PricewaterhouseCoopers AG*, *Volkswagen AG*, *thyssenkrupp AG* or 
*REWE Systems GmbH*, is the so called *Industrial Data Space* [@web_industrial-data-space]. 
The project unifies both, research and commercial interests and runs over a time period of three 
years until the third quarter of 2018. It aims *"[...] to facilitate the secure exchange and easy 
linkage of data in business ecosystems"*, where at the same time *"[...] ensuring digital 
sovereignty of data owners"* [@whitepaper_2016_industrial-data-space]. It will be interesting to 
see how these two, yet rather distinct objectives, come together in the future. Based on the white 
paper, the project's focus mainly seems to lie in enabling and standardizing the way companies 
collect, exchange and aggregate data with each other across process chains to ensure high 
interoperability and accessibility.

hereafter it can be found a selective list of further research projects, work and commercial 
products around the topic of *personal data*:

__Research__

+   Higgins [https://www.eclipse.org/higgins/]
+   Hub-of-All-Things [http://hubofallthings.com/what-is-the-hat/]
+   ownyourinfo [http://www.ownyourinfo.com]
+   PAGORA [http://www.paoga.com]
+   PRIME/PrimeLife [https://www.prime-project.eu, http://primelife.
    ercim.eu/]
+   databox.me (reference implementation of the *[Solid framework](https://github.com/solid/solid)*)
+   Polis (greek research project from 2008) [http://polis.ee.duth.gr/Polis]


__Organisations__

+   Open Identity Exchange [http://openidentityexchange.org/resources
    /white-papers/]
+   Qiy Foundation [https://www.qiyfoundation.org/]


__Commercial Products__

+   MyData [https://mydatafi.wordpress.com/]
+   RESPECT network [https://www.respectnetwork.com/]
+   aWise AEGIS [http://www.ewise.com/aegis]


[^more-infos_zxid]: more information on the project, the code and the author, Sampo Kellomäki, can
    be found under *zxid.org*
    
[^abbr_saml2]: Security Assertion Markup Language 2.0

[^abbr_xacml]: eXtensible Access Control Markup Language

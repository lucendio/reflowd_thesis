## Related Work

The idea of a digital vault, controlled and maintained by the data subject, the individual, isn't 
that new. Holding her most sensitive and valuable collections of bits and bytes, protected from 
all these data brokers and authorities, while interacting with the digital and physical world, 
opening and closing it's door from time to time, to either put something important for her inside 
or retrieving an information important for someone else.
While in the mid and late 2000s the growth of computer performance and capacity were crossing 
it's zenith (see Moore's Law [@paper_1965_moors-law]), at the same time the internet was starting 
to become a key part in many people's lives and in society as a whole. Facilitated by these 
circumstances, *cloud computing* has been on the rise, causing the shift towards parallel 
distributed processing and patterns alike. Thereby making it possible to rethink solutions from 
the past and trying to go new ways, namely the breakthrough 2007 in *neuronal networks* cutesy 
of G. Hinton [@podcast_2015_cre-neuronale-netze]. As a result, fields like *deep machine 
learning*, *big data analytics* and most recently *data mining*, were gaining a wide range of 
attention. In almost any industry a greater amount of resources is invested in these areas 
[@web_2016_industries-intention-to-invest-in-big-data]. 

The initial research motivation can be seen as a counter-movement away from the *cloud*, 
starting to focus again on privacy, the individual and it's digital alter ego.

From simple middleware-solutions, via full-fledged software-based platforms, through embedded
hardware devices, a great variety of approaches were starting to appear in the mid 2000s until 
this day. A side effect was, that over time various research teams and projects have invented
and coined different terms, all referring to the same concept. The following list shows some
examples *(alphabetical order)*:

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

One of the first research projects is *ProjectVRM*, which originated from *Berkman Center 
for Internet & Society* at *Harvard University*. As it's name implies, it was inspired by the 
idea of turning the concepts of a *Customer Relationship Management* (CRM) upside down. This puts 
the vendor's customers back in charge of their data priorly managed by the vendors. It also solves 
the problem of unintended data redundancy. Over time the project has growing to the largest and 
most influential in this research field. It transformed into an umbrella and hub for all kinds 
of projects and research related to that topic [@web_2016_projectvrm_development-work], whether 
it's frameworks or standards, services offering e.g. privacy protection, reference implementations, 
applications, software or hardware components. *VRM* became more and more a synonym for a set of 
principles [@web_2016_projectvrm_principles], including for example *"Customers must have control 
of data they generate and gather. [They] must be able to assert their own terms of engagement."* 
These principles can be found in various ways across a lot of research done within this area.

Another research that is worth mentioning, because of the foundational work it has been done, is 
the european funded project called *Trusted Architecture for Securely Shared Service* (TAS3). 
The project led to a open source 
reference implementation called *ZXID* [^more-infos_zxid]. The major goal was, to develop an 
architecture, that takes all involved parties into account, whether it's commercial businesses 
(vendors) or it's users (customers), in order to fit into more sophisticated and dynamic processes, 
but at the same time demanding a high level of user-centric security facilitate i.a. by a developed
policy framework. Due to these requirements the architecture ended up being rather complex 
[@graphic_2011_architecture_components-of-organization-domain]. *ZXID* as it's implementation
incorporates several standards like SAML 2.0 [^abbr_saml2] and XACML [^abbr_xacml], has only
three third-party dependencies which are *OpenSSL*, *cURL (libcurl)* and *zlib* and as of now it
supports Java, PHP and Perl.
The project lasted for a period of 4 years, but after it ended in 2011, the research work has 
pursued i.a. by the *Liberty Alliance Project*, which is now part of the *Kantara 
Initiative* [@web_kantara-initiative], including all documents and results. These results were 
taken up occasionally, recently from the IEEE [@paper_2014_personal-data-store-approach].

A research project, which is probably the closest to what this document aims to create, bears the
name *openPDS* [@paper_2012_openpds_on-trusted-use-of-large-scale-personal-data] and is done by 
*Humans Dynamics Lab* [@web_mit_openpds-safeanswers-project-page], which is part of *MIT Media 
Laboratories*. Despite the usual concepts of
a *PDS*, it introduces multi-platform components and user interfaces including a mobile devices
and separating the persistence layer physically at the same time. This facilitates administrative
tasks regardless of the data subject's position and time.
Moreover, with their idea of *SafeAnswers* 
[@paper_2014_openpds_protecting-privacy-of-meta-data-through-safeanswers], the team even goes a 
step further. The concept behind that, is based around *remote code execution*, briefly described 
in [one of the user stories during the first chapter](#header-applying-for-a-loan-and-checking-creditworthiness). 
It abstracts the concept of a data request to a more human-understandable level, a simple question.
This question consists of two representation: (A) a short explanation of what the data consumer 
wants to know and which data might be involved and thus what information a data consumer actually 
will receive, instead of raw data the consumer could then use for all kinds of purposes e.g. 
data aggregation or mining. Aside from that, the request payload also includes (B) a code-based
representation, which gets executed in a sandbox on the data subjects's *PDS* system with the 
necessary data as arguments. The resulting output is answer and response all in once.

Aside from all the research projects done within the scientific context, applications with a 
commercial interest were starting to occur in a variety of sectors, too. Microsoft's HealthVault
[@web_microsoft_healthvault], 
for example, which aims to replace all the paper-based patient medical record and combine them in one digital 
version. This results in a patient-centered medical data and documents archive, helping doctors to
make the most accurate decisions on medical treatment.

*Meeco* [@web_meeco_how-it-works] [@slides_2015_meeco-case-study], based on the MyData-Project 
[whitepaper_2014_mydata-a-nordic-model-for-human-centered-personal-data-management-and-processing], 
which essentially just cuts out the advertisement 
service provider as a middle man inherits that role by itself. The platform does provide
the data subjects with more control over what information they reveal, but it doesn't go the 
so eagerly demanded next step, which would means real uncoupling from the advertisement market 
and finding a suitable business model that focuses on the data subject, instead of surrounding them 
with just another walled garden.

A recently announced project, sponsored by Germany's *Federal Ministry of Education and Research*, 
but developed and maintained primarily by *Fraunhofer-Gesellschaft* in cooperation with several 
private companies like *PricewaterhouseCoopers AG*, *Volkswagen AG*, *thyssenkrupp AG* or 
*REWE Systems GmbH*, is the so called *Industrial Data Space* [@web_industrial-data-space]. 
The project unifies both, research and commercial interests and runs over time period of three 
years until the third quarter of 2018. It aims to *"[...] to facilitate the secure exchange and 
easy linkage of data in business ecosystems"*, where at the same time *"[...] ensuring digital 
sovereignty of data owners"* [@whitepaper_2016_industrial-data-space]. It will be interesting to 
see how these two, yet rather distinct objectives, will come together in the future. Based on the 
white paper, the project's focus mainly seems to lie in enabling and standardizing the way companies 
collect, exchange and aggregate data with each other across process chains to ensure high 
interoperability and accessibility.

Hereafter a selective list can be found of further research projects, work and commercial products 
regarding the issue around *personal data*:

__Research__

+   Higgins [https://www.eclipse.org/higgins/]
+   Hub-of-All-Things [http://hubofallthings.com/what-is-the-hat/]
+   ownyourinfo [http://www.ownyourinfo.com]
+   PAGORA [http://www.paoga.com]
+   PRIME/PrimeLife [https://www.prime-project.eu, http://primelife.ercim.eu/]
+   databox.me (reference implementation of the *[Solid framework](https://github.com/solid/solid)*)
+   Polis (greek research project from 2008) [http://polis.ee.duth.gr/Polis/index.php]


__Organisations__

+   Open Identity Exchange [http://openidentityexchange.org/resources/white-papers/]
+   Qiy Foundation [https://www.qiyfoundation.org/]


__Commercial Products__

+   MyData [https://mydatafi.wordpress.com/]
+   RESPECT network [https://www.respectnetwork.com/]
+   aWise AEGIS [http://www.ewise.com/aegis]


[^more-infos_zxid]: more information on the project, the code and the author, Sampo Kellomäki, can
    be found under *zxid.org*
    
[^abbr_saml2]: Security Assertion Markup Language 2.0

[^abbr_xacml]: eXtensible Access Control Markup Language

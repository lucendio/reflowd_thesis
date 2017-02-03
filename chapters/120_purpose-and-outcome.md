## Purpose & Outcome



At first glance, it might not be considered harmful to provide its own personal data to third 
parties - at least form an individual's perspective - because free or improved services are 
eventually offered in return, for example more adequate recommendations and fitting advertisement, 
or more helpful therapies and more secure environments. 
Gathering and processing data is essentially just mathematics and computer technologies, how those 
tools are utilized and what purposed they serve is within the decision of their developers. 
However, it should be determined by the data creators, what data points are used and how they get 
processed to thereby have an influence on the results of these processes and thus on decisions made 
upon them which can have an impact on their lives.

To address the described issue, the initial idea here is to (1) equip individuals with the ability 
to control and maintain their entire data distribution, in order to (2) reduce the amount of 
*potentially discriminatory* [@paper_2008_discrimination-aware-data-mining] attributes that could 
leak into arbitrary computations. For that, people need a reliable and trustworthy tool, which helps 
them to manage all their *personal data* and provides an interface for third parties to access their 
data, but at their own terms. As a result, those parties probably have the most accurate and 
reliable one-stop resource to an individuals's *personal data* at hand permitted to access, while at 
the same time urged to respect their privacy. However, this approach comes along also with some 
downsides related to security and potential data loss. Elaborating on these issues and discussing 
potential solutions is part of the [design process](#design-discussion).

The way of addressing the described dilemma about personal data analysis is not new (see 
[Related Work](#related-work)). Early work done in this field can be dated back to the Mid-2000s 
when studies were conducted for example about recent developments in the industry (e.g targeted ads) 
and the user's concerns about privacy 
[@study_2004_architecture-for-privacy-sensitive-ubiquitous-computing]. At that time, the term 
*Vendor Relationship Management(VRM)* was first used within the context of user-centric personal 
data management, which then also led into the *ProjectVRM* [@web_2010_projectvrm_about] started by 
the *Berkman Klein Center for Internet & Society at Hardvard University*. 
To this day a great amount of effort went into this area of research since then. While commercial 
products and business models as well try to solve certain problems related to this. For instance 
with concepts like the *Personal Data Store (PDS)* 
[@paper_2013_the-personal-data-store-approach-to-personal-data-security_2013] or an implementation
of the *MyData* concept 
[@whitepaper_2014_mydata-a-nordic-model-for-human-centered-personal-data-management-and-processing] 
called *Meeco* [@web_2016_meeco-how-it-works], which are all be covered in detail within the 
following chapter.

The research work and done for this thesis constitutes the foundation for an *Open Specification*, 
which is a manual for implementing a concept called *Personal Data as a Service*, henceforth called 
*PDaaS*. Examine important topics, like how the architecture looks like, where the actual data can 
be stored, how to obtain data from the exposed API or what requirements have to be met by a user 
interface for personal data management, is part of this work. By the time this document has bees 
submitted, most of the core issues should have already been addressed and can thus get outlined in a 
first draft of the specification. 
Only then the task of actually implementing certain components can begin. The reason for that is, 
when sensitive subjects especially things like people's privacy is at risk, all aspects in question 
deserve careful considerations, so they get addressed properly. That is, adequate effort must be put
primarily into the theoretical work. To not be mistaken though, that does not mean writing code to 
test theories and ideas isn't allowed during the development and specification process. It is 
encouraged and might even help to spot flaws or perhaps trigger improvements of the specification.

To create a certain level of confidence in this project and in the software that is build on it, 
it's vital to make all development processes fully transparent and encourage people to get involved.
For this reason all related software and documents [@repo_2016_pdaas-spec] are open source from day 
one on.

In summary, this document contains the ground work and is thus intended to be the initial step in a 
development process fabricating a tool to manage personal data. The tool is controlled and 
administrated by the individual who the personal data belongs to. it enables her to get a more 
precise understanding of what data is accessed by whom and how this might effect her privacy.

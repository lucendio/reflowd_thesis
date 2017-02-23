## Purpose & Outcome



At first glance, it might not be considered harmful to provide one's own personal data to third 
parties, at least from an individual's perspective, because free or improved services are 
eventually offered in return. For example, more adequate recommendations and fitting advertisement,
or more helpful therapies and more secure environments. 
Gathering and processing data is essentially just mathematics and computer technologies. How those 
tools are utilized and what purposed they serve is within the decision of their developers. 
However, what data points are used and how they get processed should be determined by the data 
creators. Thereby allowing them an  influence on the results of these processes and thus on 
decisions made upon them which impact their lives.

To address the described issue, the initial idea here is to (1) equip individuals with the ability 
to control and maintain their entire data distribution, in order to (2) reduce the amount of 
*potentially discriminatory* [@paper_2008_discrimination-aware-data-mining] attributes that could 
leak into arbitrary computations. For that, people need a reliable and trustworthy tool, which helps 
them to manage all their *personal data* and provides an interface for third parties to access their 
data, but on their own terms. The parties that would be responsible for such a tool would likely 
have the most accurate and reliable one-stop resource to an individuals' *personal data* at hand, 
while simultaneously being urged to respect their privacy. This approach comes along also with some 
downsides related to security and potential data loss. Elaborating on these issues and discussing 
potential solutions is part of the [design process](#design-discussion).

This way of addressing the described dilemma about personal data analysis is not new (see 
[Related Work](#related-work)). Early work done in this field can be dated back to the Mid-2000s 
when studies were conducted, for example, about recent developments in the industry (e.g targeted 
ads) and the user's concerns about privacy 
[@study_2004_architecture-for-privacy-sensitive-ubiquitous-computing]. At that time, the term 
*Vendor Relationship Management (VRM)* was first used within the context of user-centric personal 
data management, which then also led into the *ProjectVRM* [@web_2010_projectvrm_about] started by 
the *Berkman Klein Center for Internet & Society* at *Harvard University*. 
A great amount of effort has gone into this area of research since then. In parallel, commercial 
products and business models try to solve some of the problems related to this. For instance, 
with concepts like the *Personal Data Store (PDS)* 
[@paper_2013_the-personal-data-store-approach-to-personal-data-security_2013] or an implementation
of the *MyData* concept 
[@whitepaper_2014_mydata-a-nordic-model-for-human-centered-personal-data-management-and-processing] 
called *Meeco* [@web_2016_meeco-how-it-works], which are all be covered in detail in the 
following chapter.

The research work done for this thesis constitutes the foundation for an *Open Specification*, 
which is a manual for implementing a concept called *Personal Data as a Service*, henceforth called 
*PDaaS*. Examining important topics like the architecture, where data can 
be stored, how to obtain data from the exposed API or what requirements have to be met by a user 
interface for personal data management, is the main part of this work. By the time this document has been 
submitted, most of the core issues should have already been addressed and can thus be outlined in a 
first draft of the specification. 
Only then can the task of actually implementing certain components begin. The reason for that is, 
when sensitive subjects, especially things like people's privacy, are at risk, all aspects in 
question deserve careful consideration, so they can be addressed properly. That is, adequate effort 
must be put primarily into the theoretical work. However, that does not mean writing code to 
test theories and ideas isn't allowed during the development and specification process. It is 
encouraged and might even help to spot flaws or perhaps trigger improvements of the specification.

To create confidence in this project and in the software built upon it, 
it's vital to make all development processes fully transparent and encourage people to get involved.
For this reason all related software and documents [@repo_2016_pdaas-spec] are open source from the beginning.

In summary, this document lays the ground work and is intended to be the initial step in a 
development process fabricating a tool to manage personal data. The tool is controlled and 
administrated by the individual to whom the personal data belongs. It enables her to get a more 
precise understanding of what data is accessed by whom and how this might affect her privacy.

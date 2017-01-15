Introduction
==========================================



## Motivation

Nowadays it is rare to find someone that does not collect data about some kind of thing; 
particularly humans are the targets of choice for the *Big Data Movement* 
[@web_2016_privacy-international-about-big-data]. Since humans are all individuals, they 
are - more or less - distinct from each other. However, subsets of individuals might share a 
minor set of attributes, but the bulk is still very unique to an individual, given that
the overall variety of attributes is fairly complex. That small amount of shared attributes 
might seem to be less important, due to the nature of inflationary occurrence, but the opposite 
turns out to be true. These similarities allow to determine the individuals who are part of a 
subset and the ones who arn't. Stereotypical patterns are applied to these subsets and thus to
all relating individuals. Thus enriched information are then used to help predicting outcomes 
of problems or questions regarding these individuals. In other words, searching for causation 
where in best the case one might find correlations - or so called *discrimination*, which

>   [...] refers to unfair or unequal treatment of people based on membership to a category or a
>   minority, without regard to individual merit. *[@paper_2008_discrimination-aware-data-mining]*

When interacting directly with each other, discrimination of human beings is still a serious issue 
in our society, but also when humans leverage computers and algorithms to uncover formerly 
unnoticed information in order to include them in their decision making. For example when 
qualifying for a loan, hiring employees, investigating crimes or renting flats. Approval or denial, 
the decision is based on computed data about the individuals in question
[@book_2015_ethical-it-innovation_ethical-uses-of-information-and-knowledge], which is simply
discrimination on a much larger scale and with less effort - almost parenthetically. 
The described phenomenon is originally referred to as *Bias in computer systems*
[@paper_1996_bias-in-computer-systems]. What at first seems like machines going rouge on 
humans, is, in fact, the *cognitive bias* [@wikipedia_2016_cognitive-bias] of human nature, 
modeled in machine executable language and made to reveal the patterns their creators were looking 
for - the *"Inheritance of humanness"* [@web_2016_big-data-is-people] so to say.

In addition to the identity-defining data mentioned above, humans have the habit to create more and 
more data on a daily basis - pro-actively (e.g by writing a tweet) and passively (e.g by allowing 
the twitter app accessing their current location while submitting the tweet). 
As a result, already tremendous amounts of data keep growing bigger and bigger, waiting to
be harvested, collected, aggregated, analyzed and finally interpreted. The crux here is, the 
more data being made available [@video_2015_big-data-and-deep-learning_discrimination] to *mine*, 
the higher the chances to isolate data sets, that differ from each other but are 
coherent in themselves. Then it is just a matter of how to distinguish the data set and thereby 
the related individuals from each other.

In order to lower potential discrimination we either need to erase responsible parts from the 
machines, thereby it's crucial raising awareness and teaching people about the issue of 
discrimination, or we try to prevent our data from falling into these data silos. The latter 
will be addressed in this work.



## Purpose & Outcome

From an individual's perspective providing data to third parties might not seem harmful at all.
Instead eventually one get improved services in return, e.g. more adequate recommendations and 
fitting advertisement, or more helpful therapies and more secure environments. That said, though
it is a matter of perception what's good and bad, what's harmful and what's an advantage.
Computing data to leverage decision making is essentially just science and technology and it's up 
to the humans how such tools are getting utilized and what purposes they are serving. Hence it 
should be decided by the data creators, how their data get processed and what parts of them 
are used.

To tackle the described issue the initial idea here is (1) to equip individuals with the ability 
to control and maintain their entire data distribution and (2) thus reducing the amount of 
*potentially discriminatory* [@paper_2008_discrimination-aware-data-mining] attributes leaking 
into arbitrary calculations. To do so people need a reliable and trustworthy tool, which assists 
them in managing all their *personal data* and making them accessible for 3rd parties but under 
their own conditions. After getting permission granted these data consumers might have the most 
accurate and reliable one-stop resource to an individuals's data at hand, while urged to respect 
their privacy at the same time. However this also comes with downsides in terms of security and 
potential data loss. Elaborating on that and discussing different solutions will be part of the 
[design process][Design].

The way how to solve the described dilemma is not new. Early days of work done in this field can be 
dated back to the Mid-2000s where studies were made e.g. about recent developments in the 
industry or user's concerning about privacy, and the term *Vendor Relationship Management
(VRM)* were used initially within the context of user-centric personal data management, which 
also led into the *ProjectVRM* [@web_2010_projectvrm_about] started by the *Berkman Klein Center 
for Internet & Society at Hardvard University*. Since then a great amount of effort went into
this research area until today, while also commercial products and business models trying to 
solve certain problems. For instance concepts such as the *Personal Data Store (PDS)* 
[@paper_2013_the-personal-data-store-approach-to-personal-data-security_2013] or a *MyData* 
[@whitepaper_2014_mydata-a-nordic-model-for-human-centered-personal-data-management-and-processing] 
implementation called *Meeco* [@web_2016_meeco-how-it-works], which will all be covered in 
a more detailed way within the following chapter.

The work and research done for this thesis will be the foundation for an *Open Specification*, 
which by itself is a manual to implement a concept called *Personal Data as a Service*. Important 
topics like how the architecture will look like, where the actual data can be stored, how to 
obtain data from the external API or what requirements a user interface for data management 
need to satisfy, will be examined. After the thesis will be finished, the majority of core issues 
should already be addressed and can then get outlined in the specification document. 
Only then the task to actual implement certain components can begin. The reason for that is, 
when sensitive subjects especially like people's privacy is at risk, all aspects in question 
deserve a careful considerations and then get addressed properly. Thus it is indispensable to 
put adequate effort primarily into the theoretical work. To be clear though, that doesn't mean 
writing code to test out theories and ideas can't be done during research and specification 
development. It might even help to spot some flaws and eventually trigger evolvement.

To ensure a great level of trust to this project and the resulting software, it is vital to make 
the development process fully transparent and encourage people to get involved.
Therefore it is required to open source all related software and documents [@repo_2016_pdaas-spec] 
from day one on.

In summary, this document is meant to be the initial step in a development process fabricating 
a tool to manage all data defining a data subject's identity, that is controlled and administrated 
by that individual, so that maybe she is giving a more precise understanding about where her 
personal information flows and how this might effect her privacy.

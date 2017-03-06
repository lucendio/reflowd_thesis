Conclusion
==========================================



Even though the *Right to privacy* is a fundamental right, stated by numerous national 
constitutions and confirmed by court decisions, stating that
 
>   Given the context of modern data processing, the protection of individuals against unlimited 
>   collection, storage, use and transfer of their personal data is subsumed under the general right 
>   of personality governed by [...] the Basic Law. [...] this fundamental right guarantees in 
>   principle the power of individuals to make their own decisions as regards the disclosure and use 
>   of their personal data. [@court-decision_1983_census-act-germany, p. 3]
 
It is demonstrated in *[Chapter 2 - Fundamentals](#fundamentals)*, that these legislation encounter
not much recognition nowadays. Secret agencies simply ignore or reinterpret 
[@web_2016_bnd-weltraumtheorie] them and private organisations are usually out of jurisdiction.
But since it still is valid law, individuals have not only a reasonable desire, but as stated above, 
the right to protect their personal data. A web service, controlled only by themselves, can 
contribute moving into this direction. Representing her digital counterpart, it encourages the 
data subject to effortlessly maintain all her personal data. Furthermore, making them explicitly and 
selectively available to third parties, while carrying them around, stored in her mobile device. 
This software enables the data owner to keep track of her data flows, while at the same time trying 
to be as trustworthy and secure as possible. The specification for such a service is hereby 
available as a first *Working Draft* and is attached to this work.



## Ethical & Social Relevance

In *Chapter 2* - 
*[Personal Data in the context of the Big Data Movement](#personal-data-in-the-context-of-the-big-data-movement)*
and 
*[Personal Data as a Product](#personal-data-as-a-product)*
it is described what impact personal data has in today's society and especially the economy. Data as
a commercial good has lead to humans become the product. Those actors, who collect, analyze and 
interpret personal date, using algorithms to unwind invisible information that might help to figure
out people's motives and patterns in order to forecast their behaviour, with the purpose of 
improving their services to ultimately increase revenue. Here it is often failed to notice, that 
correlation is by far no proof of causation. Furthermore, those algorithms naturally inherit the 
bias of their creators. This in conjunction leads to privacy violations and worse, discrimination. 

These 'side effects' are not acceptable in a society where tolerance and solidarity are desirable
values. Hence, we, as individuals, have to move away from being the product and start to become 
self-determined again. The answer to what platform do we want for a global community, like the one 
envisioned by Mr. Zuckerberg [@web_2017_facebook_building-global-community], must not be *facebook*.
Instead the answer should be build on openness and neutrality, and on an infrastructure that is 
accessible to everyone and owned by everyone - like the origins of the internet, 
*"an Internet of People"* [@web_2017_encouraging-individual-sovereignty, sec. 5]. The here proposed 
software can conduce in reclaiming the internet as the platform for a global community - our 
society.

While trying to prevent our personal data from being read by men in the middle during transfer 
(HTTPS), we have missed to cut out the middle-men between our data and those who are utilizing them.
Thus, every individual must be re-enabled, so that they can fully decide on their own what level of 
privacy they are willing to share and under what conditions other parties are permitted to access 
their personal data. 
The here proposed software can help to counter massive and unimpeded data collection in minimize the 
possibility of discrimination. In this way, though, these issues can be addressed only partially. As 
mentioned before, bias, causing discrimination, is naturally inherited and therefore needs to be 
acknowledged by raising awareness and teaching involved authors and developers about these issues 
and how to avoid them or at least address them properly. For example by reducing questionable 
data items, considering possible consequences for data subjects of their interpretations, or by 
keeping indirect correlations in mind. Only both approaches combined, can help to remove the greater 
part of bias, embedded not only in those machines but in all of us.



## Challenges & Solutions

As touched on before, the motivation and basic idea for this work was to overcome discrimination and 
privacy violation experienced by data owners and caused through large scale data collection, to 
prevent data from being collected in the fist place. This turns out to be a major challenge, because 
third parties still require personal data, at least for basic processes such as ordering or payment 
(e.g address), and therefore raw data needs to be transmitted, which is, by the 
nature of information technology, a process of duplicating data. Thus, the definition of ownership, 
at least on a technical level, cannot be applied anymore 
(see *[Chapter 2 - Digital Identity, Personal Data and Ownership](#def--ownership)*). Where 
legislation has already failed to address the issues mentioned above, technology as well has its 
limitations. Although, certain scenarios, such as check creditworthiness or calculating 
recommendation, are able - from a conceptional perspective - to support *Supervised Code Execution*, 
which allows the data to stay within the *PDaaS*. However, just being able to control access or at 
least having an overview of who has access to what data, is already a major advantage.

The *PDaaS* may be valued as the digital representation of a human being. Hence, third parties, who
are interacting with the digital self, want to be able to trust and rely, and maybe even verify, 
that the received or accessed data actually relates to the represented individual.
Several approaches to address this have been discussed in 
*[Chapter 5 - Data Reliability](#data-reliability)*. As a result, a however implemented signing 
procedure, involving the administration or an official documents *(eID-card)*, was stated as a 
feasible solution. Although, both require an additional but diverging level of effort for the data 
owner, the QES-based eID-card version is not widely used and the *Recurring Certification* performed 
by the administration is a rather theoretical concept.
However, the question, is an individual willing to depend on the government well-disposition, may 
remain. Since for both solutions a public key infrastructure to verify the signatures is mandatory,
a more liberal and open approach like the *web-of-trust* could be a valuable alternative solution.

Retaining integrity of the personal data, that's being stored, but also maintaining those, becomes 
rather complex when introducing flexibility. That is, allowing the owner to change underlying
data *structs* at any time, results in running a background data migration after every structure 
change, regardless of where the *Personal Data Storage* is located at that moment. In order to 
simplify that process, one solution is to create a new database next to the existing one, execute 
every query in the write history and adjust the affected data items according to the new type 
structure on the fly in those queries during the mirroring process.

While reviewing the different scenarios described in *[Chapter 1](#scenarios)* and comparing them 
with the established capabilities of the *PDaaS*, it can be observed that the developed system is 
able to provide a reasonable foundation for all of them. Even though it requires the willingness of 
all sorts of third parties to integrate with the proposed specification and a rethinking and change 
of perspective of how personal data is obtained and utilized until now. It is questionable, though, 
how the industry might respond to such fundamental changes, but this is a secondary issue, though. 
First, it must be focused on increasing the adoption rate of data subjects. Problems and benefits,
as mentioned in the *[Ethical & Social Relevance](ethical-social-relevance)* before, must be 
outlined. It is vital to create a trustworthy and easy-to-use system, which can be archived through 
public development and an active and healthy community. Ultimately the result has to provide a great 
user experiences, which primarily refers to installation and setup procedures as well as data 
management and a seamless mobile integration, which emphasises the benefit of 
*'carry your data with you'*. If the acceptance has reached a critical minimum, *data subjects* 
might be able to demand potential *data consumers* to start adapting the specification, if they 
still want to be able to access their personal data.



## Business Models & Monetization

An imaginable opportunity for a viable business model can be to provide commercial services around 
the proposed system. Developing and implementing the specification yields to expertise, that may 
qualify, for example, to provide high-quality hosting of *PDaaS* instances for end users, or to 
customize implementations in order to adapt for special scenarios, or to assist with integrations. 
Even though the underlying technology is open source, history shows various examples of successful 
businesses based on open source technology, such as 
[Meteor](https://meteor.com),
[Mozilla Foundation](https://www.mozilla.org),
[Red Hat](https://www.redhat.com), or
[Wordpress](https://wordpress.org).
It allows to drive the development forward and to contribute back to the ecosystem, from which 
the whole community eventually benefits from, and while following the specification, 
interoperability remains preserved on all levels.

As another, very distinct way of monetization is the possibility and willingness of data subjects to
sell their personal data to third parties, under their conditions. This can mean to actually hand 
over the raw data, but also to just license the access, which is the business model of data brokers. 
Of course, this requires further specification, additional infrastructure i.a. for anonymization and 
payment transfer, and probably a marketplace as well.
But for now let's take a step back and reevaluate this idea.
An negative scenario may result in people trying to make a living by selling all their data to 
everybody, or worse, having no other option than doing so. In contrast, other individuals, who don't
want to monetize their digital identity could therefore be discriminated. Or data consumers who 
previously depended on gratis data, for what ever reason and however obtained, may now run dry, 
because if people are able to charge for their data, they do it. The market may be not stable and 
data becomes inflationary.
On the other hand, a positive scenario may bring more quality data to various places where they are
eagerly needed to improve our social co-existence. Studies and research might be able to reveal 
otherwise hidden solutions (e.g. health care, public sector, government, etc) that could be commonly 
relevant. Furthermore this approach would cut out current middle-men whose business model is to
collect and monetize personal data, or at least it could result in a fair revenue share between them 
and data owners. This could also lead to data consumers become more aware of what data they collect 
and what parts they actually need. 
Either way, those are all just excerpts of possible outcomes, and even a mixture between both 
directions is conceivable. So to conclude, certain scenarios may need to be restricted by law. For 
example an insurance company should not be allowed to give those members, who permit the company to 
access their data, an advantage (or discount) over those who don't. This is a simple case of 
discrimination. In general, if individuals don't want to monetize their personal data, they must not 
experience any disadvantages. This work originates i.a. in the attempt of preventing this in the 
first place. It must not create something that encourages discrimination, though. From that point of 
view, it is questionable to equip data subjects with such capabilities. On the other hand, though, 
regardless of this work or such feature, such discount offers as described before are already start 
to occur [web_2015_health-insurance-discount-in-return-of-data] 
[@web_2016_insurance-discount-in-return-of-data]. 



## Future Work

On the on side, looking back and re-evaluating past research mentioned in 
*[Chapter 2 - Related Work](#related-work)* can give the impression of only minor progress that has 
been made in this field despite following a reasonable approach that is more relevant today then 
ever before. Only a few projects have managed to last beyond a prototype or case study, to which the 
problem of user adoption rate might have contributed. On the other side, though, for example the 
project *openPDS/SafeAnswers*, of which the specification has in part followed similar 
approaches, is fairly new and matches with the latest opinions of experts 
[@web_2017_distributed-future-is-personal].

The critique, which the specification is partially able to address, is the lack of control of our 
own personal data while it's being collected. Where instead the existence and utilization of data 
analytics per see is a huge advantage for our society, because the ability of discovering 
information and relationships we would otherwise not be able to uncover, lets us conclude and 
therefore evolve. The *PDaaS* is a tool that again is the foundation to do exactly that but on a 
smaller and individual scope, and only if we choose to do so. But this requires an additional stack 
of components, including i.a. for data mining and machine learning, which therefore need to be 
integrate with the *PDaaS*.

The concept of *Supervised Code Execution* can be enhanced by migrating the 
*Personal Data Storage (PDS)* and execution to a *Bockchain*-based approach 
[@paper_2015_decentralizing-privacy-using-blockchain-to-protect-personal-data] as proposed in the 
[Enigma](http://www.enigma.co) Project. In general the idea of encrypting the *PDS* might be a 
reasonable step, which would introduce new challenges as well. Therefore it requires a reevaluation 
of its necessity.
During concept development, it appears to become necessary to define an additional role. The so 
called *data contributors* can be a plugin, client or even just a dedicated account that is 
authorized by the *operator* to only push data into the *PDaaS*. This concept was merely touched on 
and requires additional work invested to outline the details.
Two major enhancements but rather independent to all the other components are obviously the 
inclusion of an *OpenID Provider* supporting 2-Factor-Authentication, but only for that individual
represented by the *PDaaS*.

The next steps to push the development forward are finalizing the specification by outlining each 
component so that the minimum viable set of features discussed in this work are supported, and then 
starting to develop the first components until a working prototype appears. The latter step 
typically goes along with finding and addressing flaws in the specification, which is an iterative 
process. Mobile components have to follow shortly and additional features such as those just 
mentioned may come afterwards.

It remains conclusive to say, that the here proposed concept is fare from being the ultimate 
solution, but it is in any regards an improvement considering the current situation, It definitely 
has its weaknesses and needs further development, but they are worth to invest in order ro reach the 
overall goals of increasing privacy and empowering individuals to control their own data.

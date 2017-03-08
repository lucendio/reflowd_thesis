Conclusion
==========================================



The *Right to privacy* is a fundamental right found in numerous national constitutions and confirmed
by court decisions, stating that:
 
>   Given the context of modern data processing, the protection of individuals against unlimited 
>   collection, storage, use and transfer of their personal data is subsumed under the general right 
>   of personality governed by [...] the Basic Law. [...] this fundamental right guarantees in 
>   principle the power of individuals to make their own decisions as regards the disclosure and use 
>   of their personal data. [@court-decision_1983_census-act-germany, p. 3]
 
However, this legislation goes largely unrecognized today, as demonstrated in 
*[Chapter 2 - Fundamentals](#fundamentals)*. Secret agencies simply ignore or reinterpret 
[@web_2016_bnd-weltraumtheorie] such laws, and private organisations are usually out of jurisdiction.
But since it is still valid law, individuals have not only a reasonable desire but, as stated above, 
the right to protect their personal data. A web service, controlled only by themselves, can 
contribute to a move in this direction. It acts as her digital counterpart, encouraging the 
data subject to effortlessly maintain all her personal data. She can explicitly and 
selectively make them available to third parties, while carrying and storing them on her mobile device. 
This software enables the data owner to keep track of her data flows, while at the same time endeavors 
to be as trustworthy and secure as possible. The specification for such a service is hereby 
available as a first *Working Draft* and is attached to this work.



## Ethical & Social Relevance

In *Chapter 2* - 
*[Personal Data in the context of the Big Data Movement](#personal-data-in-the-context-of-the-big-data-movement)*
and 
*[Personal Data as a Product](#personal-data-as-a-product)*
it is described what impact personal data has in today's society and, in particular, the economy. 
Data as a commercial good has led to humans becoming the product. Those, who collect, analyze and 
interpret personal data using algorithms to uncover hidden information that may help determine
people's motives and patterns in order to forecast their behaviour, with the purpose of 
improving their services and ultimately increasing revenue. What is often overlooked is that 
correlation is no proof of causation. Furthermore, those algorithms naturally inherit the 
bias of their creators. Together, this leads to privacy violations, and worse, discrimination. 

These 'side effects' are not acceptable in a society where tolerance and solidarity are desirable
values. Therefore we, as individuals, have to move away from being the product and start to become 
self-determined again. The answer to what platform we want for a global community, like the one 
envisioned by Mr. Zuckerberg [@web_2017_facebook_building-global-community], must not be *facebook*.
Instead the answer should be built on openness and neutrality, and on an infrastructure that is 
accessible to everyone and owned by everyone - like the origins of the internet, 
*"an Internet of People"* [@web_2017_encouraging-individual-sovereignty, sec. 5]. The software proposed 
here can aid in reclaiming the internet as the platform for a global community - our society.

While trying to prevent our personal data from being read by men in the middle during transfer 
(HTTPS), we have missed cutting out the middle-men between our data and those who are utilizing them.
Thus, every individual must be re-enabled, so that they can fully decide, on their own, what level of 
privacy they are willing to share and under what conditions other parties are permitted to access 
their personal data. 
The software proposed here can help to counter massive and unimpeded data collection and minimize the 
possibility of discrimination. However these issues can be addressed only partially by these means. As 
mentioned before, bias, causing discrimination, is naturally inherited and therefore needs to be 
acknowledged by raising awareness and teaching involved authors and developers about these issues 
and how to avoid them or at least address them properly. For example, by reducing questionable 
data items, considering possible consequences for data subjects of their interpretations, or by 
keeping indirect correlations in mind. Only a combination of both approaches can remove the greater 
part of bias, embedded not only in those machines but in all of us.



## Challenges & Solutions

As touched on before, the motivation for this work was to overcome discrimination and 
privacy violation experienced by data owners and caused through large scale data collection, to 
prevent data from being collected in the first place. This turns out to be a major challenge, because 
third parties may still require to possess personal data, at least for basic processes such as ordering 
or payment (e.g address), and therefore raw data needs to be transmitted, which is, by the 
nature of information technology, a process of duplicating data. Thus, the definition of ownership, 
at least on a technical level, cannot be applied anymore 
*([Chapter 2 - Digital Identity, Personal Data and Ownership](#def--ownership))*. Where 
legislation has already failed to address the issues mentioned above, technology has its own
limitations. Certain scenarios, such as creditworthiness checks or calculating 
recommendation, are able - from a conceptional perspective - to support *Supervised Code Execution*, 
which allows the data to stay within the *PDaaS*. However, even when data cannot be completely contained in the *PDaaS*, being able to control access, or have an overview of who has access to what data, is already a major advantage.

The *PDaaS* may be valued as the digital representation of a human being. Hence, third parties, who
are interacting with the digital self, want to be able to trust, rely upon, and maybe even verify, 
that the received or accessed data actually relates to the represented individual.
Several approaches to address this have been discussed in 
*[Chapter 5 - Data Reliability](#data-reliability)*. The proposed solution was a procedure involving 
the administration (or another party with similar properties) or an official document *(eID-card)*
that signs and certifies the data in question, which can then serve a verifiable proof for the data
consumer. Although both require an additional but diverging level of effort for the data 
owner, the QES-based eID-card version is not widely used and the *Recurring Certification* performed 
by the administration is a rather theoretical concept.
However, the question of an individual's willingness to depend on the government's good intentions may 
remain, since  both solutions require a public key infrastructure to verify the signatures.
A more liberal and open approach like the *web-of-trust* could be a valuable alternative solution.

Retaining integrity of the personal data, that's being stored, but also maintaining that data, 
becomes rather complex when allowing a flexible data structuring. That is, allowing the owner to 
change underlying data *structs* at any time, results in running a background data migration after
every structure change, regardless of where the *Personal Data Storage* is located at that moment.
In order to simplify that process, one solution is to create a new database next to the existing 
one, execute every query in the write history and adjust the affected data items according to the
new type structure on the fly in those queries during the mirroring process.

While reviewing the different scenarios described in *[Chapter 1](#scenarios)* and comparing them 
with the established capabilities of the *PDaaS*, it can be observed that the developed system is 
able to provide a reasonable foundation for all of them. Even though it requires the willingness of 
all sorts of third parties to integrate with the proposed specification and a rethinking and change 
of perspective of how personal data has been obtained and utilized until now.
How the industry might respond to such fundamental changes is an open question, but this is a secondary issue. 
First, the focus must be on increasing the adoption rate of data subjects. Problems and benefits,
as mentioned in the *[Ethical & Social Relevance](#ethical-social-relevance)*, must be 
outlined. It is vital to create a trustworthy and easy-to-use system, which can be archived through 
public development and an active and healthy community. Ultimately the result has to provide a great 
user experience, which primarily refers to installation and setup procedures as well as data 
management and a seamless mobile integration, which emphasizes the benefit of 
*'carrying your data with you'*. If the acceptance has reached a critical minimum, *data subjects* 
might be able to demand potential *data consumers* to start adopting the specification if they 
still want to be able to access their personal data.



## Business Models & Monetization

An imaginable opportunity for a viable business model is to provide commercial services around 
the proposed system. Developing and implementing the specification yields expertise, that may 
qualify, for example, to offer high-quality hosting of *PDaaS* instances for end users, or to 
customize implementations in order to adapt to special scenarios, or to assist with integrations. 
Even though the underlying technology is open source, history shows various examples of successful 
businesses based on open source technology, such as 
[Meteor](https://meteor.com),
[Mozilla Foundation](https://www.mozilla.org),
[Red Hat](https://www.redhat.com), or
[Wordpress](https://wordpress.org).
It allows the development to be driven forward and to contribute back to the ecosystem from which 
the whole community eventually benefits from. Additionally, because there is a specification, 
interoperability remains preserved on all levels.

Another, very distinct, way of monetization is the possibility and willingness of data subjects to
sell their personal data to third parties, on their own terms. This can mean to actually hand 
over the raw data, but also to simply license the access, which is the business model of data brokers. 
Of course, this requires further specification, additional infrastructure i.a. for anonymization and 
payment transfer, and probably a marketplace as well. But let's take a step back for a moment and 
reevaluate this idea.  
A negative scenario may result in people trying to make a living by selling all their data to 
everybody, or worse, having no other option than doing so. In contrast, other individuals, who don't
want to monetize their digital identity could therefore be discriminated. Or data consumers who 
previously depended on gratis data, for whatever reason and however obtained, may now run dry, 
because if people are able to charge for their data, they do it. The market may be not stable and 
data becomes inflationary.  
On the other hand, a positive scenario may bring more quality data to various places where they are
eagerly needed to improve our social co-existence. Studies and research might be able to reveal 
otherwise hidden solutions (e.g. health care, public sector, government, etc) that could be commonly 
relevant. Furthermore this approach would cut out current middle-men whose business model is to
collect and monetize personal data, or at least it could result in a fair revenue share between them 
and data owners. This may also lead to data consumers become more aware of what data they collect 
and what parts they actually need.  
Either way, those are all just excerpts of possible outcomes, and a mixture of both 
directions is conceivable. In conclusion, certain scenarios may need to be restricted by law. For 
example, an insurance company should not be allowed to give those members, who permit the company to 
access their data, an advantage (or discount) over those who don't. This is a simple case of 
discrimination. In general, if individuals don't want to monetize their personal data, they must not 
experience any disadvantages. This work originates i.a. in the attempt of preventing this in the 
first place. It must not create something that encourages discrimination. From that point of 
view, it is questionable to equip data subjects with such capabilities. On the other hand, though, 
regardless of this work or such feature, such discount offers as described before are already
starting to occur [web_2015_health-insurance-discount-in-return-of-data] 
[@web_2016_insurance-discount-in-return-of-data]. 



## Future Work

On the one hand, looking back and re-evaluating past research mentioned in 
*[Chapter 2 - Related Work](#related-work)* can give the impression that only minor progress has 
been made in this field, despite following a reasonable approach that is more relevant today than 
ever before. Only a few projects have managed to last beyond a prototype or case study, to which the 
problem of user adoption rate might have contributed. On the other hand, the *openPDS/SafeAnswers*
project, for example, whose specification has, in part, followed similar approaches, is fairly new 
and matches with the latest opinions of experts [@web_2017_distributed-future-is-personal].

The critique, which the specification is partially able to address, is the lack of control of our 
own personal data while it's being collected. The existence and utilization of data analytics per se 
is a huge advantage for our society because of the ability to discover information and relationships
we would otherwise not be able to uncover. This allows us to draw conclusions and thereby evolve. 
The *PDaaS* is a tool that provides a foundation to do exactly that, but on a smaller and individual 
scope, and only if we choose to do so. However, this requires an additional stack of components to 
be integrated with the *PDaaS*, i.a. *Data Mining* and *Machine Learning*.

The concept of *Supervised Code Execution* can be enhanced by migrating the 
*Personal Data Storage (PDS)* and execution to a *Blockchain*-based approach 
[@paper_2015_decentralizing-privacy-using-blockchain-to-protect-personal-data] as proposed in the 
[Enigma](http://www.enigma.co) Project. Further on, idea of encrypting the *PDS* might be a 
reasonable step, although it would introduce new challenges. Therefore it requires a reevaluation of
its necessity.  
During concept development, it appeared necessary to define an additional role. The so called 
*data contributors* can be a plugin, client, or even just a dedicated account that is authorized by 
the *operator* to only push data into the *PDaaS*. This concept was merely touched on and requires
additional work invested to outline the details.  
Two major, but rather independent, enhancements, that seem natural to include, are an 
*OpenID Provider*, and support of 2-Factor-Authentication for the individual represented by the 
*PDaaS*.

The next steps to push development forward are, finalizing the specification by outlining each 
component so that the minimum viable set of features discussed in this work are supported, and then 
starting to develop the first components until a working prototype appears. The latter step 
typically goes along with finding and addressing flaws in the specification, which is an iterative 
process. Mobile components have to follow shortly and additional features such as those just 
mentioned may come afterwards.

In conclusion, the concept proposed here is far from being the ultimate solution, but it is 
nonetheless an improvement over the current situation, It definitely has its weaknesses and needs 
further development, but they are worth investing in, in order to reach the overall goals of 
increasing privacy and empowering individuals to control their own data.

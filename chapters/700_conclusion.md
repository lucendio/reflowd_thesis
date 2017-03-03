Conclusion
==========================================



Even though the *Right to privacy* is a fundamental right, stated by numerous national 
constitutions and confirmed by court decisions, stating that
 
>   Given the context of modern data processing, the protection of individuals against unlimited 
>   collection, storage, use and transfer of their personal data is subsumed under the general right 
>   of personality governed by [...] the Basic Law. [...] this fundamental right guarantees in 
>   principle the power of individuals to make their own decisions as regards the disclosure and use 
>   of their personal data [@court-decision_1983_census-act-germany, p. 3].
 
It is demonstrated in *[Chapter 2 - Fundamentals](#fundamentals)*, that these legislation encounters
not much recognition nowadays. Secret agencies simply ignore them and private organisations are 
usually out of jurisdiction.
But since it still is valid law, individuals have not only a reasonable desire, but as stated above, 
the right to protect their personal data. A web service, controlled only by themselves, can 
facilitate to move into this direction. Representing her digital counterpart, it encourages the 
data subject to effortlessly maintain all her personal data. Furthermore, making them explicitly and 
selectively available to third parties, while carrying them around, stored in her mobile device. 
This software enables the data owner to keep track of her data flows, while at the same time trying 
to be as secure as possible. The specification for such a service has been subject to this work. 



## Ethical & Social Relevance

In *Chapter 2* - 
*(Personal Data in the context of the Big Data Movement)[#personal-data-in-the-context-of-the-big-data-movement]*
and 
*(Personal Data as a Product)[#personal-data-as-a-product]*
it is described what impact personal data has in today's society and especially the economy. Data as
a commercial good has lead to humans becoming the product. Those actors, who collect, analyze and 
interpret personal date, using algorithms to unwind invisible information that might help to figure
out people's motives and patterns in order to forecast their behaviour, with the purpose of 
improving their services to ultimately increase revenue. Here it is often failed to notice, that 
correlation is by far no proof of causation. Furthermore, those algorithms naturally inherit the 
bias of their creators. This in conjunction leads to privacy violations and worse, discrimination. 

These 'side effects' are not acceptable in a society where tolerance and solidarity are desirable
values. Hence, we, as individuals, have to move away from being the product and start to become 
self-determined again. The answer to what platform do we want for a global community, like the one 
envisioned by Mr. Zuckerberg [@web_2017_facebook_building-global-community], must not be *facebook*.
Instead the answer should be founded on openness and neutrality, and is accessible to everyone and 
owned by everyone - like where the internet originates from, *"an Internet of People"* 
[@web_2017_encouraging-individual-sovereignty, sec. 5].

While trying to prevent our personal data from being read by men in the middle during transfer 
(HTTPS), we have missed to cut out the middle-men between our data and those who are utilizing them.
Thus, in order to re-enable every individual, so that they can fully decide on their own what level 
of privacy they are willing to share and under what conditions other parties are permitted to 
access their personal data, 

Thereby this software can contribute in helping to reclaim the internet as the platform for a 
global community - our society.
 

to counter massive and unimpeded data collection
to minimize discrimination, which is not really effective to address the problem in this way. as
mentioned before, bias, causing discrimination, is naturally inherited and therefore needs to be
acknowledged by raising awareness and teach everyone involved about these issues and how to avoid 
them, for example by reducing questionable data items, consider the consequences of their interpretation,
or keep indirect correlations in mind


Depending on which *data consumers*, what task their
are entrusted with and what motivation the *data subject* has has in mind to do so, the *PDaaS* 
might become a powerful *'digital reflection'* and starts to get seen as a real and reliable 
representation of herself. Then the decisions made by *data consumers* might have a big impact for
the *data subject's* life. For example a housing loan won't be granted or a medical treatment has 
been refused.







## Challenges & Solutions

As touched on before, the motivation and basic idea for this work was in order to overcome 
discrimination and privacy violation experienced by data owners and caused through large scale data 
collection, to prevent data from being collected in the fist place. This turns out to be a major
challenge, because third parties still required personal data, at least for basic processes such as 
ordering or payment (e.g address), and therefore raw data needs to be transmitted, which is, by the 
nature of information technology, a process where data is duplicated. Thus, the definition of 
ownership, at least on a technical level, cannot be applied anymore 
(see *[Chapter 2 - Digital Identity, Personal Data and Ownership](#def--ownership)*).
Where legislation has already failed to address the issues mentioned above, technology as well has
its limitations. Although, certain scenarios, such as check creditworthiness or calculating 
recommendation, are able - from a conceptional perspective - to support *Supervised Code Execution*, 
which allows the data to remain only within the system. However, just being able to control access 
or at least having an overview who has access to what data, is already an improvement considering 
the current situation.

The *PDaaS* may be valued as the digital representation of a human being. Hence, third parties, who
are interacting with the digital self, want to be able to trust and rely, and maybe even verify, 
that the received or accessed data actually relates to the represented individual.
Several approaches have been discussed in *[Chapter 5 - Data Reliability](#data-reliability)*. As a
result, a, however implemented, signing procedure, involving the administration or official 
documents *(eID-card)*, was stated a feasible solution. Although, both require additional but a 
diverging level of effort for the data owner, the QES-based eID-card version is not widely used and
the *Recurring Certification* performed by the administration is just a theoretical concept.
However, the question, is an individual willing to depend on the government well-disposition, may 
remain. Since for both solutions a public key infrastructure to verify the signatures is mandatory,
a more liberal and open approach like the *web-of-trust* could be a valuable alternative solution.

Retaining integrity of the personal data, that's being stored, and also maintaining those, becomes 
rather complex when introducing flexibility. That is, allowing the owner to change underlying
data *structs* at any has the consequence of running a data migration in the background after every 
structure change, regardless of where the *Personal Data Storage* is located at that moment. In
order to simplify the process, one solution can be to create a new database next to the existing 
one, execute the write history and adjust the affected data items according to the new type 
structure on the fly during the mirroring process.

While reviewing the different scenarios described in [Chapter 1](#scenarios) and comparing them with 
the established capabilities of the *PDaaS*, it can be observed that the developed system is able to 
provide a reasonable foundation for all of them. Even though it requires the willingness of all 
sorts of third parties to integrate with the proposed specification and a rethinking and change of 
perspective of how personal data is obtained and utilized until now. It is questionable, though, how 
the industry might respond to such fundamental changes, but this is secondary issue, though. First, 
it must be focused on increasing the adoption rate of data subjects. Problems and benefits, as 
mentioned in the *[Ethical & Social Relevance](ethical-social-relevance)*, must be outlined. It is
vital to create a trustworthy and easy-to-use system, which can be archived through public 
development and an active and healthy community. Ultimately the result has to provide a great user 
experiences, which primarily refers to installation and setup as well as data management and a 
seamless mobile integration, which outlines the benefit of *'carry your data with you'*. If the 
acceptance has reached a critical minimum, *data subject* might be able to demand potential 
*data consumers* to start adapting the specification, if they want to be able to access their 
personal data.



## Business Models & Monetization

An imaginable opportunity for a viable business model can be to provide commercial services around 
the proposed system. Developing and implementing the specification yields into expertise, that may 
qualify, for example, to provide high-quality hosting of *PDaaS* instances for end users, or to 
customize implementations in order to adapt for special scenarios, or to assist with integrations. 
Even though the underlying technology is open source, history shows the emerging of various 
successful businesses based on open source technology, such as 
[Meteor](https://meteor.com/),
[Mozilla Foundation](https://www.mozilla.org),
[Red Hat](https://www.redhat.com), or
[Wordpress](https://wordpress.org/).
It allows to drive the development forward and to contribute back to the ecosystem, from which 
the whole community eventually benefits from, and while following the specification, 
interoperability remains preserved on all levels.

As another, very distinct way of monetization is the possibility and willingness of data subjects to
sell their personal data to third parties, under their conditions. This can mean to actually hand 
over the raw data, but also to just license the access, which is the business model of data brokers. 
Of course, this requires further specification, additional infrastructure i.a. for anonymization and 
payment transfer, and probably a marketplace as well.
But let's take a step back and reevaluate this idea.  
An negative scenario may result in people trying to make a living by selling all their data to 
everybody, or worse, having no other option than doing so. In contrast, other individuals, who don't
want to monetize their digital identity could therefore be discriminated. Or data consumers who 
previously depended on gratis data, for what ever reason and however obtained, may now run dry, 
because if people are able to charge for their data, they do it. The market may be not stable and 
data become inflationary.
On the other hand, a positive scenario may bring more quality data to various places where they are
eagerly needed to improve your social co-existence. Studies and research might be able to reveal 
otherwise hidden solutions (e.g. health care, public sector, government, etc) that could be commonly 
relevant. Furthermore this approach would cut out the current middle-men whose business model is to
collect and monetize personal data, or at least it could result in a fair revenue share for data 
owners. This could also lead to data consumers become more aware. 
Either way, those are all just excerpts of possible outcomes, and even a mixture between both 
directions is conceivable. So to conclude, certain scenarios may need to be restricted by law. For 
example an insurance company should not be allowed to give those members, who permit the company to 
access their data, an advantage (or discount) over those who don't. This is a simple case of 
discrimination. In general, if individuals don't want to monetize their personal data, they must not 
experience any disadvantages. This work originates i.a. in the attempts of preventing this in the 
first place. It must not create something that encourages discrimination, though. From that point of 
view, it is questionable to equip data subjects with such capabilities. On the other hand, though, 
regardless of this work or such feature, such discount offers as described before are already start 
to happen [web_2015_health-insurance-discount-in-return-of-data] 
[@web_2016_insurance-discount-in-return-of-data]. 



## Target Groups Perspective

*NOTICE: the following perspectives do not necessarily reflect the sole perspective of the author, 
but should be understood as a general opinions from the respective user type.*


For me, as a data subject, privacy is a major concern. With this software I would not only have one
single place to maintain all my personal and sensitive data while carrying the actual the data with 
me, but I would also be able to control on a very precise level and under my conditions which vendor 
has what data on me or can access. I can even collect and submit data to my system, completely 
automated, whether it's movement data, my browsing history or any other data I am create. And since 
I have full control over the system I could even analyze the date about me by myself.
It is not my concern know exactly how the *PDaaS* might work, but it needs to be reliable and I have
to be able to trust it with my data. A convenient setup and usage is vital, otherwise I would 
probably not make a great effort to get it up and running. 
If those demands the *PDaaS* is capable to provide, then of course I would use it, because it gives 
me freedom of my data.

From a developer's perspective, the most important aspects of an open source project, are in my 
opinion, a friendly and cooperative community of users and developers, as well as detailed 
specification and documentation for what's already exist. I must also be a user of that developed 
software, which generally is a valuable perspective for every developer. As a developer I must be 
able to conceive the specification as well as the overall architecture and design. That is, the more 
sophisticated those aspects are, the more effort is required to get involved. The software can still 
have many components though, but the complexity of the relations between them should be simple and
explicit. The barriers for participation or contribution must be as low as possible. For example,
the documentation should provide instructions on how to setup a local development environment.

 

- depending on the question of taste, the spec should either be restrictive or flexible
- it should definitely be very precise on how the internal interfaces between components as well as 
  external should look like, and also any part that is security related  

- different implementations based on different languages
- little external third party dependencies and





+   Dev:    
    -   spec implementer
    -   integrater in consumer:
+   Consumer:
    -   what can she do with it:
        adjsut precision of datasets and values to increase privacy
    -   control and get an overview on where her data might flow (and for what purpose)



## Future Work

TODO: make a reference or involve the research mentioned at the beginning


+   during concept development, it appears to become necessary to define another role, for *data 
contributors* (plugins/clients that are authorized by the *operator* but only allowed to push data 
to the *PDaaS*).


+   maybe enable the tool to play the role of an own OpenID provider?
+   2FA service/provider

+   going one step further and train machine (predictor) by our self with our own data (https://www.technologyreview.com/s/514356/stephen-wolfram-on-personal-analytics/)

+   finalize first draft of the spec with all core aspect included and outlined
+   developing based on that a first prototype to find flaws in the spec. iterate/repeat
+   release 1.0 (spec and example implementation)
+   touch on parts that were left blank
+   first supporting platforms


+   full encryption of the *data storage*

+   In the sole opinion of the author the here proposed concept is fare from being the ultimate 
solution, but it is in any regards an improvement of the current situation. It definitely has its 
weaknesses and needs further development, which are worth to invest in order ro reach its goals.



## Summary



Is primarily a transition technology 


+   main focus 
+   unique features
+   technology stack & standards
+   resources
+   the tool might be not a bulletproof vest, but


The work will be continued.

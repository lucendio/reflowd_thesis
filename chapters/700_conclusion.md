Conclusion
==========================================



Even though the *Right to privacy* is a fundamental right, stated by numerous national 
constitutions and confirmed by court decisions, saying that
 
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

to counter massive and unimpeded data collection
to minimize discrimination, which is not really effective to address the problem in this way. as
mentioned before, bias, causing discrimination, is naturally inherited and therefore needs to be
acknowledged by raising awareness and teach everyone involved about these issues and how to avoid 
them, for example by reducing questionable data items, consider the consequences of their interpretation,
or keep indirect correlations in mind










large scale
 

+   give back the data subject to control the level of privacy she is willing to share





## Target group perspectives
 
+   User: would I use this stuff? The underpinning technical details and how it works is not my 
    concern and non of my interests. I want this stuff work and being reliable. it its simple to 
    use. and maybe even easy to setup (server n stuff), then the hell, I would!
    
+   Regarding involving an official party to verify data reliability:
The actual question would be, is the *data subject* certain, that she really wants to hand over 
those capabilities to official authorities? Depending on which *data consumers*, what task their
are entrusted with and what motivation the *data subject* has has in mind to do so, the *PDaaS* 
might become a powerful *'digital reflection'* and starts to get seen as a real and reliable 
representation of herself. Then the decisions made by *data consumers* might have a big impact for
the *data subject's* life. For example a housing loan won't be granted or a medical treatment has 
been refused.
    
    
    
+   Dev:    
    -   spec implementer
    -   integrater in consumer:
+   Consumer:
    -   what can she do with it:
        adjsut precision of datasets and values to increase privacy
    -   control and get an overview on where her data might flow (and for what purpose)
    






## Business Models & Monetization

+   possible resulting direct or indirect business models
+   data subject might want to sell her data, only under her conditions. therefor some kind of 
    infrastructure and process is required (such as payment transfer, data anonymization, market
    place to offer data)



## Challenges

+   adoption rate of such technology

+   data reliability from the perspective of a *data consumer*
Since it is almost impossible to ensure complete reliability of all the data a *PDaaS* has stored or
might me offering, and because it is operated by exactly that individual, and that individual only, 
all data in question is relates to and is thereby owned by her, it, of cause, makes it not easy for 
*data consumers* to trust *PDaaS*s as resources for their business processes, but I am certain, that 
the demand for all different kinds of data exceeds the partial uncertainty of their reliability.

+   personal data leaking
Preventing personal data from being leaked to the outside, is, especially because of the system's 
purpose, extremely hard to prevent, if not possible at all. Just by querying data from the storage
or by physically transferring them from one location to another, it's already copied. It's the
very nature of digital information technology/systems.
So this cannot be defeated. It only can be impeded. Interestingly though, is the same approach 
the media industry for centuries is trying to make copyright infringements more difficult.

+   scenario where the mobile device, or in general the data storage get lost.
first of all, not much of a problem, because either device backup or since the liberal relation, the 
system would continue to function, but limited, until a data storage gets part of the system again 
(TODO: touched on in the data section at the end)

+   during concept development, it appears to become necessary to define another role, for *data 
contributors* (plugins/clients that are authorized by the *operator* but only allowed to push data 
to the *PDaaS*).

+   when *structs* currently in use get changes all data have to migrate accordingly and fully 
automated



## Solutions

+   even though *OAuth* don't find it's way into this project, working through the standard inspired
here and there a solution, for example using a URL as a feedback channel or TODO. 

+   refer to the scenarios at the beginning by saying that with the *PDaaS* one is able to implement
all of them



## Future Work

TODO: make a reference or involve the research mentioned at the beginning

+   maybe enable the tool to play the role of an own OpenID provider?
+   going one step further and train machine (predictor) by our self with our own data (https://www.technologyreview.com/s/514356/stephen-wolfram-on-personal-analytics/)

+   finalize first draft of the spec with all core aspect included and outlined
+   developing based on that a first prototype to find flaws in the spec. iterate/repeat
+   release 1.0 (spec and example implementation)
+   touch on parts that were left blank
+   first supporting platforms

+   full encryption of the *data storage*



## Summary

+   In the sole opinion of the author the here proposed concept is fare from being the ultimate 
solution, but it is in any regards an improvement of the current situation. is definately has its 
weaknesses and needs further development, which are worth to invest in order ro reach its goals.


+   main focus 
+   unique features
+   technology stack & standards
+   resources
+   the tool might be not a bulletproof vest, but


The work will be continued.

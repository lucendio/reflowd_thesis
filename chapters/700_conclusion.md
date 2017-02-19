Conclusion
==========================================



## Ethical & Social Impact (TODO: or "Relevance")

+   Regarding involving an official party to verify data reliability:
The actual question would be, is the *data subject* certain, that she really wants to hand over 
those capabilities to official authorities? Depending on which *data consumers*, what task their
are entrusted with and what motivation the *data subject* has has in mind to do so, the *PDaaS* 
might become a powerful *'digital reflection'* and starts to get seen as a real and reliable 
representation of herself. Then the decisions made by *data consumers* might have a big impact for
the *data subject's* life. For example a housing loan won't be granted or a medical treatment has 
been refused.

+   give back the data subject to control the level of privacy she is willing to share

+   (formally placed in 230) At the end it all comes down to understanding the human being and why she behaves as she does. 
    The challenge is not only to compute certain motives but rather concluding to the right ones. 
    When analyzing computed results with the corresponding data models and trying to conclude, 
    it is important to keep in mind, that correlation is by far no proof of causation.


## Business Models & Monetisation

+   possible resulting direct or indirect business models
+   data subject might want to sell her data, only under her conditions. therefor some kind of 
    infrastructure and process is required (such as payment transfer, data anonymization, market
    place to offer data)
    
    
    
## Target group perspectives
 
+   User: would I use this stuff? The underpinning technical details and how it works is not my 
    concern and non of my interests. I want this stuff work and being reliable. it its simple to 
    use. and maybe even easy to setup (server n stuff), then the hell, I would!
+   Dev:    
    -   spec implementer
    -   integrater in consumer:
+   Consumer:
    -   what can she do with it:
        adjsut precision of datasets and values to increase privacy
    -   control and get an overview on where her data might flow (and for what purpose)
    


TODO: make a reference or involve the research mentioned at the beginning



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
here and there a solution, for example using a URI as a feedback channel or TODO. 

+   refer to the scenarios at the beginning by saying that with the *PDaaS* one is able to implement
all of them



## Attack Scenarios

+   single point of failure (data-wise),
    -   but considering what data users already put into their 
        social networks (or: thE social network: fb), they/it has already become a de facto data silo and is 
        thus a single point of failure. If that service breaks or get down, the data from all users might be
        lost or worse (stolen). The aspect of data decentralization achieved by individual data stores can 
        be valued as positive.

+   what about token stealing when using jwt?

+   future work: add/activate an intrusion detection system

+   PDS is on mobile platform and server platform is corrupted: storage connector must queue 
    requests and regularly provide the server with a JWT, triggered by the operator when interacting
    with the mobile app.





## Future Work

+   maybe enable the tool to play the role of an own OpenID provider?
+   going one step further and train machine (predictor) by our self with our own data (https://www.technologyreview.com/s/514356/stephen-wolfram-on-personal-analytics/)

+   finalize first draft of the spec with all core aspect included and outlined
+   developing based on that a first prototype to find flaws in the spec. iterate/repeat
+   release 1.0 (spec and example implementation)
+   touch on parts that were left blank
+   first supporting platforms

+   full encryption of the *data storage*



## Summary

+   main focus 
+   unique features
+   technology stack & standards
+   resources
+   the tool might be not a bulletproof vest, but


The work will be continued.

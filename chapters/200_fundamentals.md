Fundamentals
==========================================



## Personal Data, Ownership and Digital Identity

+   *Personal Data* definition
    +   general - freely spoken
    +   as of EU law (incl citation)
    +   as of US law (incl citation)
    +   is it just policy/guideline or enforceable too (law/rule)? what relevance/impact have
        companies *terms and conditions*?
    +   EU and USA (since server might be located outside the state or effective range)

+   *Ownership* of personal data
    -   who is the owner in what situation or under what circumstances?
    -   am I the owner when I was the one who was collecting them? Does it depend whether the 
        resource was public or somewhat private?
    -   what will happen with her data service after a person died?
    
+   *Digital Identity*
    -   what is a *DI*? and in comparison to *Personal Data*? 
    -   what is required to make the PDaaS used or seen as a *DI*?


####################################################################################################


+   In the context of this document and all related work, *Personal Data* (or *Personal 
    Information*) is specified as a set of data points (key-value-pairs), that are related 
    to an individual or defining her personality. A subset of these attributes combined can 
    result in a unique fingerprint as well as values of single attribute, depending on the 
    context. Not only external imposed attributes, such as social security number, birth or
    customer ID, are part of an individual's personal data. Data (pro-)actively created by that 
    individual - including meta data - belongs to her as well; for instance time series data 
    such as bank account history, a written blog posts or a geo-location attached to her tweet as
    meta information. That also includes data, captured by someone ore something on or about the 
    individual's private living space and property. Generally speaking, all data solely associating 
    with an individual, is in the ownership of the same.
    
+   The european *Data Protection Regulations* defining *Personal Data* as follows:
>   ‘personal data’ means any information relating to an identified or identifiable natural person 
>   (‘data subject’); an identifiable natural person is one who can be identified, directly or 
>   indirectly, in particular by reference to an identifier such as a name, an identification 
>   number, location data, an online identifier or to one or more factors specific to the physical, 
>   physiological, genetic, mental, economic, cultural or social identity of that natural person;
>   *[@regulation_2016_eu_general-data-protection-regulation_definition]*
    
+   The U.S.A. has little legislation on defining and protecting consumer's privacy. At least they
    have no explicit bills addressing such area [@web_2016_wikipedia_information-privacy-law_us]. 
    Though some of the existing sectoral laws consist of partially applicable policies and 
    guidelines [@web_2016_data-protection-laws-in-the-us]; most of them addressing specific types
    of data.
    In 2015 the White House made an attempt to fill the gap with the *Consumer Privacy Bill of 
    Rights Act*, but to this date it didn't passes the draft state. According to the critics, it 
    lags of concrete enforceable rules consumers can rely on 
    [@web_2015_white-house-releases-consumer-privacy-bill-draft]. The draft contains a general 
    definition of *Personal Data*:
>   “Personal data” means any data that are under the control of a covered entity, not otherwise 
>   generally available to the public through lawful means, and are linked, or as a practical matter 
>   linkable by the covered entity, to a specific individual, or linked to a device that is 
>   associated with or routinely used by an individual, including but not limited to [...]
>   *[@bill-draft_2015_us_consumer-privacy-bill-of-rights-act_definition]*
+   followed by a list of concrete data points, e.g. email or postal address, name, social security 
    number and alike.
    Aside from the legislation with bills, a few third-party organisation can also participate by
    and add new or overwriting existing rules and policies. Namely for example the *Federal 
    Communications Commission* (FCC), recently releasing *Rules to Protect Broadband Consumer 
    Privacy* including a list of categories of sensitive information
    [@rules_2016_fcc_to-protect-broadband-consumer-privacy_sensitive-types-of-data],
    which wants *Personally Identifiable Information* (alias Personal Data) to be 
    understood as:
>   [...] any information that is linked or linkable to an individual. [...] information is 
>   “linked” or “linkable” to an individual if it can be used on its own, in context, or in 
>   combination to identify an individual or to logically associate with other information about a 
>   specific individual. 
>   *[@rules_2016_fcc_to-protect-broadband-consumer-privacy_personally-identifiable-information]*   

+   Despite minor difference in detail, they all have similar ideas of personal data and
    their belonging. Even though, the version proposed by EU is almost identical with the 
    definition introduced for the context of this work. Although the FCC's statutory authorities
    might be somewhat debatable regarding certain topics, the *Communications Act* as a U.S. 
    federal law equips the FCC with power to regulate and legislate.
    
+   Having a common opinion on what data points are belonging to person is the foundation to 
    define a set of rules on how deal with *Personal Data* accordingly. Every business, 
    operating within the EU, is required [^eu-data-protection-regulation_informing-data-subject] 
    to provide it's users with a *Privacy Policy*, while e.g. in the U.S. - as mentioned above - 
    only partially and depending on context and data type users must be informed about which and 
    how their data get processed [@web_2016_privacy-policies-are-mandatory-by-law]. 
    
+   A user commonly agrees on the privacy policy, by starting to interact with 
    the author's business, thus every *Privacy Policy* is required to be publicly accessible; e.g. 
    before creating an account.
>   By clicking Create an account, you agree to our [Terms](https://www.facebook.com/legal/terms) 
>   and that you have read our [Data Policy](https://www.facebook.com/about/privacy), including 
>   our [Cookie Use](https://www.facebook.com/policies/cookies/). 
>   *[web_2016_facebooks-landing-page_policy-acknowledgement]*
+   It can be seen more likely an information notice, that translates and specifies general 
    given law, rather then a contract.
+   With such knowledge at hand, it is up to each individual, if the service's benefits are worth 
    sharing some personal data, while simultaneously acquiescing potential downsides concerning 
    the privacy of such data.
    
+   Every entity who is doing so, muss process Personal data according to the law and their 
    *Privacy Policy*. If they policies are violating existing law or the entity effectively goes 
    against the law with their actual doing, penalties might follow. Depending on the level and 
    impact of their infringement in addition the law itself, aside from revising their wrong-doings 
    the entity might have to compensate the affected individuals, pay a fine or get revoked their 
    license.
    
+   Not only privacy laws, but every legal jurisdiction has it's limitations - concerning their
    territorial nature - which makes legislation not exactly an appropriate tool when it comes 
    to fixing existing issues and strengthen the individual's privacy and rights in a global 
    context like the *world wide web*.
    If no international agreement is in place [@web_2016_international-privacy-standards], only 
    those laws are considered valid and enforcible where the organisation is registered, and 
    maybe the fact where (meaning in which area of jurisdiction) the their servers are located 
    or the data is processed and stored.



Whereas __Ownership__ of *Personal Data* is generally addressed in the organisation's 
*Terms of Service*, which an individual might need to accept in order to establish a (legal) 
relationship with it's author 


Ownership in the sense of having full control over it's personal data and how they get processed at 
any given point in time; that's not only highly expensive, but also very inconvenient for both
parties - owner and data consumer.

the contents (of ToS) is not against any appliable law; or the regarding issues are lacking of any 
legislative addressing.


+   Data consumers might argue, that they had invested in enabling themselves to collect, 
    process and store personal data, so it belongs to them.
    But from the data owner's point of view it might only be the case as long as as she would
    benefit as well somehow, e.g. using products, services or features, offered by consumers,
    which quality depends on personal data. 
    If the data owner chooses to move to a competitor might what to bring her personal data with
    her. But then again the former data consumer would object, competitors would
    benefit from all investments the consumer has made, but without any effort.
    Though, not entirely wrong, two aspects need to be emphasize. (A) In order to archive a high
    level of quality for their analytics and therefore in making right decisions to gain 
    improvement, it's vital to huge amount of effort in developing these underlying technologies,
    not only in acquiring personal data. Which again only constitutes (B) the foundation of various 
    subsequential computations followed by an ongoing collecting, aggregation and 
    analytics of actively and passively created data and meta data (e.g. food deliver history or
    platform interactions and tracking). Given the initially introduced definition of *personal 
    data* only a fraction of the involved data belongs to its owner. Hence the large part should 
    remain to the data collector and should either be deleted or sufficiently anonymized, if the 
    owner cancels the relationship. The data owner should not depend on the collector's willingness
    when it comes to handing over her personal data (e.g. list of favorites or delivery history).
    Instead, using her own tool to provide the consumer with required data (e.g. list of favorites)
    or tap into her data creating interactions (e.g. food deliveries) on her own.

    
+   Since the U.S. law barely handles consumer privacy, it also touches just briefly on ownership 
    of data and in a rather generic manner.


+   A __Digital Identity__ goes a step further by not only representing and associating a living 
    human being, but also providing an additional level of authenticity verification/insurance. 
+   NOTE: maybe the dif goes as follows - personal data becomes a *DI* only when the data set holds 
    enough attributes or specific attributes to be unique in the given context, and therefore 
    allowing to identify associated individual (??); not really, same goes for personal data
+   all digital data about, related to and created by an individual, that would 
    also identify this person as the rightful owner and physical counterpart. It can also be seen 
    as an avatar in the digital world or as the digital part of a human's identity. 
    [@whitepaper_2012_the-value-of-our-digital-identity_definition]

+   identity defining data (e.g. history of personal ID card)

+   with such a system a human being is represented by a non-physical abstraction of herself.
    Which essentially is a list of attributes, that are at least for legal and civil
    administration purposes important. Their values in total are unique and representing the 
    corresponding human. Certain attributes hold unique values within it's own context, for 
    example the *social security number*. 
+   Thus it's not necessary to know the values of all attributes in order to identify it's
    owner
+   therefore its imported to not see it as a reduction of a living individual to some bits and
    bytes


[^eu-data-protection-regulation]: passed 2016, immediately enforceable in every member country of 
    the European Union, will supersede *Data Protection Directive 95/46/EC* 
    
[^eu-data-protection-regulation_informing-data-subject]: according to article 12-14 of the *EU
    General Data Protection Regulation 2016/679*


[@report_2014_big-data_seizing-opportunities-preserving-values]

+   ownership? (https://united-kingdom.taylorwessing.com/globaldatahub/article_big_data_ownership.html)
    https://lifehacker.com/you-dont-own-your-data-1556088120
+   https://www.eff.org/deeplinks/2015/07/big-tech-does-not-speak-internet



## Personal Data in the context of the Big Data Movement

+   big data itself initially can be seen as a *huge blob of data* containing more or less
    structured data sets [@web_2016_oxford_definition_big-data], whose size might have exceeded 
    the capabilities of retrieving certain information almost only by hand. Such high data 
    haystacks usually come along with new challenges in logistic and resource management, when 
    information retrieval needs to get automated on a large scale 
    [@web_2016_wikipedia_definition_big-data]. Theses practices are commonly referred to *Big 
    Data (Analysis)* including distributed computing and machine learning. 
+   Big Data, or to be more precise, collecting and analyzing big data, serves the prior purpose 
    to extract useful information, which on the other hand depends on what was the opening 
    question about, but also what data sets the corpus is containing.
+   At first, (A) formalizing question(s) that the results have to answer. 
    Secondly, (B) deciding what data is needed and appropriate and then start collecting. Third, (C) 
    designing data models accordingly and correlate with the data (D) next, analyse and interpret 
    the results. (E) last but not least, make business decisions based und the analyses 
    ([@paper_2015_big-data-analytics_a-survey] Fig. 3).
    
+   since quite a few businesses (in terms of purpose or intention) are based around the concept 
    of customers, which are generally somewhat entities consisting of at least one human being,
    personal data takes a major part in what *Big Data* can be about. 
    In the context of this thesis, these entities are individuals with a unique identity. And to 
    understand the behaviour, decision making and needs of her customers a vendor, who owns the 
    business, needs to know as much as possible about them, when she wants to know what changes
    she needs to address in order to move towards the most lucrative business.
+   personal data and information are reflecting all this knowledge. It starts with profile data, such
    as gender, age, residency or income, goes on with time series events like geo-location changes, 
    or web search history and goes all the way up to health data and self-created content like 
    *Tweets* [^tweets] or videos.

+   all these classes of personal data hold a major share[^its-all-somehow-personal] in the field 
    of data analytics (TODO: find statistics
    showing shares of data types/classes/categories, [@book-chapter_1999_Principles-of-knowledge-discovery-in-databases_introduction-to-data-mining]
    [@web_2013_big-data-collection-collides-with-privacy-concerns])
+   but, depending on the specific attributes, they might be not that easy to acquire. in general
    most businesses obtain data from within their own platforms. some data might be in the user's 
    rang of control (e.g. customer or profile data), but most of the data comes from interacting
    directly (content creation, inputs) or indirectly (transactions, meta information). the level
    of sensitivity is mainly based on the purpose of the platform (benefit for the user) and what
    is the provider's demand from the users commitment (e.g. required inputs or usage requires 
    access to location)
+   from a technical perspective collecting passively created data is as simple as integrating 
    logging mechanisms in the program logic. since the industry moved towards the cloud 
    [^because-of-the-cloud] most scenarios utilized server-client architectures. Furthermore 
    the *always-on* philosophy evolved to an imperative state. standalone software is starting 
    to call the author's servers from time to time, just to make sure the user behaves properly. 
    For browsers it was already a common narrative to make here and then requests to the server - still 
    preventable though, but when it comes to native mobile apps it is almost impossible 
    [@web_2016_answers-io] to notice such behaviour and therefore preventing apps from doing so.
+   these architectural developments were inducing the gathering of potentially useful information 
    from all over the system on a large scale [@web_2016_big-data-enthusiasts-should-not-ignore]. 
    Logging events, caused by the user's interactions, on the client, which then get forwarded 
    to backend servers. Or keeping track of all kinds of transactions, which is done directly in the 
    backend. Before running together in a designated place, all these collected chucks of data 
    (TODO or "data points") are getting enriched with meta information. Finally get stored and 
    probably never removed again - all for later analyses.

+   The mindset in the *Big Data Community* is grounded on the basic assumption of 
    *more data is more helpful*, which already is emphasised by the often-cited concept of the 
    three *Vs* (Volume, Velocity, Variety) [@report_2001_3d-data-management-controlling-data-volume-velocity-and-variety]. 
    which is not entirely wrong, because it lies in the nature of pattern and correlation discovery,
    to provide increasing quality results [@paper_2015_big-data-for-development-a-review-of-promises-and-challenges:more-data],
    while enriching the overall data with more precise data sets.
    But when new technologies are emerging, questioning the downsides and possible negative 
    mid- or long-term impacts are typically not very likely to be a high priority. The focus lies 
    on e.g. trying to to reach and eventually breach boundaries while beginning to evolve. So 
    non-technical aspects such as privacy and security awareness doesn't come in naturally, instead 
    a wider range of research needs to be done alongside the evolution process and the increasing 
    adoption rate in order to uncover such issues. Only then they can addressed properly on 
    different levels - technical, political as well as social. So that the *Big Data Community*
    itself is able to evolve, too.
    All in all it's a balancing act between respecting the user's privacy and having enough data 
    at hand to satisfy the initial questioning with the computed results. Therefore people
    working in such contexts need to have advanced domain knowledge, be aware of any downsides or 
    pitfalls and need to be sensible about the ramifications of their approaches and doings.
    Such improvements are already happening, not only originating from the field's forward thinkers
    [@web_2016_the-state-of-big-data], 
    but also advocated by governments, consumer rights organisations and even leading Tech-Companies 
    start trying to do better [@web_2016_apple_customer-letter] [@web_2016_what-is-differential-privacy]
    [@web_2016_eff_whatsapp-rolls-out-emd-to-end-encryption] - as discussed in the section 
    [TODO see personal data as of the law], 

+   earlier in the text a difference was made between actively created and passively created data 
+   based on that one could say *profile/account data* is actively created, because it got into 
    the system by the user's actively made decision to insert these information into a form and
    submit it - for whatever reason. whereas detecting the user's current location and adding this
    information to the submitted form is *meta data*
+   of cause, it is debatable whether these kind of data belongs, in the sense of being the 
    rightful owner, to the user or to the author or owner of the software containing the code
    that effectively created the data.
+   maybe personal data is every data/information whose creation (or digital existence) is a 
    direct result of user interaction/engagement?
+   lets have a look into what the rule book says about that --> next topic (law)


[^its-all-somehow-personal]: it doesn't matter whether an individual or just someone on behalf of 
    an organisation spend money for something. at the end of the day, they are all humans on this 
    planet and in a capitalistic oriented world money needs to flow and profits needs to be 
    maximized. So to know where it will flow or why it will flow in a certain direction it is 
    crucial to know everything about it's decision maker - the humans on this planet.

[^tweets]: public massages published by an account on [twitter.com](twitter.com), which will be 
    displayed in the timeline of all her subscribers and also might contain additional types of 
    content like images, links or video
           
[^because-of-the-cloud]: side note - one might come to the conclusion, that only the trend towards
    the *cloud* made it actually possible to collect to such an extent we are  all observing these 
    days, because standalone software should not necessarily require internet connection and 
    therefore the vendors had no way to gather information whatsoever



## Personal Data as a Product

+   *Big Data Analytics* by itself just comprises a structured and technical-aided procedure, 
    serving the purpose of finding invisible information, that might be helpful to make (right) 
    (business) decisions. Though, if one would ask data collectors about their motivation, most 
    likely the answer would be something along the lines of PR phrasing like *"We want to have a 
    better understanding of our customers"*. 
    But to do what exactly? To predict what might be the next thing I am supposed to buy Or what 
    things I probably would like to consume but most certainly not yet know of?
+   Let's take a look at some examples. An advertising service uses tracking data for targeted 
    advertising. The more information they have about an individual, the more accurate decisions 
    they are able to make about what ads are the ones the individual most likely will click on
    and disclose with a successful purchase. As a result this makes the placed advertisement more 
    valuable for ad service and therefore more expensive to the advertisers, because of a high 
    precision.
    Or a streaming provider's content recommendation is also based on heavy user profiling 
    done by looking at her consumption history, tracked platform interactions and probably many 
    more vectors.
    Another example is *Google Traffic* [@web_2007_introducing-google-traffic] 
    [@web_2016_wikipedia_google-traffic], a service, integrated as a feature in *Google Maps*, 
    which is Google's web mapping service. *Google Traffic* visualises real-time traffic 
    conditions, when using *Maps* as a navigation assistant, to provide the user with a selection
    of possible paths, but enriched with duration, that takes such conditions into account. The 
    data, required to offer these information, is supplied by mobile devices, constantly 
    sending GPS coordinates with a timestamp into Google's infrastructure. This, however, only is 
    made possible, because Google's services are widely used in addition to the fact that the 
    majority of mobile devices [@graphic_2016_global-mobile-os-market-share] is driven by Android, 
    an mobile operating system developed by Google, that deeply integrates with it's services.
    For this case the same assertion can be made - the more constantly streaming geo-location data, 
    the more precise the information are about traffic conditions. Since this information demands 
    the real-time aspect, adding time to the equation, add a other dimension of complexity to 
    problem.
    
+   while the impact on our society of this first example group might be doubtable, a change of 
    perspective opens up a different range of application areas. Such as
    
    -   planing and managing human resources for situations, like e.g. big events or emergency 
        situations where attendees might need some help 
        [@estimating-the-locations-of-emergency-events-from-twitter-streams_2014]
    -   predicting infrastructure workloads [TODO http://ieeexplore.ieee.org/document/7336197/]
    -   making more accurate diagnostics to improve their therapy 
        [@the-practice-of-predictive-analytics-in-healthcare_2013]
    -   finding patters in climate changes, which otherwise wouldn't be detected 
        [@data-collection-for-climate-changes_2014].
    
+   Through all these examples, some of them might not necessarily founded on personal data, whereas 
    others primarily depend on them and yet others only implicitly rely on data collected from 
    individuals.
    As always, it depends on the purpose - also known as *business model* - but it seems to be 
    consensual, that it all comes down to improving and enhancing the collector's product 
    in order to satisfy the customers - and that on the other hand depends on what is meant to 
    be the product and who is seen as customers.
    
+   Putting a top 10 list of industries using utilizing *Big Data* 
    [@graphic_2015_applications-of-big-data-in-10-industry-verticals] right next to visualization 
    showing categories of personal data targeted by data collectors  
    [@graphic_2012_personal-data-ecosystem], at least 7 [^industries-as-data-collectors] of these 
    industries can be identified as data collectors, whereas less then a half 
    [^industries-as-data-brokers] are taking part of being a *Data Broker*, but almost all of them 
    are using people's personal data, whether collected by themselves or acquired from 
    *Data Broker*.
    
+   At this point it's save to say, that *Personal Data* is either seen directly as a product, 
    especially from a Dater Broker's point of view, or indirectly due to it's essential part in 
    *Big Data* practices. The former generates direct revenue by selling these data and the latter 
    might affect a business's product quality in a positive manner and thereby increasing 
    revenue as well.
+   At the end it all comes down to understanding the human being and why she behaves as she does. 
    The challenge is not only to compute certain motives but rather concluding to the right ones. 
    When analyzing computed results with the corresponding data models and trying to conclude, 
    it is important to keep in mind, that correlation is by far no proof of causation.
    
    
+   individuals then get in role of selling/offering it's own data to those who were previously 
    collecting them
    
    
[^industries-as-data-collectors]: Banking and Securities; Communication, Media & Entertainment; 
    Healthcare Providers; Government; Insurance; Retail & Wholesale Trade; Energy & Utilities

[^industries-as-data-brokers]: Banking and Securities; Communication, Media & Entertainment;
    Insurance; Energy & Utilities


## Use Cases (NOTE: maybe move to 100_introduction)

+   package shipment after buying sth online 
+   social network accessing arbitrary profile data
+   making an online purchase
+   credibility (applying for a loan) validation by a certain financial institution: 
    accessing arbitrary data
+   patient/health record
+   care (movement) data



## Related Work

+   much more research since the data mining, big data, deep learning 

Different terms, same meaning:
+   Personal Agent
+   Personal Data Vault
+   Personal Data Store


### Research

+   openPDS/safeAnswer [http://openpds.media.mit.edu/]
+   TAS3 aka ZXID aka Synergetics (lead arch Sampo Kellomäki also Co-Authored openPDS papers)
+   Higgins [https://www.eclipse.org/higgins/]
+   Hub-of-All-Things [http://hubofallthings.com/what-is-the-hat/]
+   ownyourinfo [http://www.ownyourinfo.com]
+   PAGORA [http://www.paoga.com]
+   PRIME/PrimeLife [https://www.prime-project.eu, http://primelife.ercim.eu/]
+   databox.me (reference implementation w/ the "solid" framework)
+   Microsoft HealthVault
+   Industrial Data Space (german research project mainly driven by Fraunhofer Institute)
+   Polis (greek research project from 2008) [http://polis.ee.duth.gr/Polis/index.php]


### Organisations

+   Kantara Initiative (former "Liberty Alliance") [https://kantarainitiative.org/]
+   Open Identity Exchange [http://openidentityexchange.org/resources/white-papers/]
+   Qiy Foundation [https://www.qiyfoundation.org/]


### Commercial Products

+   MyData [https://mydatafi.wordpress.com/]
+   Meeco (killing the ad provider middle man) [https://meeco.me/how-it-works.html]
+   RESPECT network [https://www.respectnetwork.com/]
+   aWise AEGIS [http://www.ewise.com/aegis]



## Standards and Specifications

+   http(s)
+   all the *Semantic Web* stuff
+   Container/App spec
+   JWT
+   oAuth (?)
+   JSON
+   REST
+   GraphQL

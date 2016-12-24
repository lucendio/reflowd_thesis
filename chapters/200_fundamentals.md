Fundamentals
==========================================



The following chapter shall provide the foundational knowledge about concepts like *Personal 
Identity* or *Big Data* and therefore ensures a common understanding on their relation to the 
problem this work tries to solve. Additionally it is given a brief overview on what existing 
standards and technologies might be used, and summarizes the research already been made as well 
as it's current state.



####################################################################################################

## Digital Identity, Personal Data and Ownership 

+   *Digital Identity*
    -   what is a *DI*? and in comparison to *Personal Data*? 
    -   what is required to make the PDaaS used or seen as a *DI*?
    
+   *Personal Data* definition
    +   general - freely spoken
    +   as of EU law (incl citation)
    +   as of US law (incl citation)
    +   is it just policy/guideline or enforceable too (law/rule)? what relevance/impact have
        companies *terms and conditions*?
    +   EU and USA (since server might be located outside the state or effective range)

+   *Ownership* of personal data
    -   who is the owner in what situation or under what circumstances?
    -   am I the owner when I was the one who was collecting them? Does it depend on whether the 
        resource was public or somewhat private?
    -   what will happen with her data service after a person died?

####################################################################################################


+   A __Digital Identity__ is a non-physical abstraction of an entity, such as an organisation,
an individual, a device or even software, which allows bidirectional association. In the context 
of this document, it only refers to human beings. Therefore a *digital identity* is the 
individual's representation in digital systems, consisting of identity-defining data, such as 
*personal information* and it's history and preferences 
[@whitepaper_2012_the-value-of-our-digital-identity_definition]. *Personal information*, in this 
case, refers to inherent (date of birth) and imposed (credit card number) characteristics.

+   From a technical perspective a DI is essentially a collection of characteristics, attributes
and time series data (e.g. interaction logs or bank account history). A subset of these attributes 
combined can form unique fingerprint, like certain single data points (e.g. social security number)
in their own context might be, too. Thus it might not be necessary to know the values of all 
attributes in order to identify a person as the rightful owner and physical counterpart. 
It can also be seen as an avatar in the digital world or as the digital part of a human's identity. 
Therefore its important to not view the *DI* as a reduction of a living individual to some bits 
and bytes, but rather as a appropriate representation for certain purposes and contexts.
 
+   It is also possible to provide an additional level of authenticity insurance for data 
related to an entity. Therefor an unrelated third party, which needs to be approved not only by
the related individual, but also by all entities participating in a context, which might be 
relevant e.g. for some administration purposes.
+   But the concept would also impose a new level of attacking vectors to the identity owner, such as 
identity theft. The attacker is no longer required to be physically present to be able to steal 
certain unique identifiers from a person. It is sufficient to gain access to area where the 
sensitive data is stored.



+   In the context of this document and all related work, __Personal Data__ is specified as a
    combination of an individual's *Digital Identity* and all of it's ever created intellectual 
    property (e.g. posts, images, tweets or comments). This includes all sorts of tracking data 
    and interaction monitoring, as well as metadata manually or automated enriching content 
    (e.g.geo-location attached to a tweet as meta information). Data, captured by someone ore 
    something on or about the individual's private living space and property. 
    Simply every data point reflecting the individual's personality - partly or as a whole - is 
    seen as *personal data*.
    
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



Whereas __Ownership__ of *Personal Data* has no legal ground foundation so ever. The concepts of 
intellectual property protection and copyright might intuitively be applicable, because the data, 
created by the data subject, seems to be her *intellectual property*. Such property implies to be a result 
of a creative process though, but unfortunately there is no *threshold of originality* in facts, 
like *personal information* is [@paper_2014_who-owns-yours-data]. 

+   Ownership in the sense of having exclusive control over it's personal data and how they get 
processed at any given point in time; this not only comes with high costs, but is also very 
inconvenient for both parties - data subject and data consumer. It consists of two concepts: (A) the 
right to do what every is desired with their property and (B) in which rules and mechanisms the 
ownership can be assigned to someone [@book_1987_private-ownership_definition].

+   The european DPR [^abbr_dpr] contains only one occurrence of the word *ownership*, which is not 
even related to the context of *personal data* or the *data subject*. It only stats, that 
*"Natural persons should have control of their own personal data."* 
[@regulation_2016_eu_general-data-protection-regulation_ownership]. 
Whereas Commissioner J. Rosenworcel of the FCC wants *"consumers [...] to [...] take some ownership 
of what is done with their personal information."* 
[@rules_2016_fcc_to-protect-broadband-consumer-privacy_ownership]

+   Typically the question of data ownership is addressed in data consumer's *Terms of Service* 
(ToS), which an individual might have to accept in order to establish a (legal) relationship with 
it's author. I should be kept in mind, that *ToS* might change over time; not necessarily to the 
users advantage. All addressed issues (by the ToS) must not violate any applicable or related law, 
otherwise the *ToS* might not be legally recognized.
Taking the following excerpts from different *ToS*:
 
>   You own all of the content and information you post on Facebook, and you can control how 
>   it is shared [...]. *(under "2. Sharing Your Content and Information", by Facebook
>   [@web_2016_facebook_terms-of-service])*

>   You retain your rights to any Content you submit, post or display on or through the Services. 
>   What’s yours is yours — you own your Content. *(under "3. Content on the Services", by Twitter
>   [@web_2016_twitter_terms-of-service])* 

>   Some of our Services allow you to upload, submit, store, send or receive content. You retain 
>   ownership of any intellectual property rights that you hold in that content. In short, what 
>   belongs to you stays yours. *(under "Your Content in our Services", by Google 
>   [@web_2016_google_terms-of-service])*

>   Except for material we may license to you, Apple does not claim ownership of the materials 
>   and/or Content you submit or make available on the Service "(under "H. Content Submitted 
>   or Made Available by You on the Service", by Apple [@web_2016_apple-icloud_terms-of-service])*

All these statements are followed by the same term, stating that the user grants the author a 
worldwide license to do almost any imaginable thing with her data. This even applies to Apple, 
if the user is *"submitting or posting [...] Content on areas of the Service that are accessible
by the public or other users with whom [the user] consent to share [...] Content"*
[@web_2016_apple-icloud_terms-of-service].
+   It is worth noticing, that in every *ToS* it is only referred to the data subject's 
content, not all her personal data. As mentioned above, personal information are no 
intellectual property, but playing an important role in data analytics though. Which is why
*privacy policies* are in place, to ensure at least some user enlightenment, even though it
doesn't compensate the lack of control.
+   In addition to that, the meaning of *ownership* used in the quoted *ToS* is missing a 
clear outline and thus causing ambiguity and leaving room for interpretation. Nor the actual 
definition of *ownership*, as described earlier, is applicable for these kind of cases, since 
the user losing all its control is by design. Handing over data to the consumer annihilates
the exclusive control over the data and revokes the ability of assigning such control. There 
is no (legislation based) way to establish a feasible concept of *ownership*, if the data consumer 
has no motivation to promote the user the a comprehensive owner of her data.
 
+   Leaving all the legal layer aside for a moment and switching the perspectives a bit; 
Data consumers might argue, that they had invested in enabling themselves to collect, process 
and store personal data, so it belongs to them. But from the data subject's point of view it might 
only be the case as long as as she would benefit as well somehow, e.g. using products, services 
or features, offered by consumers, which quality depends on personal data. 
If the data subject chooses to move to a competitor might what to bring her personal data with
her. But then again the former data consumer would object, competitors would
benefit from all investments the consumer has made, but without any effort.
Though, not entirely wrong, two aspects need to be emphasize. (A) In order to archive a high
level of quality for their analytics and therefore in making right decisions to gain 
improvement, it's vital to huge amount of effort in developing these underlying technologies,
not only in acquiring personal data. Which again only constitutes (B) the foundation of various 
subsequential computations followed by an ongoing collecting, aggregation and 
analytics of actively and passively created data and metadata (e.g. food deliver history or
platform interactions and tracking). Given the initially introduced definition of *personal 
data* it appears to only be a fraction of the involved data belonging to its owner. The larger part 
consists of highly valuable metadata [@web_2013_why-metadata-matters] 
[@web_2016_why-you-need-metadata-for-big-data-to-success] and therefore should remain to the 
data collector and either be deleted or sufficiently anonymized, if the owner cancels the 
relationship. The data subject should not depend on the collector's willingness when it comes 
to handing over her personal data (e.g. list of favorites or delivery history). Instead, 
using her own tool to provide the consumer with required data (e.g. list of favorites) or 
tap into her data creating interactions (e.g. food deliveries) on her own.

+   Whether an individual dies or a user deletes her account, as long as certain data point are
shared with / connected to other users, the data will remain. At least when it comes to facebook.

+   Generally speaking, all data solely associating with an individual, is in the ownership of 
the same. But since it doesn't exist any legal concepts on *personal data* ownership, a 
technical solution could help to regain some control. 


[^eu-data-protection-regulation]: passed 2016, immediately enforceable in every member country of 
    the European Union, will supersede *Data Protection Directive 95/46/EC* 
    
[^eu-data-protection-regulation_informing-data-subject]: according to article 12-14 of the *EU
    General Data Protection Regulation 2016/679*
    
[^abbr_dpr]: EU Data Protection Regulation



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
for example, which aims to replace all the paper-based patient file and combine them in one digital 
version. This results in a patient-centered medical data and documents archive, helping doctors to
make the most accurate decisions on medical treatment.

*Meeco* [@web_meeco_how-it-works] [@slides_2015_meeco-case-study], based on the MyData-Project 
[whitepaper_2014_mydata-a-nordic-model-for-human-centered-personal-data-management-and-processing], 
which essentially just cuts out the advertisement 
service provider as a middle man inherits that role by itself. The platform does provide
the data subjects with more control over what information they reveal, but it doesn't go the 
so eagerly demanded next step, which would means real decoupling from the advertisement market 
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



## Standards and Specifications

The overall attempt is to involve as much standards as possible, because it increases the chances
of interoperability and thereby it lowers the effort, that might be needed, in order to integrate
with third parties or other APIs.
Hereinafter, some of these possible technologies will be touched on just briefly, why they might 
be a reasonable choice and what purposes they might going to service.

__HTTP(S)__ [@web_spec_http1], well known as the transport layer for the *World Wide Web* is most 
likely going to fulfill the same purpose in the context of this work. Whether internal components 
(local or as part of a distributed system) talk to each other or data consumers request information.
Features introduces with Version 2 [@web_spec_http2] of the protocol are yet to be known of their 
relevance and corresponding use cases.
The *Transport Layer Security* [@web_spec_tls] embedded in the protocol provides encryption during 
transfer, which reduces the vulnerability to *man-in-the-middle* attacks and thus ensures data 
integrity. Due to it's asymmetrical cryptographic concepts used to establish a connection, *TLS* 
also allows to verify the integrity of the entity on the the connection's counterside, and, 
depending on the integration, it could even used for authentication.
*Websockes* [@web_spec_websockets] might also be a possibility to communicate between components or 
even with external parties, which has the advantage of high efficient ongoing connections using for 
real-time data exchange or remotely pending process responses, while at the same time avoiding 
HTTP's long-polling abilities. 

__JSON__ [^abbr_json] is an alternative data serialization format to XML, heavily used in web 
contexts to transfer data via *HTTP*, whose syntax is inspired by the JavaScript object-literal 
notation.

The open standard __OAuth__ defines a process flow for authorizing third parties to access
externally hosted resources, such as the user's profile image from *facebook*. The authorisation
validation is done with the help of a previously generated token. However generating and supplying
such a token can be initiated in a variety of ways depending on the situation, e.g. with the user
entering her credentials (`grant_type=authorization_code`). This design mistakenly 
[@web_2012_problem-with-oauth-for-authentication] lead to *OAuth* integrations with the intention to 
provide an authentication service whether as an alternative or as an addition to existing in-house 
solution. Therewith the application authors pass the responsibility on to the OAuth-supporting data 
providers. While *version 1.0a* [@web_spec_oauth-1a], seen as a protocol, provides integrity for 
transferred data by using signatures and confidentiality by encrypting data ahead of transfer. 
Whereas *version 2.0* [@web_spec_oauth-2], labeled as a framework, just requires *TLS*. It also 
includes certain process flows for specific platforms, such as *"web applications, desktop 
applications, mobile phones, and living room devices"* [@web_2016_oauth-2].

With __OpenID__ on the other side, the authenticity of a requesting user gets verified, which
is by design. An in-depth description of the whole process can be found in the protocol's 
same-titled open standard. With decentralisation kept in mind, the protocols's nature encourages 
to design a distributed application architecture, similar to the idea behind *microservices*, but 
without owning all services involved, *decentralized authentication as a service* so to speak. An 
application owner doesn't have to write or implement it's own user management system, instead
it is sufficient to just integrate these parts from the standard need to support signing in with 
*OpenID*. Equally the user is not required to register a new account whenever it is necessary, 
instead she can use her *OpenID*, already created by another identity provider, to authenticate 
with the application. The extension *OpenID Attribute Exchange* allows to import additional profile 
data.
*OpenID Connect* [@web_spec_openid-connect-1] is the third iteration of the OpenID technology
*Connect* is to OpenID what *facebook connect* is to *facebook*, except for the additional
authentication layer, which is build upon *OAuth2.0* and therefore enables, aside from authorisation 
mechanisms, third parties to authenticate an OpenID-user and makes certain data available about 
that account via REST interface.

If it's necessary for certain components, as part of a distributed software, to make them stateless, 
apart from changing the architecture so that the state at that point is not needed anymore, the only 
other option would be to carry the state along (TODO: or "passing the state around"). 
 This is a common use case for a 
__JSON Web Token__ *(JWT)* [@web_spec_json-web-token]. A *JWT*, as it's name implies, is 
syntactically speaking formatted as *JSON*, but URI-safe into *Base64* encoded, before it gets transferred.
The token itself holds the state. Here is where the use of *HTTP* comes in handy, because the 
token can be stored within the HTTP header and therefore can be passed through all communication 
points, where then certain data could be readout and therewith get verified. Such a token typically 
consists of three parts: information about itself, a payload, which can be arbitrary data such as 
user or state information, and a signature; all separated with a period. Additional standards define 
encryption *(JWE [^abbr_jwe])* to ensure confidentiality and signatures *(JWS [^abbr_jws])* to 
preserve integrity of it's contents.
Using a *JWT* for authentication purposes, that is described as *stateless authentication*, because 
the verifying entity doesn't need to be aware of session IDs or know anything about a certain state. 
So instead of the backend interface being constrained to check a state (`isLoggedIn(sessionId)` or 
`isAuthorized(sessionId)`) on every incoming request in order to verify permissions, it just needs 

__REST(ful)__ [^abbr_rest] is a common set of principles to design web resources communication, 
primarily server-client relations, in a more generic and thereby interoperable way. Aside from 
hierarchically structured URIs, which reflect semantic meanings, it involves a group of rudimentary 
vocabulary [^http_methods] to provide basic Create-Read-Update-Delete operations across distributed
systems. The entire request need to contain everything that is required to get proceeded, e.g. state 
data and possibly authentication. These operation normally wont get applied directly to the 
responsible component. Instead the whole system (or certain services) exposes a restful API, with
which a third party can then interact. 

The *QL* in __GraphQL__ [@web_spec_graphql] stands for *query language*. It's goal is to abstract
multiple data sources in order to unify them under one API and make all containing data queryable,
including all relating data points. The returned data, emitted in JSON syntax, can exhibit 
graph-like structures, meaning multiple data points, that might be somehow related to each other, or 
in other words: indirectly "linked" through each other. These, naturally deep-leveled structures,
can be described by the syntax of the query language.

The term __Semantic Web__ bundles a conglomerate of standards addressing syntax, schemas, assess
control and integration around the idea of *web of data* to *"allow data being shared and reused 
across"* [web_2016_w3c_semantic-web-activity] or within several scopes and contexts.
Alongside several others, the following three standards have a certain relevance to that  concept.
RDF [^abbr_rdf] basically defines the syntax. OWL [^abbr_owl] provides the guidelines on how the 
semantics and schemas should be defined and with SPARQL [@web_w3c-tr_sparql], the query language for 
the RDF format, the data can be retrieved.
A picture emerges in which the web is used as a database, queried by URIs with a query language.
An example would be a person's email address, which is available under a specific domain (preferable 
owned by that person) - or to be more precise, an URI *(WebID) [@web_w3c-draft_webid]* - and 
provided in a certain syntax *(RDF)* and tagged with the semantic *(OWL)* of a email address; all 
embedded in a valid html page. This information can be queried *(SPARQL)*, which requires at least 
the URI, working as a unique identifier. 
While defining the standards, an importancy was to define a syntax which is also valid markup, in 
order to maintain a single source of trough and save redundant work.
Related to this topic is the work on a specification called __Solid__ [^abbr_solid]. Based on the 
*Linked Data* principals, that are facilitated through the standards just mentioned and the 
*WebAccessControl* [@web_2016_wiki_webaccesscontrol] system, the project focuses on decentralization 
and personal data. A reference implementation called *databox* [@web_2016_demo_databox] combines all 
these technologies and is build on top. 

The concept of application (or software) __container__ is about encapsulating runtime environments 
by introducing an additional layer of abstraction. A container bundles just the software 
dependencies (e.g. binaries) that are absolutely necessary so that the enclosed program is able to 
run properly. The actual container separation is done, aside from others, with the help of two 
features provided by the Linux kernel. *Cgroups* [^abbr_cgroups], which define or restrict how much 
of the existing resources a group of processes (e.g. CPU, memory or network) can use. Whereas 
*namespaces* [@web_2016_kernel-namespace] define or restrict what parts of the system can be 
accessed or seen by a process (e.g. filesystem, user, other processes).
The idea of encapsulating programs from the operating system-level is not new, Technologies, such as 
*libvirt*, *systemd-nspawn*, *jails*, or *hypervisors* (e.g. VMware, KVM, virtualbox) have been used 
for years, but were usually too cumbersome and never reached a great level of convenience, so that 
only people with a certain expertise were able to handle systems build upon virtualization, but 
people with other backgrounds couldn't and weren't that much interested. Until *Docker* and *rkt* 
emerged. After some years of separated work, both authors, and others, recently joined forces in the 
*Open Container Initiative* [@web_2016_open-container-initiative], which aims to harmonize the 
diverged landscape and start building common ground to ensure a higher interoperability, and that in 
turn is requisite for orchestration. It also marks the initial draft of the specifications for 
runtime [@web_oci-spec_runtime] and image [@web_oci-spec_image] definition, on which the work is 
still ongoing.
This concept of *containerization* also inherits the a ability known from *emulation*, because it 
allows a certain set of software to run on a system that otherwise is not supported, e.g. mobile 
devices. It only requires the runtime to be working.



[^abbr_json]: The JavaScript Object Notation (JSON) Data Interchange Format; ECMA Standard  
    [@web_spec_json] and Internet Engineering Task Force RFC 7159 [@web_rfc_json]

[^abbr_jwe]: JSON Web Encryption, Internet Engineering Task Force RFC 7516 
    [@web_spec_json-web-encryption]

[^abbr_jws]: JSON Web Signature, Internet Engineering Task Force RFC 7515 
    [@web_spec_json-web-signature]

[^abbr_rest]: *Representational State Transfer*, introduces by Roy Fielding in his doctoral 
    dissertation [@web_spec_rest] 

[^http_methods]: knows as HTTP Methods or Verbs [@web_spec_http-methods] (e.g. GET, OPTIONS, PUT, 
    DELETE)
    
[^abbr_rdf]: Resource Description Framework [@web_w3c-tr_rdf]

[^abbr_owl]: Web Ontology Language [@web_w3c-tr_owl]

[^abbr_solid]: social linked data [@web_spec_solid]

[^abbr_cgroups]: control groups [@web_2015_cgroup-doc]

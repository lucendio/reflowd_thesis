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
and time series data (e.g. interaction logs or bank account history). A subset of those attributes 
combined can form unique fingerprint, like certain single data points (e.g. social security number)
in their own context might be, too. Thus it might not be necessary to know the values of all 
attributes in order to identify a person as the rightful owner and physical counterpart. 
It can also be seen as an avatar in the digital world or as the digital part of a human's identity. 
Therefore it's important to not view the *DI* as a reduction of a living individual to some bits 
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
    property [@web_2016_wikipedia_intellectual-property] (e.g. posts, images, tweets or comments). This includes all sorts of tracking data 
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



Whereas __Ownership__ of *Personal Data* has no legal ground foundation what so ever. The concepts 
of intellectual property protection and copyright might intuitively be applicable, because the data, 
created by the data subject, seems to be her *intellectual property*. Such property implies to be a result 
of a creative process though, but unfortunately there is no *threshold of originality* in facts, 
like *personal information* is [@paper_2014_who-owns-yours-data]. 

+   Ownership in the sense of having exclusive control over it's personal data and how they get 
processed at any given point in time; this not only comes with high costs, but is also very 
inconvenient for both parties - data subject and data consumer. It consists of two [concepts]{#def-ownership}: (A) the 
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

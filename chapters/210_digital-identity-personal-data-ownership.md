## Digital Identity, Personal Data and Ownership 



A __[Digital Identity]{#def--digital-identity}__ is viewed as a non-physical abstraction of an 
entity, such as an organisation, an individual, a device or even some software. It is 
bidirectionally associated to its physical counterpart. In the context of this work, it only refers 
to human beings. Therefore a Digital Identity is the representation of an individual in digital 
systems, consisting of identity-defining data, such as *personal information*, its own history and 
preferences [@whitepaper_2012_the-value-of-our-digital-identity_definition]. *Personal information*, 
in this case, refers to inherent (e.g. date of birth) as well as imposed (e.g. credit card number) 
characteristics. The individual to whom those data relates to, is the owner of that 
*Digital Identity*.
From a technical standpoint, a *Digital Identity* is essentially a collection of characteristics, 
attributes and time series data (e.g. interaction logs or bank transfer history). Based on a subset 
of those attribute values, a unique fingerprint can be easily generated. Depending on the data point 
and complexity of its value, such a fingerprint could require either a single, unique identifier on 
its own (e.g. social security number) or only a few. Hence, it doesn't take a complete set of 
attributes including all its values, but rather just a fraction of a *Digital Identity* in order to 
determine its rightful owner and physical counterpart. The *Digital Identity* can be viewed as an 
avatar in digital environments or even as the digital part of a persons's identity. That is, a 
*Digital Identity* of a living individual cannot simply be reduced to bits and bytes. Instead, it 
should be valued as an appropriate, and perhaps legal, representation in certain contexts and for a 
variety of purposes.
In some of those situations it might be required (e.g. administrative purposes) to ensure a certain 
level of authenticity for a *Digital Identity* or for particular attributes of it. This means, to 
provide reliable confirmation that the attribute values are really the ones that belong to exactly 
they individual they supposedly belong to. An independent third party, who is trusted by all 
entities participating in such a construct, could somehow verify (or vouch for) the subject in 
question. On the other hand, this concept opens up at least one class of attack scenarios. The risk 
of identity theft, for example, increases dramatically when assigning such value to a 
*Digital Identity* because the attacker is no longer required to be physically present in order to 
impersonate that identity or "steal" certain unique identifiers from that person. Instead, it is 
sufficient to gain access to the areas where those sensitive data are stored.
It is noted, that different technical solutions to these issues exist and will be discussed later 
on.

In the context of this project, and all related work, __[Personal Data]{#def--personal-data}__ is 
defined as the total amount of data that is part of either an individual's *Digital Identity* or her 
*[Digital Footprint](#terminologies--digital-footprint)*. On the one hand, this includes all 
intellectual property (e.g. posts, images, videos or comments) ever created, and all kinds of 
tracking data, interaction monitoring and metadata, that is used to manually or automatically enrich 
content (e.g.geo-location attached to a tweet as meta information). Moreover, it refers to data that 
is captured by someone or something from within the individual's private living space or property.
*Personal data* is basically understood as every data point reflecting the individual as such and 
her personality - partially or as a whole.

The european "Data Protection Regulations", on the other hand, defines 
*[Personal Data]{#def--personal-data-as-of-legis}* as follows:

>   ‘personal data’ means any information relating to an identified or identifiable natural person 
>   (‘data subject’); an identifiable natural person is one who can be identified, directly or 
>   indirectly, in particular by reference to an identifier such as a name, an identification 
>   number, location data, an online identifier or to one or more factors specific to the physical, 
>   physiological, genetic, mental, economic, cultural or social identity of that natural person;
>   [@regulation_2016_eu_general-data-protection-regulation_definition]
    
In contrast, the U.S.A. has little to no legislation defining *personal data* and thereby protecting
the individual's privacy. There is at least no explicit federal law addressing such areas 
[@web_2016_wikipedia_information-privacy-law_us]. Though, some of the existing sectoral laws 
contain partially applicable policies and guidelines [@web_2016_data-protection-laws-in-the-us]; 
most of them addressing only data related to specific topics (e.g. health insurance, financial 
record or lending).
In 2015 the White House has attempted to fill that gap with the "Consumer Privacy Bill of Rights 
Act", but to this date it has not left the draft state. According to the critics, the bill lacks 
concrete, enforceable rules which consumers can rely on
[@web_2015_white-house-releases-consumer-privacy-bill-draft]. The draft contains a general 
definition of *Personal Data*:

>   “Personal data” means any data that are under the control of a covered entity, not otherwise 
>   generally available to the public through lawful means, and are linked, or as a practical matter 
>   linkable by the covered entity, to a specific individual, or linked to a device that is 
>   associated with or routinely used by an individual, including but not limited to [...]
>   [@bill-draft_2015_us_consumer-privacy-bill-of-rights-act_definition]

At the end a list of concrete data points follows. Examples include email or postal address, name, 
social security number and so on.

Aside from government legislation, several third-party organisations in the U.S. are also allowed to 
define rules and policies that can overwrite existing laws, namely the 
*Federal Communications Commission (FCC)*, which recently released "Rules to Protect Broadband 
Consumer Privacy" for ISPs [^abbr_isp] including a list of categories of sensitive information
[@rules_2016_fcc_to-protect-broadband-consumer-privacy_sensitive-types-of-data]. Thereby the FCC
wants *Personally Identifiable Information* (alias *Personal Data*) to be understood as:
    
>   [...] any information that is linked or linkable to an individual. [...] information is 
>   “linked” or “linkable” to an individual if it can be used on its own, in context, or in 
>   combination to identify an individual or to logically associate with other information about a 
>   specific individual. 
>   [@rules_2016_fcc_to-protect-broadband-consumer-privacy_personally-identifiable-information]

Despite minor difference in details, the FCC has a serious idea of what is included in 
*personal data* and to whom they belong. Although the FCC's legal participation might be somewhat 
debatable regarding limitation to certain topics, the "Communications Act" as a U.S. federal law 
qualifies the FCC to regulate and legislate within its boundaries.

Having a common understanding on what data points belong to a person is the foundation of defining 
a set rules on how to handle *Personal Data* appropriately. Hence, every business operating within 
the EU is required [^eu-data-protection-regulation_informing-data-subject] to provide its users with 
a *Privacy Policy*, while in the U.S. for example, as mentioned above, only infrequently and 
depending on the class of data or context users, must inform its users about how their data get 
processed and what data points are involved [@web_2016_privacy-policies-are-mandatory-by-law].
A user typically agrees on a *Privacy Policy* by starting to interact with the author's business or
platform. Thus every *Privacy Policy* is required to be publicly accessible. For instance, not in a 
restricted area after logging in, but before creating an account. The following example is taken 
from facebook's current landing page.

>   By clicking Create an account, you agree to our [Terms](https://www.facebook.com/legal/terms) 
>   and that you have read our [Data Policy](https://www.facebook.com/about/privacy), including 
>   our [Cookie Use](https://www.facebook.com/policies/cookies/). 
>   [@web_2016_facebooks-landing-page_policy-acknowledgement]

It can be viewed more like an information notice, which translates and specifies the prevailing 
legal situation, rather then a contract, which the user would be forced to read and accept before 
revealing her data; otherwise known from procedures like software installations, where the user 
might have to accept terms of use or license agreements.
With a *Privacy Policy* at hand, it's up to each individual to decide if the benefits the service 
offers are worth sharing part(s) of her *personal data*, while at the same time reluctantly 
tolerating potential downsides concerning the privacy of that data.
When the vendor considers its policies accepted by a user, her personal data must be processed as 
stated in those policies but also according to the law. If the policies violate existing law or the 
vendor effectively goes against the law with its actual doings, penalties might follow. Depending on 
level and impact of the infringement in addition to what the law itself says, the vendor, while 
revisiting its wrong-doings in order to improve, might have to compensate affected individuals, pay 
a fine, or have its license revoked.

Not only privacy laws, but every legal jurisdiction has it's limitations - such as its territorial 
nature - which makes it an inappropriate tool for addressing existing issues and strengthening 
individuals' privacy and rights in a global context like the *world wide web*. 
Whereas the EU has approved extensive regulations, mentioned above, that are supposed to provide 
privacy protection and defines the handling of personal data, the U.S., on the other hand, has only 
subject-specific rules which merely apply to its own citizens.
Even though the definition of personal data included in the EU regulation is almost identical to the 
one introduced for the context of this work, it only applies to vendors and individuals who are part 
of the EU. Even privacy policies won't help if the vendor is registered in a different area of 
jurisdiction than the user's location. For those circumstances, international agreements might be 
established [@web_2016_international-privacy-standards], but this approach might still be useless if 
it either fails to provide proper tools for users to enforce their rights or it is simply ignored by 
contract partners with or without legal foundation [@web_2017_privacy-shield_faq] 
[@web_2017_privacy-shield_kritik].


While the legislation mentioned above is in place, *[Ownership]{#def--ownership}* of *Personal Data* 
has no legal basis whatsoever. The concepts of intellectual property protection and copyright might 
intuitively be applicable, because the data that is defined through the sole existence of the 
*data subject* (Digital Identity) and the data that is created by her seems to be her *intellectual 
property* as well. Such property implies that it is the result of a creative process, but 
unfortunately facts, which most *personal data* are, don't show a *threshold of originality* 
[@paper_2014_who-owns-yours-data]. Thus, the legal concept of *intellectual property* does not 
apply.
However, [Ownership]{#def--ownership} in the context of this work, is understood as a concept of 
having exclusive control over its personal data and how those data get processed at any given point 
in time. The exclusive control is emphasized as (A) the right to do what ever is desired with its 
property and (B) by which rules and mechanisms the ownership can be assigned to someone 
[@book_1987_private-ownership_definition]. This might result in a logistical challenge in which the 
data subject has to allow data access without losing the exclusive control over that data. In any 
case some effort might be required in order to preserve ownership as described, caused by the 
general characteristics that data has.

The european "Data Protection Regulations" mentioned before contain only one occurrence of the word 
*ownership*, and it's not even related to the context of *personal data* or the *data subject*. It 
merely states that *"Natural persons should have control of their own personal data"* 
[@regulation_2016_eu_general-data-protection-regulation_ownership]. 
Whereas Commissioner J. Rosenworcel of the FCC wants *"consumers [...] to [...] take some ownership 
of what is done with their personal information."* 
[@rules_2016_fcc_to-protect-broadband-consumer-privacy_ownership] Despite those two exceptions, 
elaborations on *data ownership* are almost non-existant in current legislation. Instead, the 
question is typically addressed in *Terms of Service (ToS)* provided by *data consumers*, which an 
individual might have to accept in order to establish a (legal) relationship with its author. The 
individual should keep in mind, that *Terms of Services* can change over time; not necessarily to 
the users advantage. The contents of a *ToS* must not violate any applicable or related law, 
otherwise the terms might not be legally recognized.
Taking for example the following excerpts from different *Terms of Services*:
 
>   You own all of the content and information you post on Facebook, and you can control how 
>   it is shared [...]. (under "2. Sharing Your Content and Information", by Facebook
>   [@web_2016_facebook_terms-of-service])

>   You retain your rights to any Content you submit, post or display on or through the Services. 
>   What’s yours is yours — you own your Content. (under "3. Content on the Services", by Twitter
>   [@web_2016_twitter_terms-of-service])

>   Some of our Services allow you to upload, submit, store, send or receive content. You retain 
>   ownership of any intellectual property rights that you hold in that content. In short, what 
>   belongs to you stays yours. (under "Your Content in our Services", by Google 
>   [@web_2016_google_terms-of-service])

>   Except for material we may license to you, Apple does not claim ownership of the materials 
>   and/or Content you submit or make available on the Service (under "H. Content Submitted 
>   or Made Available by You on the Service", by Apple [@web_2016_apple-icloud_terms-of-service])

All those statements are essentially superceded by a subsequent statement within each *ToS*, stating 
that the user grants the author a worldwide license to do almost any imaginable thing with her data. 
In case of Apple for example, if the user is *"submitting or posting [...] Content on areas of the 
Service that are accessible by the public or other users with whom [the user] consent to share [...] 
Content"* [@web_2016_apple-icloud_terms-of-service].
It is worth to be noted though, that every *ToS* only refers to the content created by the 
*data subject* instead of all her personal data. As mentioned above, personal information are not 
the subject of intellectual property, but still play an important role in data analytics. Which is 
why *privacy policies* are in place, to ensure at least some enlightenment on the whereabouts of the
user's personal data, even though it doesn't compensate the absence of control.
Additionally, neither the meaning of *ownership*, to which the quoted terms refer to, is 
sufficiently outlined, which results in ambiguity, and thus leaves room for interpretation, nor the
proposed definition of *ownership*, [as described earlier]{#def--ownership}, is applicable to these 
*Terms of services*, since the *data subject* loses all its control by design. Handing over data to 
a consumer effectively disables the exclusive control over the data and eliminates the ability to 
assign such control. Hence, the *ownership* to that data doesn't exist any further. That is, no 
(legislation based) way exists to establish a feasible concept of *ownership*, unless the data 
consumer has a motivation to promote the *data subject* to the sole owner of her data and to honour 
these privileges.

Leaving the legislation aside for a moment to move away from the top view; data consumers might 
argue that they have invested a lot in order to enable themselves to collect, process and store 
personal data, hence it belongs to them. Whereas from the data subject's point of view this might 
only be acceptable as long as she herself benefits from that arrangement somehow. Which would be the 
case if, for example, the data subject uses products, services or features offered by consumers
whose quality depends on personal data. If the data subject then chooses to move to a competitor, 
she would want to bring her personal data with her. Again, the former data consumer would object 
that competitors would then benefit from all the investment the consumer has already made, but 
without any effort. While not entirely wrong, two aspects need to be emphasized here. 
In order to get high quality analytics and therefore be able to make accurate decisions to gain 
overall improvement, it is (A) vital to put a huge amount of effort in developing the underlying 
technologies, rather than primarily collecting masses of personal data. But this effort is just the 
precondition and applies to all of its customers, which again weakens its argumentation.
It is followed by (B) an ongoing and recurring process of collecting, aggregating and analyzing 
actively and passively created data and metadata (e.g. food delivery history or platform 
interactions and tracking).
According to the definition of *[Personal Data](#def--personal-data-as-of-legis)* through 
legislation, it appears to be only a fraction of the data, namely *personal information*, that is 
involved in these kind of processes. The larger part, which is defined as the subject's 
*[digital footprint](#terminologies--digital-footprint)*, consists of highly valuable metadata 
[@web_2013_why-metadata-matters] [@web_2016_why-you-need-metadata-for-big-data-to-success], but is 
not covered by law. If the *data subject* ends the relationship with a collector, at the very least, 
the personal information should be erased and all remaining data sufficiently anonymized or even 
handed back. Which again can currently be enforced only by legislation because the *data subject* 
has no access to the collector's infrastructure where the data about her is stored. 

In summary, approaching the issues from a legislative angle has shown to be fraught with problems 
on a variety of levels. Not least because it can hardly be proven that vendors behave accordingly. 
Thus *data subjects* should not depend on the collector's willingness to respect *Ownership* of 
*Personal Data* as stated here. Instead a technical approach is proposed to embrace the 
*data subject* as the origin of her personal data and to proactively regain control.



[^eu-data-protection-regulation]: passed 2016, enforceable from May 2018 on in every member country 
    of the European Union, will supersede the "Data Protection Directive 95/46/EC" 
    
[^eu-data-protection-regulation_informing-data-subject]: according to article 12-14 of the "EU
    General Data Protection Regulation 2016/679"
    
[^abbr_isp]: Internet Service Provider

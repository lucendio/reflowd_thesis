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
    
+   machine learning/data mining --> computers trained to find coronations
    
+   since quite a few businesses (in terms of purpose or intention) are based around the concept 
    of customers, which are generally somewhat entities consisting of at least one human being,
    personal data takes a major part in what *Big Data* can be about. 
    In the context of this thesis, these entities are individuals with a unique identity. And to 
    understand the behaviour, decision making and needs of her customers a vendor, who owns the 
    business, needs to know as much as possible about them, when she wants to know what changes
    she needs to address in order to move towards the most lucrative business.
+   personal data and information are reflecting all this knowledge. It starts with profile (or sensitive) data, such
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

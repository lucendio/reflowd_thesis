Fundamentals
==========================================



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
    of customers, which are generally somewhat entities consisting of at least one human being. In 
    the context of this thesis, these entities are individuals with a unique identity. And to 
    understand the behaviour, decision making and needs of her customers a vendor, who owns the 
    business, needs to know as much as possible about them, when she wants to know what changes
    she needs to address in order to move towards the most lucrative business.
+   personal data and information are reflecting all this knowledge. It starts with profile data, such
    as gender, age, residency or income, goes on with time series events like geo-location changes, 
    or web search history and goes all the way up to health data and self-created content like 
    *Tweets* [^tweets] or videos.

+   all these classes of personal data hold a major share in the field of big data analysis (TODO: find statistics
    showing shares of data types/classes/categories, [@book-chapter_1999_Principles-of-knowledge-discovery-in-databases_introduction-to-data-mining])
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
    from all over the system on a large scale. 
    Logging events, caused by the user's interactions, on the client, which then get forwarded 
    to backend servers. Or keeping track of all kinds of transactions, which is done directly in the 
    backend. Before running together in a designated place, all these collected chucks of data are 
    getting enriched with meta information. Finally get stored and probably never removed again - 
    all for later analyses.

+   what is the (self-)understanding of such data form within the community

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
+   lets have a look into what the rule book says about that --> next topic



[^tweets]: public massages published by an account on [twitter.com](twitter.com), which will be 
           displayed in the timeline of all her subscribers and also might contain additional 
           types of content like images, links or video
           
[^because-of-the-cloud]: side note - one might come to the conclusion, that only the trend towards
                         the *cloud* made it actually possible to collect to such an extent we are 
                         all observing these days, because standalone software should not 
                         necessarily require internet connection and therefore the vendors had no
                         way to gather information whatsoever



## Personal Data as a Product

...to do what exactly? (NOTE: was previously in *Motivation*)
+   If one would ask 
    collectors for their motivation to do so, most likely the answer would be something along
    the lines of *"We want to have a better understanding of our customers"*. To do what exactly?

+   To predict what might be the next thing I am supposed to buy Or what things I probably would 
    like to consume but most certainly not yet know of?
+   Let's take a look at some examples. An advertising service uses tracking data for targeted advertising. The more 
    data they collect about an individual, the more accurate decisions they are able to make on 
    what ads they have to display are the ones the individual will click on and then will go 
    all the way down to disclose a successful purchase. This makes the placed advertisement 
    more valuable for google and therefore more expensive to the advertiser, 
    because of a high precision.
    Or a streaming provider content recommendation is also based on heavy user profiling 
    done by looking at her consumption history, tracked platform interactions and probably many 
    more vectors. 
    As always, it depends on the business model, but it seems to be consensual, that it 
    all comes down to improving and enhancing the collector's product (NOTE: needs at least
    some empirical evidence), in order to satisfy the customers - and that on the other hand
    depends on who is seen as customers.
+   Nevertheless if we change the perspective, a lot of great things can be achieved with the help 
    of myriad of personal data, such as:
    -   planing and managing human resources for situations, like e.g. big events where attendees 
        might need some help [@estimating-the-locations-of-emergency-events-from-twitter-streams_2014]
    -   predicting infrastructure workloads [http://ieeexplore.ieee.org/document/7336197/]
    -   making more accurate diagnostics to improve their therapy [@the-practice-of-predictive-analytics-in-healthcare_2013]
    -   finding patters in climate changes, which otherwise wont get revealed [@data-collection-for-climate-changes_2014].


+   individuals then get in role of selling/offering it's own data to those who were previously 
    collecting them


+   It is all about understanding the human being and why she behaves as she does. The 
    challenge is not only to computing certain motives but rather concluding to the right ones. 
    When analyzing computed results with the corresponding data models and trying to conclude, 
    it is important to keep in mind, that correlation is no proof of causation.
    


## Personal Data as of the Law

+   who is the owner in what situation or under what circumstance?
+   difference between "Personal Data" and the owner of that data?
+   what is *Personal Data* (law/rule or just policy/guideline)
+   EU and USA (since server might be located outside the state or effective range)
+   what about *terms and conditions* popular platforms?



## Digital Identity

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
    
+   what will happen with her data service after a person died?

+   __Digital Identity:__ all digital data about, related to and created by an individual, that would 
    also identifies this person as the rightful owner and physical counterpart. It can also be seen 
    as an avatar in the digital world or as the digital part of a human's identity. 
    [@whitepaper_2012_the-value-of-our-digital-identity_definition]



## Use Cases (NOTE: maybe move to 100_introduction)

+   package shipment after buying sth online 
+   social network accessing arbitrary profile data
+   making an online purchase
+   credibility (requesting credit permission) validation by a certain financial institution: 
    accessing arbitrary data
+   patient/health record
+   care (movement) data



## Related Work

+   much more research since the data mining, big data, deep learning 


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






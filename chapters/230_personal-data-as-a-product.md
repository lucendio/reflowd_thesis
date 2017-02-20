## Personal Data as a Product



The *Big Data* paradigm itself, as mentioned before, merely provides a structured and 
technically-based method to uncover non-obvious or non-visible information from self-made data silos 
in order to assist in making (correct) (business) decisions. Though, when asking data collectors 
about their actual motivation, most likely the answer would be something along the lines of typical 
PR-phrasing like *"we want to have a better understanding of our customers"*. In the long run, this 
means to increase revenue, but in the short term, to do what exactly? Maybe to predict what might be 
the next thing people are supposed to buy, or what things they would probably like to consume but do 
not yet know of?

In order to try comprehending such perspective, let's take a look at some examples.

(A) An advertising service utilizes tracking data for targeted advertising. The more information the 
service has on an individual, the more accurate decisions it is able to make about what ads are the 
ones that the individual most likely will click on and disclose with a successful purchase. As a 
result the placed advertisement becomes more valuable to the advertiser, because of its high 
precision. This again causes the service to increase the charges for serving and presenting the ad, 
because the overall quality of its service - the product - has improved.

(B) Content recommendation engines of large streaming providers, regardless of the content, serve as 
another example. This feature is also underpinned by extensive data aggregation of customer
information (user profiling), such as consumption histories (e.g. watch list), favoured content, 
friend's consumption, or any kind of trackable platform interaction. This means that the more 
information the service has on the user, the more precise are the assumptions about current mood, 
taste and interests, which leads to more suitable recommendations. At the end the user feels well 
taken care of and therefore values the service.

(C) Another example is *Google Traffic* [@web_2007_introducing-google-traffic] 
[@web_2016_wikipedia_google-traffic], a service that is integrated as a feature in *Google Maps*, 
a web-based mapping service from Google. *Google Traffic* visualises real-time traffic conditions, 
while using *Maps* as a navigation assistant in order to provide the user with a selection of 
possible paths. These paths are enriched with a duration that takes the traffic conditions into 
account. 
The data required to offer such information is supplied by mobile devices, constantly sending its 
current position including a timestamp to Google's infrastructure. This however, is only possible, 
because Google's services are widely used in addition to the significant market share of mobile 
devices [@graphic_2016_global-mobile-os-market-share] that are driven by Android - a mobile 
operating system developed by Google that deeply integrates with its services.
The same assumptions can be made as stated in the previous examples. The more geo-location data is 
obtained, the more precise the information about traffic conditions are. Since this scenario demands 
real-time information, it adds the *time* component as an additional level of complexity to the 
problem.

The impact on the society of the first group of examples might be questionable and it is doubtful if 
proper applications even exist.  However, an adjustment of perspective reveals additional categories 
of scenarios, for example:

(D) Planning and managing human resources for special occasions with big crowds, such as huge events 
or emergency situations where attendees might become endangered and require help 
[@estimating-the-locations-of-emergency-events-from-twitter-streams_2014]

(E) Predicting infrastructure workloads (e.g. power grid) 
[@paper_2015_improving-power-grid-monitoring-data-quality-an-efficient-machine-learning-framework-for-missing-data-prediction]

(F) Making more accurate diagnostics to improve a patient's therapy 
[@the-practice-of-predictive-analytics-in-healthcare_2013]
(
G) Finding patterns in climate changes, which would otherwise not have been detected 
[@data-collection-for-climate-changes_2014]

Even though the described examples require a large corpus of data and utilization of Knowledge 
Discovery, some of them might not necessarily depend on Personal Data. For other scenarios, Personal 
Data are indispensable, and still other scenarios only implicitly rely on data collected from 
individuals. As noted in the 
[previous section on Big Data](personal-data-in-the-context-of-the-big-data-movement), it depends on 
the purpose, which can be defined i.a. through a existing *business model*. But at least in those 
examples it seems to be common motivation to primarily improve and enhance the collector's product 
in order to satisfy its customers - yet again that depends on what is considered as product and who 
are the customers, generally indicated by the money flow.

Generalizing businesses based on its affiliation to an industry sector is hardly an argument for 
utilizing Personal Data, but empirically a rough attribution often suffices in order to get a 
picture of possible business models. With that said, the following observation can be made.
When putting a Top 10 List of industries utilizing *Big Data* 
[@graphic_2015_applications-of-big-data-in-10-industry-verticals] and a visualization showing 
categories of Personal Data targeted by data collectors [@graphic_2012_personal-data-ecosystem] 
side by side, it appears to be that at least seven [^industries-as-data-collectors] of these 
industries can be identified as data collectors, whereas less then a half 
[^industries-as-data-brokers] are participating in being a 
[Data Broker](#terminologies--data-broker), but almost all of them are suspected to target people's 
Personal Data, whether obtained by themselves or acquired from *Data Brokers* (for more examples, 
see [@video_2016_corporate-surveillance-digital-tracking-big-data-privacy]).
Therefore, it's safe to say that Personal Data is considered either as the direct product, 
especially from a Data Broker's point of view, or an indirect product due to its essential part in 
*Big Data* approaches. The former generates direct revenue by selling these data and the latter 
might affect a business in a positive matter.

To conclude, the possession of more and precise information on individuals leads to increased 
revenue for the possessor. However, using Personal Data to improve a product does not necessarily 
become an issue unless the data owner is not the customer. Taking a closer look at the business 
model often reveals the role of Personal Data. Thus Personal Data becomes the currency and its owner 
becomes the product, while the possessor becomes controller and profiteer. This rather unsatisfying 
situation is going to be addressed further on. For example, by shifting the individual's role to 
offering its own data to those who have previously collected and sold them.



[^industries-as-data-collectors]: Banking and Securities; Communication, Media & Entertainment; 
    Healthcare Providers; Government; Insurance; Retail & Wholesale Trade; Energy & Utilities

[^industries-as-data-brokers]: Banking and Securities; Communication, Media & Entertainment;
    Insurance; Energy & Utilities

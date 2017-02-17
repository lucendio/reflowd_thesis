## Personal Data in the context of the Big Data Movement



The term __[Big Data]{#def--big-data}__ initially has been referred to as a *huge amount of data*, 
containing more or less structured datasets [@web_2016_oxford_definition_big-data], whose size, over 
time, has started to limit its usability because it exceeded the capabilities of state-of-the-art 
standalone computer systems and storage-capacity. Instead of reducing the overall size, the issues 
are addressed by utilizing distributed storing and parallel computing. Aside from challenges in 
logistic and resource management when for example information retrieval needs to get automated on a 
large scale [@web_2016_wikipedia_definition_big-data], this strategy still doesn't answer the 
question of how to extract useful information from such deep "data lakes". What questions need to be 
asked to get answers whose usefulness has yet to be known of? To discover knowledge in order to back 
decision-making processes, technologies from the fields of *data mining*, *artificial intelligence* 
and *machine learning* (e.g. neural networks) have been adapted. Taken together, this is nowadays 
known as *Big Data (Analytics)*. Additionally it is a collective term for the practice or approach, 
described here, as well as the attitude of massively collecting data while tending to neglect 
people's privacy.
 
Big Data analytics serve the prior purpose of extracting useful information, whose results depend on 
the question initially being asked as well as what datasets the corpus contains. General steps 
involved in such a knowledge discovery process, can be outlined as follows 
[@chapter_2007_the-knowledge-discovery-process] 
[@paper_2009_a-data-mining-knowledge-discovery-process-model], 
1.  find and understand problems; formalize question(s) which the results have to answer
2.  design data models accordingly and test/correlate them against sample data 
3.  collect and prepare data
4.  process data (data mining)
5.  analyse and interpret results 
6.  use discovered knowledge (e.g. make appropriate business decisions) 

In general, the majority of businesses are required to have customer relationships. Such relations 
are based on the transfer of valued goods (e.g. services, products, etc.) in exchange for 
compensation (e.g. money). In order to process such a transfer, the vendor requires certain 
information about the involved customer. Since all entities related to this concept, including the 
customers, are considered to be human beings, such information most likely includes 
*[Personal Data](#digital-identity-personal-data-and-ownership)*.
A business normally is eager to grow and, if it has commercial interests as well, it aims for profit
maximization. So the business needs to improve and, therefore, it requires the knowledge of what and 
where its flaws are and how it can improve. To gain such knowledge, analytics based on Big Data 
approaches are part of various business strategies. But this also means that a lot of Personal Data 
get collected as part of those analytics, since that data is part of many business processes.

As a result of humans being primarily responsible for all money flow in this globalized environment, 
they also decide on the success of business. This basically means, every process analysis with an 
underlying commercial dependency somehow involves personal data
[@web_2016_facebook-utilizes-98-data-points] [@web_2016_big-data-types-of-data-used-in-analytics]
[@book-chapter_1999_Principles-of-knowledge-discovery-in-databases_introduction-to-data-mining]
[@web_2013_big-data-collection-collides-with-privacy-concerns], whether this data is mandatory in 
that process or additionally obtained to,for example, measure and analyze customer behaviour. 
Common data points involved in big data analytics start with gender, age, residency or income, goes 
on with time series events like changing current geo-location or web search history and continues 
all the way up to health data and self-created content like posts, images, or videos.
Depending on the data point though, those data might not be easy to collect. In general, most 
businesses obtain data from within their own platforms. Some data might even be in the customer's 
range of control (e.g. customer or profile data), but most of the data is created during direct 
(content creation, inputs) or indirect (transactions, meta information) interaction with the
business. The sensitivity level of involved personal data is determined by how big the benefit is
for the customer in comparison to what the vendor's demand is from the customer's commitment (e.g. 
required inputs, or usage requires access to location information).

From a technical perspective, collecting indirectly created data is as simple as integrating 
logging or debugging statements in the program logic. Since most vendors and organisations nowadays 
have a business that is partially happening through the internet or is even completely based on it, 
most scenarios of transactions utilize server-client architectures.
Furthermore, the *always-on* philosophy has evolved to an imperative and implicit state of devices. 
Standalone software, installed on a personal computer, calls the vendor's infrastructure that is 
located in the cloud on a regular basis, just to make sure that its user behaves properly while,
en passant, the vendor is provided with detailed user statistics. The web-browser already invokes a 
common narrative that requests happen here and there and are preventable. But when it comes to 
native mobile applications, it's almost impossible [@web_2016_answers-io] to notice such behaviour 
or even prevent them from exposing potentially sensitive information. Those developments in 
architecture design have enabled a system-wide collection of potentially useful information on a 
large scale [@web_2016_big-data-enthusiasts-should-not-ignore].
Logging transactions triggered by the user on the client and forwarding the resulting logs to the 
back end infrastructure, or keeping track of all sorts of transactions directly in the back end; all 
these collected chunks of data are then enriched with meta information before running together in a 
designated place where they are finally stored and probably never removed, waiting to be analyzed 
some day.

Within *Big Data Communities* sometimes the *big* is misinterpreted as, regardless of what the 
problem is that needs to be solved, speculatively gathering as many data points as possible with
the hope that, in the future, those data might become valuable. 
This mindset is reflected by the oft-cited concept of the three *Vs* (Volume, Velocity, Variety) 
[@report_2001_3d-data-management-controlling-data-volume-velocity-and-variety]. It is not entirely 
wrong though, because it's the nature of pattern and correlation discovery to provide increasing 
quality results [@paper_2015_big-data-for-development-a-review-of-promises-and-challenges:more-data], 
when the overall data corpus is enriched with larger and more precise datasets.
When new technologies emerge and are hyped, questioning their downsides and potential negative mid- 
or long-term impacts is typically not a high priority. The focus is instead to experiment and try to 
reach and perhaps breach boundaries while beginning to evolve. Non-technical aspects such as privacy 
and security awareness don't come in naturally, instead the adoption rate has to increase before 
more and diverse research occurs that might uncover such issues. Only then can they be addressed 
properly and on different levels - technical, political, and social. Hence, the *Big Data Community* 
itself is able to evolve, too.

Big Data and Knowledge Discovery is a balancing act between respecting the user's privacy and having 
enough data at hand so that initial questioning can be satisfied by the computed results. 
Aside from having specific domain knowledge of the used technologies, people working in these fields 
need to be aware of downsides or pitfalls and also have to be sensible about the ramifications of 
their approaches and doings.
Such improvements are already happening, not only originating from the community's forward thinkers
[@web_2016_the-state-of-big-data], but also advocated by governments and consumer rights 
organisations, as stated in the previous section (see 
*[legislation](#digital-identity-personal-data-and-ownership)*. Even leading Tech-Companies have 
begun trying to do better [@web_2016_apple_customer-letter] [@web_2016_what-is-differential-privacy] 
[@web_2016_eff_whatsapp-rolls-out-emd-to-end-encryption]. 

In various science and research areas it's also very common to gather and store enormous amounts of 
data. In these contexts the data and its analytical results are used to, for example, run complex 
simulations (e.g. weather, population, diseases, hardware, physics), monitor and analyse complex 
proceedings (e.g. nature, infrastructure, behaviour), explore the unknown (e.g. universe), or even 
to imitate a famous painter [@web_2016_research-experiment_ai-rembrandt]. But unlike in the academic 
sector, the commercial interest within the private sector is much larger, therefore Personal Data 
are in great demand, because forecasting customer behaviour rather than global warming is much more 
valuable in that context.

It is the logical conclusion to distribute and scale horizontal when the data demand exceeds latest 
hardware capacity and capability, but it's no justification for thoughtless data collecting.
Ultimately, it's not the amount of data that counts, but how it is handled (to not loose its 
usefulness); what data flows into those data lakes is up to the questioner, which might not act in 
the interest of everyone. Therefore *data subjects* need to regain control and actively participate 
in formulating these questions. 

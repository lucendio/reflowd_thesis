Introduction
==========================================



## Motivation

Nowadays it is rare to find someone that does not collect data about some kind of thing; 
particularly humans are the targets of choice for the *Big Data Movement* 
[@web_2016_privacy-international-about-big-data]. Since humans are all individuals, they 
are - more or less - distinct from each other. However, subsets of individuals might share a 
minor set of attributes, but the bulk is still very unique to an individual, given that
the overall variety of attributes is fairly complex. That small amount of shared attributes 
might seem to be less important, due to the nature of inflationary occurrence, but the opposite 
turns out to be true. These similarities allow to determine the individuals who are part of a 
subset and the ones who arn't. Stereotypical patterns are applied to these subsets and thus to
all relating individuals. Thus enriched information are then used to help predicting outcomes 
of problems or questions regarding these individuals. In other words, searching for causation 
where in best the case one might find correlations - or so called *discrimination*, which

>   [...] refers to unfair or unequal treatment of people based on membership to a category or a
>   minority, without regard to individual merit. *[@paper_2008_discrimination-aware-data-mining]*

When interacting directly with each other, discrimination of human beings is still a serious issue 
in our society, but also when humans leverage computers and algorithms to uncover formerly 
unnoticed information in order to include them in their decision making. For example when 
qualifying for a loan, hiring employees, investigating crimes or renting flats. Approval or denial, 
the decision is based on computed data about the individuals in question
[@book_2015_ethical-it-innovation_ethical-uses-of-information-and-knowledge], which is simply
discrimination on a much larger scale and with less effort - almost parenthetically. 
The described phenomenon is originally referred to as *Bias in computer systems*
[@paper_1996_bias-in-computer-systems]. What at first seems like machines going rouge on 
humans, is, in fact, the *cognitive bias* [@wikipedia_2016_cognitive-bias] of human nature, 
modeled in machine executable language and made to reveal the patterns their creators were looking 
for - the *"Inheritance of humanness"* [@web_2016_big-data-is-people] so to say.

In addition to the identity-defining data mentioned above, humans have the habit to create more and 
more data on a daily basis - pro-actively (e.g by writing a tweet) and passively (e.g by allowing 
the twitter app accessing their current location while submitting the tweet). 
As a result, already tremendous amounts of data keep growing bigger and bigger, waiting to
be harvested, collected, aggregated, analyzed and finally interpreted. The crux here is, the 
more data being made available [@video_2015_big-data-and-deep-learning_discrimination] to *mine*, 
the higher the chances to isolate data sets, that differ from each other but are 
coherent in themselves. Then it is just a matter of how to distinguish the data set and thereby 
the related individuals from each other.

In order to lower potential discrimination we either need to erase responsible parts from the 
machines, thereby it's crucial raising awareness and teaching people about the issue of 
discrimination, or we try to prevent our data from falling into these data silos. The latter 
will be addressed in this work.



## Purpose & Outcome

From an individual's perspective providing data to third parties might not seem harmful at all.
Instead eventually one get improved services in return, e.g. more adequate recommendations and 
fitting advertisement, or more helpful therapies and more secure environments. That said, though
it is a matter of perception what's good and bad, what's harmful and what's an advantage.
Computing data to leverage decision making is essentially just science and technology and it's up 
to the humans how such tools are getting utilized and what purposes they are serving. Hence it 
should be decided by the data creators, how their data get processed and what parts of them 
are used.

To tackle the described issue the initial idea here is (1) to equip individuals with the ability 
to control and maintain their entire data distribution and (2) thus reducing the amount of 
*potentially discriminatory* [@paper_2008_discrimination-aware-data-mining] attributes leaking 
into arbitrary calculations. To do so people need a reliable and trustworthy tool, which assists 
them in managing all their *personal data* and making them accessible for 3rd parties but under 
their own conditions. After getting permission granted these data consumers might have the most 
accurate and reliable one-stop resource to an individuals's data at hand, while urged to respect 
their privacy at the same time. However this also comes with downsides in terms of security and 
potential data loss. Elaborating on that and discussing different solutions will be part of the 
[design process][Design].

The way how to solve the described dilemma is not new. Early days of work done in this field can be 
dated back to the Mid-2000s where studies were made e.g. about recent developments in the 
industry or user's concerning about privacy, and the term *Vendor Relationship Management
(VRM)* were used initially within the context of user-centric personal data management, which 
also led into the *ProjectVRM* [@web_2010_projectvrm_about] started by the *Berkman Klein Center 
for Internet & Society at Hardvard University*. Since then a great amount of effort went into
this research area until today, while also commercial products and business models trying to 
solve certain problems. For instance concepts such as the *Personal Data Store (PDS)* 
[@paper_2013_the-personal-data-store-approach-to-personal-data-security_2013] or a *MyData* 
[@whitepaper_2014_mydata-a-nordic-model-for-human-centered-personal-data-management-and-processing] 
implementation called *Meeco* [@web_2016_meeco-how-it-works], which will all be covered in 
a more detailed way within the following chapter.

The work and research done for this thesis will be the foundation for an *Open Specification*, 
which by itself is a manual to implement a concept called *Personal Data as a Service*. Important 
topics like how the architecture will look like, where the actual data can be stored, how to 
obtain data from the external API or what requirements a user interface for data management 
need to satisfy, will be examined. After the thesis will be finished, the majority of core issues 
should already be addressed and can then get outlined in the specification document. 
Only then the task to actual implement certain components can begin. The reason for that is, 
when sensitive subjects especially like people's privacy is at risk, all aspects in question 
deserve a careful considerations and then get addressed properly. Thus it is indispensable to 
put adequate effort primarily into the theoretical work. To be clear though, that doesn't mean 
writing code to test out theories and ideas can't be done during research and specification 
development. It might even help to spot some flaws and eventually trigger evolvement.

To ensure a great level of trust to this project and the resulting software, it is vital to make 
the development process fully transparent and encourage people to get involved.
Therefore it is required to open source all related software and documents [@repo_2016_pdaas-spec] 
from day one on.

In summary, this document is meant to be the initial step in a development process fabricating 
a tool to manage all data defining a data subject's identity, that is controlled and administrated 
by that individual, so that maybe she is giving a more precise understanding about where her 
personal information flows and how this might effect her privacy.



## Scenarios

The following use cases shall depict different situations and possible ways such emerging software
might be applicable or useful, while providing it's user with more control over her personal data.
Some of them are more practical and realistic, like ordering and purchasing online a product,
others might have no current usage, but showing a certain potential to become more relevant when 
new technologies and business models emerge, followed by new demands of data.


####################################################################################################

+   order sth online, purchase, and package shipment 
+   social network accessing arbitrary profile data
+   credibility (applying for a loan) validation by a certain financial institution: 
    accessing arbitrary data
+   patient/health record
+   care (movement) data

####################################################################################################


#### Ordering a product online
 
The data subject searches through the web to find a new toaster, since her old one recently broke.
After some clicks and reviews, she found her soon-to-become latest member of the household's 
kitchenware. After putting the model name in a price search engine, hoping to save some money, the
first entry, offering a 23% discount, caught her attention. She decides to have a deeper look 
into the toasters and thus has heading towards the original web shop entry. Finally she came around 
and put the item onto her card, despite tha fact, that she has never bought something from that 
online shop before. Then she proceeded to checkout to place her order.
The shop-interface is asking her to either insert her credentials, proceed without registration or 
sign-in, or insert s URI to an endpoint of her *Personal Data as a Service*.
TODO: the following description might need some adjustments according data flow / process description
She opens up the management panel of her *PDaaS* and creates a new entry in a list of data consumers,
that already have access to characteristics of her personal data. As a result, she receives
a URI, which she inserts according, as mentioned before; after she assures herself that the data 
exchange with the shop through the browser is based on a secure connection (HTTPS). Under this URI, 
the shop-system can then request data, that is required for a successful transaction. Moving on to
the next step after submitting the URI, the data subject is ask to decide how she would like to pay.
The choices are: credit card, invoice, online payment provider of choice or bank transfer. She 
chooses the last one, submits her selection and thereby completes her order.
After a moment, a push notification pops up on her mobile device, which is a permission request 
from her *PDaaS*, asking for granting the shop-system, she just places the order, access to her 
full name, address and email. Additionally she can decide between three states of how log the 
permission wil be valid: *one-time-only*, *expires-on-date* and *until-further-notice*. Since
she never ordered at this shop before and might never again, she decided to grant access only
for this specific occasion.
After the shop-system receives the data, it sends an email to the data subject, containing some 
information about her order, including the shop's bank details. which then enables her to
actually pay the amount due. After the system recognizes the payment has coming in, it triggers
the shipment of the toaster.
In order to get a full impression of how the whole process might have look like when the data subject
had chosen one of the other payment methods, the differences will be describes in the following.
If the data subject would have wanted to pay with her credit card, the only difference would have 
been, that the shop-system had requested also to access the credit card number and it's belonging 
secret, and when sending the email the system would have omitted the information about the shop's 
bank details.
Being able to choose paying with invoice where possible only because the *PDaaS* response has 
indicated, that it's containing *profile data* is certified and therefore trustworthy. Which
reduces the shop owner's risk and would have enabled him in case of fraud or misuse to take action.
Choosing to involve paypal as a *middleman* to process the payment, requires the data subject to 
had already granted paypal certain access to her *PDaaS*. If that's the case, then the shop-system
would have ask also for her paypal-ID, which then the system will use to request the payment
directly from paypal. This on the other side will cause paypal to consult the *PDaaS*, which 
results in a second notification, asking the data subject for permission to proceed. After the
payment transfer was successful, the shipment will gets initiated. And with the package arriving at 
the data subject's doorstep the whole transaction has finished.


#### Interacting with a social network

Entering a social network for the first time, only take the URI to the data subject's *PDaaS* and
a password. The data subject receives a notification on her mobile device asking for permission to
access certain data about her. If her mobile device is currently not at hand, she can also use 
the administration panel provided by her *PDaaS* and reachable with a web browser on every 
internet-enabled device. Within that panel pending permission reviews will be indicated.
Whether the data subject has already reviewed the request or not, she should be able to login to
the social network. After doing so, she should not be able to see any of her information. After 
granting permissions to the social network to accessing certain data *until-further-notice* and 
reloading the session, she then should see all her 
So every time, someone on that network tries to access her information, whom she has allowed to 
see that information (which is managed by the user only from within the network), the network 
pulls the data from the data subjects's *PDaaS*, if it's still permitted to do so.
It's also imaginable, that the social network and a *PDaaS* are establishing a backward channel.
This channel could be used to send all the content she would create over time while interacting
with the social network and it's participants back to her *PDaaS*. The network itself only stores
a reference to all content object, whether it's for example an image, a post or comment on somebody 
else's post and if it's needed the actual content will be fetched from the data subject's *PDaaS*. 


#### Applying for a loan and checking creditworthiness

The data subject would like to buy an apartment. In order to finance such a acquisition, she needs a 
funding, which in her case, will be based on a loan. During a conversation in a credit institute 
of her choice, an account consultant describes to her what data will be required in order to 
decide about her creditworthiness. 
While giving a consensual nod, she takes out her smartphone and brings up the management panel of 
her *PDaaS*. With a few taps she has just created a new *data consumer*. The panel then shows
a QR-Code, that holds a URI to a dedicated endpoint of the data subject's *PDaaS*. She shows that code
to her consultant, who then scans it. While handling some more formalities and talking about 
several issues and possible products she might be interested it, she gets a notification on her 
phone, informing her about a permission request the institute just made. It lists all the different 
data points the institute would like to access in order to calculate her scoring, such as address,
monthly income, relationship status and family, history of banking or other current loans. After 
some back and forth and solving some misunderstandings with the help of her consultant, she decided 
to just partially allow access to the requested data and just for this time and purpose. The 
consultant kindly pointed out, that these decisions might have an impact on the scoring and thereby 
on the lending and it's terms. After the consultant got a signal from the computer system, the two 
then finishing up their meeting and the consultants informed the data data subject about the next 
steps, which includes a note, that the institute will contact her within the next few days, when 
they have come to a conclusion. In case of a positive outcome a new appointment need to be made, 
for doing all the paperwork and signing the contract.
From a technical point of view, two different ways of computing the score are imaginable. The first
one would be, transferring only the plain data - request, containing the query and response 
containing the data - including the expire date and information regarding the signature state. But 
the actual computations and analytics to obtain the score, will happen within the infrastructure 
of the credit institute. When this process is over, all transferred personal data has to be 
deleted. An alternative could prevent the data from leaving the *PDaaS*, in which the institute's
request won't consists of a data query. Instead it would came along with an chunk of software and 
some information on how to run it. The *PDaaS* server will provide an isolated runtime in which 
the software then gets executed. After the process has finished, the result will be send back to 
the credit institute's infrastructure.


#### Maintain and provide it's own health/patient record

Some time ago on a hiking trip in a moment of carelessness the data subject has accidently broke 
her leg. She came into a hospital and went straight into surgery, where the physicians could fix 
the injury. Time went by and the leg has healed completely. After she woke up today she felt
some pain coming from that area where her leg was broken. She decided to call in sick and went 
straight to a doctor nearby. During her recovery she visited that doctor regularly.
At the reception desk, she opens up the *PDaaS*'s management panel on her smartphone and searched
through the list of data consumers. After she found the entry for this clinic, she flipped her 
phone to show the receptionist the corresponding QR-Code, which she started to scans immediately.
However the receptionist couldn'd see any data on the screen, because the access has already 
expired. The data subject only had permitted access for the estimated time of recovery, which was 
over some time ago. That's why she got a notification, to re-grant some access. Going through 
the data points the clinic-system has requested, she noticed that her address is incorrect. 
Last month she moved out and into a bigger apartment just down the street. She must 
have forgot to change that data, which she corrects immediately right before submitting the 
access configurations for the clinic-system. She also included the access to all the data 
originated from that time after her accident. A moment later the receptionist confirms to now
being able to see all necessary data. 
The data subject takes a seat in the waiting room. While passing some time, she had a deeper look 
into her list of data consumers; some of them she couldn't even remember and for others she was 
surprised to what data she has granted access to and started to reduce certain permissions, 
if it was appropriate in her eyes. She even removed some of the entries.
The appointment with her doctor went great. He even had to review the x-ray images in order to 
make a adequate differential diagnosis. 
After the visit, she had to make a quick stop at a pharmacy along the way to pickup the drugs 
her doctor had prescribed for her to reduce the pain. She had to wait in the queue with two other 
customers being in front of her. She realized, that it's the first time she has been here. So she 
prepared a new entry in her data consumer list, including all information about her prescriptions. 
So by the time she get served, she just let the person behind the register scan her code. In the 
next seconds the data subject gets a quick confirmation notification about the request that just 
happened. A moment later the pharmacist come back with her drugs, which she then pays in cash 
and the transaction is done.


#### Vehicle data and mobility

Assuming a car itself has no hardware on board in order to establish a wireless wide area 
connection to an outside access node. Only from the inside one can connect to the car (wired or 
wireless).
After entering a car, on the data subject's mobile device pops up a notification asking for 
permission to connect to that device. In addition to the expiration date, the data subject can
choose to en- or disable two more options. First, a wifi network with an uplink to the internet 
can be provided to everyone inside the car. Secondly, connections, the car might want to establish, 
in order to emit data via internet - which, regardless, have to go through the currently linked 
mobile device. Thus the device owner gains full control over any external data transfer that might 
happen. This again would allow two things: (A) permission management for all outgoing data and (B) 
funnel all data generated and provided by the car into the *PDaaS* associated with that linked 
device. It might also be feasible to deny any connection the car is trying to make. Thus the data
will only be stored in the *PDaaS*. If somebody is interested in such then have to ask for 
access permission.
That same concept about movement tracking and vehicle data could also be applied to driving (motor) 
bicycle.

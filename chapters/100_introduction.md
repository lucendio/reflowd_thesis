Introduction
==========================================



## Motivation

Nowadays it is rare to find someone who doesn't collect data about some kind of things, 
particularly humans are the targets of choice for the *Big Data Movement* 
[@web_2016_privacy-international-about-big-data]. But since humans are all individuals, which 
means we are all distinct from each other - more or less.
Some of us are sharing a bit more similarities, but most are much less similar to each other.
Since these few similarities are widely shared, they should be less important, because it seems 
to be intuitively the nature of inflationary occurrence, but instead the opposite happens to be 
the case. It allows to determine who is part of a subset with a specific, and therefore shared, 
attribute and who isn't, in order to relate apparently common known stereo typical patters onto 
the individuals in that subset just to predict outcomes of the corresponding problem or question. 
In other words, searching for causation where in best case one might find correlations - or so 
called *discrimination*, which

>   [...] refers to unfair or unequal treatment of people based on membership to a category or a
>   minority, without regard to individual merit. *[@paper_2008_discrimination-aware-data-mining]*

When interacting directly with each other, discrimination of human beings is still a serious issue 
in our society, but also when humans leveraging computers and algorithms to uncover former 
unnoticed information in order to include them in their decision making. For example when 
qualifying for a loan, hiring employees, investigating crimes or renting flats. Approving or denying 
is all happening based on data about the affected individuals
[@book_2015_ethical-it-innovation_ethical-uses-of-information-and-knowledge], which is nothing
but discrimination, just on a much larger scale and with less effort - almost parenthetically. 
The described phenomenon is originally referred as *Bias in computer systems*
[@paper_1996_bias-in-computer-systems]. What at first seems to look like machines going rouge on 
humans, is in fact the *cognitive bias* [@wikipedia_2016_cognitive-bias] of the human nature, 
modeled in machine executable language and made to reveal the patterns their creators were looking 
for - the *"Inheritance of humanness"* [@web_2016_big-data-is-people] so to say.

In addition to the identity-defining data mentioned above humans have the habit to create more and 
more data on a daily basis - pro-actively e.g by writing a tweet and passively e.g by allowing 
the twitter app accessing their current location while submitting the tweet. 
As a result already tremendous amounts of data keeps growing bigger and bigger waiting to
get harvested, collected, aggregated, analyzed and finally interpreted. The crux here is, the 
more data being made available [@video_2015_big-data-and-deep-learning_discrimination] to *mine* 
on, the chances are much higher to isolate data sets, that differ from each other but are 
coherent in theirselves. Then it is just a matter of the preceded questioning how to distinguish 
the data set and thereby the related individuals from each other.

So to lower potential discrimination we either need to erase responsible parts from the machines, 
therefore raising awareness and teaching people about the issue of discrimination are crucial, 
or we're trying to prevent our data from falling into these data silos. The later will be 
addressed in this work.



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
a tool to manage all data that defines her identity controlled and administrated by it's owner, 
and maybe give her a more precise understanding about where her personal information flow and 
how this might effect her privacy.



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
 
The data owner searches through the web to find a new toaster, since her old one recently broke.
After some clicks and reviews, she found her soon-to-become latest member of the household's 
kitchenware. After putting the model name in a price search engine, hoping to save some money, the
first entry, offering a 23% discount, caught her attention. She decides to have a deeper look 
into the toasters and thus has heading towards the original web shop entry. Finally she came around 
and put the item onto her card, despite tha fact, that she has never bought something from that 
online shop before. Then she proceeded to checkout to place her order.
The UI is asking her to either insert her credentials, proceed without registration or sign-in, or
insert s URI to an endpoint of her *Personal Data as a Service*.
TODO: the following description might need some adjustments according data flow / process description
She opens up the management panel of her *PDaaS* and creates a new entry in a list of data consumers,
that already have access to characteristics of her personal data. As a result, she receives
a URI, which she inserts according, as mentioned before; after she assures herself that the data 
exchange with the shop through the browser is based on a secure connection (HTTPS). Under this URI, 
the shop-system can then request data, that is required for a successful transaction. Moving on to
the next step after submitting the URI, the data owner is ask to decide how she would like to pay.
The choices are: credit card, invoice, paypal or bank transfer. She chooses the last one, submits
her selection and thereby completes her order.
After a moment, a push notification pops up on her mobile device, which is a permission request 
from her *PDaaS*, asking for granting the shop-system, she just places the order, access to her 
full name, address and email. Additionally she can decide between three states of how log the 
permission wil be valid: *one-time-only*, *expires-on-date* and *until-further-notice*. Since
she never ordered at this shop before and might never again, she decided to grant access only
for this specific occasion.
After the shop-system receives the data, it sends an email to the data owner, containing some 
information about her order, including the shop's bank details. which then enables her to
actually pay the amount due. After the system recognizes the payment has coming in, it triggers
the shipment of the toaster.
In order to get a full impression of how the whole process might have look like when the data owner
had chosen one of the other payment methods, the differences will be describes in the following.
If the data owner would have wanted to pay with her credit card, the only difference would have 
been, that the shop-system had requested also to access the credit card number and it's belonging 
secret, and when sending the email the system would have omitted the information about the shop's 
bank details.
Being able to choose paying with invoice where possible only because the *PDaaS* response has 
indicated, that it's containing *profile data* is certified and therefore trustworthy. Which
reduces the shop owner's risk and would have enabled him in case of fraud or misuse to take action.
Choosing to involve paypal as a *middleman* to process the payment, requires the data owner to 
had already granted paypal certain access to her *PDaaS*. If that's the case, then the shop-system
would have ask also for her paypal-ID, which then the system will use to request the payment
directly from paypal. This on the other side will cause paypal to consult the *PDaaS*, which 
results in a second notification, asking the data owner for permission to proceed. After the
payment transfer was successful, the shipment will gets initiated. And with the package arriving at 
the data owner's doorstep the whole transaction has finished.


#### Interacting with a social network

Entering a social network for the first time, only take the URI to the data owner's *PDaaS* and
a password. The data owner receives a notification on her mobile device asking for permission to
access certain data about her. If her mobile device is currently not at hand, she can also use 
the administration panel provided by her *PDaaS* and reachable with a web browser on every 
internet-enabled device. Within that panel pending permission reviews will be indicated.
Whether the data owner has already reviews the request or not, she should be able to login to
the social network. After doing so, she should not be able to see any of her information. After 
granting permissions to the social network to accessing certain data *until-further-notice* and 
reloading the session, she then should see all her 
So every time, someone on that network tries to access her information, whom she has allowed to 
see that information (which is managed by the user only from within the network), the network 
pulls the data from the owner's *PDaaS*, if it's still permitted to do so.
It's also imaginable, that the social network and a *PDaaS* are establishing a backward channel.
This channel could be used to send all the content she would create over time while interacting
with the social network and it's participants back to her *PDaaS*. The network itself only stores
a reference to all content object, whether it's for example an image, a post or comment on somebody 
else's post and if it's needed the actual content will be fetched from the owner's *PDaaS*. 


#### Car data

The car itself has no on-board hardware to establish a wide range wireless connection to the 
outside. Only from inside the car one can connect to it (wired or wireless). If a passenger
connects her device to the automobile, two things are then happening. First, a wifi network
is with a connection to the internet is provided to everyone inside, and second, all connections, 
the car might want to establish, need to go through that device. This give the device owner full
control over any data exchange that might happen. This again makes two this possible: 
(A) permission management over data the car is trying to send and (B) tapping into the data stream
and collect them in *PDaaS* associated with the mobile device.
It would also be conceivable to deny any connection the car would like make and thus ensure that 
all data the car is generating and providing will go into the *PDaaS* and . It then somebody is 
interested in such data, they have to ask for permission.
 

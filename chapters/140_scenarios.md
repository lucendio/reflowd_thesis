## Scenarios



The following use cases portray different situations and possible ways in which the tool in question 
might be applicable, and shows in several ways that it can be helpful to be in charge of its own 
personal data. Some are more practical and realistic, like ordering and purchasing a product on the 
internet, while others might at the moment not seem to be very useful, but show a certain potential 
to become more relevant when new technologies and business models will occur, that are followed by 
new desires for data.

*NOTICE: The subsequent phrasing is intentionally written in colloquial language in order to 
facilitate comprehensibility and to convey a visualizable idea of what it would look like to use 
such technology in everyday situations.*



#### Ordering a product on the internet {-}
 
The data subject searches through the web to find a new toaster because her old one recently broke.
After some clicks and reviews, she finds her soon-to-become latest member of the household's 
kitchenware. After putting the model name in a price search engine, hoping to save some money, the
first entry, offering a 23% discount, catches her attention. She decides to have a deeper look into 
the toasters, so she heads towards the original web shop entry. Finally she puts the item into her 
shopping cart, despite the fact that she never bought something from that online shop before. Then 
she proceeds to checkout so that she can place her order. The shop-interface asks her to either 
insert her credentials, proceed without registration or sign-in, or allow the shop to obtain all 
required data on its own by either scanning a QR-Code displayed below or insert a URL to her 
*Personal Data as a Service*. She opens up the management panel of her *PDaaS* in a new browser 
window and authenticates herself to the system. Afterwards she creates a new entry in a list of 
*data consumers* who already get permitted to access certain characteristics of her personal data. 
As a result, she gets prompted with a URL, which she inserts as the shop interface requests her to 
do, only after she has convinced herself that the data exchange with the shop is based on a secure 
connection (HTTPS). Moving on to the next step after submitting the URL, the data subject is asked 
to decide how she would like to pay. The choices are: credit card, invoice, online payment or bank 
transfer. She chooses the last one, submits her selection and thereby completes the order process.
She goes back to the kitchen. After some time, a push notification appears on her mobile device. 
The notification is about a *permission request* which has just arrived at her *PDaaS*, asking her 
to grant permissions to the shop-system, where she earlier placed the order. The shop wants to 
access her full name, address and email, which are required to proceed with the order. Based on the 
information given in the request, she creates a new *permission profile* for the shop. Additionally, 
for the profile she can decide between three states of how long the permission is going to last: 
*one time only*, *expires on date* and *granted, until further notice*. Since she has never ordered 
at this shop before and probably won't do it again, she decides to grant access only for this 
specific occasion. The shop-system is then notified of the decision result. If the result is 
positive - which is the case here - the data can be obtained and the order can be further processed. 
As a result, the data subject receives an email, containing information regarding her order, 
including the shop owner's bank details, which enables her to pay the due amount. 
After the shop-system receives the payment, the toaster is shipped.

In order to get a full impression of how the whole process would look like if the data subject
would have chosen another payment method, the differences are described below.
If the data subject had wanted to pay with her credit card, the shop-system would have asked to also 
access her credit card as well as its associated secret. When sending the email, the system would 
have omitted the information about the shop's bank details.
Paying with invoice, would have been possible only if the *PDaaS* initially had been able to provide 
certified profile data, which necessarily would have been rated trustworthy. That again would have 
reduced the risk taken by shop owner and would have enabled her to take action in cases of fraud or 
misuse.
Choosing to involve an online payment service provider as a *middleman* for processing the payment
would have required the data subject to have granted the provider access to her *PDaaS* upfront. In 
that case, the shop-system would have asked for her payment provider account identifier, so that the 
system could have requested the payment directly from that payment service provider. This would have 
caused the service provider to consult the *PDaaS*, which would have resulted in a second 
notification asking the data subject for permission to proceed. After a successful payment transfer, 
the shipment would have been initiated.


#### Interacting with a social network {-}

The first entry to a social network requires either a URL to the data subject's *PDaaS*, which has 
uniquely been generated for that purpose, or a QR-Code provided by the social network. The data 
subject receives a notification on her mobile device send from her *PDaaS*, revealing what data that 
network wants to access and maybe even why. If her mobile device is currently not at hand, she can 
also use the management panel provided by her *PDaaS*, which is accessible with a web browser on 
every internet-enabled device. Within that panel pending permission reviews are indicated.
Regardless of whether the data subject has already reviewed the request, she should still be able to 
login. After doing so, she would see all her information, unless she has not yet granted permissions 
to the social network to access her data *until-further-notice*. If this is done, after waiting a 
moment and then reloading the browser session, all her data should then show up. So every time 
someone on that network tries to access her information, with whom she has allowed to see that 
information, managed by each user within the network, the network pulls the required data from her 
*PDaaS* as long as it is permitted to do so. It is also conceivable that the social network does 
provide a back-channel to the *PDaaS*, so that all content she creates within that network, 
including all interactions with other users, can be stored in her *PDaaS*, allowing it to be 
provided to other *data consumers*. The network itself only stores references to all these content 
objects. Whether it is an image, a post, or comment on somebody else's post, the actual content to 
be displayed is fetched from the corresponding *PDaaS*. 


#### Applying for a loan and checking creditworthiness {-}

The data subject would like to buy an apartment. In order to finance the acquisition, she needs
funding which, in her case, is based on a loan. During a conversation in a credit institute of her 
choice, an account consultant describes to her what data is required in order to decide her 
creditworthiness. While nodding consensually, she takes out her smartphone and brings up the 
management panel of her *PDaaS*. 
The consultant flips his screen showing a QR-Code and the *data subject* scans it. The tool displays 
some information about the institute including a reference to this assignment and a list of all data 
points the institute would like to access in order to calculate her score, such as address, monthly 
income, relationship status and family, history of banking or other current loans. After some back 
and forth and solving some misunderstandings with the help of her consultant, she decides to allow 
only partial access to the requested data, and only for this time and purpose. The consultant kindly 
points out, that these decisions might impact her score and thus on the loan and its terms. 
While handling some more formalities and talking about other possible products she might be 
interested in, the consultant gets notified by his computer, confirming the access permission. 
Thereupon the two finish their meeting and the consultant informs the data subject of the next 
steps, which include a note about contacting her within the next few days, when the institute has 
come to a conclusion. In the case of a positive outcome, a new appointment for handling all the 
paperwork and signing the contract needs to be made.
From a technical point of view, two different ways of computing the score are imaginable. The first 
would be to just transfer the plain data including expiry date and information about how reliable 
the data is. However, the actual computations and analytics to obtain the score happen within the 
infrastructure of the credit institute. When this process has finished, all the personal data that 
have been transferred must be erased. An alternative, though, that would prevent the data from 
leaving the *PDaaS*, could be if the institute's request won't contain a data query, but instead coming along 
with some software and information on how to run it. The *PDaaS* server will provide an isolated 
runtime in which the software can be executed. After that process is finished, the result is sent 
back to the credit institute's infrastructure.


#### Maintain and provide its own medical record {-}

Some time ago on a hiking trip, in a moment of carelessness the data subject accidently broke her 
leg. She went to a hospital and straight into surgery, where the surgeon where able to fix the 
injury. Time went by and the leg healed completely. When she woke up today, she felt pain coming 
from the area where her leg was broken. She decided to call in sick and went straight to a doctor 
nearby. During her recovery she had been visiting that doctor regularly. At the reception desk, she 
opens up the *PDaaS*'s management panel on her smartphone and searches through the list of data 
consumers. After she finds the entry for this clinic, she flips her phone to show the receptionist 
the corresponding QR-Code, which the receptionist scans immediately. However the receptionist was 
not able to see any data on the screen, because the access has already expired. The data subject 
only permitted access for the estimated time of recovery, which is already over. That's why she now 
gets a notification asking to re-grant some access. While going through the data items the 
clinic-system has requested, she notices that her address is incorrect. Last month she moved into a 
bigger apartment across the street. She must have forgotten to change that data. She immediately 
corrects the address, right before saving the *permission profile* for the clinic-system. She also 
includes access to all the data originating from the time after her accident. A moment later the 
receptionist confirms now being able to see all necessary data. 
The data subject takes a seat in the waiting room. While passing time, she decides to take a deeper 
look into her list of data consumers. Some of them she couldn't even remember and for others she was 
surprised by which data items she had granted access to. She starts to restrict certain 
permissions, as she desires. She even removes some of the entries entirely. The appointment with her 
doctor went great. The doctor even had to review the x-ray images in order to make an adequate 
differential diagnosis. 
After the visit, she makes a quick stop at a pharmacy along the way to pickup the drugs her doctor 
had prescribed to reduce the pain. She has to wait in the queue since two other customers are in 
front of her. She realizes that it's the first time she's in this store. So she prepares a new entry 
in her list of data consumers, including all information about her prescriptions. By the time she 
gets served, she simply lets the person behind the register scan her QR-code. In the next seconds 
the data subject gets a notification about a *permission request* from this store, which she quickly 
reviews and confirms by making sure that the permissions in that profile are the ones she prepared 
minutes ago. A moment later the pharmacist comes back with her drugs, which she then pays in cash. 
The transaction is done and the data subject leaves the store.


#### Vehicle data and mobility {-}

Let's assume a car has no hardware on board to establish a wireless wide area connection to an 
outside access node. One is only able to connect to the car from the inside (wired or wireless).
After entering a car, on the data subject's mobile device a notification comes up from the car 
asking for permission to connect that mobile device.
In addition to the expiration date, the data subject is provided with two additional options which
she can enable or disable. First, a wifi network provided to everyone in the car can be enabled, 
which utilizes the uplink from the mobile device to the internet. Secondly, the car is allowed to 
use the uplink to open up connections so it can emit or receive data from the internet. As a result
the device owner gains full control over any data the car might want to transfer. And this again 
would allow two things: (A) permission management for all outgoing data and (B) funnel all data 
generated and provided by the car towards the *PDaaS* that is associated with the linked device. It 
might be feasible as well to deny certain connections the car tries to open. Data will then be 
stored only in the *PDaaS*. If a third party is interested in that data they have to ask for access 
permission.
That same concept of movement tracking and vehicle data aggregation could be applied to driving 
motorcycles and bicycles as well.

## Scenarios



The following use cases portray different situations and possible ways in which the tool in question 
might be applicable, and shows in several ways that it can be helpful to be in charge of its own 
personal data. Some are more practical and realistic, like ordering and purchasing a product on the 
internet, while others might at the moment not seem to be very useful, but show a certain potential 
to become more relevant when new technologies and business models will occur, who are followed by 
new desires for data.



#### Ordering a product on the web
 
The data subject searches through the web to find a new toaster, because her old one recently broke.
After some clicks and reviews, she found her soon-to-become latest member of the household's 
kitchenware. After putting the model name in a price search engine, hoping to save some money, the
first entry, offering a 23% discount, caught her attention. She decides to have a deeper look into 
the toasters, therefore she is headed towards the original web shop entry. Finally she comes around 
and puts the item onto her card, despite the fact that she never bought something from that online 
shop before. Then she proceeds to checkout so that she can place her order.
The shop-interface asks her to either insert her credentials, proceed without registration or 
sign-in, or allow the shop to obtain all required data on its own by either scanning a QR-Code 
displayed below or insert a URI to her *Personal Data as a Service*. She opens up the management 
panel of her *PDaaS* in a new browser window and authenticates herself to the system. Afterwards she 
creates a new entry in a list of *data consumers* who already get permitted to access certain 
characteristics of her personal data. As a result, she gets prompted with a URI, which she inserts 
as the shop interface requests her to do, only after she has convinced herself that the data 
exchange with the shop is based on a secure connection (HTTPS). Moving on to the next step after 
submitting the URI, the data subject is ask to decide how she would like to pay. The choices are: 
credit card, invoice, online payment or bank transfer. She chooses the last one, submits her 
selection and thereby completes the order process.
She goes back to the kitchen. After some time, a push notification appears on her mobile device 
lying around. The notification is about a *permission request* which has just arrived at her 
*PDaaS*, asking for granting permissions to the shop-system, she places the order before. The shop
wants to access her full name, address and email, which are required to proceed with the order. 
Based on the information given in the request, she creates a new *permission profile* for the shop. 
Additionally, for the profile she can decide between three states of how long the permission is 
going to last: *only one time*, *expires on date* and *granted, until further notice*. Since she 
has never ordered at this shop before and probably won't do it again, she decides to grant access 
only for this specific occasion. The shop-system gets then notified about the result of decisions.
If the result is positive - which is the case here - the data can be obtained and the order can be 
further processed. As a result, the data subject receives an email, containing information regarding
her order including the shop owner's bank details, which enables her to pay the due amount. 
After the shop-system receives the payment, the toaster is shipped.

In order to get a full impression of how the whole process might would look like if the data subject
would have chosen one of the other payment methods, the differences are describes below.
If the data subject would have wanted to pay with her credit card, the shop-system would have asked
to also access her credit card as well as its belonging secret. And when sending the email, the 
system would have omitted the information about the shop's bank details.
Paying with invoice, would have been possible only if the *PDaaS* initially had been able to 
provided certified profile data, which therefore would have been rated trustworthy. That again would 
have reduced the risk taken by shop owner and would have enabled him to take action in cases of 
fraud or misuse.
Choosing to involve an online payment service provider as a *middleman* for processing the payment, 
would have required the data subject to have granted the provider certain access to her *PDaaS* 
upfront. In that case, the shop-system then would have asked for her payment provider account 
identifier, so that the system could have requested the payment directly form that payment service
provider. This on the other side would have caused the service provider to consult the *PDaaS*, 
which would have result in a second notification asking the data subject for permission to proceed.
After the payment transfer would have been succeeded, the shipment would have been initiated.


#### Interacting with a social network

Entering a social network for the first time only requires either a URI to the data subject's 
*PDaaS*, which has uniquely been generated for that purpose, or a QR-Code provided by the social 
network. The data subject receives a notification on her mobile device send from her *PDaaS*, 
revealing what data that network wants to access and maybe even why. If her mobile device is 
currently not at hand, she can also use the management panel provided by her *PDaaS*, which
is accessible with a web browser on every internet-enabled device. Within that panel pending 
permission reviews are indicated.
Regardless of whether the data subject has already reviewed the request, she should still be able to 
login. After doing so, she would see all her information, unless she has not yet granted permissions 
to the social network to access her data *until-further-notice*. If this is done, after waiting a 
moment and then reloading the browser session, all her data should then show up. So, every time if 
someone on that network tries to access her information, whom she has allowed to see those 
information, which is managed by every user only from within the network, the network pulls the 
required data from her *PDaaS*, as long as it is permitted to do so. It is also conceivable, that 
the social network does provide a back-channel to the *PDaaS*, so that all the content she creates 
within that network including all interactions with other users can be stored in her *PDaaS*, so 
that it could be provided to other *data consumers*. The network itself only stores references all 
these content objects. Whether it's for example an image, a post or comment on a post from somebody 
else, if the actual content is needed to be displayed it gets fetched from the corresponding 
*PDaaS*. 


#### Applying for a loan and checking creditworthiness

The data subject would like to buy an apartment. In order to finance such a acquisition, she needs a 
funding, which in her case, is based on a loan. During a conversation in a credit institute of her 
choice, an account consultant describes to her what data is required in order to decide on her 
creditworthiness. While nodding consensually, she takes out her smartphone and brings up the 
management panel of her *PDaaS*. 
The consultant flips his screen showing a QR-Code and the *data subject* scans it. The tool displays 
some information about the institute including a reference to this assignment and a list of all 
different data points the institute would like to access in order to calculate her scoring, such as 
address, monthly income, relationship status and family, history of banking or other current loans. 
After some back and forth and solving some misunderstandings with the help of her consultant, she 
decided to just partially allow access to the requested data and just for this time and purpose. The 
consultant kindly pointed out, that these decisions might have an impact on her scoring and thus 
on the lending and its terms. 
While handling some more formalities and talking about other possible products she might be 
interested in, the consultant gets notified by his computer confirming the access permission. 
Thereupon the two finishing their meeting and the consultant informs the data subject about the next 
steps, which include a note about contacting her within the next few days when the institute has 
come to a conclusion. In case of a positive outcome a new appointment for handling all the paperwork 
and signing the contract is needed to be made.
From a technical point of view, two different ways of computing the score are imaginable. The first
one would be, to just transfer the plain data including expire date and information about how 
reliable the data is. However, the actual computations and analytics to obtain the score, happen 
within the infrastructure of the credit institute. When this process has finished, all the personal 
data that have been transferred must be erased. An alternative, though, could prevent the data from 
leaving the *PDaaS*. Therefor, the institute's request won't contain a data query. Instead it comes 
along with some software and information on how to run it. The *PDaaS* server will provide an 
isolated runtime in which the software then can get executed. After that process is finished, the 
result is send back to the credit institute's infrastructure.


#### Maintain and provide it's own medical record

Some time ago on a hiking trip in a moment of carelessness the data subject accidently broke her 
leg. She came into a hospital and went straight into surgery, where the surgeon where able to 
fix the injury. Time went by and the leg healed completely. After she woke up today she felt
some pain coming from the area where her leg was broken. She decided to call in sick and went
straight to a doctor nearby. During her recovery she has been visiting that doctor regularly.
At the reception desk, she opens up the *PDaaS*'s management panel on her smartphone and searches
through the list of data consumers. After she has found the entry for this clinic, she flips her 
phone to show the receptionist the corresponding QR-Code, which the receptionist starts to scan 
immediately. However the receptionist was not able to see any data on the screen, because the access 
has already been expired. The data subject only permitted access for the estimated time of recovery, 
which is already over. That's why she got a notification asking about re-granting some access. While  
going through the data points the clinic-system has requested, she notice that her address is 
incorrect. Last month she moved out into a bigger apartment just across the street. She must have 
forgotten to change that data. She immediately corrects the address right before saving the 
*permission profile* for the clinic-system. She also includes access to all the data originating 
from that time after her accident. A moment later the receptionist confirms to now being able to see 
all necessary data. 
The data subject takes a seat in the waiting room. While passing some time, she decides to take a 
deeper look into her list of data consumers. Some of them she couldn't even remember and for others 
she was surprised on what data points she has granted access to them. She starts to restrict certain 
permissions, if it was appropriate in her opinion. She even removed some of the entries entirely.
The appointment with her doctor went great. He even had to review the x-ray images in order to 
make a adequate differential diagnosis. 
After the visit, she makes a quick stop at a pharmacy along the way to pickup the drugs her doctor 
had prescribed for her to reduce the pain. She has to wait in the queue with two other customers 
being in front of her. She realizes, that it's the first time she here in this store. So she 
prepares a new entry in her list of data consumer, including all information about her 
prescriptions. By the time she gets served, she just let the person behind the register scan her 
QR-code. In the next seconds the data subject gets a notification about a *permission request* from 
this store, which she quickly reviews and confirms by making sure that the permissions in that 
profile are the ones she prepared minutes ago. A moment later the pharmacist comes back with her 
drugs, which she then pays in cash. The transaction is done and the data subject leaves the store.


#### Vehicle data and mobility

Assuming a car itself has no hardware on board to establish a wireless wide area connection to an 
outside access node. Only from the inside the car one is able to connect to it (wired or wireless).
After entering a car, on the data subject' mobile device a notification comes up from the car asking 
for permission to connect that mobile device.
In addition to the expiration date, the data subject is provided with two additional options, which
she can en- or disable. First, a wifi network provided to everyone in the car can be enabled, which 
utilizes the uplink from the mobile device to the internet. Secondly, the car is allowed to use
the uplink for opening up connections so it can emit or receive data from the internet. As a result
the device owner gains full control over any data the car might want to transfer. And this again 
would allow two things: (A) permission management for all outgoing data and (B) funnel all data 
generated and provided by the car towards the *PDaaS* that associated with the linked device. It 
might be feasible as well to deny certain connections the car tries to open. Data will then be 
stored only in the *PDaaS*. If a third party is interested in that data they have to ask for access 
permission.
That same concept of movement tracking and vehicle data aggregation could be applied to driving 
motorcycles and bicycle as well.

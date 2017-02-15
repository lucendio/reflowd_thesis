## Overview



The overall purpose of this specification is to provide detailed instructions to build a web service
that on the one side encourages an individual to manage and maintain all the data relating to her 
in one place, and on the other side that enables third parties to access such data if they are 
permitted by the individual to do so, preferably through supervised code execution instead of just 
handing over the raw data points.
The result is a one-to-many relation between the data owner - the individual - and all those who 
might require some data to for example proceed a purchase initiated by the operator or make a proper 
decision on her medical treatment. 

The system architecture is designed while keeping flexibility and portability in mind but still 
preserving simplicity and security. The result supports to run some components on different 
platforms in a distributed way. Therefore the operator is able to operate the system while being on 
the move, and can literally carry all her personal data along.

The design of this specification tries to leverage as much existing standards and open technologies 
as possible for all the different aspects and components. So that by recognizing common practices 
its implementation and integration can be made as effortless as possible. 



### Key Features

__Perspective: *Operator*__

+   full control over the flow of personal data
+   maintain all personal data in one place
+   real-time information and notification
+   taking her personal data with her
+   collect and analyse her own personal data
+   trust through open development and open source
+   commercialize data access on her own


__Perspective: *Consumers*__

+   reliable single source of latest data about an individual
+   access only those data that are actually required and thus reduce 'noise'
+   access data that never were been collectible before
+   distributed computing


### Scenarios *(Excerpt)*

##### Online Purchase

In order to proceed with the checkout, the shop requires some personal from the user, such as 
shipping address, email and payment information. Either the shop is already a data consumer, then
it would access the system in the background to check if any data has changed, or the shop has to 
register as a consumer first. After the registration process has been initiated, and if not already 
has happened the user is then forwarded to complete the checkout. 
After reviewing the registration and the data that are attempted to get accessed, the use is 
informed via email that the order has been proceeded and the shipment has started.


##### Social Network 




##### Apply for a Loan




##### Browser History
 


##### Movement Profile

 



### Architectural Overview



### General Process Description



### Relations

+   one third party access (consumer) relates to one access *endpoint*, that also authenticates that
    third party by TLS based *two-way auth* 
+   zero or more *permission profiles* are associated to one *endpoint*



### Depending Technologies

a)  HTTPS via TLS
b)  GraphQL
c)  document-based database systems



### Prerequisites

a)  domain
b)  publicly reachable server (e.g public IP)
c)  [OPTIONAL] mobile device

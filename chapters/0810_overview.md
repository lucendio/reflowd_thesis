## Overview



The overall purpose of this specification is to provide detailed instructions for building a web 
service that, on the one hand, encourages an individual to manage and maintain all the data relating 
to her in one place, and on the other hand, enables third parties to access such data if they are 
permitted by the individual to do so, preferably through supervised code execution instead of just 
handing over the raw data items.  
The result is a one-to-many relation between the data owner - the individual - and all those who 
might require some data to, for example, process a purchase initiated by the operator or make a 
proper decision on her medical treatment. 

The system architecture is designed with flexibility and portability in mind while still preserving 
simplicity and security. The result supports running some components on different platforms in a 
distributed way. Therefore the operator is able to operate the system while being on the move and 
can literally carry all her personal data along.

The design of this specification tries to leverage as many existing standards and open technologies 
as possible for every aspect and component. By recognizing common practices, its implementation and 
integration can be made as effortless as possible. 



### Key Features

__Perspective: *Operator*__

+   full control over the flow of personal data
+   maintain all personal data in one place
+   real-time information and notification
+   taking her personal data with her
+   collect and analyze her own personal data
+   trust through open development and open source
+   commercialize data access on her own


__Perspective: *Consumers*__

+   reliable single source of latest data about an individual
+   access only those data that are actually required and thus reduce 'noise'
+   access data that have never been collectible before
+   distributed computing



### Scenarios *(Excerpt)*

##### Online Purchase

In order to proceed with checkout, a shop requires some personal data from the user, such as 
shipping address, email, and payment information. Either the shop is already a data consumer, then
it would access the system in the background to check if any data has changed, or the shop has to 
register as a consumer first. After the registration process has been initiated, if needed, the user 
is forwarded to complete the checkout. 
After reviewing the registration and the data that are attempted to be accessed, the user is 
informed via email that the order has been processed and the shipment has started.


##### Social Network

Instead of storing personal data by itself, a social network, after registering and being permitted
to, can request and display data about a user whenever other users try to access them. 
Created content such as posts, comments, images, or videos can be stored in the system as well. The 
social network then just holds references to all the content so that it can obtain and forward 
information on how to request those data, for example, with a one-time url.


##### Apply for a Loan

The data that credit institutes take into account when deciding on creditworthiness of an individual
can be directly accessed through the system; instead of gathering and acquiring them from all 
sorts of resources, including filled out forms from applicants. The credit institute takes out the 
part of the computation that is responsible for those calculations and hands it over to the system 
after it is permitted by the operator to do so. The system invokes that computation with the 
required data items and sends the result back to the credit institute.


##### Browser History

A browser plugin, which is connected to the service, keeps track of every called URL. Those data, 
collected by the operator, can not only be reviewed and analyzed by herself, but also be made 
available to data consumers.


##### Movement Profile

Instead of letting third party apps keep track of an individual's daily movements (e.g. fitness 
app), an app that is associated with the system, obtains and pushes those location data directly 
into it. If a third party is now interested in those data, it can apply and eventually get permitted 
to access those movement data, but at a resolution the data subject is comfortable with.



### Architectural Overview

The architecture design (see Fig. @fig:spec_arch_simplifier) defines three different platforms where 
components of the system could run. While *web* and *mobile* platforms are primarily meant to serve 
as the front end of the system and to present the operator with GUIs, the *mobile* platform in 
particular might host the *Personal Data Storage*. However, that data storage can be located on any 
platform. This is enabled by abstracting the storage through the *Storage Connector* on the *server* 
platform.

That *server* platform also provides an external API for accessing personal data. Incoming requests 
from third parties and consumers are then processed by the *Permission Manager*, which i.a. decides
if and how data can be accessed. For every consumer a dedicated exposed endpoint is provided that 
consists of a subdomain (e.g. `CONSUMER_ID.system.tld`). Other components are i.a. a 
*Code Execution Environment*, a *PKI* that provides and issues certificates and key-pairs to 
facilitate authentication at the endpoints. The *Persistence Layer* is represented by potentially 
multiple technologies, such as databases or filesystem. A *Notification Infrastructure* streamlines 
the different ways and technologies to notify the operator about certain events (e.g. system 
receives new registration). Probably one of the most important components is the *Operator API*, 
through which the operator i.a. is able to configure the system or manage permissions and the API 
is granted read/write permissions at the *Storage Connector*. The *Operator API* MAY partially be 
designed RESTfully, but accessing data MUST solely consist of the query language provided by 
*GraphQL*.

![System Architecture (simplified)](./assets/figures/spec_arch_simplifierd.png){#fig:spec_arch_simplifier width=12cm}



### Abstract Process Description

0.  *Prerequisites: the data subject has an up-and-running system; existing third party aims to 
    access personal data on the system*

1.  Third party has to register at the system to become a data consumer, therefore it has to provide 
    certain information to the operator either via QR-Code, which the operator can scans, or by 
    submitting those information to a unique URL that is generated upfront and provided by the 
    operator to the third party.
    
2.  Operator reviews the registration. On a positive outcome a new endpoint gets defined and, 
    depending on the content of the registration request, a permission profile is optionally 
    created and configured by the operator. If the outcome instead is negative, an error message is 
    prepared. In any case, the third party is then informed about the outcome via callback URL and 
    optionally provided with additional information that is required for further interactions.
    
3.  After the consumer has set up a client according to the documentation and the information he has
    been provided with, and after he successfully authenticates to the system, he then submits a 
    query to the dedicated endpoint.

4.  The incoming query is parsed and validated against all associated *permission profiles*. If the
    query passes, the request is processed according to configurations and depending on the 
    determined *access type* (e.g. supervised code execution or plain forwarding). The response to
    the consumer either contains information about when and where the result can be obtained, or the
    actual result is included directly.
    
5.  Finally, the query result is returned to the consumer, either directly or self-obtained later 
    on.



### Relations

##### consumer:endpoint [1:1]
one entity (consumer) relates to one access point (endpoint), exclusively accessible and 
authenticated by TLS-based *two-way authentication* 
    
##### endpoint:permission-profile [1:n]
zero or more *permission profiles* are associated to one *endpoint* and are therefore responsible 
and included in the query validation procedure

##### storage-connector:personal-data-storage [1:n] 
the *Storage Connector* MUST be able to access at least one or more *Personal Data Storages*, 
regardless of their location (platform)



### Depending Technologies and Standards

a)  HTTP ([RFC 2616](https://tools.ietf.org/html/rfc2616), [RFC 7540](https://tools.ietf.org/html/rfc7540))
b)  TLS ([RFC 5246](https://tools.ietf.org/html/rfc5246)
c)  WebSockets ([RFC 6455](https://tools.ietf.org/html/rfc6455))
d)  JSON ([ECMA-404](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf))
e)  JWT ([RFC 7519](https://tools.ietf.org/html/rfc7519), [RFC 7515](https://tools.ietf.org/html/rfc7515), [RFC 7516](https://tools.ietf.org/html/rfc7516}))
f)  GraphQL ([Working Draft – October 2016](https://facebook.github.io/graphql/))
g)  Open Container Specifications (by Open Container Initiative)
    +   [image](https://github.com/opencontainers/image-spec/blob/master/spec.md)
    +   [runtime](https://github.com/opencontainers/runtime-spec/blob/master/spec.md) 
h)  X.509 ([RFC 5280](https://tools.ietf.org/html/rfc5280)
i)  ACME ([Draft 05](https://ietf-wg-acme.github.io/acme/))

+   document-based database systems
+   browser-supported technologies (HTML, CSS, JavaScript)
+   Swift, Java



### Prerequisites

a)  DNS-registered Domain
b)  publicly reachable server (e.g public IP or dynamic DNS)
c)  [OPTIONAL] mobile device

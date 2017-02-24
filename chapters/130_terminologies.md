## Terminologies 



Web Service:

: A service, that is accessible by electronic devices over the internet. This makes it almost 
effortless to use a service which would otherwise be plattform dependent or just unavailable.
Interactions with a service usually happen through enriched websites or other web-compatible
applications and interfaces.

Open Specification:

: A specification is a formal and very detailed way of describing a technology, its internals, and 
behaviour from external perspectives. It provides guidance for possible implementations to ensure a minimum viable 
level of interoperability. Structured in a formalized document and widely adopted, it might become a 
*technical standard*. *Open* in this case means it's accessible for everyone with internet access
without any restrictions. When it comes to the intellectual value itself, that might be handled 
differently, for example with an enclosed license.


[Profile Data]{#terminologies--profile-data}:

: A collection of data points reflecting an individual's inherent information and other basic 
predominantly static data, which, in conjunction, uniquely relate to that individual.


[Digital Footprint]{#terminologies--digital-footprint}:

: Refers to data and information that is related to an individual. It is distinguished between
an active footprint, which an individual chose to share publicly, and a  passive footprint,
which includes everything about an individual collected by third parties without the individual's
knowledge.


Data Subject:

: An individual who first and foremost is the owner of all of her personal data; sometimes referred 
to as *owner*.


Personal Data as a Service (PDaaS):

: A *web service* that is controlled, owned, and maybe even hosted by an individual. It provides 
access to a *data subject's* personal data and offers permission management as well as maintainability
for those data. It can be seen as her personal agent; sometimes also referred to as *the system*.


[Operator]{#terminologies--operator}:

: A *data subject* that uses a *PDaaS* to control (and probably host) her personal data; sometimes 
referred to as *data controller* or *data owner*.


[(Data) Consumer]{#terminologies--consumer}:

: Third party who requests permission or is already allowed to access a part of the *operator's* *personal 
data* through her *PDaaS*; sometimes referred to as *(data) collector* or *vendor*.


[Data Broker]{#terminologies--data-broker}:

: Third party with commercial interests in collecting, aggregating and analyzing information/data 
about humans from any possible resource in order to combine and enrich them, to finally license 
those *data profiles* to other organisations. [@report_2014_data-brokers]


Permission Request:

: A formalized attempt made by a third party to request permissions in order to access certain data 
on the *PDaaS*. The request has to include all the data to which access is being demanded, as well
as sufficient information about the underlying purpose. It requires the third party to already
being registered as *data consumer*.


Permission Profile:

: A set of access rules and configurations tied to a *data consumer*. It determines what data is 
accessible by the related *data consumer* and for how long. The profile is the result of a reviewed 
and granted *permission request*. 


Access Request:

: An attempt to actually access data provided by a *PDaaS*. The request primarily consists of a 
query, that defines what data points are tried to be accessed. The access is only permitted if
the query matches against the *permission profiles*.


Endpoint:

: An endpoint is defined as part of an URI that is uniquely associated with a single *data 
consumer*. Usually it's the host part of a URI (e.g. domain incl. subdomains), whereas following 
parts indicating different resources that might be available within that endpoint. It can also be 
viewed as group of resources whose access is restricted. 

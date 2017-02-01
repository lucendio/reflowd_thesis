Specification *(Draft)*
==========================================



This chapter hold the first draft of what might become a specification. As for now it has therefore
no claim of completeness, continuity or accuracy. The contents is based on and a result of all 
previous discussions and developed solutions.  


TODO: should might must n stuff in table (see dark mail spec)



## Overview

+   purpose
+   architectural overview
+   short description of the whole process



## Components

### Webserver

### User Interface
    
### Storage/Persistence
    
### Notification Infrastructure

### Data API



## Data

### Structure & Types

+   henceforth only two things: primitive and struct
+   supported date types

### Read

### Write

(!) every data or configuration change has to be reversible



## Protocols

###### Consumer registration

0)  \[OPTIONAL\] *data subject* provides URI to *data consumers* 

1)  *data consumers* create *permission request* that includes
    -   X.509 based CSR [^abbr_csr]
    -   callback URI via HTTPS as feedback channel
    -   \[OPTIONAL\] information about what data points wanted to be accessed

2)  depending on 0), *data consumer* provides *operator* with priorly created *permission 
    request* either as QR-Code or via HTTPS by given URI 
    
3)  *operator* reviews request and decides to either refuse or grant assess; the latter results in:
    a)  creating new *endpoint* 
        +   create new unique subdomain and a related asymmetric key pair signed by the system's 
            root CA (self-signed)
        +   issue *consumer* certificate based on it's CRS and sign it with the key pair related 
            to this *endpoint*
    b)  if information is provided, creating new *permission profile* by either applying existing 
        draft/template or configuring *permission type* (incl. expiration date if required) and 
        permitted data endpoints; associate to specific *endpoint*

4)  *data consumers* gets informed about the decision via callback channel
    +   on grant, response includes 
        +   *consumer's* certified certificate
        +   certificate that's associated with the created endpoint
        +   information on what data points are allowed to be accessed;
    -   on refusal: error code/message
    
5)  *data consumer* handles the response appropriately
    +   \[OPTIONAL\] pin the provided *PDaaS* certificate
    

###### Data Access

0)  after successfully authenticated, *consumer* sends *access request*
 
1)  request contains at least the *data query*; based on that query and the *permission profiles*, 
    access is tried to get verified
    a)  on success, response gets computed
    b)  on failure, error code/message is responded; process aborts
        -   if the error was raised because no appropriate *permission profile* was found, then the
            *consumer* first needs to request permission for the *data points* that were part of the 
            query

2)  \[OPTIONAL\] depending on whether the `keepalive` flag was set `true`, the connection of this
    requests lasts until response computation has finished or timeout has reached, otherwise the 
    response contains a URI unique to this current request including an estimation
    when response will be available under that URI; connection can still timeout, which is defined 
    by the system
 
3)  depending on the type of that *access request*, 
    (A) the data get queried and the result is added to the response
    (B) based in further information provided by the request, the environment for the *supervised
        code execution* is getting provisioned, the program from the *consumer* will be ran against
        various tests
        a)  in fail, error code/message get added to the response
        b)  on pass, computed result gets added to the response
        
4)  response is finalized and gets returned back to the *consumer*, either as a response to this 
    request or provided under the unique URI as of 2) 


###### Permission Validation

TODO: detailed description of the algorithm that checks *permission profiles* according to an 
*access request*; including all different possible cases (multiple profiles for one consumer etc)


###### Add or Change Personal Data


[^abbr_csr]: Certificate signing request





### Data Management




+   one third party access (consumer) relates to one access *endpoint*, that also authenticates that
    third party by TLS based *two-way auth* 
+   zero or more *permission profiles* are associated to one *endpoint*


## APIs


__Registration Request__
+   contains certificate signing request
+   \[OPTIONAL\] contains *permission request*

```JSON
{
    "callbackUri": "TODO",
    "csr": "TODO",
    "dataPoints": [
        "profile.lastname"
    ]
}
```


__Permission Request__
+   creates new *permission profile*
+   `https://example-consumer.pdaas.tld/pr`

```JSON
{
    "callbackUri": "",
    "dataPoints": [
        "profile.lastname"
    ]
}
```


__Access Request__
+   obtains actual data
+   if `keepalive` is set `true`, the connections lasts until response computation has finished,
    otherwise the response contains a URI unique to this current request including an estimation
    when response will be available under that URI; connection can still timeout, which is defined 
    by the system
+   `https://example-consumer.pdaas.tld/ar`

```JSON
{
    "query": "TODO"
}
```
*Requirements:*
-   query has to match exactly one corresponding *permission profile*



TODO: basic structure of a *permission profile*

How do the APIs involved with the protocols look like?



## Security

+   the downside of having not just parts of the personal data in different places (which is
    currently the common way to store), is in case of security breach, it would increase the 
    possible damage by an exponential rate
    Thereby all data is exposed at once, instead of not just the parts which a single service
    has stored 
+   does it matter from what origin the data request was made? how to check that? is the 
    requester's server domain in the http header?
    eventually there is no way to check that, so me might need to go with request logging and
    trying to detect abnormal behaviour/occurrence with a learning artificial intelligence
    
+   is the consumer able to call the access request URI repeatedly and any time? (meaning will this
    be stateless or stateful?)
    
+   initial consumer registration would be done on a common and valid https:443 CA-certified 
    connection. after transferring their cert to them as a response, all subsequent calls
    need to go to their own endpoint, defined as subdomains like `consumer-name.owners-notification-server.tld`


### Environment


### Transport

+   communication between internal components *must* be done in https only, but which ciphers?
    eventually even http/2?


### Storage

+   documents based DB instead of Relational DBS, because of structure/model flexibility 
+   graphql because of it's nature to abstract a storage engine, which comes in handy when the 
actual storage gets relocated (e.g. from a server to a mobile device)


### Authentication

+   how should consumer authenticate?



## Recommendations

### Software Dependencies

### Host Environment(s)

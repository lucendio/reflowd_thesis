Specification
==========================================




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

### Read

### Write



## Protocols

### Permission Request / Consumer Registration

+   data to provide in a registration request:
    -   CSR [^abbr_csr]
    -   callback URI as feedback channel
    -   permissions: what data for what purpose and how long
    
    
    
[^abbr_csr]: Certificate signing request

### Data Access

TODO: detailed description of the algorithm that checks *permission profiles* according to an 
*access request*; including all different possible cases (multiple profiles for one consumer etc)


### Data Management



## APIs

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

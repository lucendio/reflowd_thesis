## Protocols



*The following protocols reflect core procedures. They have to be understood as detailed 
instructions on how these procedures have to be implemented.*



#### Consumer Registration

*Description: TODO*


+   initial consumer registration would be done on a common and valid https:443 CA-certified 
    connection. after transferring their cert to them as a response, all subsequent calls
    need to go to their own endpoint, defined as subdomains like `consumer-name.owners-notification-server.tld`


0.  \[OPTIONAL\] *data subject* provides URI to *data consumers* 

1.  *data consumers* create *permission request* that includes
    -   X.509 based CSR [^abbr_csr]
    -   callback URI via HTTPS as feedback channel
    -   \[OPTIONAL\] information about what data points wanted to be accessed

2.  depending on 0), *data consumer* provides *operator* with priorly created *permission 
    request* either as QR-Code or via HTTPS by given URI 
    
3.  *operator* reviews request and decides to either refuse or grant assess; the latter results in:
    a)  creating new *endpoint* 
        +   create new unique subdomain and a related asymmetric key pair signed by the system's 
            root CA (self-signed)
        +   issue *consumer* certificate based on it's CRS and sign it with the key pair related 
            to this *endpoint*
    b)  if information is provided, creating new *permission profile* by either applying existing 
        draft/template or configuring *permission type* (incl. expiration date if required) and 
        permitted data endpoints; associate to specific *endpoint*

4.  *data consumers* gets informed about the decision via callback channel
    +   on grant, response includes 
        +   *consumer's* certified certificate
        +   certificate that's associated with the created endpoint
        +   information on what data points are allowed to be accessed;
    -   on refusal: error code/message
    
5.  *data consumer* handles the response appropriately
    +   \[OPTIONAL\] pin the provided *PDaaS* certificate



#### Permission Request

*Description: applying for permission to get access to certain data*



#### Access Request (accessing data)

*Description: TODO*


0.  after successfully authenticated, *consumer* sends *access request*
 
1.  request contains at least the *data query*; based on that query and the *permission profiles*, 
    access is tried to get verified
    a)  on success, response gets computed
    b)  on failure, error code/message is responded; process aborts
        -   if the error was raised because no appropriate *permission profile* was found, then the
            *consumer* first needs to request permission for the *data points* that were part of the 
            query

2.  \[OPTIONAL\] depending on whether the `keepalive` flag was set `true`, the connection of this
    requests lasts until response computation has finished or timeout has reached, otherwise the 
    response contains a URI unique to this current request including an estimation
    when response will be available under that URI; connection can still timeout, which is defined 
    by the system
 
3.  depending on the type of that *access request*, 
    (A) the data get queried and the result is added to the response
    (B) based in further information provided by the request, the environment for the *supervised
        code execution* is getting provisioned, the program from the *consumer* will be ran against
        various tests
        a)  in fail, error code/message get added to the response
        b)  on pass, computed result gets added to the response
        
4.  response is finalized and gets returned back to the *consumer*, either as a response to this 
    request or provided under the unique URI as of 2) 



#### Permission Validation

*Description: detailed description of the algorithm that checks permission profiles according to an 
access request; including all different possible cases (multiple profiles for one consumer etc)*



#### Adding or Changing Personal Data

*Description: TODO*




[^abbr_csr]: Certificate signing request

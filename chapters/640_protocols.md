## Protocols



The following protocols reflect core procedures. They have to be understood as detailed 
instructions on how these procedures MUST be implemented.



##### Consumer Registration
*Before a third party is permitted to request data access, it must first register to the system. As 
a result, the third party becomes data consumer and is provided with a dedicated endpoint, to which 
it MUST authenticate by presenting its certificate signed by the system.*

*Preconditions:*
+   secure channel;  QR-Code (by *third party*), HTTPS (by *data subject*)
+   key-pair and CSR (on the consumer-side)
+   unique URI created by *data subject* with the help of the system's management tool 


0.  [OPTIONAL] *data subject* provides *third party* with unique URI 

1.  *third party* creates registration request that includes
    -   information about itself and reasons for registration attempt
    -   X.509 based Certificate Signing Request (CSR)
    -   callback URI via HTTPS as feedback channel
    -   [OPTIONAL] information about what data points are wanted to be accessible 

2.  depending on (0), *third party* provides *data subject* with registration request either as 
    QR-Code or via HTTPS by given URI 
    
3. [OPTIONAL] *data subject* gets notified about new registration request (REQUIRED if no mobile 
    platform is associated to the system) 
    
4. *data subject* reviews registration and decides to either accept or refuse the registration
    +   *Accept*
        1)  create new *endpoint* 
            -   create new entry in `endpoints` (PL) by providing registration information (csr, 
                info, callback URI etc.),
            -   generate consumer identifier 
            -   register new subdomain in *web server* with consumer identifier 
                (e.g. `CONSUMER_ID.system.tld`)
        2)  issue certificate
            -   generate new key-pair and certificate for registered subdomain 
                (CN: `CONSUMER_ID.system.tld`) and sign it with the system's root certificate
            -   process CSR accordingly, sign it with the subdomain's certificate and store it in 
                the related entry within `endpoints`
        3)  [OPTIONAL] if registration contains information on what data is requested to get 
            permission to access, those information MUST be processed as described in 
            [Permission Request](#-permission-request)
        4)  respond issued third party certificate, endpoint's certificate and
            [OPTIONAL] result(s) of the [Permission Request](#-permission-request) procedure
    
    +   *Refuse*
        1)  *data subject* SHOULD provide reason or MUST fall back to default reason
        2)  respond reason
        
    +   *Failure*
        *   subsequent processes decide on their own what error message and how much information is 
            provided to the third party
        1)  form proper error identifier and message
        2)  add unique URI to submit a new registration
        3)  respond error

5.  assemble and submit response via provided callback URI
    
6.  *third party* is informed about the decision via callback channel and proceeds responded data
    accordingly
    +   *Accept*
        1)  install certificates and [OPTIONAL] pin provided *endpoint* certificate
        2)  [OPTIONAL] recognize and process result(s) of the 
            [Permission Request](#-permission-request)

    +   *Refuse: unspecified*

    +   *Failure*
        1)  [OPTIONAL] depending on error, act accordingly (e.g. create a new registration and 
            submit it again)


*Result(s):*
+   *third party* becomes *data consumer* and is now able to request permissions
+   *data consumer* MAY now be permitted to access data, if registration has contained information 
    for [Permission Request](#-permission-request)



##### Permission Request 
*In order for a data consumer to access data that is provided by the system, he MUST first request 
those permission(s).*

*Preconditions:*
+   third party must be registered as *data consumer* to the system
+   *consumer* must know very precisely what data points he wishes to access 


1.  *consumer* creates permission request and submits it to his dedicated *endpoint* provided by the
    system

2.  *operator* gets notified about new permission request

3.  *operator* reviews requested permission 
    +   *Accept*
        1)  *operator* creates new *Permission Profile* by either applying a prepared 
            template/draft, importing configurations from an existing profile, or filling out an 
            empty, or pre-filled with provided information, profile. 
            When saving the new profile, it gets associated to the requester's *endpoint*
        3)  respond what data points are permitted to access, how often, and how long this 
            permission lasts
    
    +   *Refused*
        1)  applying the provided information as is, the system creates and stores a permission 
            profile after all, still associated with the requester's *endpoint* but flagged as 
            `refused`
        2)  respond [OPTIONAL] a reason
        
    +   *Failure*
        1)  form proper error identifier and message based on the error that has occurred
        2)  respond error

5.  assemble and submit response to *consumer*

4.  *consumer* is informed about the decision and acts accordingly
    +   *Accept*
        1)  apply provided information to subsequent *access requests*
    
    +   *Refuse: unspecified*
    
    +   *Failure*
        1)  [OPTIONAL] depending on error, act accordingly (e.g. review and adjust permission 
            request)


*Result(s):*
+   *consumer* is aware of what data he is allowed to access
+   *consumer* is able to access data
+   *operator* holds documentation about who has access to which of her data points
+   *operator* it able to regulate access permission for the *consumer* at any point in time



##### Access Request
*After requesting permission to access data and getting these granted, a consumer actually access
data points by either getting them forwarded or providing a program, that gets invoked
with the data points as arguments. The result of that invocation is then send back to the 
originating data consumer.*

*Preconditions:*
+   successfully requested permission
+   [OPTIONAL] program, that has to be invoked


1.  after successfully authenticated, *consumer* submits access request, containing
    +   query (defines data and its structure) 
    +   access type (plain forward or program invocation)
    +   [OPTIONAL] response method (`keepalive` or `push`)
    +   [OPTIONAL] program (source or binary)
 
2.  *Permission Manager* tries to verify the access (see 
    [Access Verification](#access-verification)) and resulting to
    +   *allowed*
        1)  depending on defined response method either keep session open until timeout limit 
            exceeds, or respond with unique process identifier and [OPTION] estimated duration
    
    +   *denied*
        1)  abort processing access request
        2)  respond default denial notice or [OPTIONAL] message from *Access Verification*
        
3.  obtain data from *PDS*

4.  compute result according to provided access type
    +   *forward*
        1)  add expiration date for the data
        2)  move all obtained data to response handler
        
    +   *supervised execution* 
        0)  copy program into *PL*
        1)  inspect and review code, if available
        2)  provision container runtime with dependencies and provided program
        3)  run multiple tests with generated test data
        *)  if threshold of failed tests exceeds, abort and pass error message on to response 
            handler
        4)  run with real data
        5)  forward result to response handler

5.  finalize response and submit it back to *consumer* 


*Result(s):*
+   in case of *supervised execution* no actual personal data has left the system
+   if *consumer* would have been not permitted to access data, it would not have happened



##### Access Verification
*When an access request is received, it first MUST be verified if that access is even permitted 
according to the permission profiles and the presented data query before the request is proceeded 
and data gets obtained from the PDS.*

*Preconditions:*
+   query string
+   endpoint name (or consumer identifier)
+   options contained in the access request (e.g. access type)


1.  gather all *permission profiles* relating to the given endpoint

2.  find all profiles, that
    a)  address at least one requested data point and
    b)  have a valid *permission type* at that moment

3.  check resulting subset and if ...
    +   it's empty
        1)  return with a negative result (`false`)
    
    +   not all requested data points are addressed among those profiles
        1)  pause processing
        2)  notify operator and ask for decision on whether access to unregulated data points is 
            allowed or denied
        3)  after missing data points got acknowledged by operator, go back to (2.)
    
    +   all requested data points are addressed among those profiles and ... 
        -   at least one is not allowed to access (counting also `refused` profiles)
            1)  return with a negative result (`false`) and [OPTIONAL] include information on 
                which data points are affected
            2)  inform operator about this incident
    
        -   all are allowed to access 
            1)  return with a positive result (`true`)
    

*Result(s):*
+   only explicitly permitted access requests are able to succeed
+   violation of existing access rules is reported 

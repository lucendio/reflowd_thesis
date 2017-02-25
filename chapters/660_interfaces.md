## Interfaces



### Graphical User Interfaces (GUIs)

The primary GUI of the system is the operator's *Management Tool*, which is used to administrate
the system, to control and manage data access, and to maintain personal data. The tool MAY be 
available on mobile platforms, but MUST at least be provided for *desktop* platforms. The following 
lists show briefly, which features the tool provides to the operator. 


#### Functionality, that MUST be provided:

+   Operator authentication
+   Managing consumers and their entry point(s)
+   Managing permission profiles
+   Reviewing registrations and permission requests
+   Maintenance of personal data
+   Responsive screen adaption
+   Low-latency view rendering
+   Changing system settings
+   Notifications
+   Registration of new front end platforms to the system 


#### Functionality, that SHOULD be available:

+   Personal data import
+   History of access requests
+   Reviewing permission requests
+   Mechanisms to make backups
+   Filter mechanisms for permission profiles, access history
+   Creating & Managing templates for permission profiles
+   QR-Code scanning (mobile platform only)


#### Functionality, that MAY be supported:

+   Reverting changes in permission profiles
+   System monitoring and statistics
+   Personal data export
+   Utilization of the *accordion* pattern for (re)viewing data structures
+   Modeling new data structures
+   Migration of the *PDS* to another platform



### Application Programming Interface (APIs)

The lists of GUI features implicitly define what the *Operator API* must be capable of, whereas 
interactions originated by third parties and data consumers are described below. These descriptions
show the behavior of all major API endpoints that are required to access personal data, which is 
hosted by the system. 
The payload MUST be transmitted with HTTP requests, secured by TLS, declared as *POST* method, 
unless otherwise outlined. It MUST be serialized in JSON and constitute the complete request body. 
When sending data originating from certain formats (e.g. PEM-formatted file content or binary 
streams) as string values that are a part of a URL or JSON, *bas64url* MUST be used for encoding. 
Furthermore, it is to be noted, that requests are asynchronous and MAY take several hours up to a 
few days to be answered.


##### Registration Request {#spec_api_registration-request}
MUST be handed over to the system in order to be acknowledged as a *data consumer*. It can either 
be submitted via HTTP to the system, if the operator has provided a URL, or encoded as a QR-Code 
presented on web page, served via HTTPS by the requester, ready to be scanned with the operator's 
mobile device. 


*Parameter(s):*
+   `csr: String`                   -   certificate signing request
+   `cb: String`                    -   callback URL (REQUIRES https)
+   `cert: String`                  -   [OPTIONAL] certificate for callback URL, if not publicly 
                                        trusted
+   `desires: [String] || String`   -   [OPTIONAL] list of data item selectors or query string (see 
                                        [Registration Request](#spec_api_permission-request))

*Request:* `https://system.tld/register/$uniqueRndValue`

``` {.json .numberLines}
{
    "csr": "$base64UrlEncodedCsr",
    "cb": "https://third-party.tld/callbacks/$procedureIdentifier",
    "desires": [
        "profile.lastname",
        "profile.firstname",
        "finance.bankAccounts"
    ]
}
```

*Response:*

+   `endpoint: String`      -   URL of the consumer-specific endpoint
+   `cert: String`          -   certificate of the consumer-specific endpoint
+   `type: String`          -   permission type (see [Permission Profile](#permission-profile))
+   `expiration: Number`    -   [MUST if type == `expires-on-date'`] date of expiration
+   `interval: Object`
    -   `value: Number`     -   time value
    -   `unit: String`      -   unit of time value
+   `grants: [String]`      -   list of data items allowed to be accessed

``` {.json .numberLines}
{
    "endpoint": "https://$endpointId.system.tld",
    "cert": "$base64UrlEncodedCert",
    "permissions": {
        "type": "expires-on-date",
        "expiration": $twoWeeksFormNow,
        "interval": {
            "value": 1,
            "unit": "daily"
        }
        "datapoints": [
            "profile.lastname",
            "profile.firstname"
        ]
    }
}
```


##### Permission Request {#spec_api_permission-request}
MUST create a new *permission profile* and thus MAY enable the data consumer to access personal 
data. In return, the consumer is provided with all information that is required to request data 
access based on the permissions requested herewith.

*NOTICE: If the representation of the data to which access is requested is defined as a list of 
strings (`[String]`), then the response MUST show a similar structure; the same applies to the data 
query for string-representations (`String`).*
   
*Parameter(s):*
+   `desires: [String] || String`    -  list of data items selectors or query string, representing 
                                        what data is requested to get access to
   
*Request:* `https://$endpointId.system.tld/pr`

``` {.json .numberLines}
{
    "desires": "{profile{firstname,lastname},finance{bankAccounts}}"
}
```

*Response:* 

+   `type: String`          -   permission type (see [Permission Profile](#permission-profile))
+   `grants: String`        -   data query representing the data items allowed to be accessed

``` {.json .numberLines}
{
    "type": "one-time-only",
    "grants": "{profile{firstname,lastname}}"
}
```



##### Access Request {#spec_api_access-request}
leads to the actual data access, if the *[Access Verification](#access-verification)* does not 
reject access.

*Parameter(s):*
+   `query: String`             -   data query representing the data that is requested to be 
                                    accessed
+   `type: String`              -   [OPTIONAL] access type: `fwd` or `sce`
+   `program: Object`           -   [MUST if `type == 'sec'`]
    -   `mimeType: String`      -   MIME-Type (see [RFC 2046](https://tools.ietf.org/html/rfc2046))
    -   `extension: String`     -   file extension
    -   `file: String`          -   base64url-encoded file content
+   `reliable: Boolean`         -   [OPTIONAL] indicates whether the consumer expects a proof of 
                                    data reliability or not
+   `respond: String`           -   [OPTIONAL] `push` (returns immediately with information where to 
                                    obtain the result) or `keepalive` (keep connection open until 
                                    response is computed)
   
*Request:* `https://$endpointId.system.tld/ar`
``` {.json .numberLines}
{
    "type": "fwd",
    "reliable": true,
    "respond": "keepalive",
    "query": "{profile{firstname,lastname}}"
}
```

*Response: [if `respond == 'push'`]*

+   `pickup: String`    -   URL where to find the actual response
+   `duration: Number`  -   estimated time in seconds until response SHOULD be available

``` {.json .numberLines}
{
    "pickup": "https://$endpointId.system.tld/ar/$procedureId",
    "duration": 43200,
}
```

*Request:* `https://$endpointId.system.tld/ar/$procedureId`
*Response:*

+   `expiresAt: Number`         -   date when data become outdated
+   `proof: String`             -   [OPTIONAL] certificate that indicates verified data reliability
+   `data: Object || String`    -   if valid JSON, then Object, otherwise base64url-encoded string 

``` {.json .numberLines}
{
    "expiresAt": $oneMonthFromNow,
    "proof": "$reliabilityVerificationCertificate",
    "data": {
        "profile": {
            "firstname": "Jane",
            "lastname": "Doe"
        }
    }
}
```

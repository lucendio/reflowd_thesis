## Interfaces



### Graphical User Interfaces (GUIs)

The primary GUI of the system is the operator's *Management Tool*, which is used to administrate
the system, to control and manage data access and to maintain personal data. The tool MAY be 
available on mobile platforms, but at least MUST be provided for *desktop* platforms. The following 
lists show briefly, which features the tool provides to the operator. 


#### Functionality, that MUST be provided:

+   operator authentication
+   manage consumers and their entry point(s)
+   manage permission profiles
+   review registrations and permission requests
+   maintain personal data
+   responsive screen adaption
+   low-latency view rendering
+   change system settings
+   provide notifications
+   register new front end platforms to the system 


#### Functionality, that SHOULD be available:

+   import personal data
+   view access history
+   review access requests
+   backup mechanisms
+   filter mechanisms for permission profiles, access history
+   create & manage templates for permission profiles
+   QR-Code scanning (mobile platform only)


#### Functionality, that MAY be supported:

+   revert changes of permission profiles
+   system monitoring and statistics
+   export personal data
+   utilize *accordion* pattern (re)viewing data structures
+   model new data structures
+   migrate *PDS* to another platform



### Application Programming Interface (APIs)

The lists of GUI features implicitly define what the *Operator API* must be capable of, whereas 
interactions originated by third parties and data consumers are described below. These descriptions
show the behavior of all major API endpoints, that are required to access personal data hosted by
the system. 
The payload MUST be transferred with HTTP requests, secured by TLS, as *POST* method, unless 
otherwise outlined. It MUST be serialized in JSON and constitutes the complete request body. In 
order to send data in certain formats (e.g. PEM-formatted file content or binary streams) as a 
string values as part of a URLs or JSON, *bas64url* MUST be used to encode such data. Furthermore, 
it is to be noted, that request are asynchronous and MAY take several hours up to a few days to get 
answered.

*NOTICE: If the representation of the data that is requested for access defined as a list of strings 
(`[String]`), then the response has the same structure. Same apply to the data query in a 
string-representation (`String`).*


##### Registration Request {#spec_api_registration-request}
MUST be handed over to the system in order to get acknowledged as a *data consumer*. It can either 
be submitted via HTTP to the system, if the Operator has provided a URL, or encoded as a QR-Code 
presented on web page, which is served via HTTPS by the requester, ready to get scanned with the 
operator's mobile device. 


*Parameter(s):*
+   `csr: String`                   -   certificate signing request
+   `cb: String`                    -   callback URL (REQUIRES https)
+   `cert: String`                  -   [OPTIONAL] certificate for callback URL, if not publicly 
                                        trusted
+   `desires: [String] || String`    -  [OPTIONAL] list of endpoint selectors or query string (see 
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
+   `grants: [String]`      -   list of data points allowed to be accessed

``` {.json .numberLines}
{
    "endpoint": "https://$consumerId.system.tld",
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
data. In return the consumer is provided with all information that are required to request data 
access based on this permission request.
   
*Parameter(s):*
+   `desires: [String] || String`    -  list of endpoint selectors or query string, representing 
                                        what data is requested to get access to
   
*Request:* `https://$consumerId.system.tld/pr`

``` {.json .numberLines}
{
    "desires": "{profile{firstname,lastname},finance{bankAccounts}}"
}
```

*Response:* 

+   `type: String`          -   permission type (see [Permission Profile](#permission-profile))
+   `grants: String`        -   data query representing the data points allowed to be accessed

``` {.json .numberLines}
{
    "type": "one-time-only",
    "grants": "{profile{firstname,lastname}}"
}
```



##### Access Request {#spec_api_access-request}
leads to the actual data access, if the *[Access Verification](#access-verification)* does not 
refuse to let through.

*Parameter(s):*
+   `query: String`             -   data query representing the data that is requested to be 
                                    accessed
+   `type: String`              -   access type: `fwd` or `sce`
+   `program: Object`           -   [MUST if `type == 'sec'`]
    -   `mimeType: String`      -   MIME-Type (see [RFC 2046](https://tools.ietf.org/html/rfc2046))
    -   `extension: String`     -   file extension
    -   `file: String`          -   base64url-encoded file content
+   `reliable: Boolean`         -   indicates whether the consumer expects a proof of data 
                                    reliability or not
+   `respond: String`           -   `push` (returns immediately with information where to obtain the 
                                    result) or `keepalive` (keep connection open until response is 
                                    computed)
   
*Request:* `https://$consumerId.system.tld/ar`
``` {.json .numberLines}
{
    "type": "fwd",
    "reliable": true,
    "respond": "keepalive",
    "query": "{profile{firstname,lastname}}"
}
```

*Response:*

+   `pickup: String`    -   URL where to find the actual response
+   `duration: Number`  -   time in seconds until result SHOULD be available

``` {.json .numberLines}
{
    "pickup": "https://$consumerId.system.tld/ar/$procedureId",
    "duration": 43200,
}
```

*Request:* `https://$consumerId.system.tld/ar/$procedureId`
*Response:*

+   `expiresAt: Number`         -   date when data becomes outdated
+   `proof: String`             -   certificate that indicates verified data reliability
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

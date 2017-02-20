## Interfaces



+   graphical user interfaces
    -   management tool: web and mobile
    -   platform types
    -   feature list
+   registration
+   Operator APIs
+   for data consumers
    -   permission requests
    -   access request



__Registration Request__
+   contains certificate signing request
+   \[OPTIONAL\] contains *permission request*

``` {.json .numberLines}
{
    "csr": "TODO",
    "cb": "TODO",
    "access": [
        "profile.lastname"
    ]
}
```


__Permission Request__
+   creates new *permission profile*
+   `https://example-consumer.pdaas.tld/pr`

``` {.json .numberLines}
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
+   in case of plain forwarding, add an expiration date
+   `https://example-consumer.pdaas.tld/ar`

``` {.json .numberLines}
{
    "query": "TODO"
}
```
*Requirements:*
-   query has to match exactly one corresponding *permission profile*


*Response*
``` {.json .numberLines}
{
    "expiresAt": Date
}
```

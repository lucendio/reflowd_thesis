## Recommendations & Resources



This section provide additional information on hosting and operating such a system as well as 
further resources, that MAY be worth knowing. Moreover, it contains advices that are recommended to 
consider when implementing (parts of) this specification.



#### Host Environment(s) Recommendations

+   Depending on the technologies that are being used for the implementations, the environment 
    specifications MAY vary. Although, it SHOULD be feasible to expect at least around *2* cores, 
    *4GB* of memory and *60GB* of storage.

+   Unless server components are running in containers, it is not recommended to run other 
    applications on the same environment side by side.

+   a vendor, who hosts for multiple data subjects, one system instances, SHOULD NOT locate all of 
    them in one environment, but rather deploy a separate virtualization of an operating system for
    every instance.
    
+   the host environment (for the components) SHOULD install measures for detecting security 
    violations and breaches



#### Recommendations To Third Parties

+   If data consumers accessing data from more than one system instances representing different 
    individuals, it MAY considerable to use another key-pair and certificate for any of those 
    instances, and maybe even unique endpoints.
    
+   Data consumers SHOULD also provide a full-featured *endpoint* based on a subdomain, thereby a 
    bidirectional communication flow can be established, instead of the workaround based on callback 
    URLs.



#### Software Recommendations

+   letsencrypt (ACME implementation)
+   nginx (web server and load balancer)
+   systemd (process management)
+   rkt (OCI implementation)
+   Kubernetes (container orchestration
+   LibreSSL (cryptographic software library)
+   CouchDB (document-oriented database system focusing on real-time)
+   RethinkDB (graph-structured database system)
+   Prometheus (database system optimized for time series data)



#### Resources

+   [SSL and TLS Deployment Best Practices](https://github.com/ssllabs/research/wiki/SSL-and-TLS-Deployment-Best-Practices)
+   [Security/Server Side TLS](https://wiki.mozilla.org/Security/Server_Side_TLS)
+   [Strong SSL Security on nginx](https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html)
+   [GraphQL Specification - 3.1 Types](https://facebook.github.io/graphql/#sec-Types)

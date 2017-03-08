## Recommendations & Resources



This section provides additional information on hosting and operating such a system, as well as 
further resources that MAY be worth knowing. Moreover, it contains advice to consider when 
implementing (parts of) this specification.



#### Host Environment(s) Recommendations {-}

+   Depending on the technologies that are being used for the implementations, the environment 
    specifications MAY vary. Although, it SHOULD be feasible to expect at least around *2* cores, 
    *4GB* of memory and *60GB* of storage.

+   Unless server components are running in containers, it is not recommended to run other 
    applications in the same environment side by side.

+   A vendor, who hosts for multiple data subjects, one system instance each, SHOULD NOT locate all 
    of them in one environment, but rather deploy a distinct operating system (virtualization) for
    every instance, or separate them physically on different machines.
    
+   The host environment (for the system's server components) SHOULD offer measures for detecting 
    security violations and breaches.



#### Recommendations To Third Parties {-}

+   If data consumers are accessing data from more than one system instance, representing different 
    individuals, it MAY be wise to use different key-pairs and certificates for all instances, and 
    probably even unique endpoints.
    
+   Data consumers SHOULD also provide a full-featured *endpoint* based on a subdomain, thereby a 
    bidirectional communication flow can be established, instead of the workaround based on callback 
    URLs.



#### Software Recommendations {-}

+   letsencrypt (ACME implementation)
+   nginx (web server and load balancer)
+   systemd (process management)
+   rkt (OCI implementation)
+   Kubernetes (container orchestration
+   LibreSSL (cryptographic software library)
+   CouchDB (document-oriented database system focusing on real-time)
+   RethinkDB (graph-structured database system)
+   Prometheus (database system optimized for time series data)
+   Container Linux (open-source lightweight operating system, by CoreOS)



#### Resources {-}

+   [SSL and TLS Deployment Best Practices](https://github.com/ssllabs/research/wiki/SSL-and-TLS-Deployment-Best-Practices)
+   [Security/Server Side TLS](https://wiki.mozilla.org/Security/Server_Side_TLS)
+   [Strong SSL Security on nginx](https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html)
+   [GraphQL Specification - 3.1 Types](https://facebook.github.io/graphql/#sec-Types)

## Security



The following aspects are required measures in order to improve and ensure the overall sufficient 
security level of the system.



### Transport {-}
    
-   no HTTP allowed, all HTTP (80, 8080) --> must block all non-encrypted traffic (ports != 443)
-   HTTP/2 support for web gui
-   TLS configurations: which ciphers (e.g. use ciphers supporting PFS)
    -   TODO insert example nginx config
-   provide new dhparam for every endpoint

    
### Authentication {-}

-   PKI 'n' stuff
-   JWT
-   2-factor-auth (how?)


### System Architecture

+   distributed approach: location of PDS
+   Containerization


### Supervised Code Execution

-   no shared filesystem, no network


### System Monitoring

+   pattern recognition & anomaly detection for access requests (e.g. check if request come constantly from the same IP)
    -   does it matter from what origin the data request was made? how to check that? is the 
        requester's server domain in the http header?
        eventually there is no way to check that, so me might need to go with request logging and
        trying to detect abnormal behaviour/occurrence with a learning artificial intelligence
+   spam protection 

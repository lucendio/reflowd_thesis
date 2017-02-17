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

The following two authentication technologies MUST be supported by the system. 
2-Factor authentication is OPTIONAL an can be implemented either by email or if a mobile platform is
part of the system.


##### Transport Layer Security



##### JSON Web Token (JWT)

When using JWT, they MUST be encrypted JWE and signed JWS. Thus, `{"alg":"none"}` as header MUST NOT
be used.
If the operator fails to connect to the system before the token's expiration date has been exceeded,
the operator has login again. The token MUST be renewed, but at least after half of the period of 
validity has been reached. JWTs MUST be created and verified by the *Operator API*. The secrets and
keys for that purpose are stored in the *Persistence Layer*. Signature validation MAY get performed
by the *Web server*.

The following claims are REQUIRED:

+   `"exp"` (Expiration Time)
+   TODO

The following algorithms for the `"alg"` are REQUIRED:

+   TODO


##### 2-factor-auth (how?)


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

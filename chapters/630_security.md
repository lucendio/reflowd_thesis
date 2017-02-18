## Security



The following aspects are required measures in order to improve and ensure the overall sufficient 
security level of the system. Configurations mentioned below MAY change prospectively due to issues 
or vulnerabilities emerging in the future. 



### Transport {-}

All communications from and towards the system as well as internal communication between components 
located on different platforms MUST be established with *HTTP over TLS*. Thus, external third 
parties are only allowed to communicate with the system on port `443`, whereas internal 
communication runs through port `4223`. Port `80` MUST return HTTP Error `403 Forbidden` and all 
other ports SHOULD be blocked.

The key-pair used in TLS to agree on a mutual symmetric key, MUST be based on either the *RSA* or 
*DSA* cipher suite, although *RSA* SHOULD be preferred over *DSA*. All created keys MUST have a 
length of at least `4096` bits. The Ciphers for TLS, that support *Perfect Forward Secrecy* SHOULD 
be preferred, but ciphers not supported by `TLSv1.2` MUST be avoided. Evey endpoint and all other 
dedicated entry points MUST provide their own generated Diffie-Hellman groups with a minimal length 
of `4096` bits.

For web-based GUIs *TLS session resumption* SHOULD be activated, but for *endpoints* it MUST be 
deactivated. Web-based GUIs MUST NOT depend on external resources. All involved assets MUST be 
stored in the system and thus get served by the *web server* as well. This required behaviour is 
enforced by utilizing the *Content Security Policy (CSP)* in HTTP headers. The *web server* MUST 
facilitate a web socket connection fFor web-based GUIs. If a browser does not support those 
natively, a fallback SHALL be provided by the GUI. Furthermore, those GUIs SHOULD be served with 
HTTP/2.

The subsequent examples show two Nginx configuration for the *web server*, implementing the previous 
specifications.

__[Code 01: web server configuration for a web-based GUI (excerpt)]{#spec_code-01_nginx-config-web-gui}:__
``` {.ngix .numberLines}
server {
    server_name gui.system.tld;

    listen 4223 ssl http2;
    listen [::]:4223 ssl http2 ipv6only=on;
    
    ssl_trusted_certificate /path/to/public-ca.tld.crt.pem;
    ssl_certificate         /path/to/gui.system.tld.crt.pem;
    ssl_certificate_key     /path/to/gui.system.tld.key.pem;
    ssl_dhparam             /path/to/gui.system.tld.dhp.pem;
    
    ssl_prefer_server_ciphers on;
    ssl_protocols TLSv1.2;
    ssl_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:
        ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:
        ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:
        ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:
        ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:
        ECDHE-RSA-AES128-SHA256';

    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 5m;
    
    add_header Strict-Transport-Security "max-age=15768000" always;
    add_header Content-Security-Policy "default-src 'self'";
}
```

\ \ 

__[Code 02: web server configuration for a consumer endpoint (excerpt)]{#spec_code-01_nginx-config-consumer-endpoint}:__
``` {.nginx .numberLines}
server {
    server_name CONSUMER_ID.system.tld;
    
    listen 80;
    listen [::]:80 ipv6only=on;
    
    return 403;
}

server {
    server_name CONSUMER_ID.system.tld;
    
    listen 443 ssl http2;
    listen [::]:443 ssl http2 ipv6only=on;
    
    ssl_trusted_certificate /path/to/system.tld.crt.pem;
    ssl_certificate         /path/to/CONSUMER_ID.system.tld.crt.pem;
    ssl_certificate_key     /path/to/CONSUMER_ID.system.tld.key.pem;
    ssl_dhparam             /path/to/CONSUMER_ID.system.tld.dhp.pem;
    
    ssl_verify_client on;
    ssl_client_certificate  /path/to/CONSUMER_ID.crt.pem;
    
    ssl_prefer_server_ciphers on;
    ssl_protocols TLSv1.2;
    ssl_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:
        ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:
        ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:
        ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:
        ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:
        ECDHE-RSA-AES128-SHA256';
    
    ssl_session_cache off;
    
    add_header Strict-Transport-Security "max-age=15768000" always;
}
```


### Authentication {-}

The following two authentication technologies MUST be supported by the system. 2-Factor 
authentication as an enhancement of the operator authentication procedure is OPTIONAL and can be 
implemented either by email or if a mobile platform is part of the system.


##### Transport Layer Security

Before the first consumer tries to register on the system, the system MUST generate a key-pair and 
sign it by itself. With the resulting certificate the system becomes a private Certificate Authority
primarily responsible for signing certificates that are required for every endpoint, and maybe even 
for connections between mobile and server platforms.
The key-pair for a specific endpoint is then used to issue a certificate based on the 
*Certificate Signing Request (CSR)*, supplied by the consumer, who is associated to that very 
endpoint. The certified certificate and the endpoint's certificate MUST then be transferred to the
consumer on a secure channel, which the consumer is responsible to provide (e.g. HTTP over TLS 
certified by trusted public CA, or by a self-signed certificate provided with the registration). 

In order to use TLS for bidirectional authentication, not only the client (consumer) MUST be able to 
verify the server's (system) certificate, also the server MUST do the same for the client. This 
procedure is known as *two-way authentication*, which is part of the TLS connection establishing.
If the connection failed to establish the authentications has failed, and vice versa the consumer
has successfully authenticated to the system.


##### JSON Web Token (JWT)

When using JWT, `{"alg":"none"}` as header MUST NOT be used. A JWT MAY be encrypted (JWE). If the 
operator fails to connect to the system before the token's expiration date has been exceeded, the 
operator is REQUIRED to login again. The token MUST be renewed, but at least after half of the 
period of validity has been reached. JWTs MUST be created and verified by the *Operator API*. The 
secrets and keys for that purpose are stored in the *Persistence Layer*. Signature validation MAY 
get performed by the *Web server*.

The following claims are REQUIRED:

+   `"iss"` (Issuer) - domain from which the front end component obtains its data
+   `"sub"` (Subject) - front end platform name; MUST be system-wide unique
+   `"aud"` (Audience) - `"operator"` or `"contributor"` 
+   `"exp"` (Expiration Time)
+   `"iat"` (Issued At)
+   `"jti"` (JWT ID)

One of the following algorithms is REQUIRED (for the `"alg"` header):

+   `"HS512"`           (key length: 512 bits)
+   `"RSA1_5"`          (recommended key length: 2048 bits)
+   `"RSA-OAEP-256"`    (recommended key length: 2048 bits)
+   `"A256KW"`          (recommended key length: 2048 bits)



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

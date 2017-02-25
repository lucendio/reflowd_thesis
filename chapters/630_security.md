## Security



The following aspects are required measures in order to improve and ensure the overall sufficient 
security level of the system. Configurations mentioned below MAY change prospectively due to issues 
or vulnerabilities emerging in the future. 



### Transport

All communication from and towards the system as well as internal communication between components 
located on different platforms MUST be established with *HTTP over TLS*. Thus, external third 
parties are only allowed to communicate with the system on port `443`, whereas internal 
communication runs through port `4223`. Port `80` MUST return HTTP Error `403 Forbidden` and all 
other ports SHOULD be dropped or blocked.

The key-pair, used in TLS to agree on a mutual symmetric key, MUST be based on either the *RSA* or 
*DSA* cipher suite, although *RSA* SHOULD be preferred. All created keys MUST have a length of at 
least `4096` bits. Those ciphers for TLS, that support *Perfect Forward Secrecy* SHOULD be 
preferred, but ciphers that are not supported by `TLSv1.2` MUST be avoided. All endpoint and other 
dedicated entry points MUST provide their own generated Diffie-Hellman groups with a minimal length 
of `4096` bits.

For web-based GUIs *TLS session resumption* SHOULD be activated, but for *endpoints* it MUST be 
deactivated. Web-based GUIs MUST NOT depend on external resources. All involved assets MUST be 
stored in the system and thus get served by the *web server*. This required behaviour is enforced by 
setting the *Content Security Policy (CSP)* in HTTP headers, which also eliminates the risk of 
Cross-site scripting (XSS) attacks. The *web server* MUST facilitate a web socket connection for 
web-based GUIs. If a browser does not support this natively, a fallback SHALL be provided by the 
GUI. Furthermore, those GUIs SHOULD be served with HTTP/2.

The subsequent examples show two Nginx configurations for the *web server* component, implementing 
the specifications from above.

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


### Authentication

The following two authentication technologies MUST be supported by the system. 2-Factor 
authentication as an enhancement of the operator authentication procedure is OPTIONAL and can be 
implemented either by email or with a mobile platform, if it is part of the system.


#### Transport Layer Security

Before the first consumer tries to register on the system, the system MUST generate a key-pair and 
sign it by itself. With the resulting certificate the system becomes a private Certificate Authority
primarily responsible for signing certificates that are required for every endpoint, and maybe even 
for connections between mobile and server platforms.
The key-pair for a specific endpoint is then used to issue a certificate based on the 
*Certificate Signing Request (CSR)*, supplied by the consumer, who is associated to that very 
endpoint. The certified certificate and the endpoint's certificate MUST then be transferred back to 
the consumer on a secure channel, which the consumer is responsible to provide (e.g. HTTP over TLS 
certified by trusted public CA, or by a self-signed certificate provided with the registration). 

In order to use TLS for bidirectional authentication, not only the client (consumer) MUST be able to 
verify the server's (endpoint) certificate, also the server MUST do the same for the consumer. This 
procedure is known as *two-way authentication*, which is part of the TLS connection establishing.
If the connection failed to establish, the authentications has failed, and vice versa has the 
consumer successfully authenticated to the system.


#### JSON Web Token (JWT)

When creating a JWT, the `"alg"` in the header MUST NOT be set to `"none"`. A JWT MAY be encrypted 
(JWE). JWTs MUST be created by the *Operator API*. Validation MAY be performed by *Operator API* or
*Web server*. Secrets and keys for that purpose are stored in the *Persistence Layer*. As long as 
the token is not encrypted, every token MUST associate its own secret key for the HMAC computation.

When authenticating, the JWT MUST be provided either as HTTP header (`Authorization: Bearer $JWT`)
or as a query parameter indicated by the key `t`. If the operator fails to connect to the system 
before the token's expiration date has been exceeded, the operator is REQUIRED to login again. The 
token MUST be renewed, but at least after half of the validity period is reached. The period, in 
which the token is valid, SHOULD be 24 hours but MUST NOT exceed 48 hours.

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

The centralized version of the system architecture places every component into the server platform. 
Even the web-based management tool, which later is fetched onto front end platforms, initially is 
stored there. This means, all the operator's personal data is located somewhere in the 'cloud', 
probably out of reach, and potentially vulnerable to unauthorized access. Whereas the distributed 
approach allows for example to re-locate the *Personal Data Store* component to a mobile platform,
which as well might be used by the operator to manage the system. The general approach of a more 
distributed deployment of components SHOULD reduces the vulnerability for certain scenarios and 
makes it harder for entities to compromise (parts of) the system. 
As long as all requirements are met and every component is completely functional and thus the system 
as a whole, any component MAY be located on whatever platform is sufficient.

A second approach to gain not only portability, but also to increase the overall level of 
security is to isolate components [and their process(es)] from the surrounding platform environment. 
This enables explicit and controlled allocation of resources, such as memory, CPU usage or network
and filesystem access. This concept MUST be implemented by either using the process isolation 
features provided by the host environment, namely *cgroups*, *namespaces* and *systemd-nspawn*, or 
by putting components into application containers. The latter is RECOMMENDED and MUST respect all 
*Open Container* Specifications. An orchestration software MAY be useful to manage all containers. 



### Supervised Code Execution *(SCE)*

When running programs on the server platform provided by consumers, it is REQUIRED to solely execute 
them after putting them into an application container (see 
[System Architecture](#system-architecture)). This implies to provision the container first and then 
invoke it by providing the requested data items as arguments. The container MUST NOT be allowed to 
access the host's filesystem or network. Before running the container with the actual data, it MUST
be executed several times with generated test data. If the program is provided as source code, it
MUST be automatically inspected and reviewed. If one of those test layers result insufficiently, 
processing the access request MUST abort and return with a failure information.



### System Monitoring

The *Tracker* component MUST ensure that the following information are being persisted *(required 
fields for those information are defined in [Data and Types](#data-and-types))*:

+   Access Requests (regardless of its success)
+   failed Access Verifications
+   Registrations of consumers (regardless of its success)
+   Results of operator Authentications
+   Permission Profile creation, manipulation and deletion
+   SCE (regardless of its success)
+   any third party request attempt arriving at the web server
+   Server Resources (continually)
 
To make sure, that these data is collected, other components MUST provide the *Tracker* with such 
information. Therefore, components such as *Operator API*, *Permission Manager* and *Web server*, 
MUST push information towards the *Tracker*. 
By performing pattern recognition & anomaly detection, the *Tracker* is then able to recognize 
abnormal behaviour or occurrence, for example by monitoring the IP of an access request origin, 
which normally should not change very often. Such data MAY also help to prevent spam requests. If 
the *Tracker* finds suspicious patterns, the operator MUST be notified via email and push 
notification.   

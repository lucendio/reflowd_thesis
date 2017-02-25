## Attack Scenarios



If only briefly, previous sections already mentioned a few potential attack types and 
vulnerabilities of the system, such as man-in-the-middle attacks that are possible during connection
establishment and data transfer, or session hijacking which can be done by stealing the JWT used to 
authenticate privileged entities to the system. Attack vectors causing those and other scenarios 
as well as possible and feasible counter-measures are discussed in detail within this section.



Initially however, it is to identify what motivation(s) would drive such attacks. The first and 
probably the most dangerous one appears to be *Digital Identity Theft*. Thereby the attacker 
impersonates the individual that was originally associated to the system. Then data consumers, 
though, have the misleading impression, that everything the intruder does with the *PDaaS* still 
happens on behave of the data owner herself. Such control can be abused for vicious data changes to 
harm the physical counterpart or the access can simply be exploited to unopposedly extract the 
individual's personal data. The more data the system contains and the more purposes it serves, the 
more power can be gained by controlling it. Those motivations are extrinsically driven by third 
parties, whereas intrinsic and mostly unintended damage can be caused by system or human failure, 
which may lead, for example, to data loss or irrecoverable system access.

As the name states, in a man-in-the-middle attack the transferred content of a communication is 
intercepted and possibly tampered with, while the participants not noticing any of that. A common 
solution here is to encrypt and sign the content before transferring it. For HTTP communication this 
is implemented by the *Transport Layer Security (TLS)*. The crux here is to move from an unencrypted
to an encrypted connection. This upgrade procedure involves the *Diffie-Hellman-Key-Exchange* to 
agree on a pre-shared key and certification based on *asymmetrical cryptography* for authentication. 
The procedure starts i.a. with the server-role presenting the client-role with its certificate 
*while the connection is still insecure*. This is essential, because the connection is still 
insecure, a man-in-the-middle attack is possible at that time. In order to prevent that and to 
ensure the trustworthiness of that certificate, the client has to verify the certificate. This is 
done by using an installed certificate from a trustful public CA, that has issued and therefore 
trusted the server's certificate, to examine its chain of trust.
But since HTTPS connections between data consumers and the system rather use certificates that are 
issued by the system itself instead of relying on CA-certified certificates, there is no chain of 
commonly trusted entities, that can verify the presented certificates. So in order to still trust
those certificates, even though they are sent on a insecure channel during the connection 
establishment, they have to be handed over in private sometime before. This is defined in the  
registration process, where the consumer either presents a QR-Code served via publicly certified 
HTTPS, which he is responsible for but can easily verified by the data subject, or submits the 
registration request including the CSR to a URL provided by the data subject that is also reachable 
only by publicly certified HTTPS. The server then issues the certificate and sends it - alongside 
with its own certificate - back to the consumer via publicly certified HTTPS, too. The consumer is 
able to trust the server certificate and can even pin it to detect fictitious certificates he might 
get presented with. 
This approach enables not only confidentiality and integrity of the data exchanged between consumer 
and data subject, but by enforcing *two-way authentication* authenticity of the respective opposite 
is provides to both parties as well. While other HTTP connections via TLS may still rely on 
certificates signed by publicly trusted CAs, regular key change and certificate renewal has therefor 
to be ensured.

Another aspect of the system, that could be vulnerable to certain attacks, is the authentication 
mechanism used by the data subject to log into her management tool. A JSON Web Token, also 
containing all session information, serves as the key. As mentioned before, such connections are 
forced to be established only by TLS. So from this perspective the JWT is no less or more secure 
than any other type of credentials. Though, this doesn't prevent the token from being usable to the 
attacker once it is stolen. A short expiration date, equally to a session timeout, and token 
invalidation cycle, which is the same as forced logout, can reduce the potential harm an incident 
like this may cause. Furthermore the integration of 2-factor authentication hardens the 
authentication procedure. But in order to not introduce another dependency, namely an external 
service providing such functionality, 2-factor authentication is only supported, when a mobile 
device is associated to the *PDaaS*.
Further precautions can be taken by preventing attackers from getting in the near of such token, 
referring to *cross-site scripting (XSS)*, to which web-based graphical interfaces are vulnerable 
to. Approaching this issue means to abandon external resources providing parts of the interface
and instead store all content on the server platform and serve it with the system's own web server.
Even if that means an increased load time caused by the browser constrains of how content is loaded,
which isn't an issue in HTTPS/2 anymore.

The approach of running consumer-provided programs locally in order to prevent personal data from 
leaving the system represents a key part in this work, but it also raises major security concerns. 
To address those concerns such a program is executed in an application container, which encapsulates
the runtime from the host environment and allows to restrict resource access, such as network, 
filesystem or computing power, to the required minimum. This concept, previously introduced as 
*Supervised Code Execution* forms a containment layer preventing security breaches towards the host
environment, which ultimately means a great security enhancement.
Nevertheless, it makes involved components and dependencies vulnerable for almost any security flaw 
that they might carry in. Therefore it is vital to keep all related software up to date, which 
probably means enabling automated update mechanisms. That again introduces yet another type of 
attack vectors, which can be depressed by only using signed and trusted software and resources.

When it comes to personal data, existing social networks and other great platforms, founded on 
user-generated content have already become de facto data silos, and thus a single point of failure.
A more decentralized approach, for example the here proposed concept would result in, diminishes the 
impact of potential security breaches, those platforms may experience. While from an global 
perspective this can be valued as a step in the right direction, from the perspective of a data 
subject instead, a *PDaaS* instance still represents a single point of failure as well. But in order 
to provide most control over the own personal data, this design choice appears to be the logical 
consequence. Besides that, several system components are highly portable, so that more sensitive 
parts, like the *Personal Data Store*, can be relocated away from the server platform into the data 
owner's mobile device. In this case, for example a JWT issued by the *PSD* can be used to 
authenticate the access to personal data. 

However, those measures are still no guarantee for a comprehensive security protection. The only way 
is to continuously improve the system and provide mechanisms to securely recover from any type of 
incident. Not least that's why a complete open (source) development is enforced from the start, 
because vulnerabilities can easy be disclosed and hence addressed immediately. 



*__Conclusions:__*
Securing data transport and storage are the two pivotal aspects to focus on. Choosing self-singed 
certificates over publicly trusted CAs in order to not only encrypt but also reasonably authenticate 
the consumer-system communication requires to make sure that the preliminary transfer of the 
certificates is not compromised, so that both parties can safely rely on them. Settings for any 
cryptographic procedure regarding their expense have to be chosen in favour of increasing the level 
of security instead of reducing resources and cost. The general mindset for this project is to 
rather utilize long proven libraries and technologies instead of using own implementations for
cryptographic concepts and algorithms. Nevertheless, ongoing reviewing and re-evaluation of those 
dependencies as well as the software itself is mandatory.

As a future enhancement it is planned to integrate an *intrusion detection system* into the server 
platform's host environment, even though all server components are recommended to be encapsulated 
by containers. Monitoring transactions and events on the application-level is already part of the 
system architecture, facilitated by the *Tracker* component.
Furthermore it is considered to apply full storage encryption to the *Personal Data Storage*, which 
would result in major security improvements. Therefore, when the personal data is located on the 
server, it should stay secure, even if the system is compromised. In return, the system might lose 
convenience in user interaction.
It essentially comes down to an act of balance between security and convenience. Not much security 
measure or mechanism can be simplified or abstracted while not violating other (general) values at 
the same time. Key is to find the right compromise for the right motive.

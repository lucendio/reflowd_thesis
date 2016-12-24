## Data



+   keep in mind to make it all somehow extendible, e.g. by using and storing 
    corresponding schemas


+   NOTE: step numbers marked with a `*` are somehow tasks which are happening in the background 
    and don't require any user interaction



### Modelling



### Categories (or Classes)



### Types



### Persistence

+   database requirements



### Access & Permission

+   data needs to have an expiration date

__IF01 - Authorizing a data consumer to request certain data__
1)  operator creates a new endpoint URI (like *pdaas.datasubjectsdomain.tld/e/consumer-name*) within 
    the *management user interface*
2)  operator passes this URI on to the *consumer*, e.g. through submitting a form or using any 
    arbitrary, eventually insecure channel
3*) consumer need to call this URI for the fist time to verify it's authenticity 
4)  operator then get's a notification which asks her for permissions to access certain data under the 
    listed conditions
5*) consumer will be informed about the outcome of the operator's decision (NOTE: alongside with 
    some details? how do they look like? XXX need to be in the spec)



### Consumption (data inflow)

+   how data will get into the system
+   hwo is the user able to do that, and how does it works


#### Manually

#### Automatically



### Emission (data outflow)

+   depending on what category of data, they might need to get anonymized somehow before they 
    leave the system
    
+   oAuth (1.0a and 2) requires consumers to register upfront. Since the current flow indicates
    that the initial step is done by the owner, that would cause an overhead in user 
    interactions. Although the owner already *authorized* the consumer simply by submitting a 
    unique URI (`pdaas-server.tld/register?crt=CONSUMER_REGISTER_TOKEN`), of which the `crt` 
    is considered private.
    Even though the registration provides the consumer with mandatory information such as a 
    consumer identifier (v1: `oauth_consumer_key`, v2: `client_id`) and, depending on the client 
    type, a secret (see https://tools.ietf.org/html/rfc6749#section-2), this process it is not 
    part the specification (https://oauth.net/core/1.0a/#rfc.section.4.2, 
    https://tools.ietf.org/html/rfc6749#section-2). This enables the possibility of integrating 
    oAuth into the consumer registration flow by using the `CONSUMER_REGISTRATION_TOKEN` as
    oAuth's *client identifier*. The lack of credentials (v1: `auth_consumer_secret`, 
    v2: `client_secret`) would require transferring the consumer identifier done over
    a secure channel (e.g. TLS). That would leave *oAuth2* as the version of choice, since it
    relies on *HTTPS* adn therefore makes the *secret* optional. Where on the other side
    oAuth 1.0a requires a *secret* to create a signature in order to support insecure connections..

+   A general and URI for 3rd parties to register (aka requesting authentication) would raise 
    the issue of dealing with spam request and how to distinct these from the actual ones.



### History

+   data versioning
+   access logs

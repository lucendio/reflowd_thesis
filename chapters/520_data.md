## Data



+   keep in mind to make it all somehow extendible, e.g. by using and storing 
    corresponding schemas



### Modelling



### Categories (or Classes)



### Types



### Persistence

+   database requirements



#### Access & Permission

+   data needs to have an expiration date



### Consumption (data inflow)

+   how data will get into the system
+   hwo is the user able to do that, and how does it works


#### Manually

#### Automatically



### Emission (data outflow)

+   depending on what category of data, they might need to get anonymized somehow before they 
    leave the system
    
+   oAuth2 is sadly no option to use for the 3rd-party authorisation protocol, even though their
    have some ideas and steps in common. Registering the client up-front would mean an overhead
    in the user's interaction, sine the user already has *authorized* the 3rd party simply by
    submitting a unique URI, which is considered private. A general and public endpoint for
    3rd parties to register (aka requesting authentication) would raise the issue of dealing with
    spam request and how to distinct these from the actual ones.
+   oAuth 1.0a on the other hand might be providing sufficient flexibility, because "(the
    process and requirements for provisioning Consumer Key and Consumer Secret are entirely up to
    the Service Provider)[https://oauth.net/core/1.0a/#rfc.section.4.2]"



### History

+   data versioning
+   access logs

## Data & Types


+   abstraction concept (GraphQL)
+   areas of applications (excerpt)
    +   profile data
    +   sensor data (e.g. geo-location, motions)
    +   financial record (and history)
    +   payment information
    +   medical record
    +   governmental data
    +   biometric datasets (e.g. finger print, retina)
    +   web search history
    +   what about user-created content, like pictures, videos or blog posts?
+   primitives and structs
+   minimum feasible types
+   structs as add-ons
+   data models (PL)
    -   registration
    -   endpoint (relation to the key and file)
    -   permission profile
        +   permission type 
        +   max/min interval (how often)
        +   block all on this endpoint until further notice

### Structure & Types

*NOTICE: required fields are implicit and therefore not marked as such, but any other notation is 
explicit*

+   henceforth only two things: primitive and struct
+   supported date types

+   Tracker:
    -   access-request
        -   `tsin: Number` - timestamp of occurrence
        -   `tsout: Number` - timestamp of response
        -   `type: String` - access type (`sce`,`cp`)
        -   `query: String` - data query
        -   `state: String` - current state of proceeding
        -   `endpoint: String` - endpoint on which the request came in
        -   `header: String` - consumer's HTTP header
        -   `result`: result of SCE [OPTIONAL]
    -   access-validation
        -   `access-request: String` - reference to access request
        -   `reason: String` - why has the verification failed  

### Read

+   permission profiles
    +   type
    +   how often
    +   what data
    +   expiration of the data (in case of plain fwd)

### Write

(!) every data or configuration change has to be reversible


precision of data: demanding lower precision than the *data subject* has approved is always 
possible. The other ways around not.

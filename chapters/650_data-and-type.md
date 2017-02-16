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

+   henceforth only two things: primitive and struct
+   supported date types

### Read

+   permission profiles
    +   type
    +   how often
    +   what data

### Write

(!) every data or configuration change has to be reversible


precision of data: demanding lower precision than the *data subject* has approved is always 
possible. The other ways around not.

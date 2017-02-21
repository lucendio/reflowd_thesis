## Data & Types



The system is aware of two different classes of data - personal data and system data. The latter is
stored within the *Persistence Layer* and represents the current state of the system, whereas all the 
personal data, that reflects the Digital Identity of the operator and is maintained and also 
provided by the *Personal Data Store*.



### Personal Data {-}

The *PDS* is portable and can be placed on any of the platform types supported by the system, 
whereas data queries typically originate in a server platform. In order to provide such flexibility, 
and unless editing personal data happens on the same platform instance on which the data is also 
stored, access to the *PDS* MUST be abstracted. This design approach can be implemented by utilizing
GraphQL's native architecture, which is - aside from its generic graph-structured query language - 
primarily characterized by its separation of validation and execution. The execution level requires
adapters for every database system the PDS have to support, while the validation is agnostic 
regarding a query origin. That is, the underlying database system can be swapped, or various 
database systems can run side by side. A universal query languages has also the advantages of 
being effortless re-applicable to a different storage system and being able to revert every data 
change. Therefore it is REQUIRED to store every writing query chronological, alongside the current 
state of the personal data.


*Additional requirements are:*

a)  precision of data, accessed by consumers must be adjustable (e.g. cut fractional digits, 
    decrease sampling rate of time series datasets)    
b)  store and fetch binary data
    
    
*Suitable Areas or Scenarios of Application (excerpt):*

+   core/master/profile data of an individual
+   biometric data (e.g. finger print, retina)
+   financial record (and history)
+   sensor data (e.g. geo-location, motions, IoT)
+   payment information
+   medical record
+   governmental data
+   user-generated content (blog posts, comments, pictures, videos, etc.)
+   web search or browsing history
+   consume behaviors (e.g. watchlist, music playlist)



### System Data {-}

The *PL* consists of multiple storage technologies and MUST be placed on a trusted platform type, 
a server. At least TWO technologies MUST be supported; the platform's filesystem, which SHOULD be 
accessible by other components on that platform, and a document-oriented storage system that 
provides high flexibility through a schema-free approach and MUST also shared among several 
components. It is OPTIONAL, if the *Tracker* uses the same storage system, multiple ones or a 
complete different storing mechanism. Regardless, they are all summarized under the 
*Persistence Layer* component.


Additional requirements are:

a)  configurations and application data (e.g. permission profile) MUST be reversible



### Structure & Types

*NOTICE: Required fields are implicit and therefore not marked as such. Any other notation is 
explicit, though.*

+   henceforth only two things: primitive and struct
+   supported date types

+   primitives and structs
+   minimum feasible types
+   structs as add-ons



### Data Models {-}


-   registration
-   endpoint (relation to the key and file)
-   permission profile
    +   permitted data endpoints; 
    +   associate to specific *endpoint*
    +   permission type 
    +   max/min interval (how often)
    +   expiration date of an access request, granted based on that profile
    +   block all on this endpoint until further notice


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

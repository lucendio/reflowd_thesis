## Data & Types



The system is aware of two different classes of data - personal data and system data. The latter is
stored within the *Persistence Layer* and represents the current state of the system, whereas all the 
personal data, that reflects the Digital Identity of the operator, is maintained and also provided 
by the *Personal Data Store*.



### Personal Data {-}

The *PDS* is portable and can be placed on any of the platform types supported by the system, 
whereas data queries typically originate in a server platform. In order to provide such flexibility, 
and unless editing personal data happens on the same platform instance on which the data is also 
stored, access to the *PDS* MUST be abstracted. This design approach can be implemented by utilizing
GraphQL's native architecture, which is - aside from its generic graph-structured query language - 
primarily characterized by its separation of validation and execution. The execution layer requires
adapters for every database system the PDS has to support, while the validation is agnostic 
regarding the query origin. That is, the underlying database system can be swapped, or various 
database systems can run side by side. A universal query languages has also the advantages of 
being effortless re-applicable to a different storage system and being able to revert every data 
change. Therefore it is REQUIRED to store every writing query chronologically, next to the current 
state of the personal data.


*Additional requirement(s) are:*

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

The *PL* consists of multiple storage technologies and MUST be placed on a trusted platform type - 
a server. At least two technologies MUST be supported; the platform's filesystem, which SHOULD be 
accessible by other components on the same platform, and a document-oriented storage system that 
provides high flexibility through a schema-free approach and MUST be shared as well among several 
components. It is OPTIONAL, if the *Tracker* uses the same storage system, multiple ones or a 
completely different storing mechanism. Regardless, they are all unified under the 
*Persistence Layer* component.


*Additional requirement(s) are:*

a)  configurations and application data (e.g. permission profile) MUST be reversible



### Structure & Types of Personal Data

The type system, on which all personal data is based on, MUST be compatible with the type system
provided by GraphQL. The subsequent definitions represent the least set of features that a type 
system for personal data MUST acknowledge in any implementation.


`[primitive]`

: most basic or atomic data type, consisting of just a single value that is either defined as 
  `String`, `Boolean`, `Integer`, `Float` or `null`, which are `primitives` by themselves; 
  *(corresponding to GraphQL's `Scalar`)* 


`[struct]`

: combines multiple types in order to define more complex types; typically composed of `primitives` 
  and organized as (nested) *Object(s)* or *List(s)*; can consist of other structs as well


The *Storage Connector* MUST support a basic set of `primitives` and `structs` right from the start,
in order to reduce the effort when making first steps with the system. The following types are 
initially REQUIRED:


#### Primitives:

+   `ID`
+   `Date`
+   `Email`
+   `Domain`
+   `PhoneNumber`
+   `URL`


#### Structs:

+   `Position`
+   `File`
+   `Address`
+   `Unit`
+   `Product`
+   `Diseases`
+   `Treatment`
+   `Organisation`
+   `Route`
+   `CV`
+   `Contact`
+   `Transaction`


Other *structs*, that might become needful over time, can either be created and modeled by the 
operator herself or are developed and provided by community members and other third parties, so 
that unsupported types just need to be imported into the system.



### Data Models for System Data {-}

Aside from personal data, whose structure is adjustable by the *data subject* to suit her needs, the 
system itself REQUIRES some data models as well in order to provide i.a. mechanisms for managing 
the process of accessing data. Those models are outlined below.

The types that MUST be supported by the *PL* are similar to the *primitives* available in the Query 
Language, but somewhat more rudimentary: `String`, `Boolean`, `Number`, and `null`. Everything 
beyond this depends on the technologies that are being used. 


*NOTICE: Required fields are implicit and therefore not marked as such. Any other notation is 
explicit, though. The indicated value types are minimum viable; if supported, a more precise one 
SHOULD be used.*


#### Endpoint

+   `name: String`                  -   full valid subdomain name
+   `consumer: String || Object`    -   consumer information || name 
    -   `name: String`              -   readable and descriptive consumer name 
    -   `description: String`       -   [OPTIONAL] consumer description provided during registration
+   `crt: String`                   -   endpoint's certificate (filesystem path or file content)
+   `key: String`                   -   endpoint's private key (filesystem path or file content)
+   `ccert: String`                 -   consumer's certificate (filesystem path or file content)


#### Permission Profile

+   `data: [String]`            -   [MUST if `query == undefined`] list of permitted data endpoints
+   `query: Object || String`   -   [MUST if `data == undefined`] query, representing permitted data
+   `endpoint: String`          -   associating endpoint
+   `type: String`              -   how long the profile is valid
    -   `: one-time-only`
    -   `: expires-on-date`
    -   `: until-further-notice`
+   `expiresAt: Number`         -   [MUST if type == `expires-on-date'`] date of expiration
+   `interval: Object`          -   least amount of time between two access requests
    -   `value: Number`         -   time value
    -   `unit: String`          -   unit of time value
+   `createdAt: Number`         -   date of creation of this profile
+   `disbaled: Boolean`         -   [OPTIONAL] disabled until further notice
+   `access: String`            -   [OPTIONAL] access type: `fwd` (plain forward) or `sce` 
                                    (supervised code execution)
+   `dataExpiration: Number`    -   [SHOULD if access == `'fwd'`] date of when responded data 
                                    becomes outdated and thus unreliable


#### Notification

*NOTICE: MUST be encrypted, if is sent via Push Notification Service*

+   `oid: String`       -   identifier of what this notification has triggered
+   `type: String`      -   type of procedure/occasion 
+   `message: String`   -   information, that is presented to operator
+   `payload: String`   -   anything, that can be serialized into a string (e.g. JSON, containing
                            information about a related procedure)


#### Tracker

*Collection:* `registrations`
+   `id: String`        -   identifier of this document 
+   `csr: String`       -   certificate signing request
+   `callback: String`  -   callback URL for submitting registration response
+   `crt: String`       -   [OPTIONAL] certificate for callback URL, if not publicly trusted
+   `pr: Boolean`       -   was permission request included?
+   `header: String`    -   third party's HTTP header
+   `tsin: Number`      -   timestamp of occurrence

*Collection:* `access-requests`
+   `id: String`                -   identifier of this document 
+   `tsin: Number`              -   timestamp of occurrence
+   `tsout: Number`             -   timestamp of response
+   `type: String`              -   access type: `fwd` (plain forward) or `sce` (supervised code 
                                    execution)
+   `program: String || Object` -   [MUST if `type == 'sec'`] filesystem path or file content that 
                                    facilitates supervised code execution
+   `data: [String]`            -   [MUST if `query == undefined`] list of permitted data endpoints
+   `query: Object || String`   -   [MUST if `data == undefined`] query representing permitted data 
+   `state: String`             -   current state of proceeding
    -   `: 'handling'`          -   pre-process access request
    -   `: 'verifying'`         -   verify against existing permission profiles
    -   `: 'obtaining'`         -   query data from *PDS* 
    -   `: 'adjusting'`         -   apply precision rules
    -   `: 'responding'`        -   hand over generated result back to consumer
+   `endpoint: String`          -   endpoint on which the request came in
+   `header: String`            -   consumer's HTTP header
+   `result: String`            -   [MUST if access == `'sce'`] serialized result of *SCE*
+   `responseMethod: String`    -   how the system should submit he response to the consumer 
                                    (`keepalive` or `push`)
+   `verifyReliability: Boolean` -  indicate in response, that obtained data is reliable/authentic 

*Collection:* `failed-access-verifications`
+   `id: String`            -   identifier of this document 
+   `requestId: String`     -   reference to `access-request` ID
+   `reason: String`        -   why has the verification failed (e.g. error or refused message)


#### System Configurations and Defaults__

| Key                     | Primitive | Default           | Description                            |
|:-----------------------------------|:----------|:-----------:|:----------------------------------|
| `dataExpiration`        | Number    | *now + 48 hours*  | see *Permission Profile* above         |
| `accessResponseMethod`  | String    | `'push'`          | see *Collection:* `access-requests`    |
| `accessResponseTimeout` | Number    | `120`             | timeout of access response in sec.     |
| `accessType`            | String    | `'sce'`           | see *Permission Profile* above         |
| `notifyInGui`           | Boolean   | `true`            | notify in management tool              |
| `notifyByMail`          | Boolean   | `true`            | notify via email                       |
| `notifyOnRegistration`  | Boolean   | `true`            | notify on incoming registration        |
| `notifyOnPermission`    | Boolean   | `true`            | notify on incoming permission request  |
| `notifyOnAccess`        | Boolean   | `false`           | notify on incoming access request      |
| `notifyOnViolation`     | Boolean   | `true`            | notify on violations of access rules   |
| `notifyOnAnomaly`       | Boolean   | `true`            | notify if *Tracker* recognizes anomaly |
| `notifyOnError`         | Boolean   | `false`           | notify on unexpected errors in system  |
| `notifyOnError`         | Boolean   | `false`           | notify on unexpected errors in system  |
| `notfyIfNotReliable`    | Boolean   | `false`           | notify on failed reliability check     |

Table: Global System Configurations and their default values {#tbl:spec_system-default-config} 

## Components



##### Web server 
an interface to (or proxy for) server components

a)  process incoming traffic originating by operator, consumer and third parties
b)  all other server components are reachable only through this component
c)  serve web-based front ends
d)  perform all TLS-based authentications
e)  do load balancing, if necessary
f)  pass through notification for web-based Management Tools that are connected via Web Sockets
g)  rule-based traffic management leveraging network characteristics and alike  


##### Permission Manager 
processes incoming requests from third parties or consumers

a)  parse requests and proceed accordingly
b)  examine and check queries that are aiming to access personal data
c)  queue requests, if further processing is blocked 
d)  notify operator about new registration attempts
e)  create and manage permission profiles
f)  read personal data through *Storage Connector*
g)  delegate supervised code execution and obtain result


##### Key Infrastructure (PKI)
provides the web server with keys and issues certificates
  
a)  issue certificate based on CSR provided by third party
b)  create and self-sign a system key-pair 
c)  create and sign key-pairs for every endpoint
d)  maintain certificates and their validity (recurring renewal) issued by trusted public CAs
e)  create new Diffie-Hellman groups


##### Storage Connector
abstracts the *Personal Data Storage* and facilitates read, write, changelog and permissions

a)  basic access management
b)  connect to the PDS
c)  validate query according to the abstracted query language
d)  query personal data
e)  keep track of all changes
f)  provide migration and backup possibilities


##### Personal Data Storage
a database system where the personal data is actually stored

a)  can be located on any platform
b)  capable of translating the abstract query language into domain-specific query languages required
    by the supported database systems
c)  add, change, remove personal data
d)  provide translations for common operations (filter, sort, aggregate)
e)  store change history
f)  store binary data


##### Operator API
provides all functionalities an operator must be capable of

a)  perform all JWT-based authentications
b)  read and write personal data through *Storage Connector*
c)  configure, maintain and monitor system
d)  provide access history
d)  manage data structs
e)  can control *Permission Manager*
d)  administrate restricted access for *data contributors*


##### Code Execution Environment
provides isolated runtime (sandbox) for supervised code execution
  
a)  invoke software provided by data consumers with required data points
b)  restrict access to the host environment
c)  provision runtimes
d)  perform test runs and code review
e)  monitor runtime during invocation
f)  handover results back to *Permission Manager*
g)  archive software in *Persistence Layer*


##### Tracker
logs events and transactions occurring in the system

a)  track states of ongoing access requests
b)  provide data for monitoring and system analytics
c)  log access history
d)  pattern recognition and anomaly detection


##### Persistence Layer
combines multiple technologies to represent and hold the current systems state  

a)  store:
    +   system related data
    +   component configuration
    +   data provided by the *Tracker*
    +   permission profiles
    +   tokens
b)  filesystem access
c)  hold keys and certificates
d)  cache certain runtime data


##### Notification Infrastructure
a unified facility for server components to distribute notifications to multiple front ends 

a)  support native mobile notifications through connected Push Notification Service
b)  notify operator about pending approval or review


##### Data Contributor 
an authorized entity, typically software, that sends personal data into the system

a)  MUST be explicitly authorized by the operator
b)  data structure and format MUST be known by the system


##### Management Tool (and other GUIs used by the operator)
a graphical user interface, available for mobile and desktop platforms, accessible only by the 
operator to control the system

a)  based on either web technologies or native technologies that are supported by mobile platforms
b)  offer all relevant features provided by the Operator API 
c)  scan third party registrations via QR-Codes or generate URI to submit registration

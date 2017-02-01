## Data



The core task of a *PDaaS* is providing data, *personal data*, which in conjunction is the digital
manifestation of an individual, a person. One party creates the data, another one obtains and
processes it. Thus, both need to agree, or at least need to know, how that data looks like, how is 
it structured and what are their semantics. The following section is intended to discuss different
technologies, used to create queries that obtain those data points that are desired. Further on, it 
describes some basic data types and schemas, that might be useful in the context of *personal data* 
as well as for previously introduces [scenarios](#scenarios).  

First of all, to address the need of portability, which has to be satisfied by those components, 
that are storing and providing *personal data*, it is essential to abstract the actual storage from 
how it gets accessed. This makes it possible to relocate those storage into other platforms and 
environments. Thereby the *personal data storage* itself becomes platform-agnostic from an outside 
view, in other words portable. In order to reduce possible issues related to unsupported 
communication protocols it might be reasonable to enforce HTTP - over TLS, if they don't share the 
same environment - even if the storage therefor requires an additional driver or proxy layer, like 
for example a mobile app. 

Possible technologies are for example *[GraphQL](#link-graphql)* or the 
*[SPARQL](#link-sparql)*, which is part of the *[Semantic Web Suite](#link-semantic-web)*. Both are
query languages underpinned by the concept of a graph. This means, relations between data points are 
embedded within the data structure itself. That meant, in terms of a graph, relations are *edges* and 
data points are *nodes*. In consequence the structure of a query itself reappears in it's result, 
which means the originator of that query knows exactly what to expect for the response. Therefore
it's not necessary to provide any additional information about how to handle and interpret the
responded data. The example below gives a first impression of how it might look like, when a 
*consumer* obtains the name of the *data subject* and a bank account of hers, that supports online 
payment.

__[Code 01: Example query in SPARQL]{#code-01_sparql-query}:__
```sql
# query 1: obtain the data subject's first and last name
PREFIX person: <http://pdaas.tld/schemas/person>

SELECT $firstname $lastname
FROM <https://unique-consumer-endpoint.pdaas.tld/sparql/profile>
WHERE {
    $person person:firstname $firstname .
    $person person:lastname $lastname .
}


# query 2: obtain all bank accounts that are available for online payment
PREFIX bank-account: <http://pdaas.tld/schemas/bank-account>

SELECT $accountId $bankName $paymentMethod
FROM <https://unique-consumer-endpoint.pdaas.tld/sparql/finance>
WHERE {
    $bank-account bank-account:payment-method "online-service" .
    $bank-account bank-account:payment-method $paymentMethod .
    $bank-account bank-account:account-id $accountId . 
    $bank-account bank-account:bank-name $bankName .
}
```

__[Code 02: Results of Code 01 in JSON]{#code-02_sparql-query-results}:__
```JSON
// result 1:
{
    "head": {
        "vars": [
            "firstname",
            "lastname"
        ]
    },
    "results": {
        "bindings": [
            {
                "firstname": {
                    "type": "literal",
                    "value": "Doe"
                },
                "lastname": {
                    "type": "literal",
                    "value": "Jane"
                }
            }
        ]
    }
}

// result 2:
{
    "head": {
        "vars": [
            "accountId",
            "bankName",
            "paymentMethod"
        ]
    },
    "results": {
        "bindings": [
            {
                "accountId": {
                    "type": "integer",
                    "value": 0905553715
                },
                "bankName": {
                    "type": "literal",
                    "value": "A. W. Fritter Institute"
                },
                "paymentMethod": {
                    "type": "literal",
                    "value": "online-service"
                }
            }
        ]
    }
}
```

Without going into much details here, the syntax of this example ([Code 01](#code-01_sparql-query)) 
already shows its nature of decentralization. This aspect at the same time introduces additional 
external dependencies. Because the query language itself has no concept of schemas or any kind of 
semantic, it needs to be made aware of them. SPARQL queries typically return XML which then can be 
rendered into (HTML) tables. JSON and RDF are supported as well.
The reason for performing two queries instead of just one is, because otherwise the result might 
have returned multiple "rows" with redundant data, if more then one bank account would have 
supported online payment; varying in three columns containing data about bank accounts though, but 
being identical in the fields related to the profile information.

__[Code 03: Example query in GraphQL]{#code-03_graphql-query}:__
```js
# URL: https://unique-consumer-endpoint.pdaas.tld/graphql

query {
    profile {
        firstname
        lastname
    }
    bankAccounts(paymentMethod: 'online-service') {
        accountId
        bankName
        paymentMethod
    }
}
```

__[Code 04: Result of Code 03 in JSON]{#code-04_graphql-query-result}:__
```JSON
{
    "profile": {
        "firstname": "Jane", 
        "lastname": "Doe"
    },
    "bankAccounts": [
        {
            "accountId": 0905553715,
            "bankName": "A. W. Fritter Institute",
            "paymentMethod": "online-service"
        }
    ]
}
```

Whereas comparing the *GraphQL* query syntax ([Code 03](#code-03_graphql-query)) with it's result 
([Code 04](#code-04_graphql-query-result)) shows of a remarkable resemblance. 
By defining `paymentMethod` as an argument, the resolver for `bankAccounts` then implements an 
instruction to match the value of that argument (`'online-service'`) against the whole set. 
*GraphQL's server* then knows from which resources the data in question need to be pulled and how
they need to be aggregated. 
While SPARQL has a full-featured query language syntax including all sorts of controls (e.g. 
aggregation, operators, nested queries etc.), GraphQL's syntax instead is more rudimental, because
all it's functions and logic was abandoned from the language itself and put into a server part. With 
this concept of separation it is straightforward to validate queries, because it essentially means
matching against types. 
Both query languages share a comprehensive understanding of a type-system, that encourages to 
create all kinds of data types. However, when comparing the results of both languages, some 
distinctions appear. While in GraphQL the characteristics of graph-structured data are remain,
*SPARQL's* output is missing a certain level of depth. The reason for that originates in the design 
of the query language and it's syntax. *SPARQL* is able to notice implicit relations between data 
points, though it's query language is not capable of grabbing and presenting them. Thus the result
only consists of two dimensions.

It is crucial for the *PDaaS* to provide the *data subject* with abilities to create her own data 
types and schemas ([S.P.03](#sp03)). Thereby she is enabled to serve data points according to her 
own needs and terms. In order to interact with their customers or users, *data consumers* might 
develop and provide schemas for their requests as well. This can help *data subjects* to speedup the 
process of permission granting and to easier understand what data points are affected. Data types 
and schemas are the key to validate incoming and outgoing data. If data violates the underlying 
schema or no appropriate schema exists, the data transfer fails. 
Other missing data types could be developed by a community, because not every *data subject* might 
have the ability to model her own data types. Thus everyone can benefit from that effort taken by a 
few. As a result, the ones that are widely used might then become de facto standards. Moreover, it's 
also possible that several data types will emerge, which are based on common standards, for example 
*medical record* [@web_spec_data-schemas_ehr], *point of interest* [@web_spec_data-schemas_poi] or 
*bank transfer* [@web_spec_data-schemas_bank-transfer]. With this approach those data types can be 
viewed as something like a plugin or add-on for the *PDaaS*.

In order to avoid confusion about the differences between types and schemas and to simplify their
relations, the following two definitions are henceforth being used. A (data) *type* is the superior 
term; hence refers to both of them. 

[primitive]: most basic or atomic data type; defined as either *String*, *Boolean*, *Integer*, 
    *Float* or *Nil (null)*

[struct]: combines multiple types in order to define more complex data types; typically composed of 
    *primitives*, but can consist of other structs as well
  
Based on these two concepts almost any imaginable data type can be modeled. A selection of such
types can be found in the list of [suggested structs (List 01)](#list-01_suggested-structs), 
whereas an extract of (sub-)categories that might be useful in a *PDaaS* are specified in a list
of [data categories (List 02)](#list-02_data-categories). Additional examples for *structs*
include a [*data subject's* profile (Code 05)](#code-05_struct_profile), a
[contact (Code 06)](#code-06_struct_contact) and bare 
[position (Code 07)](#code-07_struct_position). 
All those examples and lists are only meant as a starting point that should cover basic scenarios as 
well to give a first impression of what data types a *PDaaS* could provide.

__[List 01: Suggestions for useful structs]{#list-01_suggested-structs}__
+   Address
+   Contact
+   Location
    -   Country
    -   City
    -   Position
+   Media
    -   Audio
    -   Video
+   Organisation
+   Date
+   TimeRange
+   Language
+   Diseases

*NOTICE: schema notation is based on the rules underpinning the schema definition provided by the 
SimpleSchema project [@web_2017_repo_node-simple-schema].*

__[Code 05: Struct - Profile (example)]{#code-05_struct_profile}__
```js
{
    firstname: String,
    lastname: String,
    pseudonym: String,
    birth: Date,
    gender: String,
    religion: String,
    motherTongue: Language
    photo: File,
    residence: Address,
    employer: Organisation
}
```

__[Code 06: Struct - Contact (example)]{#code-06_struct_contact}__
```js
{
    label: String,
    type: String('phone'|'email'|'url'|'name-of-social-network'),
    prio: Integer(0-2),
    uid: String
}
```

__[Code 07: Struct - Position (example)](#code-07_struct_position)__
```js
{
    lat: Float,
    lon: Float,
    radius: {
        value: Float,
        unit: Distance
    },
    description: String
    ts: Date
}
```

__[List 02: relevant (sub-)categories of data]{#list-02_data-categories}__
+   Finance
    -   Income
    -   Bank transfers
+   Shopping history
+   Things/Objects
+   Media consumption
    -   Music playlist
    -   Watchlist
+   Favorites/Interests
    -   Music genres
    -   Songs
    -   Movies
    -   Books
    -   Travel destinations
    -   Topics
+   Curriculum vitae (CV)
    -   Educational level
    -   Visited schools
+   Visited ...
    -   points of interest
    -   countries
    -   websites/URLs (browser history)
+   Units (measurements)
+   Organisations
    -   Company
    -   Bank
    -   ...
+   Medical/Health Record
    -   Diseases
    -   Treatments
    -   Visits to the doctor
    -   Medication

The available *primitives* mainly depend on those who are supported by the query language itself.
In this case, all *primitives* mentioned above are supported by *SPARQL* [@web_spec_xml_types] and 
*GraphQL* [@web_spec_graphql_types]. When choosing a database system it has to be ensured that 
either the system already supports the required *primitives* or they can be emulated somehow with a 
least amount of drawbacks. When modelling relations between data point one can use for example keys 
(or identifiers) to make reference, or additional syntactical tools like *lists* (or arrays) and 
maps (or objects). Those tools facilitate readability so that relations are almost intuitively 
observable, therefore they should be enforced. Whereas another know concept in data modelling, 
inheritance, isn't required, but could help to reason about certain *structs* and their 
representations, it might add complexity though.

Aside form the *subject's* *personal data* other information and data must be persist as well. This
includes for example:

+   Application data
    -   Templates ([P.I.05](#pi05))
    -   permission profiles (incl. versioning)
    -   consumer information
    -   meta data
    -   notifications
    -   states
    -   tokes
    -   access logs
+   Files
    +   cryptographic keys
    +   executable program
    +   container images
    +   configurations
    +   user interfaces
    +   documentations

The list revels that not only a database system is needed to satisfy the requirements, but the 
environments filesystem might need to be utilized as well.
This leads to the the question what requirements a database system has to satisfy. But first of all
it is pivotal to distinguish between the needs of a *personal data storage (PDS)* and a general 
*persistence layer (PL)* for the system's backend.


----------------------------------------------------------
Characteristic                Personal Data   Persistence 
                                 Storage         Layer
---------------------------- --------------- -------------
portable

advanced user & permission                        __X__
management

document-oriented                 __X__          __X__

support common primitives         __X__          __X__

replication                                      __X__

efficient binary storage          __X__          __X__
and serialization

high performance                                 __X__

operations and                    __X__          __X__
transactions

background optimization                          __X__

version control
----------------------------------------------------------

Table: selection of characteristics that a database system has to feature in order to be suitable 
    for either of the defined purposes {#tbl:dbs-features} 


Although, most of the characteristics (in Table @tbl:dbs-features) are self explanatory, certain 
aspects need to be commented on. Fist, portability, an important requirement ([S.A.02](#sa02)), 
which is oddly not marked in the Table @tbl:dbs-features. That's because of the priorly introduced 
concept of abstracting the *personal data storage* with a additional query language. This makes the 
access to the *PDS* platform-agnostic. Whereas the database system storing that data can be 
implemented with respect to the requirements while considering the environment constraints at the 
same time. 
Basic permission management should suffice the *PDS*, since it's not differently accessed in 
multiple ways. It's only relates to the query language abstraction.
Data and especially it's structure is expected to be highly fluctuant ([S.P.02](#sp02)), thus 
advantages of relational databases (e.g. schema-oriented and -optimized) would instead harm the 
performance and flexibility, because they are not primarily designed to handle schema changes. 
Database systems, whose storage engine is build upon a document-oriented approach, would be a better 
choice. 
Replication can be used for horizontal scaling, federation and
backups ([S.P.05](#sp05)). Here it is focused on the latter, because without *PL* the *PDaaS* wont be 
able to function. In case of irreversible data loss, the whole system state is gone, which then has 
to be reconfigured and reproduced from the ground up. Such effort can be spared by introducing a 
reliable backup strategy. With the *PDS* on the other hand replication is not necessary, but 
ensuring no data loss still needs to be addressed. Therefor every database system that might be used 
for the *PDS* must provide a mechanism to backup or at least to export the data, which can be 
triggered and obtained through the *operator's* management tool. Another approach could be to not 
only store the actual data written to the *PDS* but also to save all queries used to write that data 
in a chronological order. Therefore the current state can be restored just by running those writing 
queries against the *PDS*. It is reasonable to store the the queries from the abstracted query 
language not the ones the query language is transformed into.
If a mobile device is part of the *PDaaS*, another approach would be for the *operator* could be to 
perform regular device backups. These are all just initial thoughts which might be sufficient only 
as a starting point. Other solutions are imaginable, but elaborating on those is beyond the scope of 
this work.
Depending on what technologies are being used, it might be necessary from a conceptional 
perspective to split the *PL* into two parts. One part is a database system and the other is 
represented by the environment's filesystem. This might be no alternative, when it comes to
configuration files certain technologies or key files, which are typically accessed as files. 
In any case, both have to be able to store files of any kind, which is required for instants to 
support the use case of medical records. File size restriction should be mandatory though. The 
*PDaaS* has no intention to replace existing *file hosting* solutions. 

Being able to revert certain data points or to review the change-history of those data, can be very 
useful; not only when those changes were persisted mistakenly. This behaviour might not be necessary
for every data, especially when it comes to application configuration or logs. Also, not every
*operator* might require those features. Therefore and because database systems with no alternative 
might not be able to provide this capability, it's not required by either the *PDS* or the *PL*. If 
it not natively supported but still desired, it needs to be considered if for example high 
frequently backups would already suffice or if a implementation on the application is required.

Before serving data it first needs to be put into the *PDS*. This can be done in three different 
ways:

1.  the *data subject* is provided with forms by the graphical user interface, which she is using to 
    insert data about her, for example her [profile information (Code 05)](#code-05_struct_profile).
    This data is then submitted into the *PDaaS* which takes care of storing it.
2.  the *data subject* is in possession of file(s) or string(s) that contain a data format that is 
    supported by the system. The graphical user interface provides a mechanism to either upload the 
    file(s) or insert the string(s), thereby the data is then send into the system. If this raw data
    is not self-explaining to the system the *data subject* has to elaborate on the context of those
    data.
3.  Third party software, for example a browser plugin, is used to provide the *PDaaS* with data; in
    this case it's a browser history. This software uses a restricted API which is provided by the 
    *PDaaS*, to let data flow into the system.

These three concepts, especially 2. and 3. are required to be inspected for malicious content and
extensively validated against existing *structs*. Only if these are matching, the submitted data can 
be stored. In the second version the *data subject* need to be ask to review the imported data to 
make sure everything is as expected. When enabling third party software to submit data, appropriate
authentication and permission mechanisms must be in place. That software is classed like all other
*operator* clients, but without permissions to obtain data.



*__Conclusions:__*
In order to gain flexibility in choosing technology and location for the *personal data storage*, 
the logical consequence is to abstract the interface to to the database system. Introducing a
separate query language is proposed as a reasonable approach. It can be chosen between two suggested 
query languages, *GraphQL* or *SPARQL*. Both provide the necessary features required to integrate 
them in a distributed system; *SPARQL* with it concepts of URIs as identifiers and resources, and 
*GraphQL* with it's separation of query definition and execution. This also has an effect on the
process of query validation, which is much harder to do for *SPARQL*, because its syntax is more
flexible and allows some shorthands. In general *SPARQL's* syntax is harder to reason about 
compared to *GraphQL*. And even though the result of both languages is formatted in JSON, only 
*GraphQL* preserves all the relations which are embedded in the query syntax, in the output as well. 
Therefore *GraphQL* (and its implementations) is the query language of choice for this project.

Engaging a user community when it comes to creating new structs can compensate the lack of certain
types. Examples for a potential start point of *PDaaS* supported data types were showed before.
Data Modelling in general is a large research field for it's own. With regards to the *PDaaS* it 
needs much more work, though tt's beyond the scope of this document. The basic approaches within 
this section should only be viewed as an introduction that gives an outlook of how it's imagined. 

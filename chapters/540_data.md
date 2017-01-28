## Data



The core task of a *PDaaS* is providing data, *personal data*, which in conjunction is the digital
manifestation of an individual, a person. One party creates the data, another one obtains and
processes it. Thus, both need to agree, or at least need to know, how that data looks like, how is 
it structured and what are their semantics. The following section is intended to discuss different
technologies, used to create queries that obtain those data points that are desired. Further on, it 
describes some basic data types and structs, that might be useful in the context of *personal data* 
as well as for previously introduces [scenarios](#scenarios).  

First of all, to address the need of portability related to those components, storing and providing
*personal data*, it is essential to abstract the actual storage from how it gets accessed. This 
makes it possible to relocate those storage into other platforms and environments. Thereby the 
*personal data storage* itself become platform-agnostic, in other words portable. In order to reduce 
possible issues related to unsupported communication protocols it might be reasonable to enforce 
HTTP - over TLS, if they don't share the same environment - even if the storage therefor requires an 
additional driver or proxy layer, like for example a mobile app. 

TODO: persisting the other stuff

TODO: Technology: *GraphGL* or the *Semantic Web Suite* ??? 
 
 
 responsible for persisting any kind of
 data

to elaborate on the different mechanisms to save and store certain groups of system-relevant data

Both languages know the concept of a graph, which means relations between data points are embedded
in the data structure itself. This is, in terms of a graph, relations are *edges* and data points 
are *nodes*. In consequence the structure of a query shows the same as the result does, which means 
the originator of that query knows exactly how the response will look like. 


__Query:__

```SPARQL
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

__Result:__
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
                    "type": "literal",
                    "value": "janeod23"
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

Without going into much details here,  
The syntax itself already shows its nature of 
decentralization, which at the same time introduces 
additional external dependencies. Because the query language itself has no concept of schemas, 
structs or any kind of semantic, it needs to be made aware of them.

SPARQL queries typically return XML which then can be rendered into (HTML) tables, but JSON and RDF 
are supported as well.





__Query:__
```GraphQL
# URL: https://unique-consumer-endpoint.pdaas.tld/graphql

query {
    profile {
        firstname
        lastname
    }
    bankAccounts(paymentMethod: 'online-service') {
        accountId
        bankName
        paymentMethod('online-service')
    }
}
```

__Result:__
```JSON
{
    "profile": {
        "firstname": "Jane", 
        "lastname": "Doe"
    },
    "bankAccounts": [
        {
            "accountId": "janeod23",
            "bankName": "A. W. Fritter Institute",
            "paymentMethod": "online-service"
        }
    ]
}
```

Whereas comparing the GraphQL query syntax with it's result shows of a remarkable resemblance. 

While SPARQL has a full-featured query language syntax including all sorts of logic (e.g. 
aggregation, operators, nested queries etc.), GraphQL's syntax on the other hand is more rudimental.
All it's functions and logic is separated from the language itself into a backend-like part, that is 
responsible for resolving queries. Those resolvers then implement features like sorting, searching, 
grouping or aggregating. With this concept of separation it is straightforward to validate queries, 
because it is essentially matching against types.   

Both share a comprehensive understanding of a type-system, that encourages to create all kinds of
data types.






+   keep in mind to make it all somehow extensible, e.g. by using and storing 
    corresponding schemas


+   NOTE: step numbers marked with a `*` are somehow tasks which are happening in the background 
    and don't require any user interaction
    
TODO: data types
+   missing data types as candidate for a "plugin"/"addon" concept, because not every user might 
have the ability to model data types according to her needs. to have a community for this, were the
best solutions might "win"

+   Modelling
+   Categories (or Classes)
+   Types

+   database requirements

+   data Consumption (data inflow)
    -   how data will get into the system
    -   hwo is the user able to do that, and how does it works
    -   manually and automated

+   history
    -   data versioning
    -   access logs



### *Conclusions*

TODO: why Graphql over Sparql ?

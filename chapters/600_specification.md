Specification *(Draft)*
==========================================

\hfill\                                                                              *Version 0.1.0*


This chapter holds the first draft of what might become an open specification. Therefore, it has no 
claim of completeness, continuity or accuracy at this time. Frequent changes are to be expected. The 
contents is based on, and a result of, all previous discussions and developed solutions. Hence, some 
of the contents can be expected to reoccur.



### Introduction {-}

This specification describes a system with the purpose of controlling the personal data of a single 
entity. By 'entity', a person, or an individual, is primarily meant. This individual manages all 
data relating to her in an online platform operated by her, which exposes a service making those 
data selectively accessible to third parties that might be interested. Meanwhile, the system tries 
to ensure that no personal data ever leaves the system. 
The overall flexibility and portability of the system enables the individual to store her data on a 
mobile phone, for example, so that she is able to carry all her personal data along while providing 
the access to her data at all times.



### Notation and Conventions {-}

The requirements notation used in this document originates in the 
[RFC 2119](https://tools.ietf.org/html/rfc2119) and shall be interpreted as described there. 
This applies to the following keywords, recognizable by capital letters: MUST, MUST NOT, REQUIRED, 
SHALL, SHALL NOT, SHOULD, SHOULD NOT, RECOMMENDED, MAY and OPTIONAL.

Values and words presented in a `fixed-width font` need to be understood as names and must therefore
be used as is. If one of those starts with a `$` (Dollar) character, a variable is indicated, which 
means implementations must replace this variable with an actual value. 

Lists that are numbered indicate an order which must be followed. Lists that start with a character 
(upper or lower case) have no claim to its order. Their items are inclusive (logical *and*) whereas 
bullet list items are exclusive (logical *or*). 



### Terminology {-}

[(The) System]{#spec_term_system}:

: refers to either the overall concept or the implementation of this specification


[Platform]{#spec_term_platform}:

: combination of environment capabilities and common role characteristics, which can be inherited 
  from its hardware/device properties; possible values: *desktop*, *server*, *mobile*
  
  
[Component]{#spec_term_component}:

: independent piece of software that is part of the system and might be capable of running on 
  different platforms, but not at the same time; serves a unique purpose within the system   


[Operator]{#spec_term_operator}:

: data subject and owner, not necessarily provider or host; individual, represented by the 
  system and whose personal data can be accessed through the system; also referred to as 
  *data controller*, *data subject*, or *data owner*


[Third Party]{#spec_term_third-party}:

: external entity or vendor, who is yet to become registered as a *consumer* to the system


[(Data) Consumer]{#spec_term_consumer}:

: external entity or vendor, who has registered to the system and is therefore permitted to request
  access to data or even to access data held by the system
 
  
[(Data) Contributor]{#spec_term_contributor}:

: external entity, that is authorized by the *operator* to obtain and push personal data of hers 
  into the system  


[Personal Data]{#spec_term_personal-data}:

: data related to the *operator* that is contained in the system and selectively permitted to 
  be accessed by consumers
  
  
[Data Broker]{#spec_term_data-broker}:

: entity with commercial interests in collecting, aggregating and analyzing personal data from any 
  possible resource in order to combine and enrich those and to license the result to other entities


[Endpoint]{#spec_term_endpoint}:

: dedicated entry for a specific *data consumer* to communicate with the system (e.g. access 
  personal data)


[Permission Profile]{#spec_term_permission-profile}:

: set of access rules and configurations tied to an *endpoint* that define, for example, how long, 
  how often, and which personal data are accessible by a related *data consumer*


[Access Type]{#spec_term_access-type}:

: defines the method by which access to personal data is provided  

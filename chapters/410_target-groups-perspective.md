## Target Groups Perspective



The subsequent views of a *data subject*, a software developer, and a *data consumer* describe their 
motivation, why they would or would not use the proposed system or participate in creating such 
software, and what circumstances may lead to their decision. Those statements are meant as a 
generalized addition to the [*Scenarios* describe in *Chapter 1*](#scenarios).  

*NOTICE: The following statements are written in first-person perspective for stylistic purpose 
only. They do not necessarily reflect the sole perspective of the author, but should be understood 
as a general opinions from the respective user types.*



As a data subject, for me, privacy is a major concern. With this software I would not only have one
single place to maintain all my personal and sensitive data while carrying the actual data with 
me, but I would also be able to control on a very precise level and under my conditions which vendor 
has what data on me or is able to access. I myself can even collect and submit data to my system, 
completely automated, whether it's movement data, my browsing history or any other data I am 
creating. And since I have full control over the system I could even analyze the date about me 
myself.
It's not my concern in particular how exactly the *PDaaS* works, but it needs to be reliable and I 
have to be able to trust it with my data. Furthermore, I like to control my *PDaaS* regardless of 
where I am. If somebody wants to access my data, I would like to get informed about that and would
like to decide on my own how to proceed. A convenient setup and usage is vital, otherwise I would 
probably resign before I got it to work. 
If those demands the *PDaaS* is capable to provide, then I would definably like to use it, because 
it gives me freedom of my data.

From a developer's perspective, the most important aspects of an open source project are, in my 
opinion, a friendly and cooperative community combined of users and developers, as well as a 
detailed specification and documentation for what already exists. I also have to be a user of the 
developed software, which, in general, is a valuable perspective for every developer. As such I must 
be able to understand the specification as well as the overall architecture and design. That is, the 
more sophisticated these aspects are, the more effort is required to get involved. The software can 
still have many components though, but the complexity of the relations between them should be simple 
and explicit. The barriers for participation or contribution must be as low as possible. For 
example, instructions on how to setup a local development environment with only little external 
dependencies can be very helpful and time-saving.
The specification can either be restrictive or more flexible in its description. So, it depends on 
the developer's personal preferences which is preferred. Though, it must describe very precise how 
the internal interfaces between components as well as external should look like, in order to enable 
several people to work on different components at the same time. Implementations based on different 
languages can not only increase user adoption but also encourage developers from other communities 
to join. Alternative implementations can serve as templates or 
inspirations of new ones. Those aspects not only apply to core developers but also to those who 
write *consumer clients*, which is a library that abstracts the consumer-system-relation and should 
provide effortless integration into the consumer's existing infrastructure. Here it is particularly 
important to provide those who are going to integrate the client with detailed instructions and 
documentations to prevent misunderstandings and mistakes during integration.
If all those aspects, especially detailed and useful documentation as well as a helping community,
are in place, I as a developer and probably many more would gladly like contribute to this project.

As a data consumer, it would only be reasonable for me to support interoperability with a system 
that prevents me from collecting data but still provides access to it, if my business model is not 
contrary to that behaviour. For example, directly monetizing the collected data won't be possible 
anymore, unless the data subject enables me to do so by giving me raw data. If I instead want, for 
example, to enrich and improve my service(s) or product(s), this approach is, to me, as equal as 
storing the data on my own. Furthermore, this strategy may indirectly reduce resources and therefore 
expense, because it's essentially the same to the procedure of outsourcing. 
The amount of effort to integrate the required interface must be appropriate. Support from the 
community may become necessary. In order to not violate the constrains for 
*Supervised Code Execution* a detailed description as well as a group of different examples should 
be available. It can get frustrating after several attempts, if I am still not be able to get such a 
procedure to work. This again may hamper the adoption progress. 
The most important aspects for me are reliability in any regards as well a trust. The possible 
latency between requesting data and actually obtaining them could become an issue. Therefore either, 
I have to adjust my process design so that it's not time-critical or if it's inevitable though, the 
data subject needs to be informed about such constraint, so that she can try to adapt to this, or 
a data resource controlled by the data owner might not be an adequate alternative to my current 
approach. 

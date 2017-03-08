## Target Groups Perspective



The subsequent views of a *data subject*, a software developer, and a *data consumer* describe their 
motivation, why they would or would not use the proposed system or participate in creating such 
software, and what circumstances may lead to their decision. Those statements are meant as a 
generalized addition to the [*Scenarios* describe in *Chapter 1*](#scenarios).  

*NOTICE: The following statements are written in first-person perspective for empathizing purposes 
only. They do not necessarily reflect the sole perspective of the author, but should be understood 
as general opinions of the respective user types.*



As a data subject, privacy is a major concern for me. With this software I would not only have one
single place to maintain all my personal and sensitive data while carrying the actual data with me, 
but I would also be able to control, on a very precise level and under my conditions, which vendor 
has what data about me or access to that data. I, myself, can even collect and submit data to my 
system, completely automated, whether it's movement data, my browsing history or any other data I am 
creating. And since I have full control over the system I could even analyze the data about me 
independently.  
It's of no particular concern to me how exactly the *ReFlowd* works, but it needs to be reliable and
I have to be able to trust it with my data. Furthermore, I like to be able to control my *ReFlowd* 
regardless of where I am. If somebody wants to access my data, I would like to be informed about 
that and would like to decide, on my own, how to proceed. Convenient setup and usage is vital, 
otherwise I would probably resign before I got it to work. 
If the *ReFlowd* can meet these demands, then I would definitely want to use it, because it maintains 
my data's freedom.

From a developer's perspective, the most important aspects of an open source project are, in my 
opinion, a friendly and cooperative community combined of users and developers, as well as a 
detailed specification and documentation for what already exists. I also have to be a user of the 
developed software, which, in general, is a valuable perspective for every developer. As such I must 
be able to understand the specification as well as the overall architecture and design. That is, the 
more sophisticated these aspects are, the more effort is required to get involved. The software can 
still have many components though, but the complexity of the relations between them should be simple 
and explicit. The barriers for participation or contribution must be as low as possible. For 
example, instructions on how to setup a local development environment with few external 
dependencies can be very helpful and time-saving.  
The specification can either be restrictive or more flexible in its description. It depends on the 
developer's personal preferences which is preferred. But it must describe very precisely how the 
internal interfaces between components and external interfaces should look like. This is needed in 
order to enable several people to work on different components at the same time. Implementations 
based on different languages can increase user adoption and also encourage developers from other 
communities to join. Alternative implementations can serve as templates or inspirations for new 
ones. Those aspects not only apply to core developers but also to those who write 
*consumer clients*, which is a library that abstracts the consumer-system-relation and should 
provide effortless integration into the consumer's existing infrastructure. Here it is particularly 
important to provide those who are going to integrate the client with detailed instructions and 
documentations to prevent misunderstandings and mistakes during integration.  
If all those aspects, especially detailed and useful documentation and a helping community, are in 
place, I, as a developer, and probably many like me, would gladly contribute to this project.

As a data consumer, it would only be reasonable for me to support interoperability with a system 
that regulates my access to user data if my business model is not contrary to that behaviour. For 
example, directly monetizing the collected data won't be possible anymore, unless the data subject 
enables me to do so by giving me raw data. If, instead, I wanted to enrich and improve my service(s) 
or product(s), for example, this approach is, to me, equal to storing the data on my own.   
Furthermore, this strategy may indirectly reduce resources and therefore expense, because it's 
essentially the equivalent to the procedure of outsourcing. The amount of effort needed to integrate 
the required interface must be appropriate. Support from the community may be necessary. In order to 
not violate the constrains for *Supervised Code Execution*, a detailed description, as well as a 
diverse set of examples, should be available. Failing repeatedly to get this procedure to work can 
be very frustrating, which may discourage adoption.   
The most important aspects for me are reliability and trust. The possible latency between requesting 
data and actually obtaining them could become an issue. Therefore I have to either adjust my process 
design so that it's not time-critical or, if it's unavoidable, the data subject needs to be informed 
about such sensitivities, so she can try to adapt to this, or a data resource controlled by the data 
owner might not be an adequate alternative to my current approach. 

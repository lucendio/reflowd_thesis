## User Interfaces



Designing graphical user interfaces is beyond the scope of this work and the *PDaaS* specification 
as well. 
Nevertheless this section shell be understood as a collection of proposed ideas addressing the 
questions of what types of user interfaces the *PDaaS* should provide and which features they might 
need to support.

The most notable characteristic used to distinguish user interfaces from each other are those 
interfaces that are visible and the ones that arn't. For example a *graphical user interface (GUI)*, 
composed of visually separated areas with a certain semantic and assembled with meaningful objects 
on which the user can physically act, for example by touching them. The interface then reacts on 
those actions by changing their appearance. In this way the user can comprehend her actions.
Whereas non-graphical user interfaces don't provide the user with objects or surfaces to interact 
with. Instead, the primarily used medium is text, regardless if it's human-readable or not.
But *command line interfaces (CLI)*, available mainly in command line environments or shells, still 
provides a certain level of interactivity. A running program can pause in order to prompt the user 
with an input request. If an input is made and submitted the program then proceeds. The group of 
interfaces whose interactions can be fully automated are for example *application programming 
interfaces (API)*. Depending on the transport technologies, it's no unusual that *API* interactions 
are consisting of just one action causing one reaction. Non-graphical interfaces enabling 
interactions on lower level. Even though they provide more functionality and can more time 
efficient, they are more rudemental and often less secure.
While *GUIs* are normally meant for end users to interact with applications on a more sophisticated 
level, *CLIs* are used during development, for automation, or for server environment administration;
probably remotely, because they are typically headless. Whereas *APIs*, documented by its
provider, used to enable software developers program automated requests against those interfaces.

Table @tbl:ui-features provides a list of features and associates the different user interfaces 
mentioned before to those features if they should be supported by the interface types. It is notable 
that the *GUI* provides the *operator* with a powerful tool Hence it requires reliable protection 
mechanisms (see [Authentication](#authentication)). Whereas *API* capabilities are very limited, 
because it's the one interface that the *PDaaS* exposes to third parties.


----------------------------------------------------------
Feature                         GUI       CLI       API
---------------------------- --------- --------- ---------
manage *permission profiles*   __X__               __X__
([P.VIU.03](#pviu03))
                               
view access history            __X__     __X__
([P.VIU.04](#pviu04))
                               
register *consumer*            __X__     __X__
                               
add new *front end*            __X__
                               
authenticate *operator*        __X__
                               
migrate *personal data*        __X__     __X__
                               
review *permission requests*   __X__
([P.I.04](#pi04))

create & maintain templates    __X__
([P.I.05](#pi05))

adjust precision of data       __X__               __X__
([P.I.06](#pi06))

introduce new data *structs*   __X__               __X__
                               
configure *PDaaS*              __X__
                               
import personal data           __X__               __X__
                               
read/access *personal data*    __X__     __X__     __X__
                               
manipulate *personal data*     __X__     __X__

run supervised code                      __X__     __X__ 
execution
-----------------------------------------------------------

Table: Features that should be supported by the given user interfaces {#tbl:ui-features} 


The architectural design includes *desktop* and *mobile* platforms. While prioritizing a web-based 
*GUI*, the management tool for the *operator* also need to be implemented natively for
common mobile systems ([P.VIU.02](#pviu02)); in this case Android and iOS. This again enables to 
provide real-time notifications ([P.I.03](#pi03), [P.B.02](#pb02)) on mobile platforms, whereas 
WebSocket-based connections add this feature to *desktop* platforms. 
Since screen sizes can vary, in particular on *mobile* platforms, the *GUI* is required to be highly
responsive and has to adapt ([P.VIU.01](#pviu01)). Given the capabilities of, a inaccurate or 
error-prone rendered *GUI* can quickly cause unintended incidents. The main focus though has to

Known challenges for the *GUI* design are primarily developing very efficient but also fun to use 
interfaces for reviewing *consumer registrations* and *permission requests*. Especially the latter
can become hard to solve, because how can graph-based and nested data structures be displayed in
such a way that makes reviewing and also manipulating an easy task to do - even on a screen of a 
mobile phone. One approach could be to utilize the *accordion* pattern 
[@web_2016_wikipedia_accordion-gui] for edges and start nesting them in order to represent 
subsequent data structure. The interaction then might look like tree-structured navigation moving
along relations just by expanding and folding in data points. 

Since other parts of the system have to provide the mechanisms to increase or reduce the precision 
of data due to privacy protection, the challenge here is to find the right design concepts for *data 
subject* to facilitate those adjustments. Precision adjustments can be achieved by either changing 
the sampling rate in a dataset containing a series of data points, or by rounding values to a 
certain extend. An example is cutting fractional digits of the latitude and longitude values in a 
position information, or removing all position information obtained between every quarter from a 
full day tracking period. Whether *data subjects* can choose from an abstracted precision grading 
(e.g. *high*, *mid*, and *low*) or they set specific, type or unit related filter mechanisms, 
configurable defaults on a system-wide level should be provided by *GUIs* in any case. Following 
data types are supposedly vulnerable to compromise privacy, thus proposed to support precision 
adjustments: *Date* (time), any kind of absolute measurements, sets containing data series, and 
position information, as mentioned before.



*__Conclusions:__*
The most important aspect, when interacting with something or someone, is being provided with some 
kind of feedback. An action typically causes - and is therefore expected - a reaction. The result is
an interaction, unless no reaction occurred.

The discussion above outlines the relevance of those interactions for the *PDaaS*. Thus, for users 
and other software to interact with the *PDaaS* interfaces are mandatory. Primary characteristics of 
those interfaces are complete functionality, security precautions and restrictions, as well as 
comprehensive documentations. And visual user interfaces in addition, need to provide reliable and 
adaptive rendering, a consistent and encouraging interaction design and.
*GUIs* need to be provided for all *desktop* and *mobile* platforms, primarily to provide an 
efficient user experience for the *operator*. The *operator* is the only role with permissions to 
access a *GUI*. Components on the *server* platform should provide *CLIs*, at least when no other 
technical option exist to interact with them. Also accessing the database from command line could be 
appreciated at some point. *APIs* are mostly meant for *data consumers* to interact with the *PDaaS* 
and perhaps for automated data contribution (based on *operator* role; e.g. browser plugin). 
*Desktop* platforms might use those *APIs* as well. In any case, *APIs* must be separated according 
to the *roles*.

These are all vital characteristics whose details need to be addressed by the *specification*.
Whose implementation details though are not the concern of this specification, as long as every 
stated requirement is being acknowledged.

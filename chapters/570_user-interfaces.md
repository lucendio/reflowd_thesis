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

Table @tbl:ui-features provides a list of features with the associated user interfaces that should 
support them. It is notable that the *GUI* provides the *operator* with a powerful tool, which 
therefore needs reliable protection mechanisms (see [Authentication](#authentication)). Whereas
*API* capabilities are very limited, because it's the one interface exposed to third parties.


----------------------------------------------------------
Feature                         GUI       CLI       API
---------------------------- --------- --------- ---------
manage *permission profiles*   __X__               __X__
([P.VIU.03](#pviu03))
                               
view access history            __X__     __X__
([P.VIU.04](#pviu04))
                               
register *consumer*            __X__     __X__
                               
add new *client*               __X__
                               
authenticate *operator*        __X__
                               
migrate *personal data*        __X__     __X__
                               
review *permission requests*   __X__
([P.I.04](#pi04))

create & maintain templates    __X__
([P.I.05](#pi05))

introduce new data *structs*   __X__               __X__
                               
configure *PDaaS*              __X__
                               
import personal data           __X__               __X__
                               
read/access *personal data*    __X__     __X__     __X__
                               
manipulate *personal data*     __X__     __X__

run supervised code                      __X__     __X__ 
execution
-----------------------------------------------------------

Table: Features that should be supported by the given user interfaces {#tbl:ui-features} 


The architectural design includes *client* and *mobile* platforms. While prioritizing a web-based 
*GUI*, the management tool for the *operator* also need to be implemented natively for
common mobile systems ([P.VIU.02](#pviu02)); in this case Android and iOS. This again enables to 
provide real-time notifications ([P.I.03](#pi03), [P.B.02](#pb02)) on mobile platforms, whereas 
WebSocket-based connections add the same feature to *client* platforms. 
Since screen sizes can vary, in particular on *mobile* platforms, the *GUI* is required to be highly
responsive and has to adapt ([P.VIU.01](#pviu01)). Given the capabilities of, a inaccurate or 
error-prone rendered *GUI* can quickly cause unintended incidents. The main focus though has to

Known challenges for the *GUI* design is primarily to make very efficient but also fun ro review
review *consumer registrations* and *permission requests*. Especially the latter 

+   when a data point is a Date or location, some kind of accuracy should be able to defined (in user interface)

+   list all different features (w/ respect to the requirements) and give a suggestion on how a solution 
would look like; e.g. graph data structure with accordion menus/dropdowns




*__Conclusions:__*



Those are all vital characteristics that need to be addressed by the *specification*.


*GUIs* need to be provided for all *client* and *mobile* platforms, primarily to provide an 
efficient user experience for the *operator*. The *operator* is the only role with permissions to 
access a *GUI*. Components on the *server* platform should provide *CLIs*, at least when no other 
technical option exist to interact with them. Also accessing the database from command line could be 
appreciated at some point. *APIs* are mostly meant for *data consumers* to interact with the *PDaaS* 
and perhaps for automated data contribution (based on *operator* role; e.g. browser plugin). 
*Client* platforms might use those provided *APIs* as well. In any case *APIs* must be separated 
according to the *roles*.





The most important aspect when interacting with something or someone is being provided with some 
kind of feedback. An action typically causes, and is therefore expected, a reaction. When combining 
both, the result is interaction. 

The details of their implementations are not the concern of this specification, as long a every
containing requirement is acknowledged.

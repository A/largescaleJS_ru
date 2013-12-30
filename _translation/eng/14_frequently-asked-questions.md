### Frequently Asked Questions

#### Q: Is it possible to avoid implementing a sandbox or facade altogether?

A: Although the architecture outlined uses a facade to implement security
features, it's entirely possible to get by using a mediator and pub/sub to 
communicate events of interest throughout the application without it. This 
lighter version would offer a similar level of decoupling, but ensure you're 
comfortable with modules directly touching the application core (mediator) if 
opting for this variation.

#### Q: You've mentioned modules not having any dependencies. Does this include
dependencies such as third party libraries (eg. jQuery?
)

A: I'm specifically referring to dependencies on other modules here. What some
developers opting for an architecture such as this opt for is actually 
abstracting utilities common to DOM libraries -eg. one could have a DOM utility 
class for query selectors which when used returns the result of querying the DOM
using jQuery (or, if you switched it out at a later point, Dojo). This way, 
although modules still query the DOM, they aren't directly using hardcoded 
functions from any particular library or toolkit. There's quite a lot of 
variation in how this might be achieved, but the takeaway is that ideally core 
modules shouldn't depend on other modules if opting for this architecture.

You'll find that when this is the case it can sometimes be more easy to get a
complete module from one project working in another with little extra effort. I 
should make it clear that I fully agree that it can sometimes be significantly 
more sensible for modules to extend or use other modules for part of their 
functionality, however bear in mind that this can in some cases increase the 
effort required to make such modules 'liftable' for other projects.

#### Q: I'd like to start using this architecture today. Is there any
boilerplate code around I can work from?

A: I plan on releasing a free boilerplate pack for this post when time permits
, but at the moment, your best bet is probably the
'[Writing Modular JavaScript][14]' premium tutorial by Andrew Burgees (for
complete disclosure, this is a referral link as any credits received are re-
invested into reviewing material before I recommend it to others). Andrew's pack
includes a screencast and code and covers most of the main concepts outlined in 
this post but opts for calling the facade a 'sandbox', as per Zakas. There's 
some discussion regarding just how DOM library abstraction should be ideally 
implemented in such an architecture - similar to my answer for the second 
question, Andrew opts for some interesting patterns on generalizing query 
selectors so that at most, switching libraries is a change that can be made in a
few short lines. I'm not saying this is the right or best way to go about this, 
but it's an approach I personally also use.

#### Q: If the modules need to directly communicate with the core, is this
possible?

A: As Zakas has previously hinted, there's technically no reason why modules
shouldn't be able to access the core but this is more of a best practice than 
anything. If you want to strictly stick to this architecture you'll need to 
follow the rules defined or opt for a looser architecture as per the answer to 
the first question.


[14]: http://bit.ly/orGVOL
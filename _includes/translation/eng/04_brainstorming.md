### Brainstorming

Let's think about what we're trying to achieve for a moment. 

We want a loosely coupled architecture with functionality broken down into **
independent modules** with ideally no inter-module dependencies. Modules **
speak** to the rest of the application when something interesting happens and
an**intermediate layer** interprets and reacts to these messages. 

For example, if we had a JavaScript application responsible for an online
bakery, one such 'interesting' message from a module might be 'batch 42 of bread
rolls is ready for dispatch
'. 

We use a different layer to interpret messages from modules so that a) modules
don't directly access the core and b) modules don't need to directly call or 
interact with other modules. This helps prevent applications from falling over 
due to errors with specific modules and provides us a way to kick-start modules 
which have fallen over.

Another concern is security. The reality is that most of us don't consider
internal application security as that much of a concern. We tell ourselves that 
as we're structuring the application, we're intelligent enough to figure out 
what should be publicly or privately accessible.

However, wouldn't it help if you had a way to determine what a module was
permitted to do in the system? eg. if I know I've limited the permissions in my 
system to not allow a public chat widget to interface with an admin module or a 
module with DB-write permissions, I can limit the chances of someone exploiting 
vulnerabilities I have yet to find in the widget to pass some XSS in there. 
Modules shouldn’t be able to access everything. They probably can in most 
current architectures, but do they really need to be able to?

Having an intermediate layer handle permissions for which modules can access
which parts of your framework gives you added security. This means a module is 
only able to do at most what we’ve permitted it do.


## The Proposed Architecture

The solution to the architecture we seek to define is a combination of three
well-known design patterns: the**module**, **facade** and **mediator**.

Rather than the traditional model of modules directly communicating with each
other, in this decoupled architecture, they'll instead only publish events of 
interest (ideally, without a knowledge of other modules in the system). The 
mediator pattern will be used to both subscribe to messages from these modules 
and handle what the appropriate response to notifications should be. The facade 
pattern will be used to enforce module permissions.

I will be going into more detail on each of these patterns below:
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
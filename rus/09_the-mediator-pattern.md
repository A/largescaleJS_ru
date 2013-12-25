### The Mediator Pattern

 
The mediator pattern is best introduced with a simple analogy - think of your
typical airport traffic control. The tower handles what planes can take off and 
land because all communications are done from the planes to the control tower, 
rather than from plane-to-plane. A centralized controller is key to the success 
of this system and that's really what a mediator is.

Mediators are used when the communication between modules may be complex, but
is still**well defined**. If it appears a system may have too many
relationships between modules in your code, it may be time to have a central 
point of control, which is where the pattern fits in.

In real-world terms, a mediator** encapsulates** how disparate modules **
interact** with each other by acting as an intermediary. The pattern also
promotes loose coupling by preventing objects from referring to each other 
explicitly - in our system, this helps to solve our module inter-dependency 
issues.

What other advantages does it have to offer? Well, mediators allow for actions
of each module to vary independently, so it’s extremely flexible. If you've 
previously used the Observer (Pub/Sub) pattern to implement an event broadcast 
system between the modules in your system, you'll find mediators relatively easy
to understand.

Let's take a look at a high level view of how modules might interact with a
mediator:

![][7]

Consider modules as publishers and the mediator as both a publisher and
subscriber. Module 1 broadcasts an event notifying the mediator something needs 
to done. The mediator captures this message and 'starts' the modules needed to 
complete this task Module 2 performs the task that Module 1 requires and 
broadcasts a completion event back to the mediator. In the mean time, Module 3 
has also been started by the mediator and is logging results of any 
notifications passed back from the mediator.

Notice how at no point do any of the modules** directly communicate** with one
another. If Module 3 in the chain were to simply fail or stop functioning, the 
mediator could hypothetically 'pause' the tasks on the other modules, stop and 
restart Module 3 and then continue working with little to no impact on the 
system. This level of decoupling is one of the main strengths the pattern has to
offer.

To review, the advantages of the mediator are that:

It decouples modules by introducing an intermediary as a central point of
control.It allows modules to broadcast or listen for messages without being 
concerned with the rest of the system. Messages can be handled by any number of 
modules at once.

It is typically significantly more easy to add or remove features to systems
which are loosely coupled like this.

And its disadvantages: 

By adding a mediator between modules, they must always communicate indirectly.
This can cause a very minor performance drop - because of the nature of loose 
coupling, its difficult to establish how a system might react by only looking at
the broadcasts. At the end of the day, tight coupling causes all kinds of 
headaches and this is one solution.

** Example:** This is a possible implementation of the mediator pattern based
on previous work by[@rpflorence][8]

    var mediator = (function(){
        var subscribe = function(channel, fn){
            if (!mediator.channels[channel]) mediator.channels[channel] = [];
            mediator.channels[channel].push({ context: this, callback: fn });
            return this;
        },
    
        publish = function(channel){
            if (!mediator.channels[channel]) return false;
            var args = Array.prototype.slice.call(arguments, 1);
            for (var i = 0, l = mediator.channels[channel].length; i 
    
    
    
**Example:** Here are two sample uses of the implementation from above. It's effectively managed publish/subscribe:
    
    
    
    //Pub/sub on a centralized mediator
    
    mediator.name = "tim";
    mediator.subscribe('nameChange', function(arg){
            console.log(this.name);
            this.name = arg;
            console.log(this.name);
    });
    
    mediator.publish('nameChange', 'david'); //tim, david
    
    
    //Pub/sub via third party mediator
    
    var obj = { name: 'sam' };
    mediator.installTo(obj);
    obj.subscribe('nameChange', function(arg){
            console.log(this.name);
            this.name = arg;
            console.log(this.name);
    });
    
    obj.publish('nameChange', 'john'); //sam, john


[7]: img/chart4a.jpg
[8]: https://github.com/rpflorence
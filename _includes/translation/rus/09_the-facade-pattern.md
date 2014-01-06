### The Facade Pattern 

Next, we're going to look at the facade pattern, a design pattern which plays a
critical role in the architecture being defined today.

When you put up a facade, you're usually creating an outward appearance which
conceals a different reality. The facade pattern provides a convenient**higher-
level interface** to a larger body of code, hiding its true underlying
complexity. Think of it as simplifying the API being presented to other 
developers.

Facades are a **structural pattern** which can often be seen in JavaScript
libraries and frameworks where, although an implementation may support methods 
with a wide range of behaviors, only a 'facade' or limited abstract of these 
methods is presented to the client for use.

This allows us to interact with the facade rather than the subsystem behind the
scenes.

The reason the facade is of interest is because of its ability to hide
implementation-specific details about a body of functionality contained in 
individual modules. The implementation of a module can change without the 
clients really even knowing about it.

By maintaining a consistent facade (simplified API), the worry about whether a
module extensively uses dojo, jQuery, YUI, zepto or something else becomes 
significantly less important. As long as the interaction layer doesn't change, 
you retain the ability to switch out libraries (eg. jQuery for Dojo) at a later 
point without affecting the rest of the system.

Below is a very basic example of a facade in action. As you can see, our module
contains a number of methods which have been privately defined. A facade is then
used to supply a much simpler API to accessing these methods:

    var module = (function() {
        var _private = {
            i:5,
            get : function() {
                console.log('current value:' + this.i);
            },
            set : function( val ) {
                this.i = val;
            },
            run : function() {
                console.log('running');
            },
            jump: function(){
                console.log('jumping');
            }
        };
        return {
            facade : function( args ) {
                _private.set(args.val);
                _private.get();
                if ( args.run ) {
                    _private.run();
                }
            }
        }
    }());
    
    
    module.facade({run: true, val:10});
    //outputs current value: 10, running
    
    

and that's really it for the facade before we apply it to our architecture.
Next, we'll be diving into the exciting mediator pattern. The core difference 
between the facade pattern and the mediator is that the facade (a structural 
pattern) only exposes existing functionality whilst the mediator (a behavioral 
pattern) can add functionality.
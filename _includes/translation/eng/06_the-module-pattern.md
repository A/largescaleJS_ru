##### The Module Pattern 

The module pattern is a popular design that pattern that encapsulates 'privacy',
state and organization using closures. It provides a way of wrapping a mix of
public and private methods and variables, protecting pieces from leaking into 
the global scope and accidentally colliding with another developer's interface. 
With this pattern, only a public API is returned, keeping everything else within
the closure private.

This provides a clean solution for shielding logic doing the heavy lifting
whilst only exposing an interface you wish other parts of your application to 
use. The pattern is quite similar to an immediately-invoked functional 
expression
([IIFE][3]) except that an object is returned rather than a function. 

It should be noted that there isn't really a true sense of 'privacy' inside
JavaScript because unlike some traditional languages, it doesn't have access 
modifiers. Variables can't technically be declared as being public nor private 
and so we use function scope to simulate this concept. Within the module pattern,
variables or methods declared are only available inside the module itself thanks
to closure. Variables or methods defined within the returning object however are
available to everyone.

Below you can see an example of a shopping basket implemented using the pattern
. The module itself is completely self-contained in a global object called
`basketModule`. The `basket` array in the module is kept private and so other
parts of your application are unable to directly read it. It only exists with 
the module's closure and so the only methods able to access it are those with 
access to its scope (ie.`addItem()`, `getItem()` etc). 

    var basketModule = (function() {
        var basket = []; //private
        return { //exposed to public
            addItem: function(values) {
                basket.push(values);
            },
            getItemCount: function() {
                return basket.length;
            },
            getTotal: function(){
               var q = this.getItemCount(),p=0;
                while(q--){
                    p+= basket[q].price; 
                }
                return p;
            }
        }
    }());
    

Inside the module, you'll notice we return an `object`. This gets automatically
assigned to`basketModule` so that you can interact with it as follows: 

    //basketModule is an object with properties which can also be methods
    basketModule.addItem({item:'bread',price:0.5});
    basketModule.addItem({item:'butter',price:0.3});
    
    console.log(basketModule.getItemCount());
    console.log(basketModule.getTotal());
    
    //however, the following will not work:
    console.log(basketModule.basket);// (undefined as not inside the returned object)
    console.log(basket); //(only exists within the scope of the closure)
    

The methods above are effectively namespaced inside `basketModule`.

From a historical perspective, the module pattern was originally developed by a
number of people including[Richard Cornford][4] in 2003. It was later
popularized by Douglas Crockford in his lectures and re-introduced by Eric 
Miraglia on the YUI blog.

How about the module pattern in specific toolkits or frameworks? 

**Dojo** 

Dojo attempts to provide 'class'-like functionality through `dojo.declare`,
which can be used for amongst other things, creating implementations of the 
module pattern. For example, if we wanted to declare`basket` as a module of the
`store` namespace, this could be achieved as follows: 

    //traditional way
    var store = window.store || {};
    store.basket = store.basket || {};
    
    //using dojo.setObject
    dojo.setObject("store.basket.object", (function() {
        var basket = [];
        function privateMethod() {
            console.log(basket);
        }
        return {
            publicMethod: function(){
                    privateMethod();
            }
        };
    }()));
    

which can become quite powerful when used with `dojo.provide` and mixins. 

** YUI ** 

The following example is heavily based on the original YUI module pattern
implementation by Eric Miraglia, but is relatively self-explanatory.

    YAHOO.store.basket = function () {
    
        //"private" variables:
        var myPrivateVar = "I can be accessed only within YAHOO.store.basket .";
    
        //"private" method:
        var myPrivateMethod = function () {
                YAHOO.log("I can be accessed only from within YAHOO.store.basket");
            }
    
        return {
            myPublicProperty: "I'm a public property.",
            myPublicMethod: function () {
                YAHOO.log("I'm a public method.");
    
                //Within basket, I can access "private" vars and methods:
                YAHOO.log(myPrivateVar);
                YAHOO.log(myPrivateMethod());
    
                //The native scope of myPublicMethod is store so we can
                //access public members using "this":
                YAHOO.log(this.myPublicProperty);
            }
        };
    
    }();
    

** jQuery ** 

There are a number of ways in which jQuery code unspecific to plugins can be
wrapped inside the module pattern. Ben Cherry previously suggested an 
implementation where a function wrapper is used around module definitions in the
event of there being a number of commonalities between modules.

In the following example, a `library` function is defined which declares a new
library and automatically binds up the`init` function to `document.ready` when
new libraries (ie. modules) are created.

    function library(module) {
      $(function() {
        if (module.init) {
          module.init();
        }
      });
      return module;
    }
    
    var myLibrary = library(function() {
       return {
         init: function() {
           /*implementation*/
         }
       };
    }());
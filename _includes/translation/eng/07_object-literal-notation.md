##### Object Literal Notation 

In object literal notation, an object is described as a set of comma-separated
name/value pairs enclosured in curly braces
(`{}`). Names inside the object may be either strings or identifiers that are
followed by a colon. There should be no comma used after the final name/value 
pair in the object as this may result in errors.

Object literals don't require instantiation using the `new` operator but
shouldn't be used at the start of a statement as the opening`{` may be
interpreted as the beginning of a block. Below you can see an example of a 
module defined using object literal syntax. New members may be added to the 
object using assignment as follows`myModule.property = 'someValue';`

Whilst the module pattern is useful for many things, if you find yourself not
requiring specific properties or methods to be private, the object literal is a more than suitable alternative.

    var myModule = {
        myProperty : 'someValue',
        //object literals can contain properties and methods.
        //here, another object is defined for configuration
        //purposes:
        myConfig:{
            useCaching:true,
            language: 'en'   
        },
        //a very basic method
        myMethod: function(){
            console.log('I can haz functionality?');
        },
        //output a value based on current configuration
        myMethod2: function(){
            console.log('Caching is:' + (this.myConfig.useCaching)?'enabled':'disabled');
        },
        //override the current configuration
        myMethod3: function(newConfig){
            if(typeof newConfig == 'object'){
               this.myConfig = newConfig;
               console.log(this.myConfig.language); 
            }
        }
    };
    
    myModule.myMethod(); //I can haz functionality
    myModule.myMethod2(); //outputs enabled
    myModule.myMethod3({language:'fr',useCaching:false}); //fr


[3]: http://benalman.com/news/2010/11/immediately-invoked-function-expression/
[4]: http://groups.google.com/group/comp.lang.javascript/msg/9f58bd11bd67d937
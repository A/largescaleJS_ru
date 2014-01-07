##### Паттерн «Модуль»

Паттерн «модуль» — это популярная реализация паттерна, инкапсулирующего «приватную»
информацию, состояние и структуру используя замыкания. Это позволяет оборачивать
в модули набор публичных и приватных методов и переменных, и предотвращать
попадание этих переменных и методов в глобальный контекст, где они могут
конфликтовать с интерфейсами других разработчиков. Паттерн «модуль» возвращает
только публичную часть API, оставляя все остальное приватным, внутри замыканий.

Это обеспечивает чистое решение для того, чтобы, скрыв логику от посторонних
глаз, выполнять тяжелую работу исключительно через интерфейс, который вы
определите для использования в других частях вашего приложения. Этот паттерн
похож на  немедленно-вызываемые функциональые выражения ([IIFE][3]), 
за исключением того, что модуль возвращен не объект, а функцию.

Нужно заметить, что в JavaScript нет настоящей приватности. В отличии
от некоторых традиционных языков, JavaScript не имеет модификаторов доступа.
Переменные технически не могут быть объявленны как публичные или приватные, и
нам приходится использовать область видимости для того, чтобы эмулировать эту
концепцию. Благодаря замыканию, объявленные внутри модуля переменные и методы
доступны только изнутри этого модуля. Переменные и методы, объявленные внутри
объекта, возвращаемого модулем, будут доступны всем.

Ниже вы можете увидеть корзину покупок, реализованную с помощью паттерна «модуль».
Получившийся модуль находится в глобальном объекте `basketModule`, и содержит
все, что ему необходимо. Находящийся внутри модуля, массив `basket` приватный,
и другие части вашего приложения не могут напрямую взаимодействовать с ним. 
Массив `basket` существует внутри замыкания, созданного модулем, и
взаимодействовать с ним могут только методы, находящиеся в той же области
видимости (например, `addItem()`, `getItem()`). 

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
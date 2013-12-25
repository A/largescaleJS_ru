### CommonJS Modules

Over the last year or two, you may have heard about [CommonJS][5] - a volunteer
working group which designs, prototypes and standardizes JavaScript APIs. To 
date they've ratified standards for modules and packages.The CommonJS AMD 
proposal specifies a simple API for declaring modules which can be used with 
both synchronous and asynchronous script tag loading in the browser. Their 
module pattern is relatively clean and I consider it a reliable stepping stone 
to the module system proposed for ES Harmony (the next release of the JavaScript
language
).

From a structure perspective, a CommonJS module is a reusable piece of
JavaScript which exports specific objects made available to any dependent code. 
This module format is becoming quite ubiquitous as a standard module format for 
JS. There are plenty of great tutorials on implementing CommonJS modules, but at
a high-level they basically contain two primary parts: an`exports` object that
contains the objects a module wishes to make available to other modules and a
`require` function that modules can use to import the exports of other modules. 

    /*
    Example of achieving compatibility with AMD and standard CommonJS by putting
    boilerplate around the standard CommonJS module format:
    */
    
    (function(define){
    define(function(require,exports){
    // module contents
     var dep1 = require("dep1");
     exports.someExportedFunction = function(){...};
     //...
    });
    })(typeof define=="function"?define:function(factory){factory(require,exports)});
    

There are a number of great JavaScript libraries for handling module loading in
the**CommonJS** module format, but my personal preference is RequireJS. A
complete tutorial on RequireJS is outside the scope of this tutorial, but I can 
recommend reading James Burke's ScriptJunkie post on it[here][6]. I know a
number of people that also like Yabble.

Out of the box, RequireJS provides methods for easing how we create static
modules with wrappers and it's extremely easy to craft modules with support for 
asynchronous loading. It can easily load modules and their dependencies this way
and execute the body of the module once available.

There are some developers that however claim CommonJS modules aren't suitable
enough for the browser. The reason cited is that they can't be loaded via a 
script tag without some level of server-side assistance. We can imagine having a
library for encoding images as ASCII art which might export a`encodeToASCII`
function. A module from this could resemble:

    var encodeToASCII = require("encoder").encodeToASCII;
    exports.encodeSomeSource = function(){
        //process then call encodeToASCII
    }
    

This type of scenario wouldn't work with a script tag because the scope isn't
wrapped, meaning our`encodeToASCII` method would be attached to the `window`
`require` wouldn't be as such defined and exports would need to be created for
each module separately. A client-side library together with server-side 
assistance or a library loading the script with an XHR request using`eval()`
could however handle this easily.

Using RequireJS, the module from earlier could be rewritten as follows:

    define(function(require, exports, module) {
        var encodeToASCII = require("encoder").encodeToASCII;
        exports.encodeSomeSource = function(){
                //process then call encodeToASCII
        }
    });
    

For developers who may not rely on just using static JavaScript for their
projects, CommonJS modules are an excellent path to go down, but do spend some 
time reading up on it. I've really only covered the tip of the ice berg but both
the CommonJS wiki and Sitepen have a number of resources if you wish to read 
further.


[5]: http://commonjs.org
[6]: http://msdn.microsoft.com/en-us/scriptjunkie/ff943568
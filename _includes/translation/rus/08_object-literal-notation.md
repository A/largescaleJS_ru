##### Литеральная нотация объекта

В литеральной нотации объект описывается внутки блока фигурных скобок ({}), 
как набор разделенных точкой с запятой пар ключ/значение. Ключи объекта могут
быть как строками, так и идентификаторами. После имени ставится двоеточие.
В объекте не должно стоять точки с запятой после последней пары ключ/значение,
так как это может привести к ошибкам.

Литерал объекта не требует использования оператора `new` для создания инстанса,
но он не должен стоять в начале выражения, так как открытая `{` может быть
воспринята как начало блока. Ниже вы можете увидеть пример модуля, определенного
с помощью литеральной нотации объекта. Новые члены объекта могут быть добавлены
с помощью конструкции `myModule.property = 'someValue';`

Паттерн «модуль» может быть полезен для многих вещей. Если вы считаете, что вам
не нужно делать приватными некоторые методы или свойства, то литерал объекта — 
более чем подходящий выбор.

{% highlight javascript %}
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
{% endhighlight %}
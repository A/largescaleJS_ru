<!-- ##### Паттерн «Модуль» -->

«Модуль» — это популярная реализация паттерна, инкапсулирующего «приватную»
информацию, состояние и структуру используя замыкания. Это позволяет оборачивать
в модули набор публичных и приватных методов и переменных, и предотвращать их
попадание в глобальный контекст, где они могут конфликтовать с интерфейсами
других разработчиков. Паттерн «модуль» возвращает только публичную часть API,
оставляя все остальное доступным только изнутри замыканий.

Это хорошее решение для того, чтобы скрыть логику от посторонних глаз и выполнять
тяжелую работу исключительно через интерфейс, который вы определите для
использования в других частях вашего приложения. Этот паттерн очень похож
на немедленно-вызываемые функциональые выражения ([IIFE][3]), за тем исключением,
что модуль возвращает функцию, а не объект.

Важно заметить, что в JavaScript нет настоящей приватности. В отличии
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


{% highlight javascript %}
var basketModule = (function() {
    var basket = []; //приватная переменная
    return { //методы доступные извне
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
{% endhighlight %}

Внутри модуля, как вы заметили, мы возвращаем объект. Этот объект автоматически
прасваивается переменной `basketModule`, так что с ним можно взаимодействовать
следующим образом:

{% highlight javascript %}
//basketModule - это объект со свойствами, которые могут также быть и методами:
basketModule.addItem({item:'bread',price:0.5});
basketModule.addItem({item:'butter',price:0.3});

console.log(basketModule.getItemCount());
console.log(basketModule.getTotal());

// А следующий ниже код работать не будет:
console.log(basketModule.basket);// (undefined потому что не входит в возвращаемый объект)
console.log(basket); // (массив доступен только из замыкания)
{% endhighlight %}


Методы выше, фактически, помещены в неймспейс `basketModule`.

Истрически, паттерн «модуль» был разработан в 2003 году группой людей, в число
которых входил [Richard Cornford][4]. Позднее, этот паттерн был популяризован
Дугласом Крокфордом в его лекциях, и открыт занаво в блоге YUI благодаря Eric 
Miraglia.

Как насчет того, чтобы посмотреть на реализацию «модуля» в разных тулкитах
и фреймворках.

**Dojo** 

Dojo старается обеспечивать поведение похожее на классы, через `dojo.declare`,
который, кроме создания «модулей», также используется и для других вещей.
Давайте попробуем, для примера, опрелелить `basket` как модуль внутри неймспейса
`store`:

{% highlight javascript %}
// традиционный способ
var store = window.store || {};
store.basket = store.basket || {};

// с помощью dojo.setObject
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
{% endhighlight %}

Лучшего результата можно добиться, используя `dojo.provide` и миксины.

**YUI** 


Следующий код, по большей части, основан на примере реализации паттерна
«модуль» в фреймворке YUI, разработанным Eric Miraglia, но несколько более
самодокументирован.

{% highlight javascript %}
YAHOO.store.basket = function () {

    //приватная переменная:
    var myPrivateVar = "Ко мне можно получить доступ только из YAHOO.store.basket.";

    //приватный метод:
    var myPrivateMethod = function () {
        YAHOO.log("Я доступен только при вызове из YAHOO.store.basket");
    }

    return {
        myPublicProperty: "Я - публичное свойство",
        myPublicMethod: function () {
            YAHOO.log("Я - публичный метод");

            //Будучи внутри корзины я могу получить доступ к приватным переменный и методам:
            YAHOO.log(myPrivateVar);
            YAHOO.log(myPrivateMethod());

            //The native scope of myPublicMethod is store so we can
            //access public members using "this":
            YAHOO.log(this.myPublicProperty);
        }
    };

}();
{% endhighlight %}


**jQuery** 

Существует множество способов чтобы представить jQuery код в виде паттерна "модуль", 
даже тогда, когда этот код не напоминает привычные jQuery плагины. Бен Черри ранее 
предлагал способ, при котором, если у модулей есть общие черты, то они объявляются 
через функцию-обертку.

В следующем примере функция `library` используется для объявления новой
библиотеки и, автоматически, при создании библиотеки (т.е. модуля),
связывает вызов `init` с `document.ready`.

{% highlight javascript %}
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
       /* код модуля */
     }
   };
}());
{% endhighlight %}

{:class="message"}
**Ссылки по теме:**  
[Ben Cherry - The Module Pattern In-Depth][5]  
[John Hann - The Future Is Modules, Not Frameworks][6]  
[Nathan Smith - A Module pattern aliased window and document gist][7]  
[David Litmark - An Introduction To The Revealing Module Pattern][8]  


[3]: http://benalman.com/news/2010/11/immediately-invoked-function-expression/
[4]: http://groups.google.com/group/comp.lang.javascript/msg/9f58bd11bd67d937
[5]: http://www.adequatelygood.com/2010/3/JavaScript-Module-Pattern-In-Depth
[6]: http://lanyrd.com/2011/jsconf/sfgdk/
[7]: https://gist.github.com/274388
[8]: http://blog.davidlitmark.com/post/6009004931/an-introduction-to-the-revealing-module-pattern

<!-- ##### Литеральная нотация объекта -->

В литеральной нотации объект описывается внутри блока фигурных скобок (`{}`), 
как набор разделенных запятой пар ключ/значение. Ключи объекта могут
быть как строками, так и идентификаторами. После имени ставится двоеточие.
В объекте не должно стоять запятой после последней пары ключ/значение,
так как это может привести к ошибкам.

Литерал объекта не требует использования оператора `new` для создания экземпляра,
но он не должен стоять в начале выражения, так как открытая `{` может быть
воспринята как начало блока. Ниже вы можете увидеть пример модуля, определенного
с помощью литеральной нотации объекта. Новые члены объекта могут быть добавлены
с помощью конструкции `myModule.property = 'someValue';`

{:.message}
Паттерн «модуль» может быть полезен для многих вещей. Если вы считаете, что вам
не нужно делать приватными некоторые методы или свойства, то литерал объекта — 
более чем подходящий выбор.

{% highlight javascript %}

    var myModule = {
        myProperty: 'someValue',
        // Литералы объектов могут содержать свойства и методы.
        // ниже в свойстве определен другой объект,
        // для описания конфигурации:
        myConfig: {
            useCaching: true,
            language: 'en'   
        },
        // Очень простой метод
        myMethod: function() {
            console.log('I can haz functionality?');
        },
        // вывод значения заданного в конфигурации
        myMethod2: function() {
            console.log('Caching is: ' + ((this.myConfig.useCaching) ? 'enabled' : 'disabled'));
        },
        // переопределение конфигурации
        myMethod3: function(newConfig) {
            if (typeof newConfig == 'object') {
                this.myConfig = newConfig;
                console.log(this.myConfig.language); 
            }
        }
    };
    
    myModule.myMethod();  // 'I can haz functionality'
    myModule.myMethod2(); // Вывод 'enabled'
    myModule.myMethod3({language:'fr',useCaching:false}); // 'fr'

{% endhighlight %}

{:class="message"}
**Ссылки по теме:**  
[Ребекка Мёрфи — Использование объектов для организации вашего кода][1]  
[Стоян Стефанов — 3 способа определения класса в JavaScript ][2]  
[Бен Алман — Разъяснения по литералам объектов (понятия JSON-объект не существует)][3]  
[Джон Резиг - Простое наследование в JavaScript][4]

[1]: http://blog.rebeccamurphey.com/2009/10/15/using-objects-to-organize-your-code
[2]: http://www.phpied.com/3-ways-to-define-a-javascript-class/
[3]: http://benalman.com/news/2010/03/theres-no-such-thing-as-a-json/
[4]: http://ejohn.org/blog/simple-javascript-inheritance/

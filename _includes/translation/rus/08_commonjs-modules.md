<!-- ### CommonJS Модули -->


Возможно, в последний год или два вы что-то слышали о [CommonJS][4] — волонтерской
рабочей группе, которая проектирует, прототипирует и стандартизирует различные
JavaScript API. На сегодняшний день они ратифицировали стандарты для модулей и
пакетов(packages?). (мысль рвется) CommonJS AMD — это простой API для объявления
модулей, поддерживающий как синхронную так и асинхронную загрузку в браузере
с помощью тега `<script>`. Их паттерн «модуль» реализован достаточно просто, и 
я нахожу его хорошей ступенью к модульной системе, предложенной в ES Harmony
(следующем релизе языка JavaScript).

В плане структуры, CommonJS модуль представляет собой готовый к переиспользованию
фрагмент JavaScript кода, который экспортирует специальные объекты, которые
использует зависящий от этих модулей код. CommonJS становится все более
распространен, как стандартный формат JavaScript модулей. Существует большое
количество хороших уроков по реализации CommonJS модулей, но на высоком уровне
они содержат, в основном, две главных части: объект `exports`, содержащий объект,
который модуль хочет сделать доступной для других модулей, и `require`, функцию,
которая используется модулями для импорта объекта `exports` из других модулей.

{% highlight javascript %}
/*
Пример обеспечения совместимости между AMD и стандартом CommonJS с помощью
создания обертки над форматом CommonJS:
*/

(function(define){
define(function(require,exports){
// module contents
 var dep1 = require("dep1");
 exports.someExportedFunction = function(){...};
 //...
});
})(typeof define=="function"?define:function(factory){factory(require,exports)});
{% endhighlight %}

Есть много хороших JavaScript библиотек, для загрузки модулей в формате
**CommonJS**, но моим личным предпочтением является RequireJS. Полный учебник
по RequireJS выходит за рамки этого руководства, но я могу порекомендовать вам
почитать [пост James Bruke «ScriptJunkie»][5]. I know a number of people that
also like Yabble.

Из коробки, RequireJS обеспечивает методы для облегчения создания статичных
модулей с обертками, и, действительно, становится очень легко создавать модули
с поддержкой ассинхронной загрузки. It can easily load modules and their
dependencies this way and execute the body of the module once available.

Некоторые разработчики утверждают, что CommonJS модули не достаточно удобны
для использования в брузере, из-за того, что они не могут быть загруженны 
с помощью тега `script` без определенной помощи со стороны сервера. Представим
себе что есть некая библиотека для кодирования изображений в виде ASCII арта,
которая экспортирует функцию `encodeToASCII`. Модуль будет выглядеть как-то так:

{% highlight javascript %}
var encodeToASCII = require("encoder").encodeToASCII;
exports.encodeSomeSource = function(){
    //process then call encodeToASCII
}
{% endhighlight %}

Такой код не будет работать с тегом `<script>` без специальной обертки над
областью видимости переменных. Я имею в виду наш метод `encodeToASCII`, который
ссылается на несуществующие в контексте `window` методы `require` и `exports`.
В такой ситуации нам пришлось бы создавать `require` и `exports` отдельно
для каждого модуля. Клиентские библиотеки, которые с помощью серверной стороны
загружают скрипт через XHR-запрос, а затем выполняют `eval()`, могут легко
справится с этой проблемой. (???)

Используя RequireJS, перепишем модуль:

{% highlight javascript %}
define(function(require, exports, module) {
    var encodeToASCII = require("encoder").encodeToASCII;
    exports.encodeSomeSource = function(){
            // process then call encodeToASCII
    }
});
{% endhighlight %}

Для разработчиков, которые хотят пойти дальше простого использования JavaScript
в своих проектах, CommonJS модули — прекрасная возможность начать движение в эту
сторону, но нужно потратить немного времени для того чтобы разобраться с этим
поближе. На самом деле, все, что я рассказал — только верхушка айсберга, к счастью
и CommonJS wiki и SitePen содержат много материалов, которые вам помогут
вам лучше разобраться в CommonJS модулях.

{:class="message"}
**Ссылки по теме:**  
[The CommonJS Module Specifications][1]  
[Alex Young - Demystifying CommonJS Modules][2]  
[Notes on CommonJS modules with RequireJS][3]  

[1]: http://wiki.commonjs.org/wiki/Modules
[2]: http://dailyjs.com/2010/10/18/modules/
[3]: http://requirejs.org/docs/commonjs.html#packages
[4]: http://commonjs.org
[5]: http://msdn.microsoft.com/en-us/scriptjunkie/ff943568
### Давайте обсудим вашу существующую архитектуру

Если вы работаете над большим JavaScript приложением, не забывайте уделять 
**достаточно времени** на планирование базовой архитектуры, к которой очень
чувствительны подобного рода приложения. Большие приложения обычно представляют
из себя очень сложные системы. Гораздо более сложные, чем вы себе их
представляете изначально.

Я должен подчеркнуть значение этой разницы — я видел разработчиков, которые,
сталкиваясь с большими приложениями, делали шаг назад и говорили: «Хорошо,
У меня есть несколько идей и подходов, которые хорошо показали себя в моем
предыдущем средне-масштабном проекте. Вне всякого сомнения, они сработают и
на чем-то большем, верно?». Конечно, это может быть до какой-то степени верным,
но, пожалуйста, не принимайте это как доложное — большие приложения в основном
имеют ряд достаточно серьезных проблем, с которыми нужно считаться. Ниже я
приведу немного доводов о том, почему вам стоит потратить чуть больше времени 
на планирование архитектуры своего приложения, и чем это будет вам полезно
в долгосрочной перспективе.

Большинство JavaScript разработчиков в архитектуре своих приложений обычно
использует различные комбинации из следующих компонентов:

*   custom widgets
*   models
*   views
*   controllers
*   templates
*   libraries/toolkits
*   an application core.

Вы, вероятно, так же разбиваете различные функции ваших приложений на наборы
модулей. Либо используете какие-то иные паттерны для подобного разделения. Это
замечательно, но здесь есть несколько потенциальных проблем, с которыми вы
можете столкнуться, используя такой подход.


##### 1. Насколько ваша архитектура готова к переиспользованию прямо сейчас?

Могут ли отдельные модули использоваться самостоятельно? Являются ли они
автономными? Мог бы я прямо сейчас взять один из модулей вашего большого 
приложения, просто поместить его на новую веб-страницу, и тут же начать этот
модуль использовать? Вы можете задаться вопросом «Действительно ли это
необходимо?», как бы то ни было, я надеюсь, что вы думаете о будущем. Что, 
если ваша компания начнет создавать все больше и больше нетривиальных
приложений, которые будут имеють некоторую общую функциональность? Если кто-то
скажет «Нашим пользователям очень нравится использовать модуль чата в нашем
email-клиенте. Давайте добавим этот модуль к нашему новому приложению для
совместной работы с докуменатми!», будет ли это возможно, если мы не уделим
должного внимания контролю изменений кода? (???)


##### 2. Сколько модулей в вашей системе зависит от других модулей?

Насколько сильно связаны ваши модули? Перед тем, как я погружусь в объяснения,
о важности низкой связанности модулей, я должен отметить, что не всегда есть
возможность создавать модули, не имеющие абсолютно никаких зависимостей
в системе. Фактически, ваши модули могут, к примеру, расширять функции других, 
уже существующих модулей. Эта тема, скорее всего, относится к группировке
модулей на основе некоторого функционала (???). It should be possible 
for all of these distinct sets of modules to work in your application without 
depending on too many other modules being present or loaded in order to function.


##### 3. If specific parts of your application fail, can it still function? 

If you're building a GMail-like application and your webmail module (or modules
) fail, this shouldn't block the rest of the UI or prevent users from being able
to use other parts of the page such as chat. At the same time, as per before, 
modules should ideally be able to exist on their own outside of your current 
application architecture. In my talks I mention dynamic dependency (or module) 
loading based on expressed user-intent as something related. For example, in 
GMail's case they might have the chat module collapsed by default without the 
core module code loaded on page initialization. If a user expressed an intent to
use the chat feature, only then would it be dynamically loaded. Ideally, you 
want this to be possible without it negatively affecting the rest of your 
application.


##### 4. How easily can you test individual modules?

When working on systems of significant scale where there's a potential for
millions of users to use (or mis-use) the different parts it, it's essential 
that modules which may end up being re-used across a number of different 
applications be sufficiently tested. Testing needs to be possible for when the 
module both inside and outside of the architecture for which it was initially 
built. In my view, this provides the most assurance that it shouldn't break if 
dropped into another system.
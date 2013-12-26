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

*   касто widgets
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

##### 1. How much of this architecture is instantly re-usable? 

Can single modules exist on their own independently? Are they self-contained?
Right now if I were to look at the codebase for a large application you or your 
team were working on and selected a random module, would it be possible for me 
to easily just drop it into a new page and start using it on its own?. You may 
question the rationale behind wanting to do this, however I encourage you to 
think about the future. What if your company were to begin building more and 
more non-trivial applications which shared some cross-over in functionality?. If
someone said, 'Our users love using the chat module in our mail client. Let's 
drop that into our new collaborative editing suite', would this be possible 
without significantly altering the code?


##### 2. How much do modules depend on other modules in the system? 

Are they tightly coupled? Before I dig into why this is a concern, I should
note that I understand it's not always possible to have modules with absolutely 
no other dependencies in a system. At a granular level you may well have modules
that extend the base functionality of others, but this question is more-so 
related to groups of modules with distinct functionality. It should be possible 
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
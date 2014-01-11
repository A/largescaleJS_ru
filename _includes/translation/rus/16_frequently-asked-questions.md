<!-- ### Frequently Asked Questions -->

### Возможно ли обойтись без использования песочницы или фасада?

Хотя архитектура, которую я изложил здесь использует фасад для обеспечения
безопасности, вполне возможно достичь того же с помощью медиатора — сообщения
могут обрабатываться непосредственно ядром без использования фасада. Такая
упрощенная версия все равно будет обеспечивать необходимо низкий уровень
связывания кода, но при выборе этого варианта, нужно понимать, насколько вам
будет комфортно работать с модулями, которые взаимодействуют напрямую
с ядром(медиатором).

### В книге говорилось о том, что модули не должны иметь любых зависимостей, касается ли это библиотек (к примеру, jQuery)

Я специально вынес вопрос о зависимостях от других модулей сюда. Когда
некоторые разработчики выбирают подобную архитектуру, этот выбор подразумевает
определенную использование определенных абстракций от DOM-библиотек. К примеру,
вы можете использовать вспомогательную утилиту, которая будет возвращать нужные
вам DOM-элементы используя jQuery (или dojo). Таким образоб модули все еще могут
удобно работать с DOM, но уже будут это делать не напрямую, жестко используя
конкретную библиотеку. Существует достаточно много способов, как сделать
модули независимыми, но стоит понимать, что, в обсуждаемой нами архитектуре,
идеальные модули не должны иметь зависимостей.

You'll find that when this is the case it can sometimes be more easy to get a
complete module from one project working in another with little extra effort. I 
should make it clear that I fully agree that it can sometimes be significantly 
more sensible for modules to extend or use other modules for part of their 
functionality, however bear in mind that this can in some cases increase the 
effort required to make such modules 'liftable' for other projects.

### Q: I'd like to start using this architecture today. Is there any boilerplate code around I can work from?

A: I plan on releasing a free boilerplate pack for this post when time permits
, but at the moment, your best bet is probably the
'[Writing Modular JavaScript][14]' premium tutorial by Andrew Burgees (for
complete disclosure, this is a referral link as any credits received are re-
invested into reviewing material before I recommend it to others). Andrew's pack
includes a screencast and code and covers most of the main concepts outlined in 
this post but opts for calling the facade a 'sandbox', as per Zakas. There's 
some discussion regarding just how DOM library abstraction should be ideally 
implemented in such an architecture - similar to my answer for the second 
question, Andrew opts for some interesting patterns on generalizing query 
selectors so that at most, switching libraries is a change that can be made in a
few short lines. I'm not saying this is the right or best way to go about this, 
but it's an approach I personally also use.

### Q: If the modules need to directly communicate with the core, is this possible?

A: As Zakas has previously hinted, there's technically no reason why modules
shouldn't be able to access the core but this is more of a best practice than 
anything. If you want to strictly stick to this architecture you'll need to 
follow the rules defined or opt for a looser architecture as per the answer to 
the first question.


[14]: http://bit.ly/orGVOL
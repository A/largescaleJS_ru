### Теория модулей

Вероятно, вы уже используете некоторую вариацию модуей в своей существующей
архитектуре. Если это не так, то в этой главе я покажу вам как они устроены.

Модули — это **целая** часть любой хорошей архитектуры приложения. Обычно,
модули выполняют одну определенную задачу в более крупных системах, и могут быть
взаимозаменяемы. (?)

В зависимости от реализации, в модулях можно определять их зависимости, которые
могут быть автоматически загруженны, таким образо собирая вместе все компоненты
системы. Такой подход считается более масштабируемым, в отличии от ручной
загрузки модулей, или подстановки тега `<script>`.

Каждое нетривиальное приложение должно создаваться из модульных компонентов.
Возвращаясь к GMail, вы можете рассматривать модули, как независимые единицы
функциональности, которая может существовать сама по себе. Например, 
функция чата. Вероятно эта функция может быть основана на модуле чата, однако, 
в зависи от сложности рассматривоемой функции, модуль может состоять и из более
мелких вспомогательных модулей. Например, один из таких модулей мог бы
обеспечивать использование смайликов. Такой модуль мог бы использоваться как
в чате, так и в почте. 

В рассматриваемой архитектуре, модули имеют  **очень ограниченные знания**
о том, что происходит в других частях системы. Вместо этого мы передаем
эту ответственность медиатору и фасаду. 

This is by design because if a module only cares about letting the system know
when something of interest happens without worrying if other modules are running,
a system is capable of supporting adding, removing or replacing modules without 
the rest of the modules in the system falling over due to tight coupling.

Loose coupling is thus essential to this idea being possible. It facilitates
easier maintainability of modules by removing code dependencies where possible. 
In our case, modules should not rely on other modules in order to function 
correctly. When loose coupling is implemented effectively, its straight-forward 
to see how changes to one part of a system may affect another.

In JavaScript, there are several options for implementing modules including the
well-known module pattern and object literals. Experienced developers will 
already be familiar with these and if so, please skip ahead to the section on 
CommonJS modules.
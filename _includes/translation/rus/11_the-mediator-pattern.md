<!-- ### Паттерн «Медиатор» -->

Объяснить, что из себя представляет паттерн «Медиатор» можно на примере простой
аналогии — представьте себе как аэропорт обеспечивает контроль траффика. Башня
принимает решение о том, какие самолеты могут приземлиться, потому что все
взаимодействие происходит от самолетов к контрольной башне, вместо того, чтобы
происходить напрямую между самолетами. Централизованный котроллер — это ключ к
успеху этой системы, и это и есть паттерн «медиатор».

Медиатор используется когда взаимодействия между модулями могут быть сложными,
но все еще **хорошо определенными**. Если оказывается, что система может может
иметь слишком много связай между модулями в коде, это может быть моментом, когда
следует создать центральную точку контроля. Медиатор идеально подходит для этой
задачи.

В реальном мире, термин «медиатор» **инкапсулирует взаимодействие** различных
модулей друг с другом, выступая в качестве посредника. Паттерн также способствует
ослаблению связей,  предотвращая взаимодействие модулей друг с другом. В нашей
системе это помогает решить проблемы с зависимостями между модулями.

Какие еще преимущества существуют у «медиатора»? Ну например, медиатор позволяет
каждому модулю действовать абсолютно независимо, таким образом модули выходят
очень гибкими. Если вы раньше использовали паттерн «Обсервер» (читатель/подписчик),
для реализации системы доставки событий между модулями в вашей системе, то 
достаточно легко разберетесь с медиатором.

Let's take a look at a high level view of how modules might interact with a
mediator:

![][7]

Consider modules as publishers and the mediator as both a publisher and
subscriber. Module 1 broadcasts an event notifying the mediator something needs 
to done. The mediator captures this message and 'starts' the modules needed to 
complete this task Module 2 performs the task that Module 1 requires and 
broadcasts a completion event back to the mediator. In the mean time, Module 3 
has also been started by the mediator and is logging results of any 
notifications passed back from the mediator.

Notice how at no point do any of the modules** directly communicate** with one
another. If Module 3 in the chain were to simply fail or stop functioning, the 
mediator could hypothetically 'pause' the tasks on the other modules, stop and 
restart Module 3 and then continue working with little to no impact on the 
system. This level of decoupling is one of the main strengths the pattern has to
offer.

To review, the advantages of the mediator are that:

It decouples modules by introducing an intermediary as a central point of
control.It allows modules to broadcast or listen for messages without being 
concerned with the rest of the system. Messages can be handled by any number of 
modules at once.

It is typically significantly more easy to add or remove features to systems
which are loosely coupled like this.

And its disadvantages: 

By adding a mediator between modules, they must always communicate indirectly.
This can cause a very minor performance drop - because of the nature of loose 
coupling, its difficult to establish how a system might react by only looking at
the broadcasts. At the end of the day, tight coupling causes all kinds of 
headaches and this is one solution.

** Example:** This is a possible implementation of the mediator pattern based
on previous work by[@rpflorence][8]

    var mediator = (function(){
        var subscribe = function(channel, fn){
            if (!mediator.channels[channel]) mediator.channels[channel] = [];
            mediator.channels[channel].push({ context: this, callback: fn });
            return this;
        },
    
        publish = function(channel){
            if (!mediator.channels[channel]) return false;
            var args = Array.prototype.slice.call(arguments, 1);
            for (var i = 0, l = mediator.channels[channel].length; i 
    
    
    
**Example:** Here are two sample uses of the implementation from above. It's effectively managed publish/subscribe:
    
    
    
    //Pub/sub on a centralized mediator
    
    mediator.name = "tim";
    mediator.subscribe('nameChange', function(arg){
            console.log(this.name);
            this.name = arg;
            console.log(this.name);
    });
    
    mediator.publish('nameChange', 'david'); //tim, david
    
    
    //Pub/sub via third party mediator
    
    var obj = { name: 'sam' };
    mediator.installTo(obj);
    obj.subscribe('nameChange', function(arg){
            console.log(this.name);
            this.name = arg;
            console.log(this.name);
    });
    
    obj.publish('nameChange', 'john'); //sam, john


[7]: /assets/img/chart4a.jpg
[8]: https://github.com/rpflorence
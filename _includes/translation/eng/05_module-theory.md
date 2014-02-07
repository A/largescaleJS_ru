### Module Theory 

You probably already use some variation of modules in your existing
architecture. If however, you don't, this section will present a short primer on
them.

Modules are an **integral** piece of any robust application's architecture and
are typically single-purpose parts of a larger system that are interchangeable.

Depending on how you implement modules, it's possible to define dependencies
for them which can be automatically loaded to bring together all of the other 
parts instantly. This is considered more scalable than having to track the 
various dependencies for them and manually load modules or inject script tags.

Any significantly non-trivial application should be built from modular
components. Going back to GMail, you could consider modules independent units of
functionality that can exist on their own, so the chat feature for example. It's
probably backed by a chat module, however, depending on how complex that unit of
functionality is, it may well have more granular sub-modules that it depends on.
For example, one could have a module simply to handle the use of emoticons which
can be shared across both chat and mail composition parts of the system.

In the architecture being discussed, modules have a **very limited knowledge**
of what's going on in the rest of the system. Instead, we delegate this 
responsibility to a mediator via a facade.

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
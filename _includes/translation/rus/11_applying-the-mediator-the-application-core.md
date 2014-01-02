### **Applying the Mediator: The Application Core**


The mediator plays the role of the application core. We've briefly touched on
some of its responsibilities but lets clarify what they are in full. 



The core's primary job is to manage the module **lifecycle. **When the core
detects an** interesting message** it needs to decide how the application
should react - this effectively means deciding whether a module or set of
modules needs to be **started** or** stopped**. 

Once a module has been started, it should ideally execute **automatically**.
It's not the core's task to decide whether this should be when the DOM is ready
and there's enough scope in the architecture for modules to make such decisions
on their own. 

You may be wondering in what circumstance a module might need to be 'stopped'
- if the application detects that a particular module has failed or is
experiencing significant errors, a decision can be made to prevent methods in
that module from executing further  so that it may be restarted. The goal here
is to assist in reducing disruption to the user experience.

In addition, the core should enable **adding or removing** modules without
breaking anything. A typical example of where this may be the case is
functionality which may not be available on initial page load, but is
dynamically loaded based on expressed user-intent eg. going back to our GMail
example, Google could keep the chat widget collapsed by default and only
dynamically load in the chat module(s) when a user expresses an interest in
using that part of the application. From a performance optimization perspective,
this may make sense.

Error management will also be handled by the application core. In addition to
modules broadcasting messages of interest they will also broadcast any errors
experienced which the core can then react to accordingly (eg. stopping modules,
restarting them etc).It's important that as part of a decoupled architecture
there to be enough scope for the introduction of new or better ways of handling
or displaying errors to the end user without manually having to change each
module. Using publish/subscribe through a mediator allows us to achieve this.
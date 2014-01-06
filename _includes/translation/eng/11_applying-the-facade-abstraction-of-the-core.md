### **Applying The Facade: Abstraction Of The Core**

In the architecture suggested:

A facade serves as an **abstraction** of the application core which sits between
the mediator and our modules - it should ideally be the **only** other part of
the system modules are aware of. 




The responsibilities of the abstraction include ensuring a **consistent
interface** to these modules is available at all times. This closely resembles
the role of the **sandbox controller** in the excellent architecture first
suggested by Nicholas Zakas.


Components are going to communicate with the mediator through the facade so it
needs to be **dependable**. When I say 'communicate', I should clarify that as
the facade is an abstraction of the mediator which will be listening out for
broadcasts from modules that will be relayed back to the mediator.


In addition to providing an interface to modules, the facade also acts as
a security guard, determining which parts of the application a module may
access. Components only call **their own** methods and shouldn't be able to
interface with anything they don't have permission to. For example, a module
may broadcast dataValidationCompletedWriteToDB. The idea of a security check
here is to ensure that the module has permissions to request database-write
access. What we ideally want to avoid are issues with modules accidentally
trying to do something they shouldn't be.


To review in short, the mediator remains a type of pub/sub manager but is only
passed interesting messages once they've cleared permission checks by the
facade.
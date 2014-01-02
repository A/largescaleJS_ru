### **Tying It All Together**


*   **Modules** contain specific pieces of functionality for your application.
    They publish notifications informing the application whenever something 
    interesting happens - this is their primary concern. As I'll cover in the FAQs, 
    modules can depend on DOM utility methods, but ideally shouldn't depend on any 
    other modules in the system. They should not be concerned with:
   
    
    *   what objects or modules are subscribing to the messages they publish
    *   where these objects are based (whether this is on the client or server
        )
    *   how many objects subscribe to notifications

**![][9]**

*   **The Facade** abstracts the core to avoid modules touching it directly. It
    subscribes to interesting events (from modules) and says 'Great! What happened? 
    Give me the details!'. It also handles module security by checking to ensure the
    module broadcasting an event has the necessary permissions to pass such events 
    that can be accepted.

**![][10]**

*   **The Mediator (Application Core)** acts as a 'Pub/Sub' manager using the
    mediator pattern. It's responsible for module management and starts/stops 
    modules as needed. This is of particular use for dynamic dependency loading and 
    ensuring modules which fail can be centrally restarted as needed.
   
**![][11]**

The result of this architecture is that modules (in most cases) are
theoretically no longer dependent on other modules. They can be easily tested 
and maintained on their own and because of the level of decoupling applied, 
modules can be picked up and dropped into a new page for use in another project 
without significant additional effort. They can also be dynamically added or 
removed without the application falling over.


[9]: img/chart1a.gif
[10]: img/chart2a.gif
[11]: img/chart3a.gif
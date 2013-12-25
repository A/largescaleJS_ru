### Let's review your current architecture.

If working on a significantly large JavaScript application, remember to
dedicate**sufficient time** to planning the underlying architecture that makes
the most sense. It's often more complex than you may initially imagine.

I can't stress the importance of this enough - some developers I've seen
approach larger applications have stepped back and said 'Okay. Well, there are a
set of ideas and patterns that worked well for me on my last medium-scale 
project. Surely they should mostly apply to something a little larger, right?'. 
Whilst this may be true to an extent, please don't take it for granted
- **larger apps generally have greater concerns that need to be factored in**.
I'm going to discuss shortly why spending a little more time planning out the 
structure to your application is worth it in the long run.

Most JavaScript developers likely use a mixed combination of the following for
their current architecture:

*   custom widgets
*   models
*   views
*   controllers
*   templates
*   libraries/toolkits
*   an application core. 

You probably also break down your application's functionality into blocks of
modules or apply other patterns for this. This is great, but there are a number 
of potential problems you can run into if this represents all of your 
application's structure.


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
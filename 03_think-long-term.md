### Think Long Term

When devising the architecture for your large application, it's important to
think ahead. Not just a month or a year from now, but beyond that. What might 
change? It's of course impossible to guess exactly how your application may grow,
but there's certainly room to consider what is likely. Here, there is at least 
one specific aspect of your application that comes to mind.

Developers often couple their DOM manipulation code quite tightly with the rest
of their application - even when they've gone to the trouble of separating their
core logic down into modules. Think about it..why is this not a good idea if we'
re thinking long-term?

One member of my audience suggested that it was because a rigid architecture
defined in the present may not be suitable for the future. Whilst certainly true,
there's another concern that may cost even more if not factored in.

You may well decide to **switch** from using Dojo, jQuery, Zepto or YUI to
something entirely different for reasons of performance, security or design in 
the future. This can become a problem because libraries are not easily 
interchangeable and have high switching costs if tightly coupled to your app.

If you're a Dojo developer (like some of the audience at my talk), you may not
have something better to switch to in the present, but who is to say that in 2-3
years something better doesn't come out that you'll want to switch to?
.

This is a relatively trivial decision in smaller codebases but for larger
applications, having an architecture which is flexible enough to support**not**

To summarize, if you reviewed your architecture right now, could a decision to
switch libraries be made without rewriting your entire application?. If not, 
consider reading on because I think the architecture being outlined today may be
of interest.

There are a number of influential JavaScript developers who have previously
outlined some of the concerns I've touched upon so far. Three key quotes I would
like to share from them are the following:

"The secret to building large apps is never build large apps. Break your
applications into small pieces. Then, assemble those testable, bite-sized pieces
into your big application
" - **Justin Meyer, author JavaScriptMVC**

"The key is to acknowledge from the start that you have no idea how this will
grow. When you accept that you don't know everything, you begin to design the 
system defensively. You identify the key areas that may change, which often is 
very easy when you put a little bit of time into it. For instance, you should 
expect that any part of the app that communicates with another system will 
likely change, so you need to abstract that away.
" - **Nicholas Zakas, author 'High-performance JavaScript websites'**

and last but not least:

"The more tied components are to each other, the less reusable they will be,
and the more difficult it becomes to make changes to one without accidentally 
affecting another
" - **Rebecca Murphey, author of jQuery Fundamentals.** These principles are
essential to building an architecture that can stand the test of time and should
always be kept in mind.
### Today we're going to discuss an effective set of patterns for large-scale
JavaScript application architecture. The material is based on my talk of the 
same name, last presented at LondonJS and inspired by[previous work][1] by
Nicholas Zakas.


### Who am I and why am I writing about this topic?

I'm currently a JavaScript and UI developer at AOL helping to plan and write
the front-end architecture to our next generation of client-facing applications.
As these applications are both complex and often require an architecture that is
scalable and highly-reusable, it's one of my responsibilities to ensure the 
patterns used to implement such applications are as sustainable as possible.

I also consider myself something of a design pattern enthusiast (although there
are far more knowledgeable experts on this topic than I). I've previously 
written the creative-commons book
'[Essential JavaScript Design Patterns][2]' and am in the middle of writing the
more detailed follow up to this book at the moment.


### Can you summarize this article in 140 characters?

In the event of you being short for time, here's the tweet-sized summary of
this article:

Decouple app. architecture w/module,facade & mediator patterns. Mods publish
msgs, mediator acts as pub/sub mgr & facade handles security


[1]: http://yuilibrary.com/theater/nicholas-zakas/zakas-architecture/
[2]: http://addyosmani.com/resources/essentialjsdesignpatterns/book/
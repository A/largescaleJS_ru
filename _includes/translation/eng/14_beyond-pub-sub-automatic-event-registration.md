### Beyond Pub/Sub: Automatic Event Registration

As previously mentioned by Michael Mahemoff, when thinking about large-scale
JavaScript, it can be of benefit to exploit some of the more dynamic features of
the language. You can read more about some of the concerns highlighted on 
Michael's[G+][12] page, but I would like to focus on one specifically -
automatic event registration (AER
).

AER solves the problem of wiring up subscribers to publishers by introducing a
pattern which auto-wires based on naming conventions. For example, if a module 
publishes an event called`messageUpdate`, anything with a `messageUpdate`
method would be automatically called.

The setup for this pattern involves registering all components which might
subscribe to events, registering all events that may be subscribed to and 
finally for each subscription method in your component-set, binding the event to
it. It's a very interesting approach which is related to the architecture 
presented in this post, but does come with some interesting challenges.

For example, when working dynamically, objects may be required to register
themselves upon creation. Please feel free to check out Michael's[post][13] on
AER as he discusses how to handle such issues in more depth.


[12]: https://plus.google.com/106413090159067280619/posts/hDZkVrDXZR6
[13]: http://softwareas.com/automagic-event-registration
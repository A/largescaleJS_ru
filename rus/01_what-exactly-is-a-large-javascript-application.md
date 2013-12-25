### What exactly *is* a 'large' JavaScript application?

Before we begin, let us attempt to define what we mean when we refer to a
JavaScript application as being significantly 'large'. This is a question I've 
found still challenges developers with many years of experience in the field and
the answer to this can be quite subjective.

As an experiment, I asked a few intermediate developers to try providing their
definition of it informally. One developer suggested 'a JavaScript application 
with over 100,000 LOC' whilst another suggested 'apps with over 1MB of 
JavaScript code written in-house'. Whilst valiant (if not scary) suggestions, 
both of these are**incorrect** as the size of a codebase does not always
correlate to application complexity - those 100,000 LOC could easily represent 
quite trivial code.

My own definition may or may not be universally accepted, but I believe that it
's closer to what a large application actually represents.

In my view, large-scale JavaScript apps are **non-trivial** applications
requiring**significant** developer effort to maintain, where most heavy lifting
of data manipulation and display falls to the**browser**. 

The last part of this definition is possibly the most significant.
; Exercise 3.53. Without running the program, describe the elements of the stream defined by

(define s (cons-stream 1 (add-streams s s)))

; The stream has an intial value of 1. The next value is a promise to execute (add-stream s s), which returns a stream whose car is 2, and whose cdr will evaluate to a stream with a car of 4.

; This is a doubles stream.



#lang racket

(require sicp)
(require "celsius-to-fahrenheit/multiplier.rkt")
(require "celsius-to-fahrenheit/connector.rkt")

; Exercise 3.34. Louis Reasoner wants to build a squarer, a constraint device with two terminals such that the value of connector b on the second terminal will always be the square of the value a on the first terminal. He proposes the following simple device made from a multiplier:

(define (squarer a b)
  (multiplier a a b))

; There is a serious flaw in this idea. Explain.

; While it works from the point of view of setting "a", setting "b" won't assign the correct values to "a". Here's why:

; Say we make our connectors and apply the squarer constraint:

(define a (make-connector))
(define b (make-connector))
(squarer a b)

; Then we attempt to set b's value to 25.

(set-value! b 25 'user)

; set-value! runs the internal set-my-value procedure on the b connector. That will execute the following code:

;(set! value newval)
;             (set! informant setter)
;             (for-each-except setter
;                              inform-about-value
;                              constraints))

; b's value becomes 25. Its setter becomes 'user. And for-each-except will iterate through the constraints (just "multuplier") and call inform-about-value on it. That kicks off the multiplier's process-new-value procedure, which doesn't catch the condition where only "product" connector has a value. That means the a connector value will remain #f, its initialization value.

(get-value a) ; #f
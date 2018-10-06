#lang racket

(require sicp)
(require "celsius-to-fahrenheit/connector.rkt")
(require "celsius-to-fahrenheit/adder.rkt")
(require "celsius-to-fahrenheit/multiplier.rkt")

; Exercise 3.33. Using primitive multiplier, adder, and constant constraints, define a procedure averager that takes three connectors a, b, and c as inputs and establishes the constraint that the value of c is the average of the values of a and b.

(define (averager a b c)
  ; establishes the constraint that connector c is the average of connectors a and b, or a + b = 2 * c

  ; create a sum and two connector
  (let ((sum (make-connector)) (two (make-connector)))
    ; constrain a + b = sum
    (adder a b sum)
    ; constantize two
    (constant 2 two)
    ; constrain 2 * c = sum
    (multiplier two c sum)
    'ok))

(define A (make-connector))
(define B (make-connector))
(define C (make-connector))

(averager A B C)

(set-value! A 25 'user)
(set-value! B 5 'user)

(get-value C) ;15
#lang racket

(require sicp)
(require "celsius-to-fahrenheit/connector.rkt")
(require "celsius-to-fahrenheit/adder.rkt")
(require "celsius-to-fahrenheit/multiplier.rkt")

; Here c+, c*, etc. are the ‘‘constraint’’ versions of the arithmetic operations. For example, c+ takes two connectors as arguments and returns a connector that is related to these by an adder constraint:

(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))

; Define analogous procedures c-, c*, c/, and cv (constant value) that enable us to define compound constraints as in the converter example above.

(define (c- sum x)
  (let ((y (make-connector)))
    (adder x y sum)
    y))

(define (c* x y)
  (let ((prod (make-connector)))
    (multiplier x y prod)
    prod))

(define (c/ x y)
  (let ((quotient (make-connector)))
    (multiplier quotient y x)
    quotient))

(define (cv val)
  (let ((x (make-connector)))
    (constant val x)
    x))

; Exercise 3.37. The celsius-fahrenheit-converter procedure is cumbersome when compared with a more expression-oriented style of definition, such as

(define (celsius-fahrenheit-converter x)
  (c+ (c* (c/ (cv 9) (cv 5))
          x) (cv 32)))

(define C (make-connector))
(define F (celsius-fahrenheit-converter C))
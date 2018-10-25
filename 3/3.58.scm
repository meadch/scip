; Exercise 3.58. Give an interpretation of the stream computed by the following procedure

(load "streams.scm")

(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

; returns the digits of num/den in base radix
(display-stream (expand 10 5 2) 20)

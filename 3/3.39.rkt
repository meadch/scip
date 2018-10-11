#lang racket
(require sicp)

; Exercise 3.39. Which of the five possibilities in the parallel execution shown above remain if we instead serialize execution as follows:

(define x 10)
(define s (make-serializer))

(parallel-execute (lambda () ; P1
                    (set! x
                          ((s (lambda () (* x x)))))) ; P2
                  (s (lambda () (set! x (+ x 1))))) ; P3

; 100
; P2 reads x (10) and returns 100
; P3 reads x (10)
; P3 sets x to 11
; P1 sets x to 100

; 101
; P2 reads x (10) and returns 100
; P1 sets x to 100
; P3 reads x (100)
; P3 sets x to 101

; 121
; P3 reads x (10)
; P3 sets x to 11
; P2 reads x (11) and returns 121
; P1 sets x to 121

; 11
; P2 reads x (10) and returns 100
; P3 reads x (10)
; P1 sets x to 100
; P3 sets x to 11

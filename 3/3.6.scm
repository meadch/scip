;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |3.6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require sicp)

; Exercise 3.6.
; It is useful to be able to reset a random-number generator to produce a sequence starting from a given value.

;Design a new rand procedure that is called with an argument that is either the symbol generate or the symbol reset and behaves as follows: (rand ’generate) produces a new random number; ((rand ’reset) <new-value>) resets the internal state variable to the designated <new-value>. Thus, by resetting the state, one can generate repeatable sequences. These are very handy to have when testing and debugging programs that use random numbers.

; NOTE: Following solution works only when random-init and rand-update are defined. You can test using naive implementations:

(define random-init 0) 
(define (rand-update x) (+ x 1))

(define rand
  (let ((x random-init))
    (lambda (message)
      (cond ((eq? message 'generate) (begin (set! x (rand-update x)) x))
            ((eq? message 'reset) (lambda (new-value) (set! x new-value)))))))
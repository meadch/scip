;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |3.2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require sicp)

;Exercise 3.2. In software-testing applications, it is useful to be able to count the number of times a given procedure is called during the course of a computation. Write a procedure make-monitored that takes as input a procedure, f, that itself takes one input. The result returned by make-monitored is a third procedure, say mf, that keeps track of the number of times it has been called by maintaining an internal counter. If the input to mf is the special symbol how-many-calls?, then mf returns the value of the counter. If the input is the special symbol reset-count, then mf resets the counter to zero. For any other input, mf returns the result of calling f on that input and increments the counter. For instance, we could make a monitored version of the sqrt procedure:

(define (make-monitored f)
  (define counter 0)

  (define increment-count (lambda () (set! counter (+ counter 1))))
  (define reset-count (lambda () (set! counter 0)))

  (define (dispatch input)
    (cond ((eq? input 'how-many-calls?) counter)
          ((eq? input 'reset-count) (reset-count))
          (else (begin (increment-count) (f input)))))

  dispatch)
#lang racket
(require sicp)
(require "wire.rkt")
(require "agenda.rkt")

(provide and-gate)

(define and-gate-delay 3)

(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
           (logical-and (get-signal a1) (get-signal a2))))
      (after-delay and-gate-delay
                   (lambda () (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)


(define (logical-and s1 s2)
  (if (and (= s1 1) (= s2 1)) 1 0))
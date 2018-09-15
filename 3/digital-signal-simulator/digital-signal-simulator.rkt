#lang racket

(require sicp)
(require "wire.rkt")
(require "agenda.rkt")
(require "functions.rkt")

(define input-1 (make-wire))
(define input-2 (make-wire))
(define sum (make-wire))
(define carry (make-wire))

; probe two of the wires
(probe 'sum sum)
(probe 'carry carry)

; connect the wires in a half-adder circuit
(half-adder input-1 input-2 sum carry)

(set-signal! input-1 1)
(propagate)

(set-signal! input-2 1)
(propagate)


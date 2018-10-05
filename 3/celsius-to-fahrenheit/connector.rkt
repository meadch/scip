#lang racket

(require sicp)
(provide has-value?)
(provide get-value)
(provide set-value!)
(provide forget-value!)
(provide connect)
(provide make-connector)
(provide constant)

(define (has-value? connector)
  ; tells whether the connector has a value.
  (connector 'has-value?))

(define (get-value connector)
  ; returns the connector’s current value.
  (connector 'value))

(define (set-value! connector new-value informant)
  ; indicates that the informant is requesting the connector to set its value to the new value.
  ((connector 'set-value!) new-value informant))

(define (forget-value! connector retractor)
  ; tells the connector that the retractor is requesting it to forget its value.
  ((connector 'forget) retractor))

(define (connect connector new-constraint)
  
  ; tells the connector to participate in the new constraint.
  ((connector 'connect) new-constraint))

; Syntactic suger to communicate with constraints

(define (inform-about-value constraint)
  (constraint 'I-have-a-value))

(define (inform-about-no-value constraint)
  (constraint 'I-lost-my-value))

; A constant constructor simply sets the value of the designated connector. Any I-have-a-value or I-lost-my-value message sent to the constant box will produce an error.

(define (constant value connector)
  (define (me request)
    (error "Unknown request -- CONSTANT" request))
  (connect connector me)
  (set-value! connector value me)
  me)

(define (make-connector)
  (let ((value false) (informant false) (constraints '()))
    (define (set-my-value newval setter)
      (cond ((not (has-value? me))
             (set! value newval)
             (set! informant setter)
             (for-each-except setter
                              inform-about-value
                              constraints))
            ((not (= value newval))
             (error "Contradiction" (list value newval)))
            (else 'ignored)))
    (define (forget-my-value retractor)
      (if (eq? retractor informant)
          (begin (set! informant false)
                 (for-each-except retractor
                                  inform-about-no-value
                                  constraints))
          'ignored))
    (define (connect new-constraint)
      (if (not (memq new-constraint constraints))
          (set! constraints
                (cons new-constraint constraints)))
      (if (has-value? me)
          (inform-about-value new-constraint))
      'done)
    (define (me request)
      (cond ((eq? request 'has-value?) (if informant true false))
            ((eq? request 'value) value)
            ((eq? request 'set-value!) set-my-value)
            ((eq? request 'forget) forget-my-value)
            ((eq? request 'connect) connect)
            (else (error "Unknown operation -- CONNECTOR"
                         request))))
    me))

(define (for-each-except exception procedure list)
  (define (loop items)
    (cond ((null? items) 'done)
          ((eq? (car items) exception) (loop (cdr items)))
          (else (procedure (car items))
                (loop (cdr items)))))
  (loop list))


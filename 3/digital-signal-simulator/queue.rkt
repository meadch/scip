#lang racket

(require sicp)
(provide make-queue)
(provide insert-queue!)
(provide delete-queue!)
(provide empty-queue?)
(provide front-queue)

(define (make-queue)
  (let ((front-ptr `())
        (rear-ptr `()))
    
    (define (empty?) (null? front-ptr))
    
    (define (insert! item)
      (let ((new-pair (cons item `())))      
        (if (empty?)
            (begin (set! front-ptr new-pair) (set! rear-ptr new-pair))
            (begin (set-cdr! rear-ptr new-pair) (set! rear-ptr new-pair)))))
    
    (define (delete!)
      (if (empty?) (error "DELETE! called with an empty queue")
          (set! front-ptr (cdr front-ptr))))
    
    (define (front)
      (if (empty?) (error "FRONT called with an empty queue")
          (car front-ptr)))

    (define (dispatch msg)
      (cond ((eq? msg 'insert!) insert!)
            ((eq? msg 'delete!) delete!)
            ((eq? msg 'front) front)
            ((eq? msg 'empty?) empty?)
            (else (error msg " not recognized"))))

    dispatch))

(define (insert-queue! q item)
  ((q 'insert!) item))

(define (delete-queue! q)
  ((q 'delete!)))

(define (empty-queue? q)
  ((q 'empty?)))

(define (front-queue q)
  ((q 'front)))

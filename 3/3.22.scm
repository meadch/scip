;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |3.22|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require sicp)

; Exercise 3.22

; Instead of representing a queue as a pair of pointers, we can build a queue as a procedure with local state. The local state will consist of pointers to the beginning and the end of an ordinary list. Thus, the make-queue procedure will have the form

; (define (make-queue)
;  (let ((front-ptr ...)
;        (rear-ptr ...))
;          <definitions of internal procedures>
;        (define (dispatch m) ...)
;        dispatch))

; Complete the definition of make-queue and provide implementations of the queue operations using this representation.

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
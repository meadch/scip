;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |3.21|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require sicp)

(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))
(define (empty-queue? queue) (null? (front-ptr queue)))
(define (make-queue) (cons `() `()))

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (cons item `())))
    (cond ((empty-queue? queue)
           (begin 
            (set-front-ptr! queue new-pair)
            (set-rear-ptr! queue new-pair)
            queue))
          (else
           (begin 
            (set-cdr! (rear-ptr queue) new-pair)
            (set-rear-ptr! queue new-pair)
            queue)))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else
         (begin 
          (set-front-ptr! queue (cdr (front-ptr queue)))
          queue))))

; Exercise 3.21

; Ben Bitdiddle decides to test the queue implementation described above. He types in the procedures to the Lisp interpreter and proceeds to try them out:

; (define q1 (make-queue))
; (insert-queue! q1 'a) ; ((a) a)
; (insert-queue! q1 'b) ; ((a b) b)
; (delete-queue! q1) ; ((b) b)
; (delete-queue! q1) ; (() b)

;‘‘It’s all wrong!’’ he complains. ‘‘The interpreter’s response shows that the last item is inserted into the queue twice. And when I delete both items, the second b is still there, so the queue isn’t empty, even though it’s supposed to be.’’

; Eva Lu Ator suggests that Ben has misunderstood what is happening. ‘‘It’s not that the items are going into the queue twice,’’ she explains. ‘‘It’s just that the standard Lisp printer doesn’t know how to make sense of the queue representation. If you want to see the queue printed correctly, you’ll have to define your own print procedure for queues.’’ Explain what Eva Lu is talking about. In particular, show why Ben’s examples produce the printed results that they do. Define a procedure print-queue that takes a queue as input and prints the sequence of items in the queue.

; ANSWER

; The Lisp interpreter is asked to print a pair whose car and cdr, for example, may point to the same pair (as in the case where only one item has been added to the queue. That gives the impression that, say, 'a, is in the queue more than once.

(define (print-queue q)
  (display "[ ")
  (define (iter item)
    (if (null? item)
        (display "]")
        (begin
          (display (car item))
          (display " ")
          (iter (cdr item)))))
  (iter (front-ptr q)))
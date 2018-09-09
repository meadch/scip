;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |3.23|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require sicp)

; Exercise 3.23

; A deque (‘‘double-ended queue’’) is a sequence in which items can be inserted and deleted at either the front or the rear. Operations on deques are the constructor make-deque, the predicate empty-deque?, selectors front-deque and rear-deque, and mutators front-insert-deque!, rear-insert-deque!, front-delete-deque!, and rear-delete-deque!. Show how to represent deques using pairs, and give implementations of the operations.23 All operations should be accomplished in   (1) steps.

; deque-node's are contained within the deque and have the following structure:
; [ value, * ]
;          |
;   [parent, next]
;
; the "parent" and "next" values will point to other nodes in the deque. 

(define (make-deque-node value)
  ; [ value ] => [ parent, next ]
  (cons value (cons `() `())))
  
(define (set-parent! node parent)
  (set-car! (cdr node) parent))

(define (set-next! node next)
  (set-cdr! (cdr node) next))

(define (next node)
  (cddr node))

(define (parent node)
  (cadr node))

(define (delete-parent! node)
  (if (null? node)
      #t
      (set-car! (cdr node) `())))

(define (delete-next! node)
  (if (null? node)
      #t
      (set-cdr! (cdr node) `())))

; End deque-node procedures ****************

(define (make-deque) (cons `() `()))
(define (front-ptr-deque dq) (car dq))
(define (rear-ptr-deque dq) (cdr dq))
(define (set-front-ptr-deque! dq item) (set-car! dq item))
(define (set-rear-ptr-deque! dq item) (set-cdr! dq item))

(define (empty-deque? dq) (null? (front-ptr-deque dq)))

(define (front-deque dq)
  (if (empty-deque? dq)
      (error "FRONT called with an empty deque" dq)
      (car (front-ptr-deque dq))))

(define (rear-deque dq)
  (if (empty-deque? dq)
      (error "REAR called with an empty deque" dq)
      (car (rear-ptr-deque dq))))

(define (front-insert-deque! dq item)
  (let ((new-node (make-deque-node item)))
    (cond ((empty-deque? dq)
           (begin 
            (set-front-ptr-deque! dq new-node)
            (set-rear-ptr-deque! dq new-node)
            dq))
          (else (begin
                  (set-parent! (front-ptr-deque dq) new-node)
                  (set-next! new-node (front-ptr-deque dq))
                  (set-front-ptr-deque! dq new-node)
                  dq)))))

(define (rear-insert-deque! dq item)
  (let ((new-node (make-deque-node item)))
    (cond ((empty-deque? dq)
           (begin 
            (set-front-ptr-deque! dq new-node)
            (set-rear-ptr-deque! dq new-node)
            dq))
          (else (begin
                  (set-next! (rear-ptr-deque dq) new-node)
                  (set-parent! new-node (rear-ptr-deque dq))
                  (set-rear-ptr-deque! dq new-node)
                  dq)))))

(define (delete-front-deque! dq)
  (if (empty-deque? dq)
      (error "DELETE-FRONT called with an empty deque" dq)
      (let ((new-front (next (front-ptr-deque dq))))
        (begin
          (delete-parent! new-front)
          (set-front-ptr-deque! dq new-front)))))


(define (delete-rear-deque! dq)
  (if (empty-deque? dq)
      (error "DELETE-REAR called with an empty deque" dq)
      (let ((new-rear (parent (rear-ptr-deque dq))))
        (begin
          (delete-next! new-rear)
          (set-rear-ptr-deque! dq new-rear)))))

(define (print-deque dq)
  (display "[ ")
  (define (iter node)
    (if (null? node)
        (display "]")
        (begin (display (car node))
               (display " ")
               (iter (next node)))))
  (iter (front-ptr-deque dq)))
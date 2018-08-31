;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |3.18|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require sicp)

; Exercise 3.18. Write a procedure that examines a list and determines whether it contains a cycle, that is, whether a program that tried to find the end of the list by taking successive cdrs would go into an infinite loop.

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define (contains-cycle? x)
  (if (not (pair? x))
      #f
      (let (
            (walker x)
            (runner (cdr x))
           )
           (define (iter)
             (cond ((eq? walker runner) #t) ; runner caught up with walker, signaling a cycle
                   ((or (not (pair? runner)) (not (pair? (cdr runner)))) #f) ; runner reached end of list
                   (else (begin
                           (set! walker (cdr walker)) ; move walker forward one
                           (set! runner (cddr runner)) ; move runner forward two
                           (iter)))))
      (iter))))

(contains-cycle? (make-cycle (list 1 2 3))) ; true
(contains-cycle? (list 1 2 3)) ; false
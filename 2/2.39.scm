; Exercise 2.39. Complete the following definitions of reverse (exercise 2.18) in terms of fold-right and fold-left from exercise 2.38:

(load "append-list")

(define (reverse-right sequence)
  (fold-right (lambda (val seq) 
    (append-list seq (list val))) `() sequence))

(define (reverse-left sequence)
  (fold-left (lambda (seq val) 
    (append-list (list val) seq)) `() sequence))

(reverse-right (list 1 2 3)) ;(3 2 1)
(reverse-left (list 1 2 3)) ;(3 2 1)
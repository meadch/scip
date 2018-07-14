; Exercise 2.59. Implement the union-set operation for the unordered-list representation of sets.

(load "set.scm")

(define (union-set s1 s2)
  (if (null? s1) 
      s2
      (union-set 
        (cdr s1) 
        (if (element-of-set? (car s1) s2) s2 (cons (car s1) s2)))))
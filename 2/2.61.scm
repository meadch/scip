; Exercise 2.61. Give an implementation of adjoin-set using the ordered representation. By analogy with element-of-set? show how to take advantage of the ordering to produce a procedure that requires on the average about half as many steps as with the unordered representation.

(define (element-of-set? val s)

  (cond ((null? s) #f)
        ((< val (car s)) #f)
        ((= val (car s)) #t)
        (else (element-of-set? val (cdr s)))))

(define (adjoin-set val set)
  (cond ((null? set) (cons val))
        ((< val (car set)) (cons val set))
        ((not (element-of-set? val set)) (cons val set))
        (else set)))
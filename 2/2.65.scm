; Exercise 2.65. Use the results of exercises 2.63 and 2.64 to give   (n) implementations of union-set and intersection-set for sets implemented as (balanced) binary trees.
(load "tree.scm")

(define (union-set t1 t2)
  (define (union-list s1 s2)
    (cond ((null? s1) s2)
          ((null? s2) s1)
          ((= (car s1) (car s2)) (union-list (cdr s1) s2))
          ((> (car s1) (car s2)) (cons (car s2) (union-list s1 (cdr s2))))
          ((< (car s1) (car s2)) (cons (car s1) (union-list (cdr s1) s2)))))

  (list->tree
    (union-list 
      (tree->list-2 t1) 
      (tree->list-2 t2))))

(define (intersection-set t1 t2)
  (define (intersection-list s1 s2)
    (if (or (null? s1) (null? s2)) `()
        (let ((x (car s1)) (y (car s2)))
          (cond ((= x y) (cons x (intersection-list (cdr s1) (cdr s2))))
                ((< x y) (intersection-list (cdr s1) s2))
                (else (intersection-list s1 (cdr s2)))))))

  (list->tree 
    (intersection-list 
      (tree->list-2 t1) 
      (tree->list-2 t2))))


; Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order.

(define (append-list l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append-list (cdr l1) l2))))

(define (reverse-list l)
  (if (null? l)
      l
      (append-list (reverse-list (cdr l)) (list (car l)))))

(reverse-list (list 1 2 3 4)) ; (4 3 2 1)
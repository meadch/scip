; Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order.

(load "append-list")

(define (reverse-list l)
  (if (null? l)
      l
      (append-list (reverse-list (cdr l)) (list (car l)))))
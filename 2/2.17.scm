; Define a procedure last-pair that returns the list that contains only the last element of a given list

(define (last-pair l)
  (if (null? (cdr l))
      (list (car l))
      (last-pair (cdr l))))

(last-pair (list 23 72 149 34)) ;34
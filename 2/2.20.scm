; Use dotted-tail notation to write a procedure same-parity that takes one or more integers and returns a list of all the arguments that have the same even-odd parity as the first argument.

(define (append-list l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append-list (cdr l1) l2))))
      
(define (filter l1 proc)
  (define (iter l1 l2)
          (if (null? l1)
              l2
              (iter (cdr l1) 
                    (if (proc (car l1))
                        (append-list l2 (list (car l1)))
                        l2 ))))
  (iter l1 '()))

(define (same-parity first . integers)
       (filter (cons first integers) (if (even? first) even? odd?)))

(same-parity 1 2 3 4) ;(1 3)
(same-parity 2 3 4) ;(2 4)
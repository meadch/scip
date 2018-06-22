(define (filter predicate sequence)
        (cond ((null? sequence) `())
              ((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
              (else (filter predicate (cdr sequence)))))

(filter even? (list 1 2 3 4 5 6)) ;(2 4 6)
; Here are two different definitions of square-list. Complete both of them by filling in the missing expressions:

(define (square-list items)
  (if (null? items)
      '()
      (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square-list-map items)
        (map (lambda (x) (* x x)) items))


(define items (list 1 2 3 4 5))
(square-list items) ;(1 4 9 16 25)
(square-list-map items) ;(1 4 9 16 25)
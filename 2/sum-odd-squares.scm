(define (enumerate-tree tree)
  (cond ((null? tree) tree)
        ((pair? tree) (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))
        (else (list tree))))

(define (filter predicate sequence)
  (cond ((null? sequence) `())
        ((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define a (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (square x) (* x x))

(define (sum-odd-squares t) 
  (accumulate + 0 (map square (filter odd? (enumerate-tree t)))))

(sum-odd-squares a) ;84
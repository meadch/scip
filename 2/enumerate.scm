(define x (list 1 (list 2 3) 4 (list 5)))

(define (enumerate-interval low high)
  (if (> low high) `() (cons low (enumerate-interval (+ 1 low) high))))

(define (enumerate-tree tree)
  (cond ((null? tree) tree)
        ((pair? tree) (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))
        (else (list tree))))
        
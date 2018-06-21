(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (scale-tree tree factor)
  (map-tree tree (lambda (x) (* 10 x))))

(define (map-tree tree proc)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (proc tree))
        (else (cons (map-tree (car tree) proc) (map-tree (cdr tree) proc)))))

(scale-tree tree 10) ;(10 (20 (30 40) 50) (60 70))
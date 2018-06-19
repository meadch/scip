; Write a procedure fringe that takes as argument a tree (represented as a list) and returns a list whose elements are all the leaves of the tree arranged in left-to-right order.

(define (append-list l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append-list (cdr l1) l2))))

(define (fringe tree)
      (if (null? tree)
        tree
        (if (pair? (car tree))
          (append-list (fringe (car tree)) (fringe (cdr tree)))
          (cons (car tree) (fringe (cdr tree))))))

(define x (list (list 1 2) (list 3 (list 4 5 6))))

(fringe x) ;(1 2 3 4 5 6)

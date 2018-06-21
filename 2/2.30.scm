; Exercise 2.30. Define a procedure square-tree analogous to the square-list procedure of exercise 2.21.

; (square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

; Define square-tree both directly (i.e., without using any higher-order procedures):

(define (square-tree-direct tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree-direct (car tree)) (square-tree-direct (cdr tree))))))

(square-tree-direct (list 1 (list 2 (list 3 4) 5) (list 6 7))) ;(1 (4 (9 16) 25) (36 49))

; and also by using map and recursion:

(define (square-tree-map tree)
  (map 
    (lambda (subtree) (if (pair? subtree) (square-tree-map subtree) (* subtree subtree))) 
    tree 
  ))

(square-tree-map (list 1 (list 2 (list 3 4) 5) (list 6 7))) ;(1 (4 (9 16) 25) (36 49))
; Exercise 2.35. Redefine count-leaves from section 2.2.2 as an accumulation.

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) tree)
        ((pair? tree) (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))
        (else (list tree))))

(define (count-leaves tree)
  ; 1. Enumerate the leaves of the tree (i.e. fringe)
  ; 2. Map over the values, replacing each w/ 1 (representing a leaf)
  ; 3. Sum the 1's via accumalation
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))

(define t (list 1 (list 2 3) (list 4) 5 6 (list 7 8)))

(count-leaves t) ;8
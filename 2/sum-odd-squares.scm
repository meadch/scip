(load "accumulate")
(load "filter")
(load "enumerate")

(define a (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (square x) (* x x))

(define (sum-odd-squares t) 
  (accumulate + 0 (map square (filter odd? (enumerate-tree t)))))

(sum-odd-squares a) ;84
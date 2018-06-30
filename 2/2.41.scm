; Exercise 2.41. Write a procedure to find all ordered triples of distinct positive integers i, j, and k less than or equal to a given integer n that sum to a given integer s.

(load "accumulate")
(load "enumerate")
(load "flat-map")

(define (unique-trips n)
  (flat-map (lambda (i) 
    (flat-map (lambda (j) (map (lambda (k) (list i j k)) 
        (enumerate-interval 1 (- j 1)))) 
      (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))


(define (sum-triples n s)
  (define (matching-sum? seq) (= (accumulate + 0 seq) s))
  (filter matching-sum? (unique-trips n)))
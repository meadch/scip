; Exercise 2.40. Define a procedure unique-pairs that, given an integer n, generates the sequence of pairs (i,j) with 1< j< i< n. Use unique-pairs to simplify the definition of prime-sum-pairs given above.

(load "enumerate")
(load "flat-map")

(define (unique-pairs n)
  (flat-map (lambda (i) 
    (map (lambda (j) (list i j)) 
         (enumerate-integer 1 (- i 1))))
    (enumerate-integer 1 n)))
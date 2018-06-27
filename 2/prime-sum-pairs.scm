(load "enumerate")
(load "flat-map")
(load "filter")
(load "prime")

(define (ordered-pairs n) 
  (flat-map (lambda (i) 
    (map (lambda (j) (list i j)) (enumerate-integer 1 (- i 1)))) 
    (enumerate-integer 1 n)))

(define (is-pair-prime-sum? pair) (prime? (+ (car pair) (cadr pair))))

(define (pair-to-triple pair) (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map pair-to-triple (filter is-pair-prime-sum? (ordered-pairs n))))
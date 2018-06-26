(load "enumerate")
(load "append-list")
(load "filter")
(load "accumulate")
(load "prime")

(define (flat-map proc seq)
  (accumulate append-list `() (map proc seq)))

(define (ordered-pairs n) 
  (flat-map (lambda (i) 
    (map (lambda (j) (list i j)) (enumerate-integer 1 (- i 1)))) 
    (enumerate-integer 1 n)))

(define (is-pair-prime-sum? pair) (prime? (+ (car pair) (cadr pair))))

(define (pair-to-triple pair) (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map pair-to-triple (filter is-pair-prime-sum? (ordered-pairs n))))
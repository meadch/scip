; generate all the permutations of a set S

(load "flat-map")
(load "append-list")
(load "filter")

(define (remove-from-set val set)
  (filter (lambda (x) (not (= val x))) set))

(define (permutations s)
  (if (null? s) 
    (list `())
    (flat-map 
      (lambda (x)
        (map (lambda (rest) (append-list (list x) rest)) 
        (permutations (remove-from-set x s)))) 
      s )))
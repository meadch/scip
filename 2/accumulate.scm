(define (accumulate proc initial sequence)
  (if (null? sequence) 
    initial
    (accumulate proc (proc initial (car sequence)) (cdr sequence))))

(accumulate * 1 (list 1 2 3 4)) ;24
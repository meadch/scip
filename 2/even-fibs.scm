(define (fib n) 
  (define (fib-iter first second limit)
    (if (= limit 0) 
      first
      (fib-iter second (+ first second) (- limit 1))))
  (fib-iter 0 1 n))

(define (enumerate-integer low high)
  (if (> low high) `() (cons low (enumerate-integer (+ 1 low) high))))

(define (filter predicate sequence)
  (cond ((null? sequence) `())
        ((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (even-fibs n)
  (filter even? (map fib (enumerate-integer 0 n))))

(even-fibs 9) ;(0 2 8 34)
(define (filter-stream pred stream)
  (cond ((empty-stream? stream) the-empty-stream)
        ((pred (stream-car stream)) 
          (cons-stream (stream-car stream) (filter-stream pred (stream-cdr stream))))
        (else (filter-stream pred (stream-cdr stream)))))

(define (enumerate-stream from) 
  (cons-stream from (enumerate-stream (+ 1 from))))

(define (sieve stream)
  (let ((first (stream-car stream)))
        (cons-stream first
                      (filter-stream 
                        (lambda (val) (not (eq? 0 (remainder val first)))) 
                        (sieve (stream-cdr stream))))))

(define (print-stream nth stream)
  (if (eq? nth 0) 
      #t 
      (begin 
        (display (stream-car stream)) 
        (newline) 
        (print-stream (- nth 1) (stream-cdr stream)))))

(define primes (sieve (enumerate-stream 2)))

(print-stream 20 primes)

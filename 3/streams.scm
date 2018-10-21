; load stream-map
(load "3.50.scm")

(define (add-streams s1 s2)
	(stream-map + s1 s2))

(define ones (cons-stream 1 ones))

(define integers (cons-stream 1 (add-streams ones integers))) 

(define fibs (cons-stream 0 
		(cons-stream 1
			(add-streams (stream-cdr fibs) fibs))))

(define (display-stream stream upto)
	(if (eq? 0 upto)  #t 
	(begin (display  (stream-car stream))
		(display "\n")
	       (display-stream (stream-cdr stream) (- upto 1)))))

(define (scale-stream stream factor)
	(stream-map (lambda (val) (* val factor)) stream))

(define doubles (cons-stream 1 (scale-stream doubles 2)))

(define (filter-stream proc stream)
	(cond ((empty-stream? stream) the-empty-stream)
	      ((proc (stream-car stream))
	    	  (cons-stream (stream-car stream)
		               (filter-stream proc (stream-cdr stream))))
	      (else (filter-stream proc (stream-cdr stream)))))

(define (integers-starting-from num)
  (filter-stream (lambda (val) (>= val num)) integers))

(define (divisible? a b)
  (eq? 0 (remainder a b)))


; primes is defined in terms of the prime? predicate, which itself uses the primes stream.

(define primes (cons-stream 2 (filter-stream prime? (integers-starting-from 3))))

(define (prime? num)
  (define (iter ps)
  ;  enough of the primes stream has been generated to test the primality of the numbers we need to check next
    (cond ((> (square (stream-car ps)) num) #t)
          ((divisible? num (stream-car ps)) #f)
          (else (iter (stream-cdr ps)))))
  (iter primes))


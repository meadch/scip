; Rewrite the procedure cc so that its second argument is a list of the values of the coins to use rather than an integer specifying which coins to use.

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-list) 
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-list)) 0)
        (else (+ (cc amount (except-first-denomination coin-list))
                 (cc (- amount (first-denomination coin-list)) coin-list)))))

(define (no-more? l) (null? l))
(define (except-first-denomination l) (cdr l))
(define (first-denomination l) (car l))

(cc 100 us-coins) ; 292
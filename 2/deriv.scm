(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp) (make-sum 
                          (make-product (multiplier exp) 
                                        (deriv (multiplicand exp) var)) 
                          (make-product (multiplicand exp)
                                        (deriv (multiplier exp) var))))
        (else (error "unknown expression type -- DERIV" exp))))

(define variable? symbol?)
(define (same-variable? x y) 
  (and (variable? x) (variable? y) (eq? x y)))

(define (make-sum a b)
  (cond ((=number? a 0) b)
        ((=number? b 0) a)
        ((and (number? a) (number? b)) (+ a b))
        (else (list '+ a b))
  ))

(define (addend sum-exp)
  (cadr sum-exp))
(define (augend sum-exp)
  (caddr sum-exp)) 
(define (sum? exp)
  (and (pair? exp) (eq? (car exp) '+)))

(define (make-product a b)
  (cond ((or (=number? a 0) (=number? b 0)) 0)
        ((=number? a 1) b)
        ((=number? b 1) a)
        (else (list '* a b))))

(define (multiplier product-exp)
  (cadr product-exp))
(define (multiplicand product-exp)
  (caddr product-exp)) 
(define (product? exp)
  (and (pair? exp) (eq? (car exp) '*)))


(define (=number? exp n)
  (and (number? exp) (= exp n)))

(deriv '(* (* x y) (+ x 3)) 'x)
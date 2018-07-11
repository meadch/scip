; Exercise 2.56. Show how to extend the basic differentiator to handle more kinds of expressions. For instance, implement the differentiation rule

; d(u^n) / dx = nu^(n-1) * (du/dx)

; by adding a new clause to the deriv program and defining appropriate procedures exponentiation?, base, exponent, and make-exponentiation. (You may use the symbol ** to denote exponentiation.) Build in the rules that anything raised to the power 0 is 1 and anything raised to the power 1 is the thing itself.

(load "deriv.scm") ;get all pre-built constructors, selectors

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
        (exponentiation? (make-product
                          (make-exponentiation (make-product (exponent exp) (base exp))
                                               (make-sum (exponent exp) -1))
                          (deriv (base exp) var)))
        (else (error "unknown expression type -- DERIV" exp))))


(define (make-exponentiation base exp)
  ;Build in the rules that anything raised to the power 0 is 1 and anything raised to the power 1 is the thing itself.
  (cond ((=number? exp 0) 1)
        ((=number? exp 1) base)
        (else (list '** base exp))))
      
(define (base exp)
  (cadr exp))
(define (exponent exp)
  (caddr exp))

(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) '**)))
; Exercise 2.73. Section 2.3.2 described a program that performs symbolic differentiation.

(load "deriv.scm")

; We can regard this program as performing a dispatch on the type of the expression to be differentiated. In this situation the "type tag" of the datum is the algebraic operator symbol (such as +) and the operation being performed is deriv. We can transform this program into data-directed style by rewriting the basic derivative procedure as

(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         (else ((get 'deriv (operator exp)) (operands exp) var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

; a. Explain what was done above. Why can’t we assimilate the predicates number? and same-variable? into the data-directed dispatch?

; Rather than checking sum? and product? and operating accordingly, we simply "get" the requisit operation depending on + or *.
; We can't assimilate number? because that doesn't serve as a legitimate Types lookup value; likewise for variable?, we would be getting the operation corresponding to that particular symbol.

; b. Write the procedures for derivatives of sums and products,

(define (deriv-sum exp var)
  (make-sum (deriv (addend exp) var) (deriv (augend exp) var)))

(define (deriv-product exp var)
  (make-sum (make-product (multiplier exp) 
                          (deriv (multiplicand exp) var))
            (make-product (deriv (multiplier exp) var) 
                          multiplicand)))

; and the auxiliary code required to install them in the table used by the program above.

(define (install)
  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-product)
  'done)

; c. Choose any additional differentiation rule that you like, such as the one for exponents (exercise 2.56), and install it in this data-directed system.

(load "2.56.scm")

(define (deriv-exp exp var)
  (make-product (make-exponentiation (make-product (exponent exp) (base exp))
                                     (make-sum (exponent exp) -1))
                (deriv (base exp) var)))

(define (install-exponentiation)
  (put 'deriv '** deriv-exp)
  'done)


; d. In this simple algebraic manipulator the type of an expression is the algebraic operator that binds it together. Suppose, however, we indexed the procedures in the opposite way, so that the dispatch line in deriv looked like

; ((get (operator exp) ’deriv) (operands exp) var)

; What corresponding changes to the derivative system are required?

; The only changes needed are to the installation procedure, i.e.:

; (define (install)
;   (put '+ 'deriv deriv-sum)
;   (put '* 'deriv deriv-product)
;   'done)
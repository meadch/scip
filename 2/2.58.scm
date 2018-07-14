; Exercise 2.58. Suppose we want to modify the differentiation program so that it works with ordinary mathematical notation, in which + and * are infix rather than prefix operators. Since the differentiation program is defined in terms of abstract data, we can modify it to work with different representations of expressions solely by changing the predicates, selectors, and constructors that define the representation of the algebraic expressions on which the differentiator is to operate.

; a. Show how to do this in order to differentiate algebraic expressions presented in infix form, such as (x + (3 * (x + (y + 2)))). To simplify the task, assume that + and * always take two arguments and that expressions are fully parenthesized.

; b. The problem becomes substantially harder if we allow standard algebraic notation, such as (x + 3 * (x + y + 2)), which drops unnecessary parentheses and assumes that multiplication is done before addition. Can you design appropriate predicates, selectors, and constructors for this notation such that our derivative program still works?

(load "deriv.scm")

(define (make-sum a b)
  (cond ((=number? a 0) b)
        ((=number? b 0) a)
        ((and (number? a) (number? b)) (+ a b))
        (else (list a '+ b))
  ))

(define (addend sum-exp)
  (car sum-exp))

(define (augend sum-exp)
  (operand (cddr sum-exp)))

(define (sum? exp)
  (and (pair? exp) (eq? (cadr exp) '+)))

(define (make-product a b)
  (cond ((or (=number? a 0) (=number? b 0)) 0)
        ((=number? a 1) b)
        ((=number? b 1) a)
        (else (list a '* b))))

(define (multiplier product-exp)
  (car product-exp))

(define (multiplicand product-exp)
  (operand (cddr product-exp)))

(define (product? exp)
  (and (pair? exp) (eq? (cadr exp) '*)))

(define (operand exp)
  (let ((value (car exp)) (remaining (cdr exp)))
    (if (null? remaining) value exp)))
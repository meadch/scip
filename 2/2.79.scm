
; Exercise 2.79. Define a generic equality predicate equ? that tests the equality of two numbers, and install it in the generic arithmetic package. This operation should work for ordinary numbers, rational numbers, and complex numbers.

(define (equ? a b)
  (apply-generic 'equ? a b))

; Inside install-scheme-number-package
(put 'equ? '(scheme-number scheme-number) =)

; Inside install-rational-package
(put 'equ? '(rational rational) 
  (lambda (a b) (= (* (numer a) (denom b)) (* numer b) (denom a))))

; Inside install-complex-package
(put 'equ? '(complex complex) 
  (lambda (a b) (and (= (real-part a) (real-part b)) (= (imag-part a) (imag-part b)))))

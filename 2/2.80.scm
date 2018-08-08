

; Exercise 2.80. Define a generic predicate =zero? that tests if its argument is zero, and install it in the generic arithmetic package. This operation should work for ordinary numbers, rational numbers, and complex numbers.

(define (=zero? x)
  (apply-generic '=zero? x))

; Inside install-scheme-number-package
(put '=zero? 'scheme-number zero?)

; Inside install-rational-package
(put '=zero? 'rational
  (lambda (x) (zero? (numer x))))

; Inside install-complex-package
(put 'equ? 'complex 
  (lambda (x) (and (zero? (real-part x) (imag-part x)))))
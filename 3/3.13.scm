;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |3.13|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require sicp)

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

; Exercise 3.13

; Consider the following make-cycle procedure

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

;Draw a box-and-pointer diagram that shows the structure z created by

;(define z (make-cycle (list ’a ’b ’c)))

; z -> [a, *]
;       |  |
;       | [b, *]
;       |     |
;       |    [c, *]
;       |________|

; What happens if we try to compute (last-pair z)?

; We get stuck in an infinite loop -- (cdr x) will never evaluate to null.
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |3.14|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require sicp)

; Exercise 3.14

(define (mystery x)
  (define (loop x y)
    (if (null? x) y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x `()))

; Loop uses the ‘‘temporary’’ variable temp to hold the old value of the cdr of x, since the set-cdr! on the next line destroys the cdr. Explain what mystery does in general. Suppose v is defined by (define v (list 'a 'b 'c 'd)). Draw the box-and-pointer diagram that represents the list to which v is bound.

; mystery is a reverse! procedure. For example:

; v -> [a, *]
;          |
;         [b, *]
;             |
;            [c, *]
;                |
;               [d, /]

; When we evaluate (define w (mystery v))

; loop called with:
; x = (a, (b, (c, (d, /))))
; y = '()

; loop uses temp to hold (b, (c, (d, /))), mutates x to (a, /), and calls loop again with:
; x = (b, (c, (d, /)))
; y = (a, /)

; loop uses temp to hold (c, (d, /)), mutates x to (b, (a, /)), and calls loop again
; x = (c, (d, /))
; y = (b, (a, /))

; loop uses temp to hold (d, /), mutates x to (c, (b, (a, /))), and calls loop again
; x = (d, /)
; y = (c, (b, (a, /)))

; loop uses temp to hold '(), mutates x to (d, (c, (b, (a, /)))), and calls loop again
; x = `()
; y = (d, (c, (b, (a, /))))

; base case is hit and (d, (c, (b, (a, /)))) is returned.

; We're left with w pointing to the head of the reversed structure, and v pointing to the last pair, whose cdr was wiped out during the first pass through loop.

; w -> [d, *]
;          |
;         [c, *]
;             |
;            [b, *]
;                |
;         v ->  [a, /]
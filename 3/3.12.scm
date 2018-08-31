;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |3.12|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require sicp)

; Exercise 3.12

; Consider the interaction

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

; x -> ['a, * ]
;           |
;         ['b, \]

; y -> ['a, * ]
;           |
;         ['b, \]

; z -> ['a, * ]
;           |
;         ['b, *]
;              |
;            ['c, *]
;                 |
;               ['d, *]

; (cdr x) => ['b, \]

; (define w (append! x y))

; w -> x -> ['a, * ]
;                |
;              ['b, *]
;                   |
;           y ->  ['c, *]
;                      |
;                    ['d, *]

; (cdr x) => ['b, *]
;                   |
;           y ->  ['c, *]
;                      |
;                    ['d, *]

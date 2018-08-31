;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |3.16|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require sicp)

;Exercise 3.16
;Ben Bitdiddle decides to write a procedure to count the number of pairs in any list structure. ‘‘It’s easy,’’ he reasons. ‘‘The number of pairs in any structure is the number in the car plus the number in thecdrplus one more to count the current pair.’’ So Ben writes the following procedure:

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

; Show that this procedure is not correct. In particular, draw box-and-pointer diagrams representing list structures made up of exactly three pairs for which Ben’s procedure would

; return 3;

(define three-pairs (list 1 2 3))

; return 4
(define c (cons 1 `()))
(define b (cons c c))
(define a (cons 1 b))

(define four-pairs a)

; return 7

(define z (cons 1 `()))
(define y (cons z z))
(define x (cons b b))

(define seven-pairs x)

; never return at all.

(define s (cons 1 `()))
(define r (cons s `()))
(define q (cons r `()))
(set-cdr! s q) ; create cycle

(define infinite-pairs q)

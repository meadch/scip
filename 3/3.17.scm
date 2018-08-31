;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |3.17|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require sicp)

; Exercise 3.17.

; Devise a correct version of the count-pairs procedure of exercise 3.16 that returns the number of distinct pairs in any structure. (Hint: Traverse the structure, maintaining an auxiliary data structure that is used to keep track of which pairs have already been counted.)

(define (count-pairs x)
  (let ((counted-pairs `()))
    (define (count! x)
      (if (or (not (pair? x)) (memq x counted-pairs))
          0
          (begin
            (set! counted-pairs (cons x counted-pairs))
            (+
             (count! (car x))
             (count! (cdr x))
             1))))
  (count! x)))
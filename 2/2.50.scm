;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |2.50|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require sicp-pict)

; Exercise 2.50.

;Define the transformation flip-horiz, which flips painters horizontally

(define (flip-horizontal painter)
   ; transform-painter is different than the text
   ((transform-painter (make-vect 1.0 0.0)
                       (make-vect 0.0 0.0)
                       (make-vect 1.0 1.0))
    painter))


;180 degrees

(define (flip-180 painter)
   ((transform-painter (make-vect 1.0 1.0)
                       (make-vect 0.0 1.0)
                       (make-vect 1.0 0.0))
    painter))

;270 degrees.

(define (flip-270 painter)
   ((transform-painter (make-vect 0.0 1.0)
                       (make-vect 0.0 0.0)
                       (make-vect 1.0 1.0))
    painter))
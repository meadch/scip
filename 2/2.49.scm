;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.49|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require sicp-pict)

; Exercise 2.49. Use segments->painter to define the following primitive painters:

; a. The painter that draws the outline of the designated frame.
(define one 0.99)
(define outline-segments (list
                          (make-segment (make-vect 0 0) (make-vect one 0))
                          (make-segment (make-vect one 0) (make-vect one one))
                          (make-segment (make-vect one one) (make-vect 0 one))
                          (make-segment (make-vect 0 one) (make-vect 0 0))
                          ))
(define outline-painter (segments->painter outline-segments))


; b. The painter that draws an ‘‘X’’ by connecting opposite corners of the frame.
(define x-segments (list
                      (make-segment (make-vect 0 0) (make-vect one one))
                      (make-segment (make-vect one 0) (make-vect 0 one))
                    ))

(define x-painter (segments->painter x-segments))

; c. The painter that draws a diamond shape by connecting the midpoints of the sides of the frame.
(define midway 0.5)
(define diamond-segments (list
                      (make-segment (make-vect 0 midway) (make-vect midway one))
                      (make-segment (make-vect midway one) (make-vect one midway))
                      (make-segment (make-vect one midway) (make-vect midway 0))
                      (make-segment (make-vect midway 0) (make-vect 0 midway))
                    ))

(define diamond-painter (segments->painter diamond-segments))
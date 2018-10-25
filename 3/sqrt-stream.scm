(load "streams.scm")

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0 
      (stream-map (lambda (guess) (sqrt-improve guess x)) 
        guesses)))
  guesses)

(define (sqrt-improve guess x)
 (average guess (/ x guess)))

(define (average a b) (/ (+ a b) 2))

(display-stream (sqrt-stream 100) 10)

; 50.5
; 26.24009900990099
; 15.025530119986813
; 10.840434673026925
; 10.032578510960604
; 10.000052895642693
; 10.000000000139897
; 10.
(load "streams.scm")
(load "3.55.scm") ; import partial-sums

(define (pi-summands n)
                      ; calling (- num) flips sign
  (cons-stream (/ 1 n) (stream-map - (pi-summands (+ n 2)))))

(define pi-stream
  (scale-stream (partial-sums (pi-summands 1)) 4.0))

; 4.
; 2.6666666666666665
; 3.466666666666667
; 2.895238095238095
; 3.33968253968254
; ...
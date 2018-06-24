; Exercise 2.37: Fill in the missing matrix algebra expressions.

(load "accumulate")
(load "2.36.scm") ;loads accumulate-n to use in transpose

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector mtrx v)
    (map (lambda (vector) (dot-product vector v)) mtrx))

(define (transpose matrix)
  (accumulate-n cons `() matrix))

(define (matrix-*-matrix mtrx-a mtrx-b)
  ; transpose b to turn get columns, i.e. ((1 2) (3 4)) => ((1 3) (2 4))
  (let ((cols (transpose mtrx-b)))
        ; now that we have b's columns, can map over a and multiply each vector by the transposed matrix, or columns, of b
        (map (lambda (a-row) (matrix-*-vector cols a-row)) mtrx-a))
)


; TO TEST:
; (define a-vector (list 1 2 3))
; (define b-vector (list 2 3 4))
; (dot-product a-vector b-vector) ;20
  
; (define a (list (list 1 2 3) (list 4 5 6)))
; (matrix-*-vector a a-vector) ;(14 32)

; (define b (list (list 8 9) (list 2 6) (list 1 4)))
; (matrix-*-matrix a b) ;((15 33) (48 90))
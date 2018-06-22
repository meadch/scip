; Exercise 2.33. Fill in the missing expressions to complete the following definitions of some basic list-manipulation operations as accumulations.

; *******************************************************************
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))
; *******************************************************************


(define (map p sequence)
  (accumulate (lambda (val accum) (append (list (p val)) accum)) `() sequence))

(define (append seq1 seq2) (accumulate cons seq2 seq1))

(define (length sequence) (accumulate (lambda (val accum) (+ 1 accum)) 0 sequence))

(map (lambda (x) (* 2 x)) (list 1 2 3))
(append (list 1 2 3) (list 4 5 6))
(length (list 1 2 3 4))
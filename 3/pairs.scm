; An infinite stream of pairs
(load "streams.scm") ; provides prime?

; Generate the stream of pairs (i, j) where i <= j and i + j is prime.

; imagine `int-pairs` as the sequence of all pairs of integers (i, j) with i <= j.
; Then all we need is:

; (stream-filter (lambda (pair)
;                 (prime? (+ car pair) (cadr pair)))
;                 int-pairs)

; How do we produce the stream int-pairs?

; Supposer two streams: S = (Si) and T = (Tj) and the inifinite array would look like:

; (S0, T0) (S0, T1) (S0, T2)
; (S1, T0) (S1, T1) (S1, T2)
; (S2, T0) (S2, T1) (S2, T2)

; We want the stream to generate everthing above the diagonal (where Si <= Ti)

; (S0, T0) (S0, T1) (S0, T2)
;          (S1, T1) (S1, T2)
;                   (S2, T2)

; If the above is the contents of int-pairs, think about it this way:

; The general stream of pairs (pairs S T) is composed of three parts:

; (S0, T0) <- 1. The pair (S0, T0) | (S0, T1) (S0, T2) <- 2. The rest of the first row 
      ; (S1, T0) (S1, T1) (S1, T2)
      ; (S2, T0) (S2, T1) (S2, T2) <- 3. Remaining pairs

(define (pairs s t)
  (cons-stream 
    (list (stream-car s) (stream-car t)) ; <- part 1
    
    ; Need a way to combine parts 2 and 3... interleave!
    (interleave
      (stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t)) ; <- part 2
      (pairs (stream-cdr s) (stream-cdr t))) ; <- part 3
    ))

(define (interleave s1 s2)
  (if (stream-null? s1) 
    s2
    (cons-stream (stream-car s1) (interleave s2 (stream-cdr s1)))))


(define int-pairs (pairs integers integers)) 

(define prime-pairs (stream-filter 
  (lambda (pair) (prime? (+ (car pair) (cadr pair)))) 
  int-pairs))

(display-stream prime-pairs 10)

; (1 2)
; (2 3)
; (1 4)
; (1 6)
; (3 4)
; (2 5)
; (1 10)
; (1 12)
; (2 9)

; Exercise 2.36. Implement accumulate-n, which applies the designated accumulation procedure to combine all the first elements of the sequences, all the second elements of the sequences, and so on, and returns a sequence of the results.

; if s = ((1 2 3) (4 5 6) (7 8 9) (10 11 12))
; (accumulate-n + 0 s) => (22 26 30)

(load "accumulate")

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      `()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(accumulate-n + 0 s) ;(22 26 30)
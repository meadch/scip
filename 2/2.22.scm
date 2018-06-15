; Louis Reasoner tries to rewrite the first square-list procedure of exercise 2.21 so that it evolves an iterative process:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things)) 
                    answer))))
    (iter items `()))

(define (square x) (* x x))

(square-list (list 1 2 3 4)) ;(16 9 4 1)

; Unfortunately, defining square-list this way produces the answer list in the reverse order of the one desired. Why?

; ANSWER: Because the iter procedure removes the first value of "things", squares it, and places it in front (rather than at the end) of the answer list it's building up.

; Louis then tries to fix his bug by interchanging the arguments to cons:

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
          (cons answer 
                (square (car things))))))
    (iter items `()))

(square-list-2 (list 1 2 3 4)) ; ((((() . 1) . 4) . 9) . 16)

; This doesn’t work either. Explain.


; ANSWER: Because the iter procedure creates pairs of the current answer (a list) and the squared value. The values become nested in a list for each iteration.
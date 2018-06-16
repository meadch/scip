(define x (cons (list 1 2) (list 3 4)))

(define (length l)
  (if (null? l) 0 (+ 1 (length (cdr l)))))

(define (count-leaves tree)
        (cond ((null? tree) 0)
              ((not (pair? tree)) 1)
              (else (+ (count-leaves (car tree)) (count-leaves (cdr tree))))))

(length (list x x)) ;2
(count-leaves (list x x)) ;8


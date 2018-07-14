(load "2.54.scm") ; bring in equal?
(load "accumulate")

(define (element-of-set? val set)
  (accumulate 
    (lambda (item accum) (if (equal? val item) #t accum))
    #f
    set))

(define (adjoin-set val set)
  (if (element-of-set? val set) set (cons val set)))

(define (intersection-set s1 s2)
  (if (or (null? s1) (null? s2)) `()
      (let ((first (car s1)) (rest (cdr s1)))
        (if (element-of-set? first s2) 
            (cons first (intersection-set rest s2))
            (intersection-set rest s2)))))
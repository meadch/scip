; Exercise 2.27. Modify your reverse procedure of exercise 2.18 to produce a deep-reverse procedure that takes a list as argument and returns as its value the list with its elements reversed and with all sublists deep-reversed as well. 

(define (append-list l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append-list (cdr l1) l2))))

(define (reverse-list l)
  (if (null? l)
      l
      (append-list (reverse-list (cdr l)) (list (car l)))))

(define (deep-reverse l)
      (if (null? l)
          l
          (append-list (deep-reverse (cdr l)) 
                       (list (if (pair? (car l)) 
                          (deep-reverse (car l))
                          (car l))))))


(define x (list (list 1 2) (list 3 4))) 

(reverse-list x) ;((3 4) (1 2))
(deep-reverse x) ;((4 3) (2 1))

; Exercise 2.27. Modify your reverse procedure of exercise 2.18 to produce a deep-reverse procedure that takes a list as argument and returns as its value the list with its elements reversed and with all sublists deep-reversed as well. 

(load "append-list")  ;append-list

(define (deep-reverse l)
      (if (null? l)
          l
          (append-list (deep-reverse (cdr l)) 
                       (list (if (pair? (car l)) 
                          (deep-reverse (car l))
                          (car l))))))


(define x (list (list 1 2) (list 3 4))) 

; (deep-reverse x) ;((4 3) (2 1))

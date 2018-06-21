; Complete the definition of a procedure that generates the set of subsets of a set and give a clear explanation of why it works.

(define a (list 1 2 3))

(define (subsets s) 
  (if (null? s) 
      (list s)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (sub) (cons (car s) sub)) rest)))))

(subsets a) ;(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

; EXPLANATION
; This works by first recursing to the base case of a set with a single empty set inside, which is assigned to rest.

; (1 2 3) => (2 3) => (3) => () => hits base case and returns (()).

; append is then first called when rest = (()) and s = (3). We append the result of mapping over the existing rest (()), adding the first value from the current s to the front of each subset

; The first time append executes: (()) + ((3))
; The second time append executes: (() (3)) + ((2) (2 3))
; The third time append executes: (() (3) (2) (2 3)) + ((1) (1 3) (1 2) (1 2 3))

; Leaving us with: (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
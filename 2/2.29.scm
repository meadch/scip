; A binary mobile consists of two branches, a left branch and a right branch. Each branch is a rod of a certain length, from which hangs either a weight or another binary mobile.

(define (make-mobile left right)
  (list left right))

; A branch is constructed from a length (which must be a number) together with a structure, which may be either a number (representing a simple weight) or another mobile.

(define (make-branch length structure)
  (list length structure))

; ****************** EXERCISES ************************

; a. Write the corresponding selectors left-branch and right-branch, which return the branches of a mobile, and branch-length and branch-structure, which return the components of a branch.

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))
(define (branch-length branch)  (car branch))
(define (branch-structure branch) (car (cdr branch)))

; b. Using your selectors, define a procedure total-weight that returns the total weight of a mobile.



(define (total-weight mobile)
(+ (branch-weight (left-branch mobile)) 
  (branch-weight (right-branch mobile))))
  
  (define (branch-weight branch)
  (if (pair? (branch-structure branch))
  (total-weight (branch-structure branch))
  (branch-structure branch)))
  
  ; c. A mobile is said to be balanced if the torque applied by its top-left branch is equal to that applied by its top-right branch (that is, if the length of the left rod multiplied by the weight hanging from that rod is equal to the corresponding product for the right side) and if each of the submobiles hanging off its branches is balanced. Design a predicate that tests whether a binary mobile is balanced.
  
  (define (is-balanced? mobile)
  (define (branch-torque branch)
  (* (branch-weight branch) (branch-length branch)))
  
  (define (branch-balanced? branch)
  (if (pair? (branch-structure branch))
  (is-balanced? (branch-structure branch))
  #t))
  
  (and (= (branch-torque (left-branch mobile)) (branch-torque (right-branch mobile)))
  (branch-balanced? (left-branch mobile))
  (branch-balanced? (right-branch mobile))))
  
  
  (define branch-a (make-branch 3 10))
  (define branch-b (make-branch 5 6))
  (define m (make-mobile branch-a branch-b))
  
  (define branch-c (make-branch 1 16))
  (define branch-d (make-branch 2 m))
  (define m2 (make-mobile branch-c branch-d))

  (is-balanced? m) ; #t
  (is-balanced? m2) ; #f
  
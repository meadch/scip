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

(define branch-a (make-branch 3 4))
(define branch-b (make-branch 5 6))
(define m (make-mobile branch-a branch-b))

(define (total-weight mobile)
  (define (branch-weight branch)
    (if (pair? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)))
  (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))

(total-weight m)
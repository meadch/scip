; Exercise 2.60. We specified that a set would be represented as a list with no duplicates. Now suppose we allow duplicates. For instance, the set {1,2,3} could be represented as the list (2 3 2 1 3 2 2). Design procedures element-of-set?, adjoin-set, union-set, and intersection-set that operate on this representation. 

(load "2.59.scm")

; element-of-set? doesn't need to change

(define (adjoin-set val set)
  ; simplified by removing element-of-set? call
  (cons val set))

(define (union-set s1 s2)
  ; simplifies by just appending the two sets
  (append s1 s2))

; intersection-set doesn't need to change (even though it can produce different resulting sets based on order of arguments/which set has duplicates)

; How does the efficiency of each compare with the corresponding procedure for the non-duplicate representation? 

; element-of-set? => unchanged 
; adjoin-set => more efficient 
; union-set => more efficient
; intersection-set => unchanged

; Are there applications for which you would use this representation in preference to the non-duplicate one?

; Applications without memory constraints where we're doing a lot of adjoin-ing, union-ing
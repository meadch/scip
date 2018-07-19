; a. Do the two procedures (tree->list-1 and tree->list-2) produce the same result for every tree? If not, how do the results differ? What lists do the two procedures produce for the trees in figure 2.16?

; Yes, they produce the same trees, always list-ing the left branch before the right.
(load "tree.scm")
(load "accumulate.scm")

(tree->list-1 (accumulate adjoin-set `() (list 11 5 1 9 3 7))) ; (1 3 5 7 9 11)
(tree->list-2 (accumulate adjoin-set `() (list 11 5 1 9 3 7))) ; (1 3 5 7 9 11)

(tree->list-1 (accumulate adjoin-set `() (list 11 9 5 7 1 3))) ; (1 3 5 7 9 11)
(tree->list-2 (accumulate adjoin-set `() (list 11 9 5 7 1 3))) ; (1 3 5 7 9 11)

(tree->list-1 (accumulate adjoin-set `() (list 11 7 1 3 9 5))) ; (1 3 5 7 9 11)
(tree->list-2 (accumulate adjoin-set `() (list 11 7 1 3 9 5))) ; (1 3 5 7 9 11)

; b. Do the two procedures have the same order of growth in the number of steps required to convert a balanced tree with n elements to a list? If not, which one grows more slowly?

; tree->list-2 grows more slowly since it doesn't have to iterate through the list produced by the left branch in append, which is used in tree->list-1
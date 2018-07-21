(load "tree.scm")

  ; Write a short paragraph explaining as clearly as you can how partial-tree works. Draw the tree produced by list->tree for the list (1 3 5 7 9 11).

  ; partial-tree works by taking the middle element of a sorted list as the root and building its left and right branches with recursive calls that will do the same -- that way the tree ends up balanced. In the example of (list->tree (list 1 3 5 7 9 11)), partial-tree will:

  ; 1. Take 5 as the root (strip away the first (quotient (- n 1) 2)) elements and grab first of the remainder. In this case, (quotient (- 6 1) 2)) strips away 1 and 3, leaving 5 as the first root to be grabbed.
  ; 2. Build a partial tree out of (1 3). This will take 1 as root, etc.
  ; 3. Build a partial tree out of (7 9 11). This will take 9 as root, etc.
  ; 4. Return a tree that looks like:

                                ;    5
                                ; 1     9
                                ;  3   7 11
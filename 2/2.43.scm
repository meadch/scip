; Exercise 2.43. Explain why this flatmap/map interchange makes the program run slowly. Estimate how long it will take Louis’s program to solve the eight-queens puzzle, assuming that the program in exercise 2.42 solves the puzzle in time T.

(flatmap
 (lambda (new-row)
   (map (lambda (rest-of-queens)
          (adjoin-position new-row k rest-of-queens))
        (queen-cols (- k 1))))
 (enumerate-interval 1 board-size))

; The queen-col procedure has been nested inside another mapping layer -- it previously was called at the outer layer, i.e. only once for each column. By nesting it, it gets called repeatedly for each row as well. If the system previously took time T (a linear process to the # columns), now it would take T^Size.
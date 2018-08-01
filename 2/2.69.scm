; Exercise 2.69. The following procedure takes as its argument a list of symbol-frequency pairs (where no symbol appears in more than one pair) and generates a Huffman encoding tree according to the Huffman algorithm.
(load "huffman-trees.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

; Make-leaf-set is the procedure given above that transforms the list of pairs into an ordered set of leaves. Successive-merge is the procedure you must write, using make-code-tree to successively merge the smallest-weight elements of the set until there is only one element left, which is the desired Huffman tree. (This procedure is slightly tricky, but not really complicated. If you find yourself designing a complex procedure, then you are almost certainly doing something wrong. You can take significant advantage of the fact that we are using an ordered set representation.)

(define (successive-merge nodes)
 (if (= 1 (length nodes)) 
  (car nodes)
  (successive-merge (adjoin-set 
                      (make-code-tree (car nodes) (cadr nodes))
                      (cddr nodes)))))

(define leaves (make-leaf-set '(('A 4) ('B 2) ('C 1) ('D 1))))

(successive-merge leaves)

;      (a b d c)  8
;      |          |
; (leaf a 4)     (b d c)  4
;                |        |
;           (leaf b 2)   (d c) 2
;                        |     | 
;                  (leaf d 1) (leaf c 1)
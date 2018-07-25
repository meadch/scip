; Exercise 2.68. The encode procedure takes as arguments a message and a tree and produces the list of bits that gives the encoded message.

(define (encode message tree)
  (if (null? message)
      `()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

; Encode-symbol is a procedure, which you must write, that returns the list of bits that encodes a given symbol according to a given tree. You should design encode-symbolso that it signals an error if the symbol is not in the tree at all. 

(load "huffman-trees.scm")
(load "set.scm")

(define (encode-symbol symbol tree)
  (define (matching-leaf? symbol tree)
    (and (leaf? tree) 
         (eq? (symbol-leaf tree) symbol)))

  (cond ((matching-leaf? symbol tree) `())
        ((not (element-of-set? symbol (symbols tree))) 
          (error "symbol not in tree -- ENCODE-SYMBOL" symbol))
        ((element-of-set? symbol (symbols (left-branch tree))) 
          (cons 0 (encode-symbol symbol (left-branch tree))))
        (else 
          (cons 1 (encode-symbol symbol (right-branch tree))))))

; Test your procedure by encoding the result you obtained in exercise 2.67 with the sample tree and seeing whether it is the same as the original sample message.

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define sample-message (list 0 1 1 0 0 1 0 1 0 1 1 1 0))
(define decoded-message (decode sample-message sample-tree))

(encode decoded-message sample-tree) ;(0 1 1 0 0 1 0 1 0 1 1 1 0)
(load "accumulate")

(define (make-tree entry left right)
  (list entry left right))
(define (entry tree)
  (car tree))
(define (left-branch tree)
  (cadr tree))
(define (right-branch tree)
  (caddr tree))

(define (element-of-set? val tree)
  (cond ((null? tree) #f)
        ((= val (entry tree)) #t)
        ((< val (entry tree)) (element-of-set? val (left-branch tree)))
        (else (element-of-set? val (right-branch tree)))))

(define (adjoin-set val tree)
  (cond ((null? tree) (make-tree val `() `()))
        ((= val (entry tree)) tree)
        ((< val (entry tree)) (make-tree (entry tree) (adjoin-set val (left-branch tree)) (right-branch tree)))
        (else (make-tree (entry tree) (left-branch tree) (adjoin-set val (right-branch tree))))))


(define (tree->list-1 tree)
  (if (null? tree) `()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree) (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result)
    (if (null? tree) result
        (copy-to-list (left-branch tree) (cons (entry tree) (copy-to-list (right-branch tree) result)))))
        
  (copy-to-list tree `()))
#lang racket

(require sicp)

(define (depth-first-search tree)
  (display (datum tree))
  (for-each depth-first-search (children tree)))

(define (breadth-first-search tree)
  ; invent a data structure, a queue
  (bfs-iter (list tree)))

(define (bfs-iter queue)
  (if (null? queue)
      'done
      (let ((task (car queue)))
        (display (datum task))
        (bfs-iter (append (cdr queue) (children task))))))
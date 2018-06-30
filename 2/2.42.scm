(load "enumerate")
(load "flat-map")

(define (queens board-size)
  (define (queen-col k)
    (if (= k 0) 
      (list empty-board)
      (filter (lambda (positions) (safe? k positions))
            (flat-map 
              (lambda (rest-of-queens) 
                (map 
                  (lambda (row) (adjoin-position row k rest-of-queens))
                  (enumerate-interval 1 board-size)))
              (queen-col (- k 1))))))
  (queen-col board-size))

(define empty-board `())

(define (make-position row col)
  (cons row col))

(define (get-row position)
  (car position))

(define (get-column position)
  (cdr position))

(define (adjoin-position row col positions)
  ; Append new position to end of list so that it matches up w/ column
  (append positions (list (make-position row col))))

(define (safe? column positions)
  (define (safe-iter current-queen rest-of-queens)
    (if (null? rest-of-queens)
        #t
        (and (not (in-check? current-queen (car rest-of-queens)))
             (safe-iter current-queen (cdr rest-of-queens)))))
  
  (define (in-check? q1 q2)
    (or (same-row? q1 q2) (same-diagonal? q1 q2)))

  (define (same-row? q1 q2)
    (= (get-row q1) (get-row q2)))

  (define (same-diagonal? q1 q2)
    (= (abs (- (get-row q1) (get-row q2)))
       (abs (- (get-column q1) (get-column q2)))))

  (let (
        (queen-just-added (list-ref positions (- column 1)))
        (rest-of-queens (filter (lambda (p) (not (= column (get-column p)))) positions))
       )
       (safe-iter queen-just-added rest-of-queens)
  ))
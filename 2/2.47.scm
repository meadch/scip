; Exercise 2.47. Here are two possible constructors for frames:

(define (make-frame-1 origin edge1 edge2)
  (list origin edge1 edge2))
(define (make-frame-2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

; For each constructor supply the appropriate selectors to produce an implementation for frames.

; Getting the origin, horizontal edge is the same
(define get-origin-1 car)
(define get-origin-2 car)
(define (get-horiz-1 frame)
  (car (cdr frame)))
(define get-horiz-2 get-horiz-1)

; The only difference is getting the vertical edge
(define (get-vert-1 frame)
  (car (cdr (cdr frame))))

(define (get-vert-2 frame)
  (cdr (cdr frame)))
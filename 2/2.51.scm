; Exercise 2.51. Define the below operation for painters. Below takes two painters as arguments. The resulting painter, given a frame, draws with the first painter in the bottom of the frame and with the second painter in the top. Define below in two different ways -- first by writing a procedure that is analogous to the beside procedure:

(define (below-a p1 p2)
  (let ((top ((transform-painter (make-vect 0 0.5) 
                                (make-vect 1 0.5)
                                (make-vect 0 1)) p2))
        (bottom ((transform-painter (make-vect 0 0) 
                                  (make-vect 1 0)
                                  (make-vect 0 0.5)) p1)))
    (lambda (frame) 
      (for-each (lambda (p) (p frame)) (list top bottom)))))

; and again in terms of beside and suitable rotation operations (from exercise 2.50).

(define (below-b p1 p2)
  (flip-90 (beside (flip-270 p1) (flip-270 p2))))
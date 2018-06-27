(load "append-list")
(load "accumulate")

(define (flat-map proc seq)
  (accumulate append-list `() (map proc seq)))
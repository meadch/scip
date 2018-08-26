;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |3.4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require sicp)

; Exercise 3.4. Modify the make-account procedure of exercise 3.3 by adding another local state variable so that, if an account is accessed more than seven consecutive times with an incorrect password, it invokes the procedure call-the-cops.

(define (make-account balance password)
  
  ; Password management procedures
  (define calls-with-incorrect-password 0)
  (define (call-the-cops) (display "Call the cops!\n"))
  (define (handle-incorrect-password)
    (if (>= calls-with-incorrect-password 6)
        (call-the-cops)
        (set! calls-with-incorrect-password (+ calls-with-incorrect-password 1))))
  (define (incorrect-password? pw)
    (cond ((not (eq? pw password)) (begin (handle-incorrect-password)) #t)
          (else (set! calls-with-incorrect-password 0) #f)))

  ; Account behavior
  (define (withdraw amount)
    (if (<= amount balance)
    (begin (set! balance (- balance amount)) balance)
    "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  ; Dispatch procedure
  (define (dispatch pw message)
    (cond ((incorrect-password? pw) (lambda (_) "Incorrect password"))
          ((eq? message 'withdraw) withdraw)
          ((eq? message 'deposit) deposit)))

  dispatch)
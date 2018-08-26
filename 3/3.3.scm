;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 3.3.scm) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require sicp)

;Exercise 3.3. Modify the make-account procedure so that it creates password-protected accounts. That is, make-account should take a symbol as an additional argument, as in

; (define acc (make-account 100 'secret-password))

;The resulting account object should process a request only if it is accompanied by the password with which the account was created, and should otherwise return a complaint:


(define (make-account balance password)
  (define (withdraw amount)
    (if (<= amount balance)
    (begin (set! balance (- balance amount)) balance)
    "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (dispatch pw message)
    (cond ((not (eq? pw password)) (lambda (_) "Incorrect password"))
          ((eq? message 'withdraw) withdraw)
          ((eq? message 'deposit) deposit)))

  dispatch)
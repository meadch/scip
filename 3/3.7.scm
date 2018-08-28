;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |3.7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require sicp)


;Exercise 3.7. Consider the bank account objects created by make-account, with the password modification described in exercise 3.3.

; Suppose that our banking system requires the ability to make joint accounts. Define a procedure make-joint that accomplishes this. Make-joint should take three arguments. The first is a password-protected account. The second argument must match the password with which the account was defined in order for the make-joint operation to proceed. The third argument is a new password. Make-joint is to create an additional access to the original account using the new password. For example, if peter-acc is a bank account with password open-sesame, then

;(define paul-acc
 ; (make-joint peter-acc 'open-sesame 'rosebud))

; will allow one to make transactions on peter-acc using the name paul-acc and the password rosebud. You may wish to modify your solution to exercise 3.3 to accommodate this new feature.

(define (includes? x l)
  (cond ((null? l) #f)
        ((eq? (car l) x) #t)
        (else (includes? x (cdr l)))))

(define (make-account balance password)
  (define passwords (list password))
  (define (withdraw amount)
    (if (<= amount balance)
    (begin (set! balance (- balance amount)) balance)
    "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (add-owner new-pw)
    (begin (set! passwords (append passwords (list new-pw)))
           dispatch))

  (define (dispatch pw message)
    (cond ((not (includes? pw passwords)) (lambda (_) "Incorrect password"))
          ((eq? message 'withdraw) withdraw)
          ((eq? message 'deposit) deposit)
          ((eq? message 'add-owner) add-owner)))
  dispatch)

(define (make-joint acct orig-pw new-pw)
  ((acct orig-pw 'add-owner) new-pw))
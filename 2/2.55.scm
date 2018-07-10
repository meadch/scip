; Exercise 2.55. Eva Lu Ator types to the interpreter the expression (car ’’abracadabra)
; To her surprise, the interpreter prints back "quote". Explain.

; ' is simply syntactic sugar for the 'quote' procedure, so
; 'a is the equivalent of (quote a)
; That means (car ''abracadabra) is equivalent to
; (car (quote (quote abracadabra))), which can be rewritten as
; (car '(quote abracadabra)), i.e. quoting a two-item list with the characeters "quote" as the first item


; Exercise 2.70. The following eight-symbol alphabet with associated relative frequencies was designed to efficiently encode the lyrics of 1950s rock songs. (Note that the ‘‘symbols’’ of an ‘‘alphabet’’ need not be individual letters.)

;(A 2) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1)

; Use generate-huffman-tree (exercise 2.69) to generate a corresponding Huffman tree, and use encode (exercise 2.68) to encode the following message:

(load "2.69.scm")
(load "2.68.scm")

(define tree (generate-huffman-tree '((A 2) (NA 16) (BOOM  1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1)))) 

(define song '(Get a job Sha na na na na na na na na Get a job Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom)) 

  ; ;How many bits are required for the encoding? 
(length (encode song tree)) ;84


  ; What is the smallest number of bits that would be needed to encode this song if we used a fixed-length code for the eight-symbol alphabet?

  ; An 8-symbol alphabet would need 3 bits per symbol. With a song length of 36 symbols, 36 * 3 = 108. That's an almost 30% increase.
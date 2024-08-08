#lang sicp

(define (countDivisors num lst)
  (define (helper num lst count)
    (cond ((null? lst) count)                
          ((= (car lst) 0) (helper num (cdr lst) count))  
          ((= (remainder num (car lst)) 0)    
           (helper num (cdr lst) (+ count 1)))
          (else (helper num (cdr lst) count)))) 

  (helper num lst 0)) 

; Test cases
(display (countDivisors 10 '())) (newline)        
(display (countDivisors 10 '(20 50 60))) (newline)  
(display (countDivisors 10 '(1 20 30 2 5 40 10 60))) (newline) 
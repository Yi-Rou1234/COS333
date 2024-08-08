#lang sicp

(define (circleArea radius)
  (let (
    (pi (/ 22.0 7)))
    (if (<= radius 0)
        0
        (* pi (* radius radius))
    )))

(define (countDivisors num lst)
  (define (helper num lst count)
    (cond ((null? lst) count)                
          ((= (car lst) 0) (helper num (cdr lst) count))  
          ((= (remainder num (car lst)) 0)    
           (helper num (cdr lst) (+ count 1)))
          (else (helper num (cdr lst) count)))) 
  (helper num lst 0)) 

(define (getEveryEvenElement lst)
  (define (helper lst index)
    (cond ((null? lst) '())   
          ((= index 1) (helper (cdr lst) 2))  
          (else (cons (car lst) (helper (cdr lst) (+ index 2)))))) 
  (helper lst 1))

;Output
;task 1
(display (circleArea -1))
(newline)
;task 2
(display (countDivisors 3 '())) (newline)        
(display (countDivisors 3 '(2 8))) (newline)  
(display (countDivisors 3 '(3 1))) (newline)
(display (countDivisors 3 '(2 3 1 5 9))) (newline) 
;task 3
(display (getEveryEvenElement '())) (newline) 
(display (getEveryEvenElement '(a b c))) (newline) 
(display (getEveryEvenElement '(a b c d e f))) (newline) 

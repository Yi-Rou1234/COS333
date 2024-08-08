#lang sicp

(define (getEveryEvenElement lst)
  (define (helper lst index)
    (cond ((null? lst) '())   
          ((= index 1) (helper (cdr lst) 2))  
          (else (cons (car lst) (helper (cdr lst) (+ index 2)))))) 
  (helper lst 1))

; Test cases
(display (getEveryEvenElement '())) (newline) 
(display (getEveryEvenElement '(a))) (newline) 
(display (getEveryEvenElement '(a b c d))) (newline) 
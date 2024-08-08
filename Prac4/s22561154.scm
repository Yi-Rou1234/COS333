#lang sicp
(define (stripNegativesDuplicateEvens lst)
    (cond
        ((null? lst) '())
        ((negative? (car lst)) (stripNegativesDuplicateEvens (cdr lst)))
        ((even? (car lst)) (cons (car lst) (cons (car lst) (stripNegativesDuplicateEvens (cdr lst)))))
        (else (cons (car lst) (stripNegativesDuplicateEvens (cdr lst))))))

;testing
(display (stripNegativesDuplicateEvens '())) 
(newline)
(display (stripNegativesDuplicateEvens '(-6 -1))) 
(newline)
(display (stripNegativesDuplicateEvens '(6 8))) 
(newline)
(display (stripNegativesDuplicateEvens '(4 -1 9))) 
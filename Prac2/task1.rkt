#lang sicp

(define (circleArea radius)
  (let ((pi (/ 22.0 7)))
    (if (<= radius 0)
        0
        (* pi (* radius radius)))))

; Test cases
(display (circleArea 3.2))
(newline)

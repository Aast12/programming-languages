#lang racket


(define (fillUntil k lst)
    (cond
        ((null? lst) lst)
        ((= (car lst) k) (list k))
        (else (cons (car lst) (fillUntil k (cdr lst))))
    )
)

(define (subListL3 x y lst)
    (cond
        ((null? lst) lst)
        ((= (car lst) y) (list y))
        ((= (car lst) x) (fillUntil y lst))
        (else (subListL3 x y (cdr lst)))
    )
)

(define (find x lst)
    (cond
        ((null? lst) lst)
        ((= (car lst) x) lst)
        (else (find x (cdr lst)))
    )
)

(define (subListL4 x y lst)
    (cond
        ((and (null? (find x lst)) (null? (find y lst))) lst)
        ((= (car lst) x) (fillUntil y lst))
        ((= (car lst) y) lst)
        (else (subListL4 x y (cdr lst)))
    )
)

(subListL3 4 2 '(8 6 4 3 1 2 9))

(subListL4 4 2 '(8 6 4 3 1 2 9))
(subListL4 14 2 '(8 6 4 3 1 2 9))
(subListL4 4 12 '(8 6 4 3 1 2 9))
(subListL4 14 12 '(8 6 4 3 1 2 9))
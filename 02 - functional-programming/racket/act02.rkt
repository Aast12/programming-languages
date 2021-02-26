#lang racket

(define (sum lst)
  (if (null? lst)
      0
      (if (number? (car lst))
        (+ (car lst) (sum(cdr lst)))
        (sum(cdr lst))
      )
  )
)

(define (palindrome? lst)
    (equal? lst (reverse lst))
)

(define (reverse-lst lst)
    (if (null? lst)
        lst
        (append (reverse-lst (cdr lst)) (list (car lst)))
    )
)

(define (get lst i)
    (if (and (>= i 0) (< i (length lst)))
        (if (= i 0)
            (car lst)
            (get (cdr lst) (- i 1))
        )
        null
    )
)

(define (odds lst)
    (if (<= (length lst) 1)
        null
        (cons (cadr lst) (odds (cddr lst)))
    )
)

(sum '(1 2 3 4 5 6))
(palindrome? '(1 2 3 4 3 2 1))
(reverse-lst '(1 2 3 4 5 6))
(get '(1 2 3 4 5 6) 3)
(odds '(1 7 3 4))
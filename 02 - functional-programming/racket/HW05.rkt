#lang racket

;; ====================
;; Complete the following functions and submit your file to Canvas.
;; ====================
;; Do not change the names of the functions. 
;; Do not change the number of arguments in the functions.
;; If your file cannot be loaded by the Racket interpreted, your submission may be cancelled. Then, submit only code that works.
;; ====================
;; Grading instructions:
;; There is a series of test cases for each function. In order to state that your function "works as described", your output must be similar to the expected one in each case.

;; === fibonacci ===

(define (fibonacci n)
	(cond 
		((= n 0) 0)
		((<= n 2) 1)
		(else (+ (fibonacci (- n 2)) (fibonacci (- n 1))))
	)
)

(display "=== fibonacci ===\n")
(fibonacci 10) ;; 55
(fibonacci 15) ;; 610
(fibonacci 20) ;; 6765

;; === nestedSum ===

(define (nestedSum lst)
	(if (null? lst)
		0
		(let ((fst (car lst)) (rest (cdr lst)))
			(if (list? fst)
				(+ (nestedSum fst) (nestedSum rest))
				(+ fst (nestedSum (cdr lst)))
			)
		)
	)
)

(display "=== nestedSum ===\n")
(nestedSum '(10 20 30 40)) ;; 100 
(nestedSum '(15 (5 4 (3 10)) 6 (8))) ;; 51
(nestedSum '(((20 () ()) () 3))) ;; 23

;; === evenNumbers ===

(define (evenNumbers lst)
	(if (null? lst)
		lst
		(let ((fst (car lst)) (rest (cdr lst)))
			(if (list? fst)
				(cons (evenNumbers fst) (evenNumbers rest))
				(if (even? fst)
					(cons fst (evenNumbers rest))
					(evenNumbers rest)
				)
			)
		)
	)
)

(display "=== evenNumbers ===\n")
(evenNumbers '(10 3 25 32 37 9)) ;; '(10 32) 
(evenNumbers '(15 (5 4 (3 10)) 6 (8))) ;; '((4 (10)) 6 (8))
(evenNumbers '(((20 () ()) () 3))) ;; '(((20 () ()) ()))

;; === nestedReverse ===

(define (nestedReverse lst)
	(if (list? lst)
		(if (null? lst)
			lst
			(append 
				(nestedReverse (cdr lst))
				(list (nestedReverse (car lst)))
			)
		)
		lst
	)
)

(display "=== nestedReverse ===\n")
(nestedReverse '(10 3 25 32 37 9)) ;; '(9 37 32 25 3 10)
(nestedReverse '(15 (5 4 (3 10)) 6 (8))) ;; '((8) 6 ((10 3) 4 5) 15)
(nestedReverse '(((20 () ()) () 3))) ;; '((3 () (() () 20)))

;; === unroll ===

(define (unroll lst)
	(if (list? lst)
		(if (null? lst)
			lst
			(append (unroll (car lst)) (unroll (cdr lst)) )
		)
		(list lst)
	)
)

(display "=== unroll ===\n")
(unroll '(10 3 25 32 37 9)) ;; '(10 3 25 32 37 9)
(unroll '(15 (5 4 (3 10)) 6 (8))) ;; '(15 5 4 3 10 6 8)
(unroll '(((20 () ()) () 3))) ;; '(20 3)

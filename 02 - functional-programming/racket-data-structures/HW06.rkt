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

;; === sum ===

(define (sum matrix)
	(cond
		((null? matrix) 0)
		((not (list? matrix)) matrix)
		((equal? (length matrix) 1) (sum (car matrix)))
		(else (+ (sum (car matrix)) (sum (cdr matrix)) ))
	)
)

(display "=== sum ===\n")
(sum '((1 2 3) (4 5 6) (7 8 9))) ;; 45
(sum '((1 2) (30 40) (5 6) (70 80))) ;; 234
(sum '((8 9 5 6 7) (3 4 5 4 2))) ;; 53

;; === complete? ===

(define (get-nodes lst)
	(if (null? lst)
		lst
		(cons (caar lst) (get-nodes (cdr lst)))
	)
)

(define (has? lst1 lst2)
	(if (null? lst2)
		#t
		(if (findf
			(lambda (i) (equal? i (car lst2)))
			lst1
			)
			(has? lst1 (cdr lst2))
			#f
		)
	)
)

(define (complete-aux? graph nodes)
	
	(if (null? graph)
		#t
		(and (has? (car graph) nodes) (complete-aux? (cdr graph) nodes))
	)
)

(define (complete? graph)
	(let ((nodes (get-nodes graph)))
		(complete-aux? graph nodes)
	)	
)

(display "=== complete? ===\n")
(complete? '((a b c) (b a c) (c a b) (d e) (e d))) ;; #f
(complete? '((a b) (b a))) ;; #t
(complete? '( (a c) (b a) (c a))) ;; #f

;; === msort ===

(define (merge llst rlst)
	(cond
		((null? llst) rlst)
		((null? rlst) llst)
		((> (car llst) (car rlst))
			(cons (car rlst) (merge llst (cdr rlst)))
		)
		(else
			(cons (car llst) (merge rlst (cdr llst)))
		)
	)
)

(define (msort lst)
	(if (list? lst)
		(if (<= (length lst) 1)
			lst
			(let ( (half (truncate (/ (length lst) 2))) )
					(merge (msort (take lst half)) (msort (drop lst half)))
				)
		)
		lst
	)
)

(display "=== msort ===\n")
(msort '()) ;; '()
(msort '(1)) ;; '(1)
(msort '(10 35 8 2.6 4.7 12)) ;; '(2.6 4.7 8 10 12 35)
(msort '(1 4 7 9 3 4 8 10)) ;; '(1 3 4 4 7 8 9 10)

;; === sold-units ===

;; This should not be done! (but it helps)
(define sales 
  '(
    (105 (10 3) (4 2) (9 3))
    (106 (6 4) (8 1) (4 6))
    (107 (9 7) (12 1) (14 1) (10 4))
    (108 (4 1))
    (109 (7 21) (10 4) (14 6) (5 3))
  )
)

(define (count-units id record)
	(if (null? record)
		0
		(let ((fst (caar record)) (snd (cadar record)))
			(if (= fst id) 
				(+ snd (count-units id (cdr record)))
				(count-units id (cdr record))
			)
		)
	)
)

(define (sold-units id sales)
  	(if (null? sales)
		0
		(+ (sold-units id (cdr sales)) (count-units id (cdar sales)))
	)
)

(display "=== sold-units ===\n")
(sold-units 2 sales) ;; 0
(sold-units 9 sales) ;; 10
(sold-units 10 sales) ;; 11
(sold-units 14 sales) ;; 7

;; === insert ===

(define (insert x tree)
	(cond
		((null? tree) (list x '() '()))
		((> x (car tree)) 
			(list (car tree) (cadr tree) (insert x (caddr tree)))
		)
		(else
			(list (car tree) (insert x (cadr tree)) (caddr tree))
		)
	)
)

(display "=== insert ===\n")
(insert 1 '()) ;; '(1 () ())
(insert 3 '(1 () (5 () ()))) ;; '(1 () (5 (3 () ()) ()))
(insert 0 '(1 () (5 (3 () ()) (6 () ())))) ;; '(1 (0 () ()) (5 (3 () ()) (6 () ())))

;; == set ===

(define (set lst)
  	(cond
		((null? lst) lst)
		((number? (car lst))
			(if (findf
					(lambda (i) (if (number? i) (= (car lst) i) #f))
					(cdr lst)
				)
				(set (cdr lst))
				(cons (car lst) (set (cdr lst)))
			)
		)
		(else (set (cdr lst)))
	)
)

(display "=== set ===\n")
(set '(1 2 3 2 4 a (1 2) 5 2 3)) ;; '(1 4 5 2 3)
(set '(a b 3 4)) ;; '(3 4)
(set '(10 (a b 3) 4 (8) c d (a b 3) d c 11)) ;; '(10 4 11)

(define (union x y)
  	(set (append x y))
)

(display "=== union ===\n")
(union '(1 2 3 4) '(3 4 5 6)) ;; '(1 2 3 4 5 6)
(union '(10 2 8 4) '()) ;; '(10 2 8 4)
(union '(2 a 8 4) '(b c d)) ;; '(2 8 4)

(define (intersection x y)
  	(cond
		((null? x) x)
		((null? y) y)
		((number? (car x))
			(if (findf
					(lambda (i) (if (number? i) (= (car x) i) #f))
					y
				)
				(cons (car x) (intersection (cdr x) y))
				(intersection (cdr x) y)
			)
		)
		(else (intersection (cdr x) y))
	)
)

(display "=== intersection ===\n")
(intersection '(1 2 3 4) '(3 4 5 6)) ;; '(3 4)
(intersection '(10 2 8 4) '()) ;; '()
(intersection '(2 a 8 4) '(b c 8 d)) ;; '(8)

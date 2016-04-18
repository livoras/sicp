;; 2.2

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))


(define p1 (make-point 0 0))
(define p2 (make-point 10 10))
(define segment (make-segment p1 p2))
(print-point (start-segment segment))
(print-point (end-segment segment))

;; Impure function
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")") )

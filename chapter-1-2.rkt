#lang racket
(define (f x y)
  (let ((a (+ x 1))
        (b (- y 1)))
    (* a b)))

(f 3 2)

(define (f2 g) (g 2))
(define (dec x) (- x 1))

; 1.42
(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))
(define (inc x) (+ x 1))

((compose square inc) 6)

; 1.43

(define (repeat f count)
  (define (inner current count)
    (if (= count 0)
        current
        (inner (compose current f) (- count 1))))
  (inner f (- count 1)))

((repeat square 2) 5)

; 1.44
(define (smooth f)
  (lambda (x dx)
    (/ (+
        (f (- x dx))
        (f x)
        (f (+ x dx)))
       3)))
((smooth (lambda (x) (+ x 1))) 2 1)
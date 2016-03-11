#lang racket
;;;;;;; The squart root

(define (sqr num)
  ; Iteration of guessin
  (define (sqr-iter i)
    (if (is-good-enough? i)
        i
        (sqr-iter (improve i))))
  ; Newton way
  (define (improve i)
    (average i (/ num i)))
  ; Check if the guess is good enough for the num
  (define (is-good-enough? i)
    (< (abs (- num (* i i))) 0.001))
  ; Compute average of two numbers
  (define (average x y)
    (/ (+ x y) 2))
  ; Start to compute
  (sqr-iter 1))

(define (f num)
  (define (f-iter count f1 f2 f3)
    (if (< count num)
        (f-iter (+ count 1) (f-cur f1 f2 f3) f1 f2)
        (f-cur f1 f2 f3)))
  (if (< num 3)
      num
      (f-iter 3 2 1 0)))

(define (f-cur f1 f2 f3)
  (+ f1
     (* 2 f2)
     (* 3 f3)))

(f 3)
(f 4)


;; Ex 1.17 redefine multiplication function
(define (mul a b)
  (cond
    ((= a 1) b)
    ((= b 1) a)
    ((even? a) (double (mul (halve a) b)))
    ((even? b) (double (mul (halve b) a)))
    (else (+ b (* (- a 1) b)))))

(define (even? num)
  (= (remainder num 2) 0))

(define (double x) (+ x x))
(define (halve x) (/ x 2))
(mul 3 5)
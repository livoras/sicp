(define (subsets s)
  (if (null? s)
      (list (list))
      (let ((rest (subsets (cdr s))))
        (append rest (map
                      (lambda (set) (append (list (car s)) set))
                      rest)))))

(subsets (list 1 2 3))
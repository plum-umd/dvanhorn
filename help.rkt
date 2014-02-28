#lang racket
(provide oxford delimit)
(define (oxford xs)
  (match xs
    [(list x1 x2) (add-between xs " and ")]
    [_
      (add-between xs ", " #:before-last ", and ")]))

(define (delimit ls left center right)
  (add-between ls center #:before-first left #:after-last right #:splice? #t))
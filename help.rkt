#lang racket
(provide oxford delimit)
(define (oxford xs)
  (add-between xs ", " #:before-last ", and "))

(define (delimit ls left center right)
  (add-between ls center #:before-first left #:after-last right #:splice? #t))
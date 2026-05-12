#lang racket
(require xml)

(require "papers.rkt")

(define www "www/")


;; [Listof Xexpr] String -> Void
(define (write-page xexprs fn)
  (with-output-to-file (string-append www fn)
    #:exists 'replace
    (λ ()      
      (displayln "<!DOCTYPE html>")
      (displayln "<!--[if IE 8]>  <html class=\"no-js lt-ie9\" lang=\"en\" > <![endif]-->")
      (displayln "<!--[if gt IE 8]><!--> <html class=\"no-js\" lang=\"en\" > <!--<![endif]-->")
      (for-each write-xexpr xexprs))))

(define (make-page title col)
  `((head
     (meta ((charset "utf-8")))
     (meta ((name "viewport")
            (content "width=device-width")))
     (title "David Van Horn : " ,title)     
     #;
     (meta ((name "keywords")
            (content ,keywords)))    
     (link ((rel "stylesheet")
            (href "stylesheets/fonts.css")))
     (link ((rel "stylesheet")
            (href "stylesheets/app.css")))
     (link ((rel "stylesheet")
            (href "stylesheets/social_foundicons.css")))

     (script ((src "javascripts/vendor/custom.modernizr.js"))))
    (body
     ,(make-cdata #f #f 
                  "<script>document.write('<script src=javascripts/vendor/'
    + ('__proto__' in {} ? 'zepto' : 'jquery')
    + '.js><\\/script>');</script>")
     (script ((src "javascripts/showhide.js")))
     (script ((src "javascripts/foundation/foundation.js")))
     (script ((src "javascripts/foundation/foundation.section.js")))

     (div ((class "site-header row"))
          (div ((class "site-title large-9 columns"))
               (h1 "David Van Horn")
               (p "Associate Professor" 
                  (br)
                  (a ((href "http://www.cs.umd.edu/")) "Department of Computer Science")
                  (br)
                  (span ((class "italic")) amp) " "
                  (a ((href "http://www.umiacs.umd.edu/")) "UMIACS")
                  (br)
                  (a ((href "http://www.umd.edu/")) "University of Maryland")))
          (div ((class "site-badge large-3 columns"))
               (img ((src "img/seal.png")
                     (alt "UMD")
                     (style "align: right; padding-top: 1em; padding-bottom: 1em;")))
               #;
               (ul ((class "inline-list right subheader italic"))
                  (li "Research")
                  (li "Papers")
                  (li "Books")
                  (li "Teaching")
                  (li "Contact"))))
     
    
     (div ((class "site-nav row"))
          (div ((class "site-tagline large-5 columns"))
               (p ((class "subheader")) (span ((class "italic")) "Structures don" rsquo "t march in the streets.")))
     
          (div ((class "site-menu large-7 columns"))
               (ul ((class "inline-list right subheader italic category"))
                  (li (a ((href "index.html") (class "category")) "Home"))
                  (li (a ((href "papers.html") (class "category")) "Publications"))
                  (li (a ((href "contact.html") (class "category")) "Contact"))
                  #;(li (a ((href "about.html") (class "category")) "About")))))
              
          
     
     
     ,col
     ,footer)))


(define footer
  `(footer ((class "site-footer row"))
           (div ((class "large-12 columns"))
                (hr)
                (div ((class "footer-meta row"))
                     (div ((class "large-6 columns"))
                          (p (small copy nbsp "2014" mdash "2026 " (a ((href "http://www.cs.umd.edu/~dvanhorn/")) "David Van Horn"))))
                     (div ((class "large-6 columns"))
                          (ul ((class "inline-list right"))
                              (li (a ((href "http://validator.w3.org/check?uri=http%3A%2F%2Fwww.cs.umd.edu%2F~dvanhorn%2F")) (small "Valid HTML")))
			      (li (a ((href "https://github.com/plum-umd/dvanhorn")) (small "github")))
                              #;(li (a ((name "and")) (small amp)))
                              #;(li (a ((href "#")) (small "CSS")))))))))

(define index.xexpr
  (make-page 
   "Home"
   `(div ((class "page-shell row"))
         (div ((class "home-layout"))
              (aside ((class "home-rail"))
                     (div ((class "home-rail-card"))
                          (p ((class "home-rail-label")) "Affiliations")
                          (ul ((class "home-rail-links"))
                              (li (a ((href "https://plum-umd.github.io/")) "PLUM"))
                              (li (a ((href "https://cyber.umd.edu/")) "MC2"))))
                     (div ((class "home-rail-card"))
                          (p ((class "home-rail-label")) "Teaching")
                          (ul ((class "home-rail-links"))
                              (li (a ((href "https://www.cs.umd.edu/class/fall2025/cmsc430/")) "CMSC 430")))))
              (div ((class "page-content home-main")
                    #;(role "content"))
                   ;(hr)
                   (hr ((class "phat")))
                   (img ((class "left") (alt "Photo by BK Adams.") (src "img/dvanhorn.jpg") (style "margin-right: 1em; margin-bottom: 1em;")))              
                   (p "My research interests are in programming languages, where I work toward making the construction of reusable, trusted software "
                      "components possible and effective. "
                      "My research has spanned program analysis; semantics; "
                      "verification and model-checking; security; logic; "
                      "complexity; and algorithms.")
                   (p "Together with " (a ((href "https://msurbatovich.github.io/")) "Milijiana Surbatovich") " and "
                      (a ((href "https://lemonidas.github.io/")) "Leo Lampropoulos") ", "
                      "I direct the laboratory for " 
                   (a ((href "http://www.cs.umd.edu/projects/PL/")) 
                      "Programming Languages at the University of Maryland (" 
                      #;(abbr ((title "Programming Languages at University of Maryland")) "plum") 
                      "PLUM"
                      ")") ".")                   
                   (p "I currently serve as the faculty advisor to " (a ((href "https://www.gotechnica.org/")) "Technica") ", the largest hackathon for
underrepresented genders in the world.")
	           (h4 "News")
	           (ul
                (li "I'm giving a talk on "
                    (em "Principal Gradual Type Inference")
                    " at "
                    (a ((href "https://njpls.org/may2026.html")) "NJPLS")
                    " on May 22, 2026.")
                (li "I'll be presenting lectures on "
                    (em "A Gradual Introduction to Programming Language Research")
                    " at the "
                    (a ((href "https://cmmrs.mpi-sws.org/")) "Cornell, Maryland, Max Planck Pre-doctoral Research School")
                    ", August 3" ndash ndash "7, 2026.")
                (li "I'm serving on the PLDI 2026 Review Committee.")
                (li "I'm serving on the POPL 2026 Program Committee.")
                (li "New paper: "
                    (em (a ((href "asdf")) "Webs and Flow-Directed Well-Typedness Preserving Program Transformations"))
                    " to appear at PLDI'25.")
                (li "New paper: "
                    (em (a ((href "asdf")) "Deriving with Derivatives: Optimizing Incremental Fixpoints for Higher-Order Flow Analysis"))
                    " to appear at ICFP'24.")
                (li "I'm serving on the ICFP 2024 Program Committee.")
                (li "New paper: "
                    (em (a ((href "https://arxiv.org/abs/2302.13145")) "Absynthe: Abstract Interpretation-Guided Synthesis")) " to appear at PLDI'23.")
))))))		   


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define contact.xexpr
  (make-page 
    "Contact"
    `(div ((class "page-shell row"))    
          (div ((class "page-content")
                #;(role "content"))           
               (hr ((id "contact") (class "phat")))
               
               
               (p "Office: 5250 Iribe" (br)
                  "Iribe Center for Computer Science and Engineering" (br)
                  "University of Maryland" (br)
		  "8125 Paint Branch Drive" (br)
                  "College Park, MD 20742" (br)
                  (br)
                  "Email: dvanhorn@cs.umd.edu" )
                  
               ))))
    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define papers.xexpr
  (make-page 
    "Publications"
    `(div ((class "page-shell row"))
          (div ((class "page-content")
                #;(role "content"))           
               (hr ((class "phat")))
               (h4 "Books")
               (p (span ((class "paper-title"))
                        (a ((href "http://nostarch.com/realmofracket.htm")) "Realm of Racket"))
                  ". With "
                  (a ((href "http://www.ccs.neu.edu/home/matthias/")) "Matthias Felleisen")
                  ", Conrad Baski, Forrest Bice, Rose DeMaio, Spencer Florence, Feng-Yun Mimi Lin, Scott Lindeman, Nicole Nussbaum, Eric Peterson, and Ryan Plessner.")
               (h4 "Papers")
               ,@papers-list
               ))))


(write-page index.xexpr "index.html")
(write-page papers.xexpr "papers.html")
(write-page contact.xexpr "contact.html")

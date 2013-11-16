#lang racket
(require xml)

(require "papers.rkt")

(define www "")

;; Xexpr String -> Void
(define (write-page xexpr fn)
  (with-output-to-file (string-append www fn)
    #:exists 'replace
    (λ ()      
      (displayln "<!DOCTYPE html>")
      (displayln "<!--[if IE 8]>  <html class=\"no-js lt-ie9\" lang=\"en\" > <![endif]-->")
      (displayln "<!--[if gt IE 8]><!--> <html class=\"no-js\" lang=\"en\" > <!--<![endif]-->")
      (write-xexpr xexpr))))

(define (make-page title col)
  `(html
    (head
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
     
     (style "#scroller { position: relative; background-color: white; z-index: 2; }")
     
     (style ".phat { color: black; background-color: black; height: 2em; }")
     (style ".midphat { margin-top: 7em; }")
     
     
     (script ((src "javascripts/vendor/custom.modernizr.js"))))
    (body
     ,(make-cdata #f #f 
                  "<script>document.write('<script src=javascripts/vendor/'
    + ('__proto__' in {} ? 'zepto' : 'jquery')
    + '.js><\\/script>');</script>")
     (script ((src "javascripts/foundation/foundation.js")))
     (script ((src "javascripts/foundation/foundation.section.js")))
     ,(make-cdata #f #f
                  "<script>$(window).scroll(function () { $('#scroller').css('top', $(window).scrollTop()); });</script>")
     
   
     
    
     (div ((class "row"))
          (div ((class "large-9 columns"))
               (h1 "David Van Horn")
               (p "Assistant Professor" 
                  (br)
                  (a ((href "http://www.cs.umd.edu/")) "Department of Computer Science")
                  (br)
                  (span ((class "italic")) amp) " "
                  (a ((href "http://www.umiacs.umd.edu/")) "UMIACS")
                  (br)
                  (a ((href "http://www.umd.edu/")) "University of Maryland")))
          (div ((class "large-3 columns"))
               (img ((src "img/seal.png")
                     (style "align: right; padding-top: 1em; padding-bottom: 1em;")))
               #;
               (ul ((class "inline-list right subheader italic"))
                  (li "Research")
                  (li "Papers")
                  (li "Books")
                  (li "Teaching")
                  (li "Contact"))))
     
    
     (div ((class "row"))
          (div ((class "large-5 columns"))
               (p ((class "subheader")) (span ((class "italic")) "Structures don" rsquo "t march in the streets.")))
     
          (div ((class "large-7 columns"))
               (ul ((class "inline-list right subheader italic category"))
                  (li (a ((href "index.html") (class "category")) "Home"))
                  (li (a ((href "research.html") (class "category")) "Research"))
                  #;(li (a ((href "teaching.html") (class "category")) "Teaching"))
                  #;(li (a ((href "service.html") (class "category")) "Service"))
                  #;(li (a ((href "about.html") (class "category")) "About")))))
              
          
     
     
     ,col
     ,footer)))


(define footer
  `(footer ((class "row"))
           (div ((class "large-12 columns"))
                (hr)
                (div ((class "row"))
                     (div ((class "large-6 columns"))
                          (p (small copy nbsp "2013 " (a ((href "http://www.cs.umd.edu/~dvanhorn/")) "David Van Horn"))))
                     (div ((class "large-6 columns"))
                          (small
                           (ul ((class "inline-list right"))
                              (li (a ((href "#")) "Valid HTML"))
                              (li "+")
                              (li (a ((href "#")) "CSS")))))))))

(define index.xexpr
  (make-page 
   "Home"
   `(div ((class "row"))
         (div ((class "large-3 columns right")
               (role "content"))
              (div #;((id "scroller")) 
		   (hr)
		   (a ((href "http://www.cs.umd.edu/projects/PL/"))
		      (img ((src "http://www.cs.umd.edu/projects/PL/images/PLUM.svg")
			    (alt "Programming Languages at University of Maryland")
			    (type "image/svg+xml")
					;(height "100")
			    (width "150")
			    (border "0"))))
		   (hr)
		   (a ((href "http://nostarch.com/realmofracket.htm"))
		      (img ((src "img/racket_cover_web.png")
			    (alt "Realm of Racket"))))
                   (hr)
                   ;(h4 ((class "bold-sc")) (a ((href "#")) "quick jumps"))
                   ;(hr)
                   (ul ((class "inline-list subheader italic category"))
                       
                       (li (a ((href "http://twitter.com/lambda_calculus")) 
                              (i ((class "foundicon-twitter")))))
                       (li (a ((href "https://plus.google.com/104289846854054723827/posts"))
                              (i ((class "foundicon-google-plus")))))
                       (li (a ((href "https://github.com/dvanhorn/"))
                              (i ((class "foundicon-github")))))
                       
                       (li (a ((href "cv.pdf")) "CV"))
                       (li (a ((href "research.html#papers")) "Papers"))
                       (li (a ((href "http://www.ccs.neu.edu/course/cs2500f13/")) "CS 2500"))
                       ;(li (a ((href "#books")) "Realm of Racket"))
                       (li (a ((href "http://arxiv.org/a/vanhorn_d_1")) "arXiv"))
                       (li (a ((href "https://zimbra.ccs.neu.edu/home/dvanhorn@zimbra.ccs.neu.edu/Calendar.html")) "Calendar"))                       
                       #;(li (a ((href "#talks") (class "category")) "Talks")))
		   (hr)))
         
         (div ((class "large-9 columns")
               (role "content"))
              ;(hr)
              (hr ((class "phat")))
              (img ((class "left") (src "img/dvanhorn.jpg") (style "margin-right: 1em; margin-bottom: 1em;")))              
              (p "I work toward making the construction of reusable, trusted software "
                 "components possible and effective. "
                 "My research has spanned program analysis; semantics; "
                 "verification and model-checking; security; logic; "
                 "complexity; and algorithms.")
              (p "I" rsquo "m a member of the labratory for " 
                 (a ((href "http://www.cs.umd.edu/projects/PL/")) 
                    "Programming Languages at the University of Maryland (" 
                    #;(abbr ((title "Programming Languages at University of Maryland")) "plum") 
                    "PLUM"
                    ")") ". "
		 "Previously, I" rsquo "ve worked with the "
                 (a ((href "http://www.ccs.neu.edu/research/prl/")) "Programming Research Labratory (" 
                    #;(abbr ((title "Northeastern University Programming Research Labratory")) "prl")
                    "PRL"
                    ")") " "
                 "at Northeastern University.")
		    
              (p "I currently serve as the workshop chair for " 
                 (a ((href "http://popl.mpi-sws.org/2014/")) 
                    #;(abbr ((title "ACM SIGPLAN-SIGACT Symposium on Principles of Programming Languages")) "popl")
                    "POPL") 
                  " and the publicity chair for " (a ((href "http://icfpconference.org/")) "ICFP") ", "
                 "and on the program committees of " (a ((href "http://flint.cs.yale.edu/esop2014/")) "ESOP") ", "
		 (a ((href "http://www.ist.unomaha.edu/padl2014/")) "PADL") ", and "
                 (a ((href "http://www.cs.uu.nl/wiki/bin/view/TFP2014/WebHome")) "TFP") ". "
                 "I" rsquo "m the co-chair of " (a ((href "http://hopa.cs.rhul.ac.uk/")) "HOPA") " 2014, together with "
                 (a ((href "http://www.cs.ox.ac.uk/people/luke.ong/personal/")) "Luke Ong") ".")
              (p "I co-authored the book " (span ((class "italic")) "Realm of Racket") " with " 
                  (a ((href "http://www.ccs.neu.edu/home/matthias/")) "Matthias Felleisen") " and undergraduates "
                 "from Northeastern University, which introduces programming interactive video games.")
              ))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require "projects.rkt")

(define (projects-section ps)
  `[(hr ((id "projects") (class "phat")))
    (h4 "Projects")
    ,@(apply append (add-between (map project-section ps) '((hr))))])

(define (project-section p)
  (match p
    [(project name role desc collab)
     `[(p (span ((class "bold-sc")) ,name) " (" ,role ") " ,@desc)
       (p ,@collab)]]))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require "talks.rkt")

(define (talks-section ts)
  `[(hr ((id "talks") (class "phat midphat")))
    (h4 "Talks")
    ,@(apply append (map talk-section ts))])

(define (talk-section t)
  (match t
    [(talk #f title short-venue month year venue location abstract)
     `[(dl (dt ,title)
           (dd (span ((class "italic")) ,venue)
               ", "  ,location ", " ,month " " ,year))]]
    [(talk tag title short-venue month year venue location abstract)
     `[(dl (dt (a ((href ,(string-append "talks/" tag ".pdf")))
                  ,title))
           (dd (span ((class "italic")) ,venue)
               ", "  ,location ", " ,month " " ,year))]]))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define research.xexpr
  (make-page 
    "Research"
    `(div ((class "row"))
          (div ((class "large-3 columns right")
                (role "content"))
               
               (div ((id "scroller")) 
                    (hr)
                    (h4 ((class "bold-sc")) (a ((href "#")) "research"))
                    (hr)
                    (ul ((class "inline-list subheader italic category"))
                        (li (a ((href "#projects") (class "category")) "Projects"))
                        (li (a ((href "#students") (class "category")) "Students"))
                        #;(li (a ((href "#collaborators") (class "category")) "Collaborators"))
                        (li (a ((href "#papers") (class "category")) "Papers"))
                        (li (a ((href "#talks") (class "category")) "Talks")))
                    (hr)))
          (div ((class "large-9 columns")
                (role "content"))           
               
               ,@(projects-section projects)
                  
               (hr ((id "students") (class "phat midphat")))                   
               (h4  "Students")
               (ul (li "Phuc C. Nguyen, "
                       "Ph.D. candidate at UMD")
                   (li (a ((href "http://www.ccs.neu.edu/home/ianj/")) "J. Ian Johnson") ", "
                       "Ph.D. candidate at NEU")
                   (li (a ((href "http://www.ccs.neu.edu/home/stchang/")) "Stephen Chang") ", "
                       "Ph.D. candidate at NEU (Committee member)")
                   (li (a ((href "http://www.ccs.neu.edu/home/stamourv/")) "Vincent St-Amour") ", "
                       "Ph.D. candidate at NEU (Committee member)")
                   (li (a ((href "http://www.cs.utah.edu/~liangsy/")) "Shuying Liang") ", "
                       "Ph.D. candidate at University of Utah (Committee member)"))
               
               (hr ((id "collaborators") (class "phat midphat")))
               (h4 "Collaborators")
               
               (hr ((id "papers") (class "phat midphat")))
               (h4 "Papers")
               ,@papers-list
#|
               (h5 "Journal articles")
	       ,@jours
               (h5 "Conference articles")
               ,@confs
               (h5 "Workshop & other articles")
               ,@workshop&others
|#
               ,@(talks-section talks)))))


(write-page index.xexpr "index.html")
(write-page research.xexpr "research.html")

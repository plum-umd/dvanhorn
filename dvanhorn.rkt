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
     
     (style "#scroller { position: relative; background-color: white; z-index: 2; }")
     
     (style ".phat { color: black; background-color: black; height: 2em; }")
     (style ".midphat { margin-top: 7em; }")
     
     
     (script ((src "javascripts/vendor/custom.modernizr.js"))))
    (body
     ,(make-cdata #f #f 
                  "<script>document.write('<script src=javascripts/vendor/'
    + ('__proto__' in {} ? 'zepto' : 'jquery')
    + '.js><\\/script>');</script>")
     (script ((src "javascripts/showhide.js")))
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
                     (alt "UMD")
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
                  (li (a ((href "teaching.html") (class "category")) "Teaching"))
                  (li (a ((href "service.html") (class "category")) "Service"))
                  (li (a ((href "contact.html") (class "category")) "Contact"))
                  #;(li (a ((href "about.html") (class "category")) "About")))))
              
          
     
     
     ,col
     ,footer)))


(define footer
  `(footer ((class "row"))
           (div ((class "large-12 columns"))
                (hr)
                (div ((class "row"))
                     (div ((class "large-6 columns"))
                          (p (small copy nbsp "2016 " (a ((href "http://www.cs.umd.edu/~dvanhorn/")) "David Van Horn"))))
                     (div ((class "large-6 columns"))
                          (ul ((class "inline-list right"))
                              (li (a ((href "http://validator.w3.org/check?uri=http%3A%2F%2Fwww.cs.umd.edu%2F~dvanhorn%2F")) (small "Valid HTML")))
			      (li (a ((href "https://github.com/plum-umd/dvanhorn")) (small "github")))
                              #;(li (a ((name "and")) (small amp)))
                              #;(li (a ((href "#")) (small "CSS")))))))))

(define index.xexpr
  (make-page 
   "Home"
   `(div ((class "row"))
         (div ((class "large-3 columns right")
               #;(role "content"))
              (div #;((id "scroller")) 
                   (hr)
                   (a ((href "http://www.cs.umd.edu/projects/PL/"))
                      (img ((src "img/PLUM.png")
                            (alt "PLUM")
                            (height "100")
                            (width "150")
                            #;(style "0"))))
                   (hr)
                   (a ((href "http://nostarch.com/realmofracket.htm"))
                      (img ((src "img/racket_cover_web.png")   
                            (alt "Realm of Racket"))))
                   ;; "ACM Computing Reviews \"2013 Notable Book in Computing\""
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
                       (li (a ((href "http://www.cs.umd.edu/class/fall2018/cmsc131A/")) "CMSC 131"))
                       ;(li (a ((href "#books")) "Realm of Racket"))
                       (li (a ((href "http://arxiv.org/a/vanhorn_d_1")) "arXiv"))
                       (li (a ((href "https://www.google.com/calendar/embed?src=david.a.vanhorn%40gmail.com&ctz=America/New_York")) "Calendar"))                       
                       (li (a ((href "dvanhorn.asc")) "PGP"))
                       #;(li (a ((href "#talks") (class "category")) "Talks")))
                   (hr)))
         
         (div ((class "large-9 columns")
               #;(role "content"))
              ;(hr)
              (hr ((class "phat")))
              (img ((class "left") (alt "dvanhorn") (src "img/dvanhorn.jpg") (style "margin-right: 1em; margin-bottom: 1em;")))              
              (p "I " (a ((href "statement.pdf")) "work toward") " making the construction of reusable, trusted software "
                 "components possible and effective. "
                 "My research has spanned program analysis; semantics; "
                 "verification and model-checking; security; logic; "
                 "complexity; and algorithms.")
              (p "Together with " (a ((href "http://www.cs.umd.edu/~mwh/")) "Mike Hicks") ", "
                 "I direct the laboratory for " 
                 (a ((href "http://www.cs.umd.edu/projects/PL/")) 
                    "Programming Languages at the University of Maryland (" 
                    #;(abbr ((title "Programming Languages at University of Maryland")) "plum") 
                    "PLUM"
                    ")") ". "
                 "Previously, I" rsquo "ve worked with the "
                 (a ((href "http://www.ccs.neu.edu/research/prl/")) "Programming Research Laboratory (" 
                    #;(abbr ((title "Northeastern University Programming Research Laboratory")) "prl")
                    "PRL"
                    ")") " "
                 "at Northeastern University.")                   

              (p "I co-authored the book " (a ((href "http://nostarch.com/realmofracket.htm")) (span ((class "italic")) "Realm of Racket")) " with " 
                  (a ((href "http://www.ccs.neu.edu/home/matthias/")) "Matthias Felleisen") " and undergraduates "
                 "from Northeastern University, which introduces programming interactive video games.")
              
	      (h4 "News")
	      (ul
               (li "New draft: " (em (a ((href "https://arxiv.org/abs/1808.02101")) "Size-Change Termination as a Contract")) ".")
               (li "New draft: " (em "Type-Level Computations for Ruby Libraries") ".")
               (li (em (a ((href "https://arxiv.org/abs/1807.02132")) "Gradual Liquid Type Inference")) " won a " (b "Distinguished Paper") " award at OOPSLA 2018!")
               (li "I'm serving on the OOPSLA 2019 Review Committee.")
               (li "New paper: " (em (a ((href "https://arxiv.org/abs/1807.02132")) "Gradual Liquid Type Inference")) " to appear at OOPSLA'18 in Boston.")
               (li "New paper: " (em (a ((href "https://arxiv.org/abs/1806.03541")) "Theorem Proving for All")) " to appear at Haskell 2018 in St. Louis, MO.")
               (li "I served on the thesis committee Quentin Stiévenart's dissertation, " (em (a ((href "stievenart2018phd.pdf")) "Scalable Designs for "
                   "Abstract Interpretation of Concurrent Programs: Application to Actors and Shared-Memory Multi-Threading")) ".")
	       (li "I'm co-organizing " (a ((href "https://icfp18.sigplan.org/track/PLMW-ICFP-2018")) "PLMW @ ICFP") ", the Programming Languages Mentoring Workshop, co-located "
                   "with " (a ((href "https://icfp18.sigplan.org/")) "ICFP 2018") " in St. Louis, MO.")
               (li "I'm serving on the Selection Committee for the Student Research Competition at both "
                   (a ((href "https://pldi18.sigplan.org/track/pldi-2018-src")) "PLDI") " and " (a ((href "https://icfp18.sigplan.org/track/icfp-2018-Student-Research-Competition")) "ICFP") " 2018.")
               (li "My post-doc, " (a ((href "https://thomas.gilray.org/")) "Thomas Gilray") ", will be joining the faculty of the "
                   (a ((href "https://www.uab.edu/cas/computerscience/")) "Computer Science department") " at the "
                   (a ((href "https://www.uab.edu/home/")) "University of Alabama at Birmingham") ".")
	       (li "New paper: " (em (a ((href "https://arxiv.org/abs/1711.03620")) "Soft Contract Verification for Higher-order Stateful Programs"))
	           " published at POPL'18 in Los Angeles, USA.")
	       (li "New paper: " (em (a ((href "https://arxiv.org/abs/1707.04755")) "Abstracting Definitional Interpreters")) " published at ICFP'17 in Oxford, UK.")
	       (li "My PhD student, " (a ((href "http://david.darais.com/")) "David Darais") ", will be joining the faculty "
	           "of the " (a ((href "https://www.uvm.edu/cems/cs")) "Computer Science department") " at the " (a ((href "http://www.uvm.edu/")) "University of Vermont") " in January 2018!")
	       (li "I'll be lecturing at the " (a ((href "https://www.cs.uoregon.edu/research/summerschool/")) "Oregon Programming Languages Summer School") " at the University of Oregon in late June, early July, 2017.")
	       
	       (li (a ((href "http://goto.ucsd.edu/~nvazou/")) "Niki Vazou") " and " (a ((href "http://thomas.gilray.org/")) "Thomas Gilray") " have joined the PLUM lab as the inaugural " (a ((href "https://www.cs.umd.edu/article/2016/07/new-basili-fellows-named")) "Basili Post-doctoral Fellows") ".")
	       (li "New paper: "
		   (em (a ((href "http://arxiv.org/abs/1507.04817")) "Higher-order symbolic execution for contract verification and refutation"))
		   " published in JFP in January.")
	       (li "New paper: "
	       (em (a ((href "https://arxiv.org/abs/1608.06012")) "A Vision for Online Verification-Validation")) " published at GPCE'16 in November.")
       	       (li "New paper: "
		   (em (a ((href "http://arxiv.org/abs/1511.06965")) "Constructive Galois Connections")) " published at ICFP'16 in September.")
	       (li "New grant: " (a ((href "http://www.nsf.gov/awardsearch/showAward?AWD_ID=1618756")) (em "Online Verification-Validation"))
	       ", funded by the National Science Foundation, Software and Hardware Foundations program.  This collaborative project is with Matthew Hammer and Bor-Yuh (Evan) Chang at the University of Colorado at Boulder.")

	       (li (a ((href "http://tfp2016.org/")) "Trends in Functional Programming") " will be hosted at the University of Maryland, June 2016." )
#;	       (li "I'm attending the " (a ((href "http://www.dagstuhl.de/16402/")) "Dagstuhl Seminar on Programming Language Techniques for Incremental and Reactive Computing") " in October 2016.")
	       (li "I'm attending the " (a ((href "http://shonan.nii.ac.jp/shonan/blog/2015/04/05/higher-order-model-checking/")) "NII Shonan Village Seminar on Higher-Order Model Checking") " and the "
		      (a ((href "http://www.dagstuhl.de/en/program/calendar/semhp/?semnr=16131")) "Dagstuhl Seminar on Language Based Verification Tools for Functional Programs") ", both in March.")
	          (li "New paper: " 
		      (a ((href "http://arxiv.org/abs/1507.03137")) 
			 (em "Pushdown Control-Flow Analysis for Free"))
		      " published at POPL'16 in January.")
		  (li "New tutorial: " 
		      (a ((href "https://dvanhorn.github.io/redex-aam-tutorial/")) 
			 (em "An Introduction to Redex with Abstracting Abstract Machines"))
		      " presented at POPL'16 in January.")
#;		  (li "New paper: " 
		      (a ((href "http://arxiv.org/abs/1503.07792"))
			 (em "Incremental Computation with Names"))
		      " published at OOPSLA'15 in October.")
#;		  (li "New paper: " 
		      (a ((href "http://arxiv.org/abs/1411.3962")) 
			 (em "Galois Transformers and Modular Abstract Interpreters"))
		      " published at OOPSLA'15 in October."))))))
		  
		   


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require "projects.rkt")

(define (projects-section ps)
  `[(hr ((id "projects") (class "phat")))
    (h4 "Projects")
    ,@(apply append (map project-section ps))])

(define (project-section p)
  (match p
    [(project name role desc collab)
     (define id (symbol->string (gensym)))
     `[(p (a ((href "#")) (span ((onclick ,(format "showHide('~a'); return false;" id))) (span ((class "paper-title")) ,name) " (" ,role ") "))
	  (div ((id ,id) (style "display: none;")) 
	     (p ,@desc)
	     (p ,@collab)
	     (hr)))]]))


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
     `[(dl (dt ;(a ((href ,(string-append "talks/" tag ".pdf")))
                  ,title);)
           (dd (span ((class "italic")) ,venue)
               ", "  ,location ", " ,month " " ,year))]]))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define teaching.xexpr
  (make-page 
    "Teaching"
    `(div ((class "row"))    
          (div ((class "large-3 columns right")
                #;(role "content"))
               
               (div ((id "scroller")) 
                    (hr)
                    (h4 ((class "bold-sc")) (a ((href "#")) "teaching"))
                    (hr)))
          (div ((class "large-9 columns")
                #;(role "content"))           
               (hr ((id "contact") (class "phat")))

	       (p (a ((href "http://www.cs.umd.edu/class/fall2018/cmsc131A/")) "Fall 2018: CMSC 131A, Systematic Program Design I"))
	       (p (a ((href "http://www.cs.umd.edu/class/spring2018/cmsc132A/")) "Spring 2018: CMSC 132A, Systematic Program Design II"))
	       (p (a ((href "http://www.cs.umd.edu/class/fall2017/cmsc131A/")) "Fall 2017: CMSC 131A, Systematic Program Design I"))
               (p (a ((href "http://www.cs.umd.edu/class/spring2017/cmsc430/")) "Spring 2017: CMSC 430, Introduction to Compilers"))
	       (p (a ((href "http://www.cs.umd.edu/class/spring2016/cmsc430/")) "Spring 2016: CMSC 430, Introduction to Compilers"))
               (p (a ((href "http://www.cs.umd.edu/class/fall2015/cmsc631/")) "Fall 2015: CMSC 631, Program Analysis and Understanding"))	       
               (p (a ((href "http://www.cs.umd.edu/class/spring2015/cmsc430/")) "Spring 2015: CMSC 430, Introduction to Compilers"))
               (p (a ((href "http://www.cs.umd.edu/class/fall2014/cmsc631/")) "Fall 2014: CMSC 631, Program Analysis and Understanding"))
               (p (a ((href "http://www.cs.umd.edu/class/spring2014/cmsc631/")) "Spring 2014: CMSC 631, Program Analysis and Understanding"))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define service.xexpr
  (make-page 
    "Service"
    `(div ((class "row"))    
          (div ((class "large-3 columns right")
                #;(role "content"))
               
               (div ((id "scroller")) 
                    (hr)
                    (h4 ((class "bold-sc")) (a ((href "#")) "service"))
                    (hr)
                    (ul ((class "inline-list subheader italic category"))
                        (li (a ((href "#journals") (class "category")) "Journals"))
                        (li (a ((href "#steering-committees") (class "category")) "SCs"))
                        (li (a ((href "#chair") (class "category")) "Chair"))
                        (li (a ((href "#panelist") (class "category")) "Panelist"))
                        (li (a ((href "#program-committees") (class "category")) "PCs"))
                        (li (a ((href "#external-review-committees") (class "category")) "ERCs"))
                        (li (a ((href "#reviewer") (class "category")) "Reviewer"))
                        (li (a ((href "#other") (class "category")) "Other")))))


          (div ((class "large-9 columns")
                #;(role "content"))
               (hr ((id "journals") (class "phat")))
               (h4  "Journals refereed")          
               (p (a ((href "http://csur.acm.org/")) "ACM Computing Surveys"))
               (p (a ((href "http://tocl.acm.org/")) "ACM Transactions on Computational Logic"))
               (p (a ((href "http://toplas.acm.org/")) "ACM Transactions on Programming Languages and Systems"))
               (p (a ((href "http://link.springer.com/journal/10990")) "Higher-Order and Symbolic Computation"))
               (p (a ((href "http://journals.cambridge.org/action/displayJournal?jid=JFP")) "Journal of Functional Programming"))
               (p (a ((href "http://www.journals.elsevier.com/science-of-computer-programming/")) "Science of Computer Programming"))

               (hr ((id "steering-committees") (class "phat")))
               (h4  "Steering Committees")
               (p (a ((href "http://icfpconference.org/")) "ACM SIGPLAN International Conference on Functional Programming (ICFP), 2013-2015"))
               (p (a ((href "http://hopa.cs.rhul.ac.uk/")) "Workshop on Higher-Order Program Analysis (HOPA), 2014"))

               (hr ((id "chair") (class "phat")))
               (h4  "Chair")
	       (p (a ((href "http://tfp2016.org/")) "Symposium on Trends in Functional Programming (TFP), 2016"))
               (p (a ((href "http://hopa.cs.rhul.ac.uk/")) "Workshop on Higher-Order Program Analysis (HOPA), 2014"))          
               (p (a ((href "http://www.nii.ac.jp/shonan/blog/2011/03/19/workshop-on-automated-techniques-for-higher-order-program-verification/")) "NII Workshop on Automated Techniques for Higher-Order Program Verification, 2011"))
               (p (a ((href "http://nepls.org/")) "New England Programming Languages and Systems Symposium (NEPLS), 2011"))

               (hr ((id "panelist") (class "phat")))
               (h4  "Panelist")
               (p (a ((href "https://www.nsf.gov/dir/index.jsp?org=CISE")) "NSF Directorate for Computer & Information Science & Engineering (CISE), 2011, 2010"))

               (hr ((id "program-committees") (class "phat")))
               (h4  "Program committees")
               (p "ACM SIGPLAN Conference on Object-Oriented Programming Systems, Languages, and Applications (OOPSLA), 2018")
	       (p (a ((href "http://popl18.sigplan.org/track/PADL-2018")) "International Symposium on Practical Aspects of Declarative Languages (PADL), 2018") ", "
	       (a ((href "https://www.ist.unomaha.edu/padl2014/")) "2014"))
               (p (a ((href "http://tifp.org/")) "Symposium on Trends in Functional Programming (TFP), 2017, 2014, 2012"))
	       (p (a ((href "http://staticanalysis.org/")) "Static Analysis Symposium (SAS), 2017"))	       
	       (p (a ((href "http://www.sigplan.org/Conferences/POPL/")) "ACM SIGPLAN-SIGACT Symposium on Principles of Programming Languages (POPL), 2017"))
	       (p (a ((href "http://ecoop.org/")) "European Conference on Object-Oriented Programming (ECOOP), 2016"))
               (p (a ((href "http://icfpconference.org/")) "ACM SIGPLAN International Conference on Functional Programming (ICFP), 2015, 2011"))
	       (p (a ((href "http://www.cs.rice.edu/~sc40/obt15/")) "Off the Beaten Track: New Frontiers for Programming Languages Research, 2015"))
               (p (a ((href "http://flint.cs.yale.edu/esop2014/")) "European Symposium on Programming (ESOP), 2014"))
               (p (a ((href "http://www.easychair.org/smart-program/VSL2014/LOLA-index.html")) "Workshop on Syntax and Semantics of Low-Level Languages (LOLA), 2014"))
               (p (a ((href "http://www.cs.uwyo.edu/~jlc/tfpie14/")) "International Workshop on Trends in Functional Programming in Education (TFPIE), 2014"))
               (p (a ((href "http://lampwww.epfl.ch/~hmiller/scala2013/")) "Scala Workshop, 2013"))
               (p (a ((href "http://hopa.cs.rhul.ac.uk/hopa-2013/index.html")) "Workshop on Higher-Order Program Analysis (HOPA), 2013"))
               (p (a ((href "http://schemeworkshop.org/")) "Scheme and Functional Programming Workshop, 2011, 2009, 2015"))

               (hr ((id "external-review-committees") (class "phat")))
               (h4 "External review committees")
               (p (a ((href "http://www.sigplan.org/Conferences/ICFP/")) "ACM SIGPLAN International Conference on Functional Programming (ICFP), 2018"))
               (p (a ((href "http://www.sigplan.org/Conferences/POPL/")) "ACM SIGPLAN-SIGACT Symposium on Principles of Programming Languages (POPL), 2016, 2013"))

               (hr ((id "reviewer") (class "phat")))
               (h4 "Reviewer")
               (p (a ((href "http://www.sigplan.org/Conferences/POPL/")) "ACM SIGPLAN-SIGACT Symposium on Principles of Programming Languages (POPL), 2015, 2014, 2008"))
               (p (a ((href "http://conf.researchr.org/home/VMCAI-2016"))"International Conference on Verification, Model Checking, and Abstract Interpretation (VMCAI),  2016") ", " (a ((href "http://vmcai2014.di.ens.fr/")) "2014"))
               (p (a ((href "http://icfpconference.org/")) "ACM SIGPLAN International Conference on Functional Programming (ICFP), 2014, 2010"))
               (p (a ((href "http://link.springer.com/book/10.1007/978-3-642-19718-5")) "European Symposium on Programming (ESOP), 2011"))
               (p (a ((href "http://www.sigplan.org/Conferences/DLS/")) "ACM SIGPLAN Symposium on Dynamic Languages (DLS), 2014, 2012"))
               (p (a ((href "http://www.sigplan.org/Conferences/SPLASH/")) "ACM SIGPLAN Conference on Object-Oriented Programming, Systems, Languages, and Applications (OOPSLA), 2012"))
               (p (a ((href "http://ieeexplore.ieee.org/xpl/conhome.jsp?punumber=1000420")) "IEEE Symposium on Logic in Computer Science (LICS), 2007"))
               (p (a ((href "https://www.springer.com/computer/swe/book/978-3-540-74914-1")) "EACSL Conference on Computer Science and Logic (CSL), 2007"))

               (hr ((id "reviewer") (class "phat")))
               (h4 "Other")
 	       (p (a ((href "http://conf.researchr.org/info/icfp-2016/student-research-competition")) "Student Research Competition chair, ACM SIGPLAN International Conference on Functional Programming (ICFP), 2016"))

  	       (p (a ((href "http://icfpconference.org/icfp-2015/")) "Student Research Competition committee, ACM SIGPLAN International Conference on Functional Programming (ICFP), 2015"))
               (p (a ((href "http://www.sigplan.org/Conferences/POPL/")) "Workshop Chair, ACM SIGPLAN-SIGACT Symposium on Principles of Programming Languages (POPL), 2013-2015"))
               
               ))))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define contact.xexpr
  (make-page 
    "Contact"
    `(div ((class "row"))    
          (div ((class "large-3 columns right")
                #;(role "content"))
               
               (div ((id "scroller")) 
                    (hr)
                    (h4 ((class "bold-sc")) (a ((href "#")) "contact"))
                    (hr)))
          (div ((class "large-9 columns")
                #;(role "content"))           
               (hr ((id "contact") (class "phat")))
               
               
               (p "David Van Horn" (br)
                  "3439 A.V. Williams Building" (br)
                  "University of Maryland" (br)
		  "8223 Paint Branch Drive" (br)
                  "College Park, MD 20742" (br)
                  (br)
                  "Email: (@ dvanhorn (dot cs umd edu))" )
                  
               ))))
    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define research.xexpr
  (make-page 
    "Research"
    `(div ((class "row"))
          (div ((class "large-3 columns right")
                #;(role "content"))
               
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
                #;(role "content"))           
               
               ,@(projects-section projects)
                  
               (hr ((id "students") (class "phat midphat")))                   
               (h4  "Students")
	       (h5 "Current")
               (ul (li (a ((href "https://www.cs.umd.edu/~labichn/")) "Nicholas Labich") ", "
                       "Ph.D. student at UMD")
                   (li (a ((href "https://www.cs.umd.edu/~pcn/")) "Phúc C. Nguyễn") ", "
                       "Ph.D. student at UMD")
		   (li (a ((href "http://thomas.gilray.org/")) "Thomas Gilray") ", "
		       "Post-doc at UMD")
		   (li (a ((href "https://nikivazou.github.io/")) "Niki Vazou") ", "
		       "Post-doc at UMD"))
                   
	       (h5 "Past")
	       (ul (li (a ((href "http://david.darais.com/")) "David Darais") ", "
                       (em (a ((href "https://drum.lib.umd.edu/handle/1903/19989")) "Mechanizing Abstract Interpretation"))
		       ", Ph.D., UMD, 2017; now an asst. prof. at University of Vermont")
                   (li (a ((href "http://kmicinski.com/")) "Kristopher Micinski") ", "
                       (em (a ((href "https://drum.lib.umd.edu/handle/1903/16470")) "Interaction-based Security for Mobile Apps"))
                       ", Ph.D., UMD, 2018 (Committee member); now a visiting asst. prof. at Haverford College")
                   (li (a ((href "http://www.cs.umd.edu/~ntoronto/")) "Neil Toronto") ", "
		       "post-doc at UMD; now at MSR, Cambridge")
		   (li (a ((href "https://deeglaze.github.io/")) "Dionna Amalie Glaze") ", "
		       (a ((href "http://arxiv.org/abs/1504.08033")) (em "Automating Abstract Interpretation of Abstract Machines"))
		       ", Ph.D., Northeastern University, 2015; now at Google")
                   (li (a ((href "http://www.ccs.neu.edu/home/stamourv/")) "Vincent St-Amour") ", "
		       (a ((href "http://www.ccs.neu.edu/home/stamourv/papers/dissertation.pdf")) 
			  (em "How to Generate Actionable Advice about Performance Problems"))
		       ", "
                       "Ph.D., Northeastern University, 2015 (Committee member)")
		   (li (a ((href "http://www.cs.umd.edu/~piotrm/")) "Piotr Mardziel") ", "
		       (em (a ((href "https://drum.lib.umd.edu/handle/1903/16470")) "Modeling, Measuring, and Limiting Adversary Knowledge"))
		       ", Ph.D., University of Maryland, 2015 (Committee member)")
                   (li (a ((href "http://www.ccs.neu.edu/home/stchang/")) "Stephen Chang") ", "
                       (em "On the Relation Between Laziness and Strictness")
                       ", Ph.D., Northeastern University, 2014 (Committee member)")
                   (li (a ((href "http://shuying.me/academic.html")) "Shuying Liang") ", "
                       (em "Static Analysis of Android Applications")
                       ", Ph.D., University of Utah, 2014"
                       " (Committee member)"))
               
               #;(hr ((id "collaborators") (class "phat midphat")))
               #;(h4 "Collaborators")
               
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
(write-page contact.xexpr "contact.html")
(write-page teaching.xexpr "teaching.html")
(write-page service.xexpr "service.html")



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
                              (li (a ((href "https://www.cs.umd.edu/class/fall2025/cmsc430/")) "CMSC 430"))
                              (li (a ((href "https://www.cs.umd.edu/class/spring2026/cmsc838E/")) "CMSC 838E")))))
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
                   (h4 "Research opportunities for undergraduates")
                   (p "I am looking for current UMD undergraduates interested in Fall 2026 CMSC499As. These projects are available through "
                      (a ((href "https://undergrad.cs.umd.edu/research-professorial-faculty-cmsc499a")) "CMSC499A: Research with Professorial Faculty")
                      ".")
                   (ul
                (li (a ((href "cmsc499a-fall2026-os.html")) "Operating Systems as Abstract Machines"))
                (li (a ((href "cmsc499a-fall2026-compiler.html")) "Compiling Concurrent Functional Programs to an Abstract Process Machine")))
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

(define cmsc499a.xexpr
  (make-page
   "CMSC 499A: Operating Systems as Abstract Machines"
   `(div ((class "page-shell row"))
         (div ((class "page-content")
               #;(role "content"))
              (hr ((class "phat")))
              (h2 "CMSC 499A: Operating Systems as Abstract Machines")
              (p (strong "Fall 2026.") " Current UMD undergraduates may participate through "
                 (a ((href "https://undergrad.cs.umd.edu/research-professorial-faculty-cmsc499a")) "CMSC499A: Research with Professorial Faculty")
                 ". Interested students should email dvanhorn@cs.umd.edu before the start of the semester.")
              (p "This research project will explore a new approach to teaching and building operating systems using the Lean programming language and theorem prover. Rather than beginning from low-level hardware mechanisms alone, we will investigate operating systems as implementations of higher-level abstract machines that provide programmers with processes, virtual memory, files, communication channels, and other protected abstractions.")
              (p "The project will focus on designing and implementing a small executable operating-system model in Lean. We will begin by defining the semantics of an abstract " (q "user machine") " that exposes programmer-visible concepts such as processes, message passing, scheduling, and shell interaction. We will then explore how these abstractions can be realized atop progressively lower-level machine models involving memory, privilege modes, traps, and virtual memory.")
              (p "The emphasis of the study will be on:")
              (ul
               (li "executable semantic models,")
               (li "systems programming in Lean,")
               (li "abstract machines and interpreters,")
               (li "operating-system structure and invariants,")
               (li "lightweight mechanized reasoning,")
               (li "and the relationship between high-level system abstractions and low-level implementations."))
              (p "Students participating in the study may help design:")
              (ul
               (li "the abstract process machine,")
               (li "a small process programming language,")
               (li "schedulers and memory managers,")
               (li "IPC and filesystem abstractions,")
               (li "a toy shell and runtime environment,")
               (li "and supporting infrastructure for a future course based on these ideas."))
              (p "The project is intended to be highly exploratory and implementation-oriented. While Lean will be used throughout, the focus is not on large-scale formal proof engineering. Instead, we will emphasize executable models, semantic clarity, testing, and lightweight reasoning about system invariants.")
              (p "Students with interests in programming languages, operating systems, formal methods, compilers, runtime systems, or semantics are especially encouraged to participate.")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define cmsc499a-compiler.xexpr
  (make-page
   "CMSC 499A: Compiling Concurrent Functional Programs to an Abstract Process Machine"
   `(div ((class "page-shell row"))
         (div ((class "page-content")
               #;(role "content"))
              (hr ((class "phat")))
              (h2 "CMSC 499A: Compiling Concurrent Functional Programs to an Abstract Process Machine")
              (p (strong "Fall 2026.") " Current UMD undergraduates may participate through "
                 (a ((href "https://undergrad.cs.umd.edu/research-professorial-faculty-cmsc499a")) "CMSC499A: Research with Professorial Faculty")
                 ". Interested students should email dvanhorn@cs.umd.edu before the start of the semester.")
              (p "This research project will explore the design and implementation of a compiler for a small concurrent functional programming language inspired by Concurrent ML. The project will investigate how high-level language features such as functions, lexical scope, process spawning, synchronous communication, events, and message passing can be compiled to a lower-level abstract process machine.")
              (p "The central idea is to treat the operating-system/runtime interface as a semantic target for compilation. Rather than compiling directly to conventional hardware, we will compile programs to an executable process-machine language that provides abstractions such as processes, channels, scheduling, blocking communication, and resource handles. This target machine may also connect to a "
                 (a ((href "cmsc499a-fall2026-os.html")) "separate project")
                 " on modeling operating systems as implementations of abstract machines.")
              (p "The study will focus on:")
              (ul
               (li "designing a small ML-like source language,")
               (li "defining its operational semantics,")
               (li "implementing a parser, interpreter, and compiler,")
               (li "designing a process-machine target language,")
               (li "compiling functional abstractions such as closures and environments,")
               (li "compiling concurrency constructs such as spawn, send, recv, and possibly CML-style events,")
               (li "testing compiler correctness using executable semantics,")
               (li "and stating key semantic correctness properties."))
              (p "Possible project components include:")
              (ul
               (li "a small type checker or type inference engine,")
               (li "a bytecode or abstract-machine backend,")
               (li "a runtime representation for closures and channels,")
               (li "examples such as echo servers, pipelines, client/server programs, and interactive shells,")
               (li "lightweight correctness proofs or refinement arguments in Lean,")
               (li "and integration with an executable abstract OS/process-machine model."))
              (p "The project is exploratory and implementation-oriented. Students do not need prior experience with formal verification, but should be interested in programming languages, compilers, functional programming, concurrency, or operating systems. The goal is to develop working infrastructure and examples that could form the basis for a future course on compiling concurrent functional languages and their runtime systems.")))))

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
(write-page cmsc499a.xexpr "cmsc499a-fall2026-os.html")
(write-page cmsc499a-compiler.xexpr "cmsc499a-fall2026-compiler.html")
(write-page papers.xexpr "papers.html")
(write-page contact.xexpr "contact.html")

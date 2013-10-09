#lang typed/racket

(define-type Paper (U Conf Jour))
(define-type Jour jour-paper)
(define-type Conf conf-paper)
(define-type Auth auth)

(define-type Xexpr
  (Rec x
       (U String
          Symbol
          (List* Symbol (Listof (List Symbol String)) (Listof x))
          (List* Symbol (Listof x)))))
  
(struct: conf-paper 
  ([title : String] 
   [coauthors : [Listof Auth]] 
   [conf : Xexpr]
   [location : String]
   [date : String]
   [links : [Listof [List Symbol String]]]))

(struct: jour-paper 
  ([title : String]
   [coauthors : [Listof Auth]]
   [journal : Xexpr]
   [vol : String]
   [number : String]
   [date : String]
   [links : [Listof [List Symbol String]]]))

(struct: auth ([name : String]
               [url : (U String #f)]))

(struct: venue ([name : String]
                [url : String]))

(define ianj 
  (auth "J. Ian Johnson" 
        "http://www.ccs.neu.edu/home/ianj/"))

(define might
  (auth "Matthew Might" 
        "http://matt.might.net/"))

(define labichn
  (auth "Nicholas Labich"
        "http://www.ccs.neu.edu/home/labichn/"))

(define shuying
  (auth "Shuying Liang"
        "http://www.cs.utah.edu/~liangsy/"))

(define samth 
  (auth "Sam Tobin-Hochstadt"
        "http://samth.github.io/"))

(define earl
  (auth "Christopher Earl" #f))
  
(define sergey
  (auth "Ilya Sergey"
        "http://ilyasergey.net/"))

(: format-paper : Paper -> Xexpr)
(define (format-paper p)
  (match p
    [(conf-paper title coauthors conf location date links)
     conf]
    [(jour-paper title coauthors journal vol number date links)
     `(span ((class "italic")) ,journal)]))
      
(define papers
  (list
   (conf-paper "Optimizing Abstract Abstract Machines"
               (list ianj labichn might)
               (venue "The ACM SIGPLAN International Conference on Functional Programming"
                      "http://icfpconference.org/icfp2013/")               
               "Boston, Massachusetts"
               "September 2013"
               '((arXiv "http://arxiv.org/abs/1211.3722")))
   
   (conf-paper "AnaDroid: Malware Analysis of Android with User-supplied Predicates"
               (list shuying might)
               (venue "Workshop on Tools for Automatic Program Analysis"
                      "http://pl.cs.colorado.edu/tapas2013/")
               "Seattle, Washington"
               "June 2013"
               '((FIXME "http://www.ccs.neu.edu/home/dvanhorn/pubs/tapas-preprint-2013.pdf")))
   
   (conf-paper "Concrete Semantics for Pushdown Analysis: The Essence of Summarization"
               (list ianj)
               (venue "Workshop on Higher-Order Program Analysis"
                      "http://hopa.cs.rhul.ac.uk/")
               "New Orleans, Louisiana"
               "June 2013"
               '((arXiv "http://arxiv.org/abs/1305.3163")))
   
   (conf-paper "From Principles to Practice with Class in the First Year"
               (list samth)
               (venue "International Workshop on Trends in Functional Programming in Education"
                      "http://wwwhome.ewi.utwente.nl/~holzenspiespkf/TFPIE2013.html")
               "Provo, Utah"
               "May 2013"
               '((arXiv "http://arxiv.org/abs/1306.4713")))
   
   (conf-paper "Higher-Order Symbolic Execution via Contracts"
               (list samth)
               (venue "The ACM SIGPLAN Conference on Object-Oriented Programming, Systems, Languages, and Applications (OOPSLA'12)"
                      "http://splashcon.org/2012/cfp/378")
               "Tuscon, Arizona"
               "October 2012"
               '((ACM "http://dl.acm.org/citation.cfm?id=2384655")
                 (arXiv "http://arxiv.org/abs/1103.1362")))
   
   (conf-paper "Introspective Pushdown Analysis of Higher-Order Programs"
               (list earl sergey might)
               (venue "The 17th ACM SIGPLAN International Conference on Functional Programming (ICFP'12)"
                      "http://icfpconference.org/icfp2012/")
               "Copenhagen, Denmark"
               "September 2012"
               '((ACM "http://dl.acm.org/citation.cfm?id=2364576")
                 (arXiv "http://arxiv.org/abs/1207.1813")))
   
   ;; Best of ICFP 2010. 
   ;; http://journals.cambridge.org/action/displayFulltext?type=1&pdftype=1&fid=8669091&jid=JFP&volumeId=22&issueId=4-5&aid=8669090
   (jour-paper "Systematic Abstraction of Abstract Machines"
               (list might)
               (venue "Journal of Functional Programming"
                      "http://journals.cambridge.org/action/displayJournal?jid=JFP")
               "22"
               "4--5"
               "September 2012"
               '((CUP "http://journals.cambridge.org/action/displayAbstract?fromPage=online&aid=8669075")
                 (arXiv "http://arxiv.org/abs/1107.3539")))
   
   (jour-paper "Abstracting Abstract Machines"
               (list might)
               (venue "Communications of the ACM, Research Highlights"
                      "http://cacm.acm.org/")
               "54"
               "9"
               "September 2011"
               '((ACM "http://doi.acm.org/10.1145/1995376.1995400")
                 (arXiv "http://arxiv.org/abs/1105.1743")))
   
   (conf-paper "A Family of Abstract Interpretations for Static Analysis of Concurrent Higher-Order Programs"
               (list might)
               `(a ((href "http://sas2011.cs.technion.ac.il/"))
                   "The 18th International Static Analysis Symposium (SAS 2011)")
               "Venice, Italy"
               "September 2011"
               '((Springer "http://www.springerlink.com/content/j272827h5r088h78/")
                 (arXiv "http://arxiv.org/abs/1103.5167")))
   
   (conf-paper "Semantic Solutions to Program Analysis Problems"
               (list samth)
               '(span "FIT Session, " ;; FIXME
                      `(a ((href "http://pldi11.cs.utah.edu/"))
                          "The ACM SIGPLAN 2011 Conference on Programming Language Design and Implementation (PLDI'11)"))
               
               "San Jose, California"
               "June 2011"
               '((arXiv "http://arxiv.org/abs/1105.0106")))
   
   (conf-paper "Abstracting Abstract Machines"
               (list might)
               '(a ((href ""))
                   "The 15th ACM SIGPLAN International Conference on Functional Programming (ICFP'10)")
               "Baltimore, Maryland"
               "September 2010"
               '((ACM "http://doi.acm.org/10.1145/1863543.1863553")
                 (arXiv "http://arxiv.org/abs/1007.4446")))
               
   (conf-paper "Pushdown Control-Flow Analysis of Higher-Order Programs"
               (list earl might)
               '(a ((href "http://www.iro.umontreal.ca/~sfp2010/"))
                   "The 2010 Workshop on Scheme and Functional Programming (SFP'10)")               
               "Montréal, Québec"
               "August 2010"
               '((arXiv "http://arxiv.org/abs/1007.4268")))
   
               
               
   ))
                      
   
  
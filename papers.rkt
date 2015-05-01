#lang typed/racket
(provide confs jours workshop&others papers-list)

(require/typed "help.rkt"
  [oxford ([Listof Xexpr] -> [Listof Xexpr])]
  [delimit ((Listof Xexpr) (Listof Xexpr) (Listof Xexpr) (Listof Xexpr) -> (Listof Xexpr))])

(define-type Paper (U Conf Jour Work Diss Mast Pre))
(define-type Jour jour-paper)
(define-type Conf conf-paper)
(define-type Work work-paper)
(define-type Diss diss-paper)
(define-type Mast mast-paper)
(define-type Pre pre-paper)
(define-type Auth auth)
(define-type Venue venue)

(define-type Xexpr
  (Rec x
       (U String
          Symbol
          (List* Symbol (Listof (List Symbol String)) (Listof x))
          (List* Symbol (Listof x)))))
  
(struct: pre-paper
  ([title : String]
   [coauthors : [Listof Auth]]
   [date : String]
   [links : [Listof [List Symbol String]]]))

(struct: conf-paper 
  ([title : String] 
   [coauthors : [Listof Auth]] 
   [conf : Venue]
   [location : String]
   [date : String]
   [links : [Listof [List Symbol String]]]))

(struct: work-paper 
  ([title : String] 
   [coauthors : [Listof Auth]] 
   [conf : Venue]
   [location : String]
   [date : String]
   [links : [Listof [List Symbol String]]]))

(struct: jour-paper 
  ([title : String]
   [coauthors : [Listof Auth]]
   [journal : Venue]
   [vol : String]
   [number : String]
   [date : String]
   [links : [Listof [List Symbol String]]]))

(struct: diss-paper
  ([title : String]
   [school : String]
   [date : String]
   [links : [Listof [List Symbol String]]]))

(struct: mast-paper
  ([title : String]
   [school : String]
   [date : String]
   [links : [Listof [List Symbol String]]]))

(struct: auth ([name : String]
               [url : (U String #f)]))

(struct: venue ([name : String]
                [url : String]))


(define jfp
  (venue "Journal of Functional Programming"
	 "http://journals.cambridge.org/action/displayJournal?jid=JFP"))

(define hammer
  (auth "Matthew A. Hammer"
	"http://www.cs.umd.edu/~hammer/"))

(define dunfield 
  (auth "Joshua Dunfield"
	"http://www.cs.ubc.ca/~joshdunf/"))

(define headley
  (auth "Kyle Headley"
	"http://www.cs.umd.edu/~kheadley/"))

(define foster
  (auth "Jeffrey S. Foster"
	"http://www.cs.umd.edu/~jfoster/"))

(define hicks
  (auth "Michael Hicks"
	"http://www.cs.umd.edu/~mwh/"))

(define toronto
  (auth "Neil Toronto"
        "http://www.cs.umd.edu/~ntoronto/"))

(define mccarthy
  (auth "Jay McCarthy"
        "https://jeapostrophe.github.io/home/"))


(define ianj 
  (auth "J. Ian Johnson" 
        "http://www.ccs.neu.edu/home/ianj/"))

(define might
  (auth "Matthew Might" 
        "http://matt.might.net/"))

(define darais
  (auth "David Darais"
	"http://david.darais.com/"))

(define labichn
  (auth "Nicholas Labich"
        "https://www.cs.umd.edu/~labichn/"))

(define shuying
  (auth "Shuying Liang"
	"http://shuying.me/academic.html"))

(define sun
  (auth "Weibin Sun"
	"http://www.cs.utah.edu/~wbsun/"))

(define samth 
  (auth "Sam Tobin-Hochstadt"
        "https://samth.github.io/"))

(define nguyen
  (auth "Phuc C. Nguyen"
        "https://www.cs.umd.edu/~pcn/"))

(define earl
  (auth "Christopher Earl" #f))
  
(define sergey
  (auth "Ilya Sergey"
        "http://ilyasergey.net/"))

(define keep
  (auth "Andrew W. Keep"
	"http://andykeep.com/"))

(define lyde
  (auth "Steven Lyde"
        "https://faculty.utah.edu/u0286788-STEVEN_VAL_LYDE/research/index.hml"))

(define gilray 
  (auth "Thomas Gilray"
        "http://faculty.utah.edu/u0706517-THOMAS_EVAN_GILRAY/contact/index.hml"))

(define aldous
  (auth "Petey Aldous"
        "http://eng.utah.edu/~paldous/about.html"))

(define chang
  (auth "Stephen Chang"
	"http://www.ccs.neu.edu/home/stchang/"))

(define matthias
  (auth "Matthias Felleisen"
	"http://www.ccs.neu.edu/home/matthias/"))

(define smaragdakis
  (auth "Yannis Smaragdakis"
	"http://smaragd.org/"))

(define mairson
  (auth "Harry G. Mairson"
	"http://www.cs.brandeis.edu/~mairson/"))

(define skalka
  (auth "Christian Skalka"
	"http://www.cs.uvm.edu/~skalka/"))

(define smith
  (auth "Scott F. Smith"
	"http://www.cs.jhu.edu/~smith/"))


(: format-venue : Venue -> Xexpr)
(define (format-venue v)
  (match v
    [(venue name url)
     `(a ((href ,url)) ,name)]))

(: format-auth : Auth -> Xexpr)
(define (format-auth a)
  (match a
    [(auth name url)
     (if (false? url)
         name   
	 `(a ((href ,url)) ,name))]))

(: format-link : (List Symbol String) -> Xexpr)
(define (format-link l)
  (match l
    [(list name url)
     `(a ((href ,url))
	 ,(symbol->string name))]))

(: format-links : (Listof (List Symbol String)) -> (Listof Xexpr))
(define (format-links l)  
  (delimit (map format-link l) 
	   '("[" nbsp) 
	   '(nbsp "|" nbsp)
	   '(nbsp "]")))


(: format-paper : Paper -> Xexpr)
(define (format-paper p)
  (match p
    [(pre-paper title coauthors date links)
     `(p (span ((class "paper-title")) ,title) ". "
	 "With " ,@(oxford (map format-auth coauthors)) ". "
	 (br)
	 "Preprint, " ,date
	 "."
	 (br)
	 ,@(format-links links))]
    [(work-paper title coauthors conf location date links)
     (format-paper (conf-paper title coauthors conf location date links))]
    [(conf-paper title coauthors conf location date links)
     `(p (span ((class "paper-title")) ,title) ". "
	 "With " ,@(oxford (map format-auth coauthors)) ". "
	 (br)
	 (span ((class "italic")) ,(format-venue conf))
	 ", "
	 ,location
	 ", "
	 ,date
	 "."
	 (br)
	 ,@(format-links links)
	 )]

    [(jour-paper title coauthors journal vol number date links)
     `(p (span ((class "paper-title")) ,title) ". "
      "With " ,@(oxford (map format-auth coauthors)) ". "
      (br)
      (span ((class "italic")) ,(format-venue journal))
      ", "
      ,vol
      "("
      ,number
      "), "
      ,date
      "."
      (br)
      ,@(format-links links))]
       
	
;     #;`(span ((class "italic")) ,journal)]

    [(mast-paper title school date links)
     `(p (span ((class "paper-title")) ,title) ". "
	 (br)
	 "MS thesis, "
	 ,school
	 ", "
	 ,date
	 "."
	 (br)
	 ,@(format-links links))]

    [(diss-paper title school date links)
     `(p (span ((class "paper-title")) ,title) ". "
	 (br)
	 "PhD dissertation, "
	 ,school
	 ", "
	 ,date
	 "."
	 (br)
	 ,@(format-links links))]))
      
(define papers
  (list

   (pre-paper "Incremental Computation with Names"
               (list hammer dunfield headley labichn foster hicks)
               "March 2015"
               '((arXiv "http://arxiv.org/abs/1503.07792")))
  
   (pre-paper "Galois Transformers and Modular Abstract Interpreters"
               (list darais might)
               "March 2015"
               '((arXiv "http://arxiv.org/abs/1411.3962")))

   (conf-paper "Relatively Complete Counterexamples for Higher-Order Programs"
	      (list nguyen)
	      (venue "The 36th ACM SIGPLAN Conference on Programming Language Design and Implementation (PLDI'15)"
		     "http://conf.researchr.org/home/pldi2015")
	      "Portland, Oregon"
	      "June, 2015"
	      '((arXiv "http://arxiv.org/abs/1411.3967")))

   (conf-paper "Running Probabilistic Programs Backwards"
               (list toronto mccarthy)
               (venue "The European Symposium on Programming (ESOP'15)"
                      "http://www.etaps.org/index.php/2015/esop")
               "London, United Kingdom"
               "April, 2015"
               '((arXiv "http://arxiv.org/abs/1412.4053")))

   (conf-paper "Abstracting Abstract Control"
	       (list ianj)
	       (venue "The 10th ACM Symposium on Dynamic Languages (DLS'14)"
		      "http://www.dynamic-languages-symposium.org/dls-14/")
	       "Portland, Oregon"
	       "October 2014"
	       '((ACM "http://dl.acm.org/citation.cfm?id=2661098")
		 (arXiv "http://arxiv.org/abs/1305.3163")))
  
   (conf-paper "Pruning, Pushdown Exception-Flow Analysis"
               (list shuying sun might keep)
               (venue "The 14th IEEE International Conference on Software Code Analysis and Manipulation"
		      "http://www.ieee-scam.org/2014/")
	       "Victoria, British Columbia"
	       "September 2014"
	       '((IEEE "http://ieeexplore.ieee.org/xpl/articleDetails.jsp?reload=true&arnumber=6975660")
		 (arXiv "http://arxiv.org/abs/1409.3108")))

   (conf-paper "Soft Contract Verification"
	       (list nguyen samth)
	       (venue "The ACM SIGPLAN International Conference on Functional Programming (ICFP'14)"
		      "http://icfpconference.org/icfp2014/")
	       "Gothenburg, Sweden"
	       "September 2014"
	       '((ACM "http://dl.acm.org/citation.cfm?id=2628156")
		 (arXiv "http://arxiv.org/abs/1307.6239")))

   (jour-paper "Pushdown flow analysis with abstract garbage collection"
	       (list ianj sergey earl might)
	       jfp
	       "24"
	       "2-3"
	       "May 2014"
	       '((CUP "http://journals.cambridge.org/abstract_S0956796814000100")
                 (arXiv "http://arxiv.org/abs/1406.5106")))

   (conf-paper "Optimizing Abstract Abstract Machines"
               (list ianj labichn might)
               (venue "The ACM SIGPLAN International Conference on Functional Programming (ICFP'13)"
                      "http://icfpconference.org/icfp2013/")               
               "Boston, Massachusetts"
               "September 2013"
               '((ACM "http://dl.acm.org/citation.cfm?id=2500604")
                 (arXiv "http://arxiv.org/abs/1211.3722")))

   (work-paper "Sound and Precise Malware Analysis for Android via Pushdown Reachability and Entry-Point Saturation"
               (list shuying keep might lyde gilray aldous)
               (venue "Proceedings of the Third ACM workshop on Security and privacy in smartphones & mobile devices"
                      "http://www.spsm-workshop.org/2013/")
               "Berlin, Germany"
               "November 2013"
               '((ACM "http://dl.acm.org/citation.cfm?doid=2516760.2516769")
		 (arXiv "http://arxiv.org/abs/1311.4201")))
		    
   (work-paper "AnaDroid: Malware Analysis of Android with User-supplied Predicates"
               (list shuying might)
               (venue "Workshop on Tools for Automatic Program Analysis"
                      "http://pl.cs.colorado.edu/tapas2013/")
               "Seattle, Washington"
               "June 2013"
	       '((arXiv "http://arxiv.org/abs/1311.4198")))
   
   (work-paper "Concrete Semantics for Pushdown Analysis: The Essence of Summarization"
               (list ianj)
               (venue "Workshop on Higher-Order Program Analysis"
                      "http://hopa.cs.rhul.ac.uk/")
               "New Orleans, Louisiana"
               "June 2013"
               '((arXiv "http://arxiv.org/abs/1305.3163")))
   
   (work-paper "From Principles to Practice with Class in the First Year"
               (list samth)
               (venue "International Workshop on Trends in Functional Programming in Education"
                      "http://wwwhome.ewi.utwente.nl/~holzenspiespkf/TFPIE2013.html")
               "Provo, Utah"
               "May 2013"
               '((EPCTCS "http://arxiv.org/html/1312.2216v1")
		 (arXiv "http://arxiv.org/abs/1306.4713")))
   
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
	       jfp
               "22"
               "4-5"
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
               (venue "The 18th International Static Analysis Symposium (SAS 2011)"
                      "http://sas2011.cs.technion.ac.il/")
               "Venice, Italy"
               "September 2011"
               '((Springer "http://www.springerlink.com/content/j272827h5r088h78/")
                 (arXiv "http://arxiv.org/abs/1103.5167")))
   
   (work-paper "Semantic Solutions to Program Analysis Problems"
               (list samth)
               (venue "FIT Session, The ACM SIGPLAN 2011 Conference on Programming Language Design and Implementation (PLDI'11)"
                      "http://pldi11.cs.utah.edu/")               
               "San Jose, California"
               "June 2011"
               '((arXiv "http://arxiv.org/abs/1105.0106")))
   
   (conf-paper "Abstracting Abstract Machines"
               (list might)
               (venue "The 15th ACM SIGPLAN International Conference on Functional Programming (ICFP'10)"
                      "http://www.icfpconference.org/icfp2010/")
               "Baltimore, Maryland"
               "September 2010"
               '((ACM "http://doi.acm.org/10.1145/1863543.1863553")
                 (arXiv "http://arxiv.org/abs/1007.4446")))
               
   (work-paper "Pushdown Control-Flow Analysis of Higher-Order Programs"
               (list earl might)
               (venue "The 2010 Workshop on Scheme and Functional Programming (SFP'10)"
                      "http://www.iro.umontreal.ca/~sfp2010/")
               "Montréal, Québec"
               "August 2010"
               '((arXiv "http://arxiv.org/abs/1007.4268")))
  	       
   (conf-paper "Evaluating Call-By-Need on the Control Stack"
               (list chang matthias)
               (venue "Symposium on Trends in Functional Programming (TFP 2010)"
                      "http://www.cs.ou.edu/tfp2010/")
               "Norman, Oklahoma"
 	       "May 2010"
	       '((Springer "http://www.springerlink.com/content/4156483l58237m45/")
		 (arXiv "http://arxiv.org/abs/1009.3174")))
		
   (conf-paper "Resolving and Exploiting the k-CFA Paradox"
               (list might smaragdakis)		
               (venue "The ACM SIGPLAN 2010 Conference on Programming Language Design and Implementation (PLDI'10)"
		      "http://cs.stanford.edu/pldi10/")
	       "Toronto, Canada"
	       "June 2010"
	       '((ACM "http://dl.acm.org/citation.cfm?doid=1806596.1806631")
		 (arXiv "http://arxiv.org/abs/1311.4231")))
		 
   (diss-paper "The Complexity of Flow Analysis in Higher-Order Languages"
               "Brandeis University"
               "August 2009"
               '((UMI "http://gradworks.umi.com/33/69/3369445.html")
		 (arXiv "http://arxiv.org/abs/1311.4733")))

   #;
   (jour-paper "Subcubic Control Flow Analysis Algorithms"
               (list midtgaard)
               (venue "Higher-Order and Symbolic Execution (to appear)"
		      "http://www.springer.com/computer/theoretical+computer+science/journal/10990"))
	
   (conf-paper "Deciding kCFA is complete for EXPTIME"
	       (list mairson)
	       (venue "The 13th ACM SIGPLAN International Conference on Functional Programming (ICFP'08)"
		      "http://www.icfpconference.org/icfp2008/")
	       "Victoria, British Columbia, Canada"
	       "September 2008"
	       '((ACM "http://doi.acm.org/10.1145/1411204.1411243")
		 (arXiv "http://arxiv.org/abs/1311.5810")))

   ;; A few principles of macro design

   (conf-paper "Flow Analysis, Linearity, and PTIME"
	       (list mairson)
	       (venue "The 15th International Static Analysis Symposium (SAS 2008)"
		      "http://users.dsic.upv.es/~sas2008/")
	       "Valencia, Spain"
	       "July 2008"
	       '((Springer "http://dx.doi.org/10.1007/978-3-540-69166-2_17")
		 (arXiv "http://arxiv.org/abs/1311.5825")))

   (jour-paper "Types and Trace Effects of Higher Order Programs"
	       (list skalka smith)
	       jfp
	       "18"
	       "2"
	       "March 2008"
	       '((CUP "http://dx.doi.org/10.1017/S0956796807006466")))

   (conf-paper "Relating Complexity and Precision in Control Flow Analysis"
	       (list mairson)
	       (venue "The Twelth ACM SIGPLAN International Conference on Functional Programming (ICFP'07)"
		      "http://www.icfpconference.org/archived/icfp2007/proglang.informatik.uni-freiburg.de/ICFP2007/index.html")
	       "Freiburg, Germany"
	       "October 2007"
	       '((ACM "http://doi.acm.org/10.1145/1291151.1291166")))

   (mast-paper "Algorithmic Trace Effect Analysis"
	       "University of Vermont"
	       "May 2006"
	       '((UVM "http://library.uvm.edu/dissertations/index.php?search_type=item&bid=1563807")))

   (work-paper "A Type and Effect System for Flexible Abstract Interpretation of Java"
	       (list skalka smith)
	       (venue "The ACM Workshop on Abstract Interpretations of Object-Oriented Programs"
		      "http://web.archive.org/web/20041227060438/www.polytechnique.fr/vmcai05/Aiool.html")
	       "Paris, France"
	       "January 2005"
	       '((Elsevier "http://www.sciencedirect.com/science/article/pii/S1571066105002628")))		    
   ))
                      
   
  
(define workshop&others
  (map format-paper (filter work-paper? papers)))

(define confs
  (map format-paper (filter conf-paper? papers)))

(define jours
  (map format-paper (filter jour-paper? papers)))

(define papers-list
  (map format-paper papers))

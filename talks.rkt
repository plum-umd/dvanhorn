#lang at-exp racket
(provide talks (struct-out talk))

(struct talk (tag title short-venue month year venue location abstract) #:prefab)

(define talks
  (list
   (talk 
    "tfpie-2013"
    "From Principles to Practice with Class"
    "TFPIE"
    "May"
    "2013"
    `(a ((href "http://wwwhome.ewi.utwente.nl/~holzenspiespkf/TFPIE2013.html"))
        "Trends in Functional Programming in Education")
    "Provo, Utah"
    `[@p{We propose a bridge between functional and object-oriented programming in the
         first-year curriculum. Traditionally, curricula that begin with
         functional programming transition to a professional, usually
         object-oriented, language in the second course. This transition poses
         numerous obstacles to students, and often results in confusing the
         details of development environments, syntax, and libraries with the
         fundamentals that the course focuses on. Our proposal instead begins
         the second course with a sequence of custom teaching languages which
         minimize the transition from the first course, and allow students to
         focus on the core ideas. We then transition to Java half-way through
         the course, at which point students have a strong command of the basic
         ideas. We have 3 years of experience with this course, and it has
         produced notable success.}])
   
   (talk
    "mapls-2013"
    "Abstracting Definitional Interpreters"
    "MAPLS"
    "April"
    "2013"
    `(a ((href "http://www.cs.umd.edu/projects/PL/mapls2013/"))
        "Mid-Atlantic Programming Languages Seminar")
    "College Park, Maryland"
    `[@p{Definitional interpreters written in monadic style can express a wide
         variety of inter preters for languages with effects. In this talk, we
         show that such interpreters, under a slight reworking, can also
         express a diverse set of abstract interpretations from flow analysis
         to symbolic execution.}
       @p{We give a rational reconstruction of a definitional abstract
          interpreter for a higher- order language by constructing a series of
          units implementing monadic operations. We implement units realizing
          reachable state semantics, trace semantics, dead-code elimination,
          symbolic execution , and a finite store abstraction. The denouement of
          our story is a sound and computable abstract int erpreter that arises
          from the composition of simple, independent components. Remarkably,
          this inter preter implements a form of pushdown control flow analysis
          (PDCFA) in which calls and returns are always properly matched in the
          abstract semantics. True to the definitional style of R eynolds, the
          evaluator involves no explicit mechanics to achieve this property; it
          is simply inher ited from the defining language.}])
   
   (talk
    "umd-2013"
    "Analysis for Trustworthy Software"
    "UMD"
    "March"
    "2013"
    `(a ((href "https://talks.cs.umd.edu/talks/300"))
        "Computer Science Colloquium")
    "University of Maryland, College Park, Maryland"
    `[@p{Work on software engineering, compiler optimization, program
         parallelization, system verification, and security assurance
         critically depends on program analysis, a ubiquitous and central theme
         of programming language research.  At the same time, the production of
         modern software systems employs expressive, higher-order programming
         languages, such as Java, JavaScript, Python, Ruby, and many others,
         implying a growing need for precise and scalable program analyses for
         these languages.  For thirty years, the research community has
         expended a tremendous amount of effort designing effective analyses
         for such languages, but these past approaches, call for whole-program
         analyses, demand polynomial (or worse!)  resources, require complex
         constructions and correctness arguments, and are difficult to design
         and implement.}
       @p{In this talk I will describe an alternative approach to analysis that
          meets the scalability challenge of modern systems.  I will show how to
          leverage these new ideas in order to create a straightforward
          derivation process, thereby lowering verification costs, accommodating
          sophisticated language features and program properties, and reasoning
          about program components.}
       @p{This work traces an arc of research that began with a very theoretical
          investigation of existing program analyses and developed into a new
          practical approach to the design of analysis and verification tools
          for higher-order program languages. To conclude, I will show how I am
          applying this approach to vet the security of Android applications.}])
   
   (talk
    "msr-2012"
    "Towards Verification of Behavioral Software Contracts"
    "MSR"
    "November"
    "2012"
    `(a ((href "http://research.microsoft.com/en-us/groups/rise/default.aspx"))
        "Microsoft Research, Research in Software Engineering")
    "Redmond, Washington"
    `[@p{The past two decades have seen two parallel trends in software development: 
         the increased use of linguistic tools to rigorously ensure the reliability 
         of software, and the rise of higher-order programming languages. A prominent 
         strand within the former are Meyer-style contract systems, originally 
         developed for the Eiffel programming language and now available in a range
         of languages, including Spec#. Contracts empower programmers to write
         important invariants of the components they develop and have these down 
         invariants enforced at runtime. Over the past few years, MSR's RiSE group 
         has demonstrated that theorem provers can verify many of these contracts at 
         compile time, supporting programmers as they create modules in their IDEs.}
       @p{As research over the past decade has shown, contracts for higher-order 
          languages pose novel challenges. These contracts are no longer simple boolean 
          predicates on flat values but test objects and functions for infinitary 
          properties. Reasoning about such properties calls for new approaches and 
          technologies, and my talk will present a first solution. The approach extends 
          symbolic execution to use behavioral contracts as symbolic values, thus
          enabling symbolic approximation of higher-order behavior. This work opens a 
          path toward applying first-order verification techniques to a higher-order 
          setting.}])
   
   (talk
    "crash-2012"   
    "Raising the Level of Discourse with GnoSys"
    "CRASH"
    "November"
    "2012"
    `(a ((href "https://www.schafertmd.com/darpa/i2o/crash/2012/pi/index.php?p=agenda"))
        "DARPA Clean-slate design of Resilient, Adaptive, Secure Hosts (CRASH) PI Meeting")
    "San Diego, California"
    `[@p{The main thesis of this project is that by making language mechanisms available 
         to programmers that capture more design knowledge, this knowledge can be leveraged 
         to qualitatively improve automated reasoning about programs. As part of the GnoSys 
         project, I am investigating the interaction of analysis with language design, 
         formal methods, and operating systems to enable mutually beneficial combinations 
         for constructing robust systems. The focus of my work is to design program analysis 
         tools for capturing domain knowledge and to design program abstractions that can 
         be exploited by the components of the system such as the operating system and 
         automated theorem prover.}])
   
   (talk
    "oopsla-2012"
    "Higher-Order Symbolic Execution via Contracts"
    "OOPSLA"
    "October"
    "2012"
    `(a ((href "http://splashcon.org/2012/"))
        "The ACM SIGPLAN Conference on Object-Oriented Programming, Systems, Languages, and Applications (OOPSLA" rsquo "12)")
    "Tuscon, Arizona"
    `[@p{We present a new approach to automated reasoning about higher-order programs 
         by extending symbolic execution to use behavioral contracts as symbolic values,
         thus enabling symbolic approximation of higher-order behavior.}
       @p{Our approach is based on the idea of an abstract reduction semantics that
          gives an operational semantics to programs with both concrete and symbolic 
          components. Symbolic components are approximated by their contract and our 
          semantics gives an operational interpretation of contracts-as-values. The 
          result is an executable semantics that soundly predicts program behavior, 
          including contract failures, for all possible instantiations of symbolic 
          components. We show that our approach scales to an expressive language of 
          contracts including arbitrary programs embedded as predicates, dependent 
          function contracts, and recursive contracts. Supporting this rich language
          of specifications leads to powerful symbolic reasoning using existing program 
          constructs.}
       @p{We then apply our approach to produce a verifier for contract correctness of 
          components, including a sound and computable approximation to our semantics 
          that facilitates fully automated contract verification. Our implementation is 
          capable of verifying contracts expressed in existing programs, and of justifying 
          contract-elimination optimizations.}])
   
   (talk
    "apac-2012"
    "Scalable Abstractions for Trustworthy Software"
    "APAC"
    "October"
    "2012"
    `(a ((href "https://www.schafertmd.com/darpa/i2o/apac/pimeeting/index.php")) 
        "DARPA Automated Program Analysis for Cybersecurity (APAC) PI Meeting")
    "Arlington, Virginia"
    `[@p{Applications deployed on mobile devices play a critical role in the fabric of 
         daily life. They carry sensitive data and have capabilities with significant 
         social and financial effect. Yet while it is paramount that such software is 
         trustworthy, these applications pose challenges beyond the reach of current 
         practice for low-cost, high-assurance verification and analysis. The primary 
         goal of this project is to enable sound, secure, automatic program analysis 
         for the elimination of security vulnerabilities in mobile applications written 
         in high-level programming languages.}])
   
   (talk
    #f
    "Verification via Abstract Reduction Semantics"
    "PL Seminar"
    "December"
    "2011"
    "PL Seminar"
    "Aarhus University, Aarhus, Denmark"
    empty)
   
   (talk
    "gnosys-2011"
    "Low-level Analysis for High-level Assurance"
    "GnoSys"
    "September"
    "2011"
    "GnoSys project report for DARPA"
    "Northeastern University, Boston"
    empty)
   
   (talk
    "nii-kcfa-2011"
    '(span "The Complexity of " (span ((class "italic")) "k") "CFA")
    "NII"
    "September"
    "2011"
    '(a ((href "http://www.nii.ac.jp/shonan/seminar005/"))
        "NII Workshop on Automated Techniques for Higher-Order Program Verification")
    "Shonan Village, Japan"
    empty)
   
   (talk
    "nii-abs-red-2011"
    "Abstract Reduction Semantics"
    "NII"
    "September"
    "2011"
    '(a ((href "http://www.nii.ac.jp/shonan/seminar005/"))
        "NII Workshop on Automated Techniques for Higher-Order Program Verification")
    "Shonan Village, Japan"
    empty)
   
   (talk
    "neu-2011"
    '(span "So you" rsquo "ve ruined your life: What comes after a PhD?")
    "NEU"
    "July"
    "2011"
    "Northeastern CCIS PhD Seminar"
    "Boston, Massachusetts"
    empty)
   
   (talk
    "racket-con-2011"
    "An Object-Oriented World"
    "RacketCon"
    "July"
    "2011"
    "RacketCon"
    "Boston, Massachusetts"
    empty)
   
   (talk
    "rice-2011"
    "What Program Analysis Can and Cannot Do for You"
    "Rice"
    "March"
    "2011"
    "Computer Science Colloquium"
    "Rice University"
    empty)
   
   (talk
    "utah-2011"
    "What Program Analysis Can and Cannot Do for You"
    "Rice"
    "February"
    "2011"
    '(a ((href "http://compsci.rice.edu/events.cfm?EventRecord=15243")) 
        "Computer Science Colloquium")
    "University of Utah, Salt Lake City, Utah"
    empty)
   
   (talk
    "mit-2011"
    "The Paradox of Flow Analysis, Or: What We Talk About When We Talk About Higher-Order Flow Analysis"
    "MIT"
    "February"
    "2011"
    "PL Seminar"
    "MIT, Cambridge, Massachusetts"
    empty)
   
   (talk
    "njpls-2010"
    "Modular Analysis via Abstract Reduction Semantics"
    "NJPLS"
    "December"
    "2010"
    '(a ((href "http://www.njpls.org/"))
        "New Jersey Programming Languages and Systems Seminar")
    "Rutgers University, New Jersey"
    empty)
   
   (talk
    "icfp-2010"
    "Abstracting Abstract Machines"
    "ICFP"
    "September"
    "2010"
    '(a ((href "http://www.icfpconference.org/icfp2010/"))
        "The 15th ACM SIGPLAN International Conference on Functional Programming (ICFP 2010)")
    "Baltimore, Maryland"
    empty)
   
   (talk
    "ibm-2010"
    "Pushdown Control Flow Analysis"
    "IBM PL Day"
    "July"
    "2010"
    '(a ((href "https://researcher.ibm.com/researcher/view_page.php?id=1511")) 
        "IBM Programming Languages Day")
    "Hawthorne, New York"
    empty)
   
   (talk 
    "havard-2010"
    "Abstracting Abstract Machines: Storing and Stacking Continuations"
    "Harvard"
    "July"
    "2010"
    '(a ((href "http://web.archive.org/web/20100813114336/http://cs.harvard.edu/pl/davidvh.html"))
        "Harvard Programming Languages Seminar")
    "Cambridge, Massachusetts"
    '[@p{We describe two techniques for systematically deriving abstract interpretations 
         approximating canonical machines for higher-order languages. The first allocates
         continuations in a bounded store to achieve a finite state-space. We demonstrate 
         the generality of this approach by transforming the CEK machine of Felleisen and 
         Friedman, a lazy variant of Krivine's machine, and the stack-inspecting CM machine 
         of Clements and Felleisen into abstract interpreters. The technique scales up uniformly 
         to allow static analysis of realistic languages features, including tail calls, 
         conditionals, side effects, exceptions, first-class continuations and even garbage
         collection.}
       @p{The second technique keeps continuations on the stack to achieve a push-down model 
          of abstract interpretation. The resulting abstract interpreter always matches
          calls and returns, achieving a higher level of precision by never conflating call 
          and return pairs. Although this technique produces abstract interpreters with infinite 
          state-spaces, we demonstrate how basic static analysis questions remain decidable by 
          casting them as language inclusion problems answered by push-down automata.}
       @p{(Joint work with Matthew Might and Christopher Earl, University of Utah)}])   
   
   (talk
    "pldi-2010"
    '(span "Resolving and Exploiting the " (span ((class "italic")) "k") "-CFA Paradox")
    "PLDI"
    "June"
    "2010"
    '(a ((href "http://cs.stanford.edu/pldi10/"))
        "The ACM SIGPLAN 2010 Conference on Programming Language Design and Implementation (PLDI 2010)")
    "Toronto, Ontario"
    empty)

   (talk
    "nepls-2010"
    "Abstracting Abstract Machines"
    "NEPLS"
    "April"
    "2010"
    '(a ((href "http://nepls.org/"))
	"New England Programming Languages and Systems Symposium")
    "Yale University, New Haven, Connecticut"
    empty)

   (talk 
    "oregon-2010"
    '(span "Resolving and Exploiting the " (span ((class "italic")) "k") "-CFA Paradox")
    "Oregon"
    "April"
    "2010"
    '(a ((href "http://www.cs.uoregon.edu/Activities/Public_Talks/20100415-Vanhorn.php"))
	"Computer and Information Science Colloquium")
    "University of Oregon, Eugene, Oregon"
    empty)

   (talk
    "nepls-2010"
    '(span "Resolving and Exploiting the " (span ((class "italic")) "k") "-CFA Paradox")
    "NEPLS"
    "December"
    "2009"
    '(a ((href "http://nepls.org/"))
	"New England Programming Languages and Systems Symposium")
    "MIT, Cambridge, Massachusetts"
    empty)

   (talk
    "mitchfest-2009"
    "Subcubic Control-Flow Analysis Algorithms"
    "Mitchfest"
    "August"
    "2009"
    '(a ((href "http://www.ccs.neu.edu/events/wand-symposium/"))
	"Symposium in Honor of Mitchell Wand")
    "Northeastern University, Boston, Massachusetts"
    empty)

   (talk
    "phd-2009"
    "The Complexity of Flow Analysis in Higher-Order Languages"
    "PhD defense"
    "July"
    "2009"
    "PhD dissertation defense"
    "Brandeis University, Waltham, Massachussets"
    empty)
   
   (talk
    "nepls-2008"
    "Complexity of Flow Analysis"
    "NEPLS"
    "November"
    "2008"    
    '(a ((href "http://nepls.org/Events/21/"))
	"New England Programming Languages and Systems Symposium")
    "Harvard University, Cambridge, Massachussets"
    empty)

   (talk
    "icfp-2008"
    '(span "Deciding " (span ((class "italic")) "k") "CFA is complete for EXPTIME")
    "ICFP"
    "September"
    "2008"
    '(a ((href "http://www.icfpconference.org/icfp2008/"))
	"The 13th ACM SIGPLAN International Conference on Functional Programming (ICFP 2008)")
    "Victoria, British Columbia"
    empty)

   (talk
    "sas-2008"
    "Flow analysis, Linearity, and PTIME"
    "SAS"
    "July"
    "2008"    
    '(a ((href "http://www.dsic.upv.es/~sas2008/"))
	"The 15th International Static Analysis Symposium (SAS 2008)")
    "Valencia, Spain"
    empty)

   (talk
    "icfp-2007"
    "Relating Complexity and Precision in Control Flow Analysis"
    "ICFP"
    "October"
    "2007"
    '(a ((href "http://www.informatik.uni-bonn.de/~ralf/icfp07.html"))
	"The 12th ACM SIGPLAN International Conference on Functional Programming (ICFP 2007)")
    "Freiburg, Germany"
    empty)

   (talk
    "prl-2007"
    "Relating Complexity and Precision in Control Flow Analysis"
    "PRL"
    "May"
    "2007"
    '(a ((href "http://www.ccs.neu.edu/home/wand/pl-seminar/"))
	"Northeastern Programming Languages Seminar")
    "Boston, Massachusetts"
    empty)

   (talk
    "brandeis-2006"
    "From Syntactic Sugar to the Syntactic Meth Lab: Using Macros to Cook the Language You Want"
    "Brandeis"
    "December"
    "2006"
    "CoSci 21b (SICP)"
    "Brandeis University, Waltham, Massachusetts"
    empty)
   
   (talk
    "pljr-2006"
    "Linearity and Program Analysis, and Relating complexity and precision of approximation in control flow analysis"
    "PL Jr."
    "October"
    "2006"
    "PL Seminar, Jr."
    "Northeastern University, Boston, Massachusetts"
    empty)

   (talk
    "ms-2006"
    "Algorithmic Trace Effect Analysis"
    "MS"
    "March"
    "2006"
    "MS thesis defense"
    "University of Vermont, Burlington, Vermont"
    empty)

   ;MS thesis defense, University of Vermont, March 2006. Available in hard copy from the Bailey/Howe library at UVM.
   ;http://library.uvm.edu/dissertations/index.php?search_type=item&bid=1563807

   (talk
    "neu-2005"
    "Abstract Machines for the Multi-return λ-calculus"
    "NEU"
    "December"
    "2005"    
    '(span "G711 (" ldquo "Principles of Programming Languages" rdquo ")")
    "Northeastern University, Boston, Massachusetts"
    empty)
   
   (talk 
    "uvm-cs-2005"
    "Algorithmic Trace Effect Analysis"
    "CS Day"
    "August"
    "2005"    
    '(a ((href "http://www.cs.uvm.edu/research/researchday2005/"))
	"Computer Science Research Day")
    "University of Vermont, Burlington, Vermont"
    empty)
   ;poster
   ;http://www.ccs.neu.edu/home/dvanhorn/talks/uvm-research-day-2005-poster.pdf

   (talk
    "epscor-2005"
    "Context Based Security in Programming Languages"
    "EPSCoR"
    "August"
    "2005"
    "Vermont EPSCoR annual conference"
    "Burlington, Vermont"
    empty)))
   
    

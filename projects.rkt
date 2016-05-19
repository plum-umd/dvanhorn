#lang at-exp racket
(provide (struct-out project) projects)

(struct project (name role desc collab) #:prefab)

(define projects
  (list
   (project
    "Online Verification-Validation"
    "PI"
    '("Increasingly, modern software on the web is richly extensible, accelerating its evolution and dramatically reducing the time between development and deployment. The intellectual merit of this research consists of challenging the false choice between creating software that is extensible (easy to reuse and extend) and software that is correct (meets its specifications). The new approach advanced by this work, Incremental Verification-Validation, enables programmers to bring domain-specific safely disciplines to extensible systems, by providing a framework where these disciplines are communicated both precisely and usefully, as executable code. The project's broader significance and importance consist in changing the way programmers approach building correct extensible software for the web. "

   "Incremental Verification-Validation encourages programmers to co-design their systems with executable specifications that check these systems dynamically, as they execute. Moreover, unlike typical assertions, which execute dynamically and non-incrementally, the proposed are subject to novel patterns that enhance their performance: In regressive validation, verification partially discharges some checks, dynamically rewriting the program with residual versions; in progressive verification, online verification occurs in passes that each cache and reuse work, to avoid from-scratch verification of facts that still hold from earlier passes. Finally, to avoid forcing analysis programmers to reason about incremental changes explicitly in each analysis that they create, the meta layer expresses incremental computations implicitly, using an implicitly-incremental meta language whose abstractions hide reasoning on a per-change basis.")

'("This collaboration with Matthew Hammer and Bor-Yuh (Evan) Chang is
supported by the National Science Foundation  Software and Hardware Foundations program"))

   (project
    "The Science and Applications of Crypto-Currency"
    "Co-PI"

    '("Crypto-currencies and smart contracts are a new wave of "
      "disruptive technology that will shape the future of money and "
      "financial transactions. Today, crypto-currencies are a "
      "billion-dollar market, and hundreds of companies are entering "
      "this space, promising exciting new markets and "
      "eco-systems. Unfortunately, usage of crypto-currencies "
      "outstrips our understanding. Currently most crypto currencies "
      "rely on heuristic designs without a solid appreciation of the "
      "necessary security properties, or any formal basis upon which "
      "strong assurance of such properties might be achieved."

      
      "This work aims to establish a rigorous scientific foundation "
      "for crypto-currencies. To achieve this, this work blends cryptography, "
      "game theory, programming languages, and systems security "
      "techniques. Expected outcomes include new crypto-currency "
      "designs with provable security properties, financially "
      "enforceable cryptographic protocols whose security properties "
      "are backed by enforceable payments in case of a breach, smart "
      "contract systems that are easy to program and formally "
      "verifiable, as well as high-assurance systems for storing and "
      "handling high-value crypto-currencies and transactions. The "
      "project will provide solutions to some of the most difficult "
      "and important technical questions surrounding the current "
      "digital-money revolution. The investigators will organize a "
      "crypto-currency speaker series that will bring together technologists, "
      "economists, social scientists, and policy-makers to foster "
      "collaborations that will shape the future of digital currencies.")

    '("This collaboration with Elaine Shi, Emin Sirer, Jonathan Katz, "
      "Dawn Song, and Michael Hicks is supported by the National Science Foundation "
      "Secure " amp " Trustworthy Cyberspace program."))

   (project
    "Sound Over- and Under-Approximation of Complexity and Information Security"
    "Co-PI"
    '("Our primary goal is to enable sound, highly automated program analysis "
      "for the elimination of complexity and side-channel vulnerabilities in "
      "applications for which only bytecode source is available."
      
      "Toward this goal, we envision orders-of-magnitude improvements in scale, "
      "precision, and speed of algorithmic resource usage vulnerability analysis. "
      "The central thesis of our work is that these breakthroughs are achievable "
      "through an interplay of techniques to (1) quantify and compartmentalize "
      "adversary influence, (2) simultaneously box in resource usage analysis "
      "of a program from above using sound static analysis and below using "
      "dynamic analysis and symbolic exe- cution, and (3) integrate a human "
      "analyst in to the iterative refinement loop of the system to quickly "
      "confirm, dismiss, and focus hypotheses about resource usage.")

    '("This collaboration with Eric Koskinen, Dawn Song, and Michael "
      "Hicks is supported by the DARPA Information Innovation"
      "Office, Space/Time Analysis for Cybersecurity program."))


   (project
    "Trustworthy and Composable Software Systems with Contracts"
    "PI"

    '("Over the past decade, language-based security mechanisms" mdash "such
       as type systems, model checkers, symbolic executors, and other program
       analyses" mdash "have been successfully used to uncover or prevent many
       important (exploitable) software vulnerabilities, such as buffer
       overruns, side channels, unchecked inputs (leading to code injection),
       and race conditions, among others. But despite significant advances,
       current work makes two unrealistic assumptions: (1) the analyzed code
       comprises a complete program (as opposed to a framework or set of
       components), and (2) the software is written in a single programming
       language. These assumptions ignore the reality of modern software,
       which is composed of large sets of interacting components constructed
       in several programming languages that provide varying degrees of
       assurance that the components are well-behaved.

       In this project, we aim to address these limitations by
developing new static-analysis techniques based on software contracts,
which provide a way to extend the analysis of components to reason
about security of an entire heterogeneous system.")

    @'{This collaboration with Sam Tobin-Hochstadt, Jeff Foster, and
Michael Hicks, is supported by the National Security Agency, Science
of Security Research Lablet program.})


   (project
    "Behavioral Software Contract Verification"
    "Co-PI"
    @'{Behavioral software contracts express invariants and agreements 
       between components of a program (procedures, modules, classes, even 
       different languages) and assign blame to the appropriate party 
       whenever these agreements are violated. Such contracts tend to be 
       formulated in the full programming language, allowing arbitrary 
       properties to be encoded a programs.  While this is crucial for 
       constructing reliable components, it thwarts static reasoning and 
       incurs significant run-time monitoring costs. This work rectifies the 
       situation with tools for modular and compositional automated reasoning 
       about behavioral contracts.}
    
    @'{This collaboration with Sam Tobin-Hochstadt is supported by the 
       National Science Foundation, Software and Hardware Foundations 
       program.})
   
   (project 
    "Scalable and precise abstractions of programs for trustworthy software"
    "PI"               
    @'{Applications deployed on mobile devices play a critical role in our 
       daily life. They carry sensitive data and have capabilities with 
       significant social and financial effect. Yet while it is paramount 
       that such software is trustworthy, these applications pose challenges 
       beyond the reach of current practice for low-cost, high-assurance 
       verification and analysis. The primary goal of this project is to 
       enable sound, secure, automatic program analysis for the elimination 
       of security vulnerabilities in mobile applications in high-level 
       programming languages.}
    '("This collaboration with Matthew Might is supported by the DARPA "
      "Information Innovation Office, Automated Program Analysis for "
      "Cybersecurity program.  Read " (a ((href "apac.pdf")) "more") "."))
   
   (project
    "Raising the level of discourse with GnoSys"
    "Senior personnel"
    @'{The goal of this project is to design language mechanisms that capture 
       design knowledge and to leverage this knowledge to qualitatively 
       improve automated reasoning about programs. As part of the GnoSys 
       project, I am investigating the interaction of analysis with language 
       design, formal methods, and operating systems to enable mutually 
       beneficial combinations for constructing robust systems. The focus of 
       my work is to design program analysis tools for capturing domain 
       knowledge and to design program abstractions that can be exploited by 
       the components of the system such as the operating system and 
       automated theorem prover.}
    @'{This collaboration with Matthias Felleisen, Matthew Flatt, Pete 
       Manolios, Matthew Might, Olin Shivers, and Mitchell Wand is supported 
       by the DARPA Clean-slate design of Resilient, Adaptive, Secure Hosts 
       (CRASH) program.})))

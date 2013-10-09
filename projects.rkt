#lang at-exp racket
(provide (struct-out project) projects)

(struct project (name role desc collab) #:prefab)

(define projects
  (list
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
    @'{This collaboration with Matthew Might is supported by the DARPA 
       Information Innovation Office, Automated Program Analysis for 
       Cybersecurity program.})
   
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
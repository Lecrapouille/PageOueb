dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(SynDEx: Software for generating distributed code) 
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

dnl ICON_NEW STRONG(Page en cours de r�daction).

LEFT_MENU(LEFT_RUBRIC(D�couverte du logiciel SynDEx,
Qu'est ce que la m�thodologie AAA ?,#aaa,
Qu'est ce que SynDEx ?,#synd,
Mes tutoriels SynDEx en vid�o,#videotuto)

LEFT_RUBRIC(Mod�les d'algorithmes et d'architectures,
Mod�le d'algorithme,#algo,
Mod�le d'architecture,#archi,
Heuristique de distribution et d'ordonnancement,#heur)

LEFT_RUBRIC(En r�sum�, En r�sum� : les entr�es de SynDEx,#resumentree,
En r�sum� : les sorties de SynDEx,#resumesortie,
Travail de l'utilisateur,#userwork)

LEFT_RUBRIC(Comprendre le macro code g�n�r�,
Exemple de code g�n�r�,#ex,
Analyse du code macro par macro,#analyse,
Comprendre les macros de synchronisation,#synchro,
Comprendre le fonctionnement des send_ et receive_,#sendrec,
R�sultat du code g�n�r�,#res,
Noyau d'ex�cutif,#noy,
Travail de l'utilisateur,#comp),BANNIERES)

divert(DIVERT_FOOTER_CODE)

divert(DIVERT_BODY_CODE)

SECTION(Software overview)
SUBSECTION(ICON_EYES[]Introduction,intro)

<p>We saw in MYLINK(tuto_scicos,here), that Scilab/Scicos software can easily
   integrated libraries written in C language for react with captors and
   actuators of embedded systems (camera, joystick, serial link). We also saw
   it is not always to insert Scicos in a regulation loop to control fast
   real time systems like MYLINK(helico_intro,four heads rotors helicopter).
   Nevertheless, we can ask to Scicos to generate automaticly C code from a schema
   block application. This code can be compiled, for example, for a RTAI Linux (a Linux
   where the kernel is patched to use hard real time. See EXTLINK(http://www.scicos.org/scicosrtai.html,here)
   for more details) or for dsPIC30F architecture (see Flex System).</p>

<p>We can want to be more ambitious and, still with the same Scicos schema block application,
   want to automaticaly generate code for any multiprocessor architecture and distribute the
   threadable part of software into the architecture as better as possible. The part of the software will
   be executed in a parallel way. Scicos do not do this, but SynDEx does it.</p>

<p>This document makes a quick poverview fo SynDEx software. This software will be used for
   my MYLINK(helico_intro,four heads rotors helicopter) project (when my first prototype of regulation algorithm will
   work). An executive kernel (SynDEx term to define, in a frist approximation, by library) written in C
   allows to SynDEx to generate code for dsPIC microcontrolers.</p>

<p>STRONG(NOTE:) this executive kernel is still in progress (code has been done) but currently in stand by.
   my first prototype of regulation algorithm is not yet desined.</p>

SUBSECTION(ICON_READ[]What is the AAA methodology ?,aaa)

<p>STRONG(NOTE:) The EXECV4 document described with more details, the AAA methodology.
   Here, we just give us an quick ovierview.</p>

<p>The AAA methodology (Algorithme Architecture Adequation) is based on graph models to specify
   in first hand the algorithme and in other part the hardware architecture. The description of the
   algorithm 

   description de l'algorithme permet de mettre en �vidence le
   parall�lisme potentiel tandis que celle de l'architecture met en
   �vidence le parall�lisme disponible. Cette m�thode consiste en fait
   � d�crire l'implantation en terme de transformations de graphes. En
   effet, le graphe mod�lisant l'algorithme est transform� jusqu'� ce
   qu'il corresponde au graphe mat�riel mod�lisant l'architecture.
   L'implantation de l'algorithme sur l'architecture consiste donc �
   r�duire le parall�lisme potentiel au parall�lisme disponible tout
   en cherchant � respecter les contraintes temps r�el. Toutes ces
   transformations effectu�es avant l'ex�cution en temps r�el de
   l'application, correspondent � une distribution et � un
   ordonnancement des diff�rents calculs sur les processeurs et des
   communications sur les liaisons physiques inter-processeurs. C'est
   � partir de ces allocations spatiales et temporelles qu'un ex�cutif
   va pouvoir �tre g�n�r� et permettre l'ex�cution de l'algorithme sur
   l'architecture construite avec des processeurs. Cependant, pour que
   cette implantation soit vraiment efficace, il est n�cessaire de
   r�aliser une ad�quation entre l'algorithme et
   l'architecture. Celle-ci consiste � choisir parmi toutes les
   transformations propos�es celle qui optimise les performances temps
   r�el.</p>

LOWPICTURE(tuto/syndex/AAA,Summery of the AAA methodology.)

SUBSECTION(ICON_EYES[]What is SynDEx ?,synd)

<p>SYNDEX is a CAO software to make possible the AAA methodology for the fast
   prototypa and optimisation of the design of real time and distributed systems.
   From a given algorithm and an architecture bothe defined as a graph. SynDEx
   makes the distributed implementation of the algorithm into the architecture.
   This result is written in pseudo-code (LINKM4 lannguage) and has for name in SynDEx: 
   STRONG(executive). We also can obtain an algorithm graph from a Scicos schema
   block application but this functionality does not work on new Scicos version.</p>

<p>This software is developped by the AOSTE team at INRIA. I was an entrainee in
   this team. See MYLINK(stages_presentation,here) to see my works.</p>

SUBSECTION(ICON_EYES[]SynDEx tutorials in video,videotuto)

<p>This is my first french video tutorial (with the WINK tool). It shows how to create
   a simple SynDEx application. I will do others that will explain how to ask to SynDEx how to
   generate code.</p>

TABLEAU(1,LINK(tuto/syndex/T1_CreerArchiAlgo/CreerArchiAlgo.htm,Tutorial
1),ICON_TGZ,Flash Format)


SECTION(Algorithms and architecture models,modelalgoarchi)
SUBSECTION(ICON_GEAR[]Algorithms,algo)

<p>An algorithm is modelised by a data flow graph eventualy conditioned
   (oriented hyper-graph) composed of nodes and edges. A node is a operation
   and an egde is a data flow, i.g. data transfert between two operations.</p>

LOWPICTURE(tuto/syndex/algo,Example of algorithme graph in SynDEx)

<p>A operation maybe either a computation (lika an addition) or a state memory
   (delay) or a condditionnement or an input-output. Nodes that do not contain
   predecesoous are input interface (captors that receiving stimulus from the environement).
   and those that do not have successors are interface for outputs (actuators producing
   actions to the environement). In the case of a computation operation, the consumption
   of inputs precede production of outputs.</p>

SUBSECTION(ICON_GEAR[]Architecture,archi)

<p>An architecture is modelised by a graph which each node is a processor or a communication medium,
   and each edge is a connexion between a processor and a communication medium SAM ou RAM). We cannot
   directly link two processors or two mediums. Each node is a *machine s�quentielle* sequecening either
   computation operations for processor, or communication operations for communication medium.</p>

LOWPICTURE(tuto/syndex/archi,Example of architecture garph in SynDEx)

<p>A processor are abract representations of what can be a PC,
   a Macintosh a processus (Window, Unix, Mac) or a dsPIC microcontroler. Communications mediums
   are abract representations of what can be a TCP/IP, bus CAN, USB, FireWire, serial port.</p>

SUBSECTION(ICON_GEAR[]Heuristic of distribution and scheduling,heur)

<p>Once time the specification of algorithm and architecture are done, it is necessary to realize
   the adequation. This one must respect in the first hand events orders done during the algorithm
   specification and in other hand real time constraints. For this, among all possible graph transformations,
   is chosen the one that optimises latences or reponse time given by the length of the critical path of
   software graph (where nodes are valued by execution durations of operations and also inter-processors communications.</p>

<p>In the aim to resolve the optimisation of tmie reponse a heuristic has been made. This is a glutton algorithm
   where each step allocate an operation to a processor, link the possible inter-processors communications, i.g.
   to create communications operations and allocate each of them to a physical link. The schedule of computation
   operations or communication


   physique. L'ordonnancement des op�rations de calculs ou de
   communication est directement d�duit de l'ordre dans lequel elles
   sont allou�es.</p>

<p>Cette m�thode consiste donc � faire progresser le long du graphe
   une coupe s�parant les op�rations d�j� plac�es sur des processeurs
   de celles qui ne le sont pas encore. La progression se fait en
   respectant les pr�c�dences du graphe logiciel. De toutes les
   op�rations � distribuer sur la coupe et de tous les processeurs, on
   choisit la paire qui optimise une fonction locale de co�t prenant
   en compte :</p>

LISTE(Les diff�rences entre dates locales d'ex�cution au plus
  t�t et au plus tard (schedule flexibility),

l'allongement du temps global d'ex�cution : le temps de r�ponse (latence),

le rythme d'entr�e (cadence),

la capacit� m�moire.)

SECTION(En r�sum�,sum)
SUBSECTION(ICON_EYES[]Entr�es de SynDEx,resumentree)
<p>Pour r�sum�, SynDEx prend en entr�e :</p>

LISTE(Un graphe d'algorithme (obtenu, par exemple, � partir d'un
sch�ma bloc Scicos)., Un graphe d'architecture constitu� de
processeurs (rectangles bleus et blancs) et de m�dias de communication
(ronds bleus et arcs)., Les dur�es des t�ches et des communications
(et dans la prochaine version leur p�riode).)

TABLEAU(3,LOWPICTURE(tuto/syndex/algo,Graphe
d'algorithme),LOWPICTURE(tuto/syndex/archi,Graphe d'architecture),
LOWPICTURE(tuto/syndex/duration,Dur�e des op�rations))

SUBSECTION(ICON_EYES[]Sorties de SynDEx,resumesortie)

<p>SynDEx g�n�re automatiquement :</p>

LISTE(Un agenda des t�ches � ex�cuter dans le temps., Des ex�cutifs
   � savoir les programmes pour chaque processeur �crit en pseudo
   code.)

<p>L'agenda des t�ches � ex�cuter est constitu� de colonnes
   symbolisant les processeurs de l'architecture ainsi que les m�dias
   de communication :</p>

LISTE(Le contenu des colonnes sont les t�ches ou les envois/r�ceptions
   � ex�cuter dans le temps (de haut en bas) pour chaque processeur ou
   chaque m�dia.,Les �paisseurs des t�ches donnent la dur�e
   d'ex�cution.,La couleur orange est l'op�ration (ou communication)
   point�e par le curseur de la souris (on ne la voit pas sur la
   capture d'�cran).,La couleur verte indique les op�rations qui sont
   ex�cut�es avant l'op�ration orange et,La couleur rouge indique les
   op�rations qui s'ex�cutent apr�s l'op�ration orange.)</p>

TABLEAU(2,LOWPICTURE(tuto/syndex/schedul,Agenda des t�ches),
LOWPICTURE(tuto/syndex/executif,Ex�cutif))

<p>Un ex�cutif est la repr�sentation algorithmique de l'agenda. A
   chaque colonne, un ex�cutif lui correspond. Il y a donc un ex�cutif
   g�n�r� par processeur. Le pseudo code est en fait la syntaxe du
   langage de macroprocessing LINKM4. Comme on peut le voir sur l'image ci
   dessus, chaque ex�cutif g�n�r� contient une ITALIQUE(thread main)
   qui ex�cute les calculs (loi de commande, capteurs, actionneurs) et
   au moins une ITALIQUE(thread de communication) qui appellent les
   fonctions de haut niveau envoyer et recevoir une donn�e.</p>

<p>Dans la section ici, on explique plus en d�tail le fonctionnement de l'ex�cutif.</p>

SUBSECTION(ICON_EYES[]Travail de l'utilisateur,userwork)

<p>STRONG(Entr�es de SynDEx :) L'utilisateur doit dessiner dans l'IHM
   les deux types de graphes et d�finir les p�riodes de chaque t�ches
   et de communication. La cr�ation du graphe d'algorithme peut �tre
   obtenu � partir d'un sch�ma bloc Scicos via une passerelle
   EXTLINK(http://www-rocq.inria.fr/syndex,S2S).</p>

<p>STRONG(Sorties de SynDEx :) Les ex�cutifs g�n�r�s ne peuvent pas
   �tre exploit�s tels quels. Il faut d'abord les traduire dans un
   langage adapt� (C, assembleur, ...) puis les compiler et les
   flasher dans le micro contr�leur. Cette �tape n'est malheureusement
   pas automatis�e dans SynDEx � cause du trop grand nombre d'architectures
   disponibles sur le march� (il lui faudrait une base de donn�es des
   registres disponibles pour chaque architecture). C'est le r�le du
   cross-compilateur de les conna�tre. Il faut pouvoir associer �
   chaque macro M4 une fonction dans le langage d�sir�.  L'utilisateur
   doit �crire des fichiers d'association entre macro M4 et langage
   d�sir�. L'ensemble de ces fichiers est appel� ITALIQUE(noyau
   d'ex�cutif).</p>

SECTION(Comprendre le macro code des ex�cutifs,comprendre)
SUBSECTION(Exemple de code g�n�r�,ex)

<p>D'apparence complexe, ce code est en fait tr�s simple � comprendre
   puisque tous les ex�cutifs g�n�r�s ont le m�me squelette.</p>

CODE
processor_(dsPIC30F,dsPICmaitre,H4H_syndex,SynDEx-6.8.5 (C) INRIA)

semaphores_(
  Semaphore_Thread_RxTx,
  EnvoiMot_a_dsPICmaitre_RxTx_empty,
  EnvoiMot_a_dsPICmaitre_RxTx_full,
  prep_message_out_dsPICmaitre_RxTx_empty,
  prep_message_out_dsPICmaitre_RxTx_full)

alloc_(int,EnvoiMot_a,100)
alloc_(int,prep_message_out,100)

thread_(USART,RxTx,dsPICmaitre,MacBook)
  loadDnto_(,MacBook)
  Pre0_(prep_message_out_dsPICmaitre_RxTx_empty,)
  loop_
    Suc1_(EnvoiMot_a_dsPICmaitre_RxTx_empty,)
    recv_(EnvoiMot_a,PCnonEmbarque,MacBook,dsPICmaitre)
    Pre0_(EnvoiMot_a_dsPICmaitre_RxTx_full,)
    Suc1_(prep_message_out_dsPICmaitre_RxTx_full,)
    send_(prep_message_out,dsPIC30F,dsPICmaitre,MacBook)
    Pre0_(prep_message_out_dsPICmaitre_RxTx_empty,)
  endloop_
  saveFrom_(,MacBook)
endthread_

main_
  proc_init_
  spawn_thread_(RxTx)
  MonGrosCalcul(EnvoiMot_a,prep_message_out)
  Pre1_(EnvoiMot_a_dsPICmaitre_RxTx_empty,RxTx)
  loop_
    Suc0_(EnvoiMot_a_dsPICmaitre_RxTx_full,RxTx)
    Suc0_(prep_message_out_dsPICmaitre_RxTx_empty,RxTx)
    MonGrosCalcul(EnvoiMot_a,prep_message_out)
    Pre1_(prep_message_out_dsPICmaitre_RxTx_full,RxTx)
    Pre1_(EnvoiMot_a_dsPICmaitre_RxTx_empty,RxTx)
  endloop_
  wait_endthread_(Semaphore_Thread_RxTx)
endmain_

endprocessor_
ENDCODE

<p>Comme dit pr�c�demment, ce genre de pseudo code devra �tre traduit
   dans un langage �volu� avant de pouvoir �tre compil�. Ici, on
   utilisera comme langage cible le langage C pour plus de
   facilit�. Le programme obtenu apr�s compilation pourra �tre
   ex�cut� sur un OS comme Windows, Linux ou Mac ou sur un
   microcontr�leur comme un (ds)PIC.</p>

SUBSECTION(Analyse du code macro par macro,analyse)

<p>Voici la liste exhaustive des macros � comprendre ainsi que leur r�le.</p>

<p>La macro STRONG(processor_) d�finit les informations du processeur
   concern�. Par exemple :</p>
CODE
processor_(dsPIC30F,dsPICmaitre,H4H_syndex,...)
ENDCODE

<p>indique que, dans le cadre de l'application SynDEx nomm�e
   H4H_syndex.sdx, ce code est destin� au processeur nomm� dsPICmaitre
   qui est du type dsPIC30Fxxxx.</p>

<p>La macro STRONG(semaphores_) d�finie tous les s�maphores binaires
   (empty ou full) n�cessaires � la bonne synchronisation des threads
   de calcul et de communication de notre programme. A
   l'initialisation du processeur ces s�maphores sont TOUTES
   initialis�es � 0 (empty). Pour l'instant, pas besoin d'en savoir
   plus sur leur r�le.</p>

CODE
semaphores_(
  ...
  EnvoiMot_a_dsPICmaitre_RxTx_empty,
  EnvoiMot_a_dsPICmaitre_RxTx_full)
ENDCODE

<p>La macro STRONG(alloc_) r�serve un tableau statique de N �l�ments d'un type
   donn�. La taille du tableau ne peut �voluer dynamiquement.</p>

CODE
alloc_(int,EnvoiMot_o,100)
ENDCODE

<p>Par exemple ici on d�finit un tableau nomm� EnvoiMot_o de cent
   �l�ments de type entier (en g�n�ral cod� sur 32 bits pour le
   langage C mais tout d�pend du choix du langage cible choisi ainsi
   que celui de l'architecture du processeur cible). G�n�ralement dans
   l'IHM de SynDEx on met les identifiants _o et _i aux noms des ports
   pour indiquer s'ils sont en entr�es ou sorties.</p>

<p>La macro STRONG(main_) d�signe la thread de calcul. Les macros
   STRONG(thread_) d�signent des threads de communication. Par exemple</p>

CODE
thread_(USART,RxTx,dsPICmaitre,MacBook)
ENDCODE

<p>d�signe une thread de communication qui connecte notre processeur
   dsPICmaitre � un autre processeur nomm� MacBook (mais dont on ne
   conna�t pas l'architecture) via les pins RxTx et utilise le
   protocole USART (ici norme RS232).</p>

<p>La macro STRONG(spawn_thread_) d�signe une fonction cr�ant une thread de
   communication (spawn = g�n�rer). Par exemple</p>

CODE
spawn_thread_(RxTx)
ENDCODE

<p>correspond � la fonction UNIX thread_create. Ici RxTx r�f�re au
   protocole USART.</p>

<p>La compr�hension des macros STRONG(loop_) et STRONG(endloop_) ne
   pose � priori pas de probl�me : elles d�signent la boucle du
   programme � ex�cuter. On peut choisir diff�rents types de boucle :
   finie ou infinie, et peuvent avoir diff�rents aspects syntaxiques
   apr�s le macroprocessing (STRONG(while) ou STRONG(for) en langage
   C). Tout d�pend comment l'utilisateur � d�cider de macro-processer
   ce pseudo code. Le code s'ex�cutant avant STRONG(loop_) s'appelle
   la phase d'initialisation et a pour identifiant la macro
   STRONG(INIT). Le code apr�s STRONG(endloop_) est appel� phase de
   terminaison et a pour identifiant la macro STRONG(END). Le code
   dans la boucle a pour identifiant la macro STRONG(LOOP). Nous avons
   donc trois types de phases. Pour conna�tre le type phase en cours
   de macroprocessing, une macro a �t� d�finie et porte le nom de
   STRONG(MGC).</p>

<p>Les macros du genre STRONG(MonGrosCalcul) sont des fonctions
   d�finies par l'utilisateur. Elle prennent en param�tre des tableaux
   allou�s par les macros STRONG(alloc_), les lisent et les
   remplissent (ports d'entr�e, ports de sortie).</p>

CODE
MonGrosCalcul(EnvoiMot_a,prep_message_out)
ENDCODE

<p>Comme nous avons trois types diff�rents de phases (INIT, LOOP,
   END), la macro STRONG(MonGrosCalcul) peut �tre pr�sente au maximum
   trois fois (et au minimum une fois) dans la thread de calcul
   (STRONG(main_)) : une fois par type de phase. Une option dans l'IHM de
   SynDEx permet de d�sactiver le dupliqu�t dans les phases INIT et
   END. Dans notre exemple, seule la phase d'initialisation est
   d�sir�e.</p>

dnl C'est � l'utilisateur d'�crire le code que les macros doivent
dnl   accomplir lors de leurs  expansions dans les noyaux
dnl   d'ex�cutifs.

<p>Les macros STRONG(loadDnto_) et STRONG(saveFrom_), sauf erreur de
   ma part, servent de bootloader au processeur. Dans mon cas,
   n'utilisant pas de bootloader pour mes microcontr�leurs, je n'ai
   pas plus approfondi l'utilit� des ces fonctions.</p>

<p>Les macros STRONG(send_) et STRONG(receive_) (ex�cut�s uniquement
   dans les threads de communication) servent � �changer des donn�es
   avec les autres processeurs. Par exemple :<p>

CODE
send_(prep_message_out,dsPIC30F,dsPICmaitre,MacBook)
ENDCODE

<p>envoie le tout le contenu du tableau prep_message_out de notre
   processeur dsPICmaitre (toujours du type dsPIC) � l'autre
   processeur MacBook.</p>

SUBSECTION(Comprendre les macros de synchronisation,synchro)

<p>Nous passons maintenant � l'�tude des macros les plus
   compliqu�es � savoir STRONG(Suc0), STRONG(Pre0), STRONG(Suc1) et
   STRONG(Pre1) qui sont des macros de synchronisation entre les
   threads de calcul et de communication.</p>

<p>Pour comprendre leur utilit�, il ne faut pas oublier que tous les
   processeurs (au sens SynDEx) ne g�rent pas le multithreading au
   sens "plusieurs processus" comme les OS Unix. Des microcontr�leurs
   comme les PIC ex�cutent s�quentielement un seul programme car ils
   n'ont qu'un seul PC (pointeur d'interpr�tation). Ils ont un seul
   processus m�me s'ils sont capables d'ex�cuter en m�me temps
   l'incr�mentation de plusieurs timers, d'envoyer une donn�e sur
   l'USART, recevoir une donn�e SPI de g�n�rer un signal PWM et de
   lire une valeur analogique.</p>

<p>Pour cela, il faut simuler le multithreading et c'est pour cela
   qu'on a besoin des macros STRONG(Suc0), STRONG(Pre0), STRONG(Suc1)
   et STRONG(Pre1).</p>

<p>Les STRONG(SucX) et STRONG(PreX) (X = {0,1}) sont les verrous de
   s�maphores binaires pour la synchronisation de l'ex�cution des
   pseudo threads entre elles (calcul et communication). Elles
   correspondent sous Linux aux fonctions STRONG(wait) et
   STRONG(signal) ou P/V en allemand. STRONG(wait) permet de poser un
   verrou alors que STRONG(signal) enl�ve le verrou. (STRONG(Note :)
   la mn�motechnique est P pour "Puis-je ?" et V pour "Vas y !"). Avec
   un dsPIC il faut d�finir ces fonctions alors que sous Unix elles
   sont d�j� cod�es. De m�me, la macro STRONG(spawn_) ne sert pas pour
   les dsPIC car les threads de communication et de calcul ne sont
   plus que de simples fonctions d'o� le terme (non officiel) que
   j'utiliserai "pseudo thread".</p>

<p>Une question l�gitime � ce niveau, qu'elle est la m�thode de
   simulation  de fonctionnement des threads ? La r�ponse est simple c'est
   la macro STRONG(Pre1) de la pseudo thread de calcul qui va indiquer
   au PC de sauter vers le STRONG(Suc1) lui correspondant dans la
   pseudo thread de communication. Avant le saut, on sauve la valeur
   du PC dans une pile. STRONG(Pre1) joue, en premi�re approximation,
   le r�le de STRONG(goto) et STRONG(Suc1) joue le r�le de label
   (�tiquette).</p>

<p>Il ne reste plus qu'� savoir comment retourner � la pseudo thread
   de calcul. En fait, STRONG(Suc1) et STRONG(Pre1) sont plus
   compliqu�s qu'il n'y para�t � premi�re vue : ils modifient les valeurs des
   s�maphores binaires (souvenez vous de la macro STRONG(semaphores_)
   !).  Si lors de l'ex�cution du STRONG(Suc1), la valeur du
   s�maphores ne correspond pas alors on d�pile la valeur du PC pour
   revenir � l'endroit du code avant le saut dans la pseudo thread de
   communication; sinon le PC continue � avancer dans le code de la
   pseudo thread de communication.</p>

<p>STRONG(Suc0) et STRONG(Pre0) permettent de synchroniser les
   STRONG(send_) et STRONG(receive_).</p>

<p>To resume, when we run step by step a generated by SynDEx, we see that
   the PC (pointer counter) go jump from the main thread to a communication thread
   then 

Pour r�sumer, quand on ex�cute pas � pas un code g�n�r� par SynDEx
   on voit que le PC va sauter de la thread de main � une thread de
   communication puis le selon la valeur
   des s�maphores binaires :</p> LISTE(soit le PC va
   revenir la o� il �tait dans la thread de main juste avant le saut.,
   Soit continuer son ex�cution dans la thread de communication.)

<p>The distribution of STRONG(send_), des STRONG(receive_) and operations
   defined by the user like STRONG(MyBigCalculus) depends on the heuristic
   used by SynDEx. The heuristic depends on the number of processors, potential
   parralelism available and the duration of tasks and communications (that it
   shall be adjusted to the best (worst time)). By heuristic we talk about the
   given solution which is a good one but not necessary the best one because the
   optimum solution is too complex to be computed (NP-complex).</p>

<p>The EXECV4 document (quite hard to apprehend at the first reading), gives us
   lot of informations on how to code in the target language macros STRONG(Suc0),
   STRONG(Pre0), STRONG(Suc1) and STRONG(Pre1).</p>

SUBSECTION(How to understand the behavior of send_ and receive_ macros,sendrec)

<p>Macros STRONG(send_) and STRONG(receive_) allow to send data between differents kind of
   processors. The associated code depends on the type of communication medium. Indeed, we
   have to check if STRONG(send_) functions of the current processor and the STRONG(receive_) of
   listening processor are synchronised.</p>

<p>With protocols like UART, we have to set circular buffers and flow control or handshaking protocols.
   These are the most difficult macros to code. Generic executive kernels already exist for CAN
   and TCP/IP protocols and can be downloaded on the official SynDEx website.</p>

<p>Currently, I'm doing my own UART communication protocol (RS232 norm), also
   called serial link. See MYLINK(comm_rs232,here) for more informations.</p>

SECTION(Result of generated code)
SUBSECTION(Executive kernel)

<p>You have just seen the aim of these different kind of SynDEx macros. We have to
   translate them into a target language. This is the aim of the executive kernel.</p>

<p>As we have said it, the generated code by SynDEx uses the M4 syntaxe. For example,
   the following code:</p>
CODE
[define(`toto',`tutu')]
ENDCODE

<p>Each time that the M4 parser get the token STRONG(toto) in the file, it will replace it by
the token STRONG(tutu). Read LINKM4 and EXECV4 documents. (NOTE: the html code of this site is fully
generated by M4 macros. To see the M4 code source replace the *.html extension of these pages by *.m4).</p>

<p>In SynDEx term, the set of M4 definitions put together in a same file is called
STRONG(executive kernel) and has the extension .m4x</p>

CODE
[define(`main_',`int main(void) {')]
ENDCODE

<p>For operations definitions of the user, the code is a little more tricky.</p>

CODE
[define(`MonAddition',`ifelse(
    processorType_,`PIC16F',`ifelse(
         MGC,`INIT',``movlw $1            ; load $1 in W
                      movwf myvariable    ; myvariable is now equals to $1
                      movlw $2            ; load $2 dans W
                      addwf  myvariable,f ; result: (W) + (myvariable), so $1 + $2
                                          ; the result is saved in myvariable (,f).'',
         MGC,`LOOP',``'',
         MGC,`END',``'')',
    processorType_,processorType_,`ifelse(
         MGC,`INIT',``'',
         MGC,`LOOP',``$3[1] = $1[1] + $2[1];'',
         MGC,`END',``'')')')]
ENDCODE


SUBSECTION(User work,comp)

LISTE(Shall have a M4 library (set of M4 definitions) to translate executives generated by SynDEx
in the target language (assembly[,] C[,] ...). Some of libraries have already been defined/coded and
can be downloaded on the SynDEx website. This is the case for the Unix architecture, TCP/IP and CAN
protocol. If this not the case, the user shall develop his own library., Run the Makefile to make
macros expansions and run the M4 files then compile the obtained files to make runnable binaries.,Finaly
bootload this binary into processors.)

<p>For example, this is my code generation for dsPIC and Unix architecture. This code is given as example
   and may change in the future.</p>

CODE
/******************************************************************************/
/* SEMAPHORES BINAIRES                                                        */
/******************************************************************************/
static int semaphores[[5]] = { 0, 0, 0, 0, 0 };

#define SEMAPHORE_THREAD_RXTX                     4
#define ENVOIMOT_A_DSPICMAITRE_RXTX_EMPTY         3
#define ENVOIMOT_A_DSPICMAITRE_RXTX_FULL          2
#define PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_EMPTY   1
#define PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_FULL    0

/******************************************************************************/
/* Pseudo UART communication thread between dsPIC Master and MacBook          */
/******************************************************************************/
void thread_comm_USART(int state)
{
    /* ********** */
    /* INIT phase */
    /* ********** */

    /* The init phase has been put in the main function */

    /* ********** */
    /* LOOP phase */
    /* ********** */
    while (1)
      {
          /* "cases" are not ended by "breaks". This is allow to continue to execute
           * codes in the follower cases. */
          switch (state)
            {
            case -1: /* Used to a reloop */
            case ENVOIMOT_A_DSPICMAITRE_RXTX_EMPTY: /* Suc1 */
                if ((semaphores[[ENVOIMOT_A_DSPICMAITRE_RXTX_EMPTY]] ^= 1) == 1)
                    return;
                USART_read(EnvoiMot_a, 5); /* dsPIC master --> MacBook */
                semaphores[[ENVOIMOT_A_DSPICMAITRE_RXTX_FULL]] = 1; /* Pre0: unlock */

            case PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_FULL: /* Suc1 */
                if ((semaphores[[PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_FULL]] ^= 1) == 1)
                    return;
                USART_write(prep_message_out, 5); /* MacBook --> dsPIC master */
                semaphores[[PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_EMPTY]] = 1; /* Pre0: unlock */

            default:
                state = -1; /* Reloop */
                break;
            }                   /* end switch thread comm  */
      }                         /* end loop thread comm */

    /* ********* */
    /* END phase */
    /* ********* */

}                               /* end thread comm */

/******************************************************************************/
/* Thread Main                                                                */
/******************************************************************************/
int main(void)
{
    /* ********** */
    /* INIT phase */
    /* ********** */

    /* Initialisation of UART communication thread */
    USART_init(); /* spawn */

    semaphores[[PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_EMPTY]] = 1; /* Pre0: unlock */
    thread_comm_USART(-1);
    thread_comm_USART(ENVOIMOT_A_DSPICMAITRE_RXTX_EMPTY); /* Pre1: lock */

    /* ********** */
    /* LOOP phase */
    /* ********** */
    while (1)
      {
          /* Suc0: while until unlock on interrupt */
          while (semaphores[[ENVOIMOT_A_DSPICMAITRE_RXTX_FULL]] == 0)
              ;
          semaphores[[ENVOIMOT_A_DSPICMAITRE_RXTX_FULL]] = 0;

          /* Suc0: while until unlock on interrupt */
          while (semaphores[[PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_EMPTY]] == 0)
              ;
          semaphores[[PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_EMPTY]] = 0;

          ABigComputation();

          thread_comm_USART(PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_FULL); /* Pre1: lock */
          thread_comm_USART(ENVOIMOT_A_DSPICMAITRE_RXTX_EMPTY); /* Pre1: lock */

      }  /* end loop of computation thread */

    /* ********* */
    /* END phase */
    /* ********* */

    /* Suc0: while until unlock on interrupt */
    while (semaphores[[SEMAPHORE_THREAD_RXTX]] == 0)
        ;
    semaphores[[SEMAPHORE_THREAD_RXTX]] = 0;

    return 0;
}
ENDCODE

<p>STRONG(Note:) The STRONG(indent) tool allows to automaticly format and indent the generated code.</p>

SECTION(Conclusion)
SUBSECTION(The word of the end,conclu)

<p>Although SynDEx is a powerful software, it is not yet able to manage the following points:</p>
   LISTE(Fault tolerance: a method that consists to double or triple the nombre of processors to avoid
   that a material anomaly crashes all the application. For example this is very important in avionic.
   In old version SynDEx used to manage this.,
   
   Multi-period tasks: for example, we desire to execute the task A every 10 ms and the task B every 20 ms.
   By cycle: A will be executed two times and B once.,

   Asynchronous data send by a captor, ...). This points are currently in development.</p>

<!-- <p>Concernant l'�criture de mon ex�cutif pour dsPIC, je n'ai pas
  encore termin� le code des send_ et receive_. Par contre le
  squelette du programme semble fonctionner. Ensuite il faudra passer
  aux tests.</p>
-->


<!-- <p>Manque la chaine Scicos SynDEx Mplab</p> -->

SUBSECTION(Projet(s) similaire(s))
<p>There is at least one similar project for autonomatic code generation for dsPIC processors
EXTLINK(http://www.kerhuel.eu/RTWdsPIC/) </p>

SUBSECTION(Liens)
M4
SYNDEX
Tuto SYNDEX
Mon port s�rie
CyCab

divert(DIVERT_FOOTER_CODE)

END_BODY(,,,,) dnl helico_electronique,helico_asservissement)

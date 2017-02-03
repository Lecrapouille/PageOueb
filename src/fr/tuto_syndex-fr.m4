dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Logiciel de g�n�ration de code distribu� SynDEx)
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

SECTION(D�couverte du logiciel SynDEx)
SUBSECTION(ICON_EYES[]Pr�sentation,intro)

<p>Nous avons vu MYLINK(tuto_scicos,ici), que le logiciel
   Scilab/Scicos peut facilement int�grer des biblioth�ques �crites en
   langage C pour interagir avec des syst�mes embarqu�s via des
   capteurs ou des actionneurs (cam�ra, joystick, port s�rie). Nous
   avons �galement vu qu'il n'est pas toujours ais� de l'ins�rer dans
   une boucle d'asservissement pour contr�ler des syst�mes temps r�el
   (comme pour l'MYLINK(helico_intro,h�licopt�re quatre
   rotors)). N�anmoins, il est toujours possible de demander � Scicos
   de g�n�rer automatiquement du code C � partir d'un sch�ma block. Ce
   code peut �tre compil�, par exemple, pour un Linux RTAI (un Linux
   dont le noyau a �t� patch� pour utiliser le temps r�el dur. Voir
   EXTLINK(http://www.scicos.org/scicosrtai.html,ici) pour plus de
   renseignement).</p>

<p>On peut vouloir �tre encore plus ambitieux et, toujours � partir du
   m�me sch�ma block, vouloir g�n�rer automatiquement du code pour
   n'importe quelle architecture multiprocesseur et r�partir au mieux
   les op�rations d'un programme qui peuvent �tre ex�cut�es en
   parall�le. Scicos ne le fait pas automatiquement mais, par contre,
   il existe un logiciel nomm� SYNDEX qui permet de g�n�rer du code
   distribu�.</p>

<p>Cette page fait une rapide pr�sentation du logiciel SynDEx. Ce
   logiciel est actuellement utilis� pour la deuxi�me version de mon
   MYLINK(helico_intro,h�licopt�re quatre rotors).  Un noyau
   d'ex�cutif (terme SynDEx que l'on peut d�finir en premi�re
   approximation par biblioth�que) �crite en C permet au logiciel
   SynDEx de g�n�rer du code pour les microprocesseurs dsPIC.</p>

<p>STRONG(NOTE:) cette biblioth�que est en cours de d�veloppement et
   n'est pas encore disponible sur ce site.</p>

SUBSECTION(ICON_READ[]Qu'est ce que la m�thodologie AAA ?,aaa)

<p>Le document EXECV4 d�crit la m�thodologie AAA :</p>

<p>La m�thodologie d'STRONG(Ad�quation Algorithme Architecture) (AAA)
   est bas�e sur des mod�les de graphes pour sp�cifier d'une part
   l'algorithme et d'autre part l'architecture mat�rielle. La
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

LOWPICTURE(tuto/syndex/AAA,R�sum� de la m�thodologie AAA.)

SUBSECTION(ICON_EYES[]Qu'est ce que SynDEx ?,synd)

<p>SYNDEX est un logiciel de CAO mettant en oeuvre la m�thodologie AAA
   pour le prototypage rapide et l'optimisation de la mise en oeuvre
   d'applications distribu�es temps r�el embarqu�es. A partir d'un
   algorithme et d'une architecture tous deux donn�s sous forme de
   graphe, SynDEx g�n�re une impl�mentation distribu�e de l'algorithme
   en langage LINKM4 appel� ex�cutif. On peut obtenir un graphe
   d'algorithme en important dans SynDex un sch�ma Scicos.</p>

<p>Ce logiciel est d�velopp� par l'�quipe AOSTE � l'INRIA
   Rocquencourt. J'ai �t� stagiaire dans cette �quipe. Voir
   MYLINK(stages_presentation,ici) pour plus de renseignements.</p>

SUBSECTION(ICON_EYES[]Mes tutoriels SynDEx en vid�o,videotuto)

<p>Voici une premi�re vid�o tutoriel (qui est en cours de r�alisation
   avec l'utilitaire WINK) qui montre comment cr�er une
   application SynDEx simple. J'en ferai d'autres pour expliquer comment
   demander � SynDEx de g�n�rer le code.</p>

TABLEAU(1,LINK(tuto/syndex/T1_CreerArchiAlgo/CreerArchiAlgo.htm,Tutoriel
1),ICON_TGZ,Format Flash)


SECTION(Mod�les d'algorithmes et d'architectures,modelalgoarchi)
SUBSECTION(ICON_GEAR[]Algorithmes,algo)

<p>Un algorithme est mod�lis� par un graphe flot de donn�es
   �ventuellement conditionn� (il s'agit d'un hypergraphe orient�),
   qui se compose de sommets et d'arcs. Un sommet est une op�ration et
   un arc un flot de donn�es, c'est-�-dire un transfert de donn�es
   entre deux op�rations.</p>

LOWPICTURE(tuto/syndex/algo,Exemple de graphe
d'algorithme sous SynDEx)

<p>Une op�ration peut-�tre soit un calcul (comme une addition), soit
   une m�moire d'�tat (retard), soit un conditionnement ou encore une
   entr�e-sortie. Les sommets qui ne poss�dent pas de pr�d�cesseur
   sont des interfaces d'entr�e (capteurs recevant les stimuli de
   l'environnement) et ceux qui ne poss�dent pas de successeur
   repr�sentent des interfaces de sortie (actionneurs produisant les
   actions vers l'environnement). Dans le cas d'une op�ration de
   calcul, la consommation des entr�es pr�c�de la production des
   sorties.</p>

SUBSECTION(ICON_GEAR[]Architecture,archi)

<p>Une architecture est mod�lis�e par un graphe dont chaque sommet
   repr�sente un processeur ou un m�dia de communication, et chaque
   arc repr�sente une connexion entre un processeur et un m�dia de
   communications (SAM ou RAM). On ne peut connecter directement deux
   processeurs ou deux m�dias. Chaque sommet est une machine
   s�quentielle qui s�quence soit des op�rations de calcul pour les
   processeurs, soit des op�rations de communications pour les m�dias
   de communications.</p>

LOWPICTURE(tuto/syndex/archi,Exemple de graphe d'architecture sous SynDEx)

<p>Un processeur et les m�dias de communication sont des repr�sentations
   abstraites de ce que peut �tre un PC, un Macintosh, un processus
   (Window, Unix, Mac) ou un microcontr�leur PIC, dsPIC ou bien des
   m�dias de communications comme le TCP/IP, bus CAN, USB, FireWire,
   port s�rie.</p>

SUBSECTION(ICON_GEAR[]Heuristique de distribution et d'ordonnancement,heur)

<p>Une fois les sp�cifications de l'algorithme et de l'architecture
   effectu�es, il est n�cessaire de r�aliser l'ad�quation. Celle-ci
   est charg�e de respecter d'une part l'ordre des �v�nements pr�cis�s
   lors de la sp�cification de l'algorithme et d'autre part les
   contraintes temps r�el. Pour cela, parmi toutes les
   transformations de graphes possibles, est choisie celle qui optimise les
   performances temps r�el de l'implantation en terme de latence. La
   latence ou temps de r�ponse R est donn�e par la longueur
   du chemin critique du
   graphe logiciel, dont les sommets sont valu�s par les dur�es
   d'ex�cution des op�rations correspondantes y compris celles des
   communications inter-processeurs.</p>

<p>Afin de r�soudre ce probl�me d'optimisation du temps de r�ponse,
   une heuristique a �t� d�velopp�e. Il s'agit d'un algorithme glouton
   dont chaque �tape alloue une op�ration � un processeur, route les
   �ventuelles communications inter-processeurs c'est-�-dire cr�e des
   op�rations de communication et alloue chacune d'elles � une liaison
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

<p>Pour r�sumer, quand on ex�cute pas � pas un code g�n�r� par SynDEx
   on voit que le PC va sauter de la thread de main � une thread de
   communication puis le selon la valeur
   des s�maphores binaires :</p> LISTE(soit le PC va
   revenir la o� il �tait dans la thread de main juste avant le saut.,
   Soit continuer son ex�cution dans la thread de communication.)

<p>La r�partition des STRONG(send_), des STRONG(receive_), et des
   op�rations d�finies par l'utilisateur comme STRONG(MonGrosCalcul),
   d�pend de l'heuristique employ�e par SynDEx. Elle d�pend du nombre de
   processeur, du parall�lisme potentiel, du parall�lisme disponible
   et de la dur�e des t�ches et des communications (qu'il faudra ajuster
   au mieux, � savoir conna�tre le temps au plus tard). Par
   heuristique on entend que la solution fournie est bonne sans �tre
   forc�ment optimale car le calcul de la solution optimale est trop
   complexe (NP-complet).</p>

<p>Le document EXECV4, difficile � appr�hender lors de la premi�re
   lecture, donne plus de renseignements sur comment coder en C ou
   assembleur les macros STRONG(Suc0), STRONG(Pre0), STRONG(Suc1) et
   STRONG(Pre1).</p>

SUBSECTION(Comprendre le fonctionnement des send_ et receive_,sendrec)

<p>Les macros STRONG(send_) et STRONG(receive_) permettent
   respectivement d'envoyer et de recevoir des donn�es entre les
   diff�rents processeurs. Le code associ� d�pend du type de m�dia de
   communication. En effet, il faut v�rifier que les STRONG(send_)
   d'un processeur et les STRONG(receive_) du processeur � l'�coute
   restent synchronis�s.</p>

<p>Sur des protocoles comme l'UART, il faudra mettre en place des
   buffeurs circulaires et des signaux de contr�le de flux ou de
   protocole d'accord (handshaking). C'est sans aucun doute les macros
   les plus durs � coder. Des noyaux d'ex�cutif g�n�rique SynDEx
   existent d�j� pour le protocole CAN et TCP/IP et peuvent �tre
   t�l�charg�s sur le site officiel de SynDex.</p>

<p>Je m'amuse � coder mon propre protocole de communication UART
   (norme RS232) commun�ment appel� port s�rie. Voir
   MYLINK(comm_rs232,ICI) pour plus de renseignements.</p>

SECTION(R�sultat du code g�n�r�)
SUBSECTION(Noyau d'ex�cutif)

<p>Nous venons de voir quelles �taient le r�le des diff�rentes macros
   SynDEx. Il faut les traduire dans un langage cible : c'est le r�le
   des noyaux d'ex�cutifs.</p>

<p>Comme nous l'avons dit le code g�n�r� par SynDEx utilise la syntaxe M4. Ce code</p>
Par exemple
CODE
[define(`toto',`tutu')]
ENDCODE

A chaque fois que le parseur M4 va voir le mot toto dans le fichier il
va le remplacer par le mot tutu.  Je conseille de lire le manuel
LINKM4 et le document EXECV4. (NOTE: ce site est ENTIEREMENT g�n�r�
par macro M4)

<p>Dans le jargon de l'�quipe AOSTE, l'ensemble
des d�finitions M4 define r�unies dans un m�me fichier est appel�
noyau d'ex�cutifs et porte l'extension .m4x</p>

CODE
[define(`main_',`int main(void) {')]
ENDCODE

Pour les d�finitions des op�rations de l'utilisateur le code est un peu plus compliqu�.

CODE
[define(`MonAddition',`ifelse(
    processorType_,`PIC16F',`ifelse(
         MGC,`INIT',``movlw $1            ; charger $1 dans W
                      movwf mavariable    ; mavariable vaut maintenant $1
                      movlw $2            ; charger $2 dans W
                      addwf  mavariable,f ; r�sultat : (W) + (mavariable), donc $1 + $2
                                          ; r�sultat sauv� dans mavariable (,f).'',
         MGC,`LOOP',``'',
         MGC,`END',``'')',
    processorType_,processorType_,`ifelse(
         MGC,`INIT',``'',
         MGC,`LOOP',``$3[1] = $1[1] + $2[1];'',
         MGC,`END',``'')')')]
ENDCODE


SUBSECTION(Travail de l'utilisateur,comp) LISTE(Avoir une librairie de
d�finitions M4 pour traduire les ex�cutifs g�n�r�s par SynDEx dans un
langage voulu (assembleur[,] C[,] ...). Certaines librairies ont d�j�
�t� d�finies/cod�es et peuvent �tre t�l�charg�es sur le site de
SynDex. C'est le cas de l'architecture Unix et du protocole TCP/IP et
bus CAN. Si ce n'est pas la cas, il faudra d�velopper une librairie
par vous m�me., Ex�cuter le Makefile pour faire l'expansion des macros
ex�cuter les fichiers
m4 puis compiler les fichiers obtenus pour en faire des ex�cutables et
enfin flasher les processeurs.)

Par exemple voici ma g�n�ration de code pour dsPIC et Unix.
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
/* Pseudo thread de communication USART entre dsPICmaitre et MacBook */
/******************************************************************************/
void thread_comm_USART(int state)
{
    /* ********** */
    /* Phase INIT */
    /* ********** */

    /* La phase d'init ce thread a ete transfere dans */
    /* l'init de la fonction main */

    /* ********** */
    /* Phase LOOP */
    /* ********** */
    while (1)
      {
          /* Les "case" ne sont pas termines par des break :  */
          /* c'est pour pouvoir continuer le code dans les "case" suivants */
          switch (state)
            {
            case -1: /* sert a reboucler */
            case ENVOIMOT_A_DSPICMAITRE_RXTX_EMPTY: /* Suc1 */
                if ((semaphores[[ENVOIMOT_A_DSPICMAITRE_RXTX_EMPTY]] ^= 1) == 1)
                    return;
                USART_read(EnvoiMot_a, 5); /* dsPICmaitre --> MacBook */
                semaphores[[ENVOIMOT_A_DSPICMAITRE_RXTX_FULL]] = 1; /* Pre0: unlock */

            case PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_FULL: /* Suc1 */
                if ((semaphores[[PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_FULL]] ^= 1) == 1)
                    return;
                USART_write(prep_message_out, 5); /* MacBook --> dsPICmaitre */
                semaphores[[PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_EMPTY]] = 1; /* Pre0: unlock */

            default:
                state = -1; /* Re boucle */
                break;
            }                   /* end switch thread comm  */
      }                         /* end loop thread comm */

    /* ********* */
    /* Pahse END */
    /* ********* */

}                               /* end thread comm */

/******************************************************************************/
/* Thread Main                                                                */
/******************************************************************************/
int main(void)
{
    /* ********** */
    /* Phase INIT */
    /* ********** */

    /* Initialisation du thread de comm USART */
    USART_init(); /* spawn */

    semaphores[[PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_EMPTY]] = 1; /* Pre0: unlock */
    thread_comm_USART(-1);
    thread_comm_USART(ENVOIMOT_A_DSPICMAITRE_RXTX_EMPTY); /* Pre1: lock */

    /* ********** */
    /* Phase LOOP */
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

          UnGrosCalcul();

          thread_comm_USART(PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_FULL); /* Pre1: lock */
          thread_comm_USART(ENVOIMOT_A_DSPICMAITRE_RXTX_EMPTY); /* Pre1: lock */
      }  /* end loop thread calcul */

    /* ********* */
    /* Pahse END */
    /* ********* */

    /* Suc0: while until unlock on interrupt */
    while (semaphores[[SEMAPHORE_THREAD_RXTX]] == 0)
        ;
    semaphores[[SEMAPHORE_THREAD_RXTX]] = 0;

    return 0;
}
ENDCODE

<p>STRONG(Note :) L'utilitaire Linux STRONG(indent) permet de formater et de re-indenter le code g�n�r� de fa�on automatique.</p>

SECTION(Conclusion)
SUBSECTION(Le mot de la fin,conclu)
<p>Bien SynDEx soit un logiciel puissant in n'est pas encore capable
  de tout g�rer. Les
   points suivants sont en cours de d�veloppement :</p>
   LISTE(Tol�rance aux pannes : c'est une m�thode qui consiste �
   doubler ou tripler le nombre de processeurs pour �viter qu'une panne
   mat�riel fasse cracher toute l'application. C'est tr�s important pour
   l'avionique)., Des t�ches multi p�riodes : par exemple on d�sire
   ex�cuter la t�che A toutes les 10 ms et la t�che B toutes les 20
   ms. Par cycle A sera ex�cuter 2 fois et B une fois.,Des donn�es
   asynchrones comme l'envoie d'une donn�e par un capteur (cam�ra),
   ...)</p>

<!-- <p>Concernant l'�criture de mon ex�cutif pour dsPIC, je n'ai pas
  encore termin� le code des send_ et receive_. Par contre le
  squelette du programme semble fonctionner. Ensuite il faudra passer
  aux tests.</p>
-->


<!-- <p>Manque la chaine Scicos SynDEx Mplab</p> -->

SUBSECTION(Projet(s) similaire(s))
<p>Il existe au moins un projet similaire pour la g�n�ration automatique de code
pour les processeurs (ds)PIC. EXTLINK(http://www.kerhuel.eu/RTWdsPIC/) </p>

SUBSECTION(Liens)
M4
SYNDEX
Tuto SYNDEX
Mon port s�rie
CyCab

divert(DIVERT_FOOTER_CODE)

END_BODY(,,,,) dnl helico_electronique,helico_asservissement)

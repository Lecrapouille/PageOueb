dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Interpr�teur Forth)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_3D)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Introduction,#intro,Aper�us du jeu,#view,T�l�chargement,#download,Au coeur du Forth,#heart,Liens,#links), BANNIERES)

divert(DIVERT_BODY_CODE)

SUBSECTION(ICON_READ[]R�f�rences � Forth,ref)

<p>Ce document est une tentative de faire d�couvrir ou faire
red�couvrir ce langage, d'expliquer son fonctionnement interne ainsi
que de mieux faire comprendre certains mots dits STRONG(de haut
niveau). Avant de commencer ce tutoriel, je sugg�re aux lecteurs qui
n'ont jamais fait de Forth de s'initier avec le premier lien: Starting
Forth. Sinon, voici une s�lection d'ouvrages et de liens concernant le
langage Forth que je recommande:

LISTE(
DRAP_EN EXTLINK(https://www.forth.com/starting-forth/,Starting Forth)
est le cours d'introduction p�dagogique recommand� pour le d�butant.,

DRAP_FR EXTLINK(https://www.rfc1149.net/download/documents/ifi/forth.pdf,Un cours)
sur le Forth.,

DRAP_EN EXTLINK(http://git.annexia.org/?p=jonesforth.git;a=blob;f=jonesforth.S;h=45e6e854a5d2a4c3f26af264dfce56379d401425;hb=HEAD,JonesForth)
Un excellent tutoriel sur l'impl�mentation d'un interp�teur Forth
�crit en assembleur. Cet document compl�te le livre de W.P. Salman
pour la clart� de son code assembleur.,

DRAP_EN DRAP_FR EXTLINK(https://www.amazon.com/FORTH-W-P-SALMAN/dp/0387912568/,Forth)
W.P. Salman[,] O. Tisserand[,] B. Toulout. Edition Macmillan (english
version) ou Edition Eyrolles (french version) 1983. (ISBN-13:
978-0387912561[,] ISBN-10: 0387912568) est un excellent livre
d�crivant de fa�on compl�te le fonctionnement d'un interp�teur
Forth. Avec ce livre seul[,] il est possible de re-cr�er son propre
Forth. A noter que la version fran�aise 1983 contient quelques erreurs
de typographie dans du code Forth (probablement corrig�s dans la
version de 1984).,

DRAP_FR EXTLINK(https://www.amazon.fr/Concept-Forth-Langage-syst%C3%A8me-dexploitation/dp/2866990110,
Le Concept Forth) de Pascal Courtois (fran�ais). Explique les mots de
base[,] comment fonctionne un interpr�teur Forth mais est moins
complet que le livre Forth de W.P. Salman.,

DRAP_FR EXTLINK(http://jpb.forth.free.fr/,Entrer dans le monde du Forth) Tr�s
belle r�alisation de cartes �lectroniques pour syst�mes Forth.,

DRAP_EN EXTLINK(http://thinking-forth.sourceforge.net/,Thinking Forth) Livre
pour les d�veloppeurs d�butants donnant des conseils sur comment bien
programmer et penser son projet en Forth.,

DRAP_EN EXTLINK(http://lars.nocrew.org/forth2012/index.html,forth2012) le
glossaire Forth ANSI 2012.)

<p>Voici une liste non exhaustive de Forth:

LISTE(
DRAP_EN EXTLINK(https://www.gnu.org/software/gforth/,gForth) le Forth GNU
toujours activement d�velopp�.,

DRAP_EN EXTLINK(https://thebeez.home.xs4all.nl/4tH/4tHmanual.pdf,4th)
un Forth consid�r� comme ne crashant jamais.,

DRAP_EN DRAP_FR EXTLINK(http://christophe.lavarenne.free.fr/ff/,FreeForth) un Forth
fait par Christophe Lavarenne o� le mode ex�cution n'existe plus et
est remplac� par la compilation d'un mot anonyme.,

DRAP_EN EXTLINK(http://www.softsynth.com/pforth,pForth) un Forth portable en C.,

DRAP_EN EXTLINK(https://github.com/seanpringle/reforth,reForth) un Forth �crit en C avec des modifications
  int�ressantes vis � vis des Forth standards.,

DRAP_EN DRAP_FR MYLINK(simtadyn, SimTaDyn) mon projet GIS contenant
  mon propre interpr�teur Forth �crit en C++ et compilable en standalone.)

SUBSECTION(ICON_READ[]Histoire du Forth,intro)

<p>Forth est un langage invent� par Charles H. Moore dans les ann�es
1970 afin de palier la lourdeur des langages de l'�poque incompatibles
pour des applications temps r�el, Moore travaillant � l'�poque �
l'Observatoire National de Radio-Astronomie des Etats-Unis. Forth a
�t� con�u pour �tre le plus simple et minimaliste possible o� avec
environ 150 mots du langage, un petit syst�me d'exploitation peut �tre
cr��. Forth fut, par la suite, devenu un langage largement utilis�
dans ce milieu (comme par la NASA) mais aussi pour des machines
personnelles telles que le Machintosh avec le MacForth (pour ne citer
que lui). Actuellement, le prix du stockage m�moire ayant fortement
baiss� et la puissance brute en calcul augment�e, l'optimisation des
ressources des syst�mes embarqu�s est devenu moins critique, ce
langage est devenu beaucoup moins � la mode l� o� le C demeure
toujours en ma�tre.

<p>Comme nous allons le d�tailler tout le long de ce document, faire
son propre interpr�teur Forth est tr�s simple, chacun pouvant poss�der
le sien mais pas forc�ment compatible avec celui d'un autre. Cela fut
un point noir de ce langage qui malgr� plusieurs tentatives de
standards (78, 79, 83, 2012 ...) pour normaliser les mots les plus
courants ne furent pas forc�ment b�n�fique au langage.

<p>Pour information, Charles H. Moore est toujours actif. Il a quitt�
le consortium, jugeant que cela nuisait � l'innovation, il a ainsi pu
continuer � simplifier les structures Forth comme expliqu� dans
EXTLINK(https://www.rfc1149.net/download/documents/ifi/forth.pdf,le
lien suivant) (conf�re la section Structures simplifi�es). Avec
EXTLINK(https://blogs.msdn.microsoft.com/ashleyf/2013/11/02/the-beautiful-simplicity-of-colorforth/,colorForth)
Moore a ajout� un r�le aux mots en leur ajoutant une couleur. Il a
�galement fond� GreenArrays Inc. qui produit des puces
EXTLINK(http://bitlog.it/programming-languages/getting-started-with-the-ga144-and-arrayforth/,GA144)
contenant un r�seau communicant de sous-processeurs Forth dont
le EXTLINK(https://www.google.com/patents/US7752422,brevet) explique
clairement le fonctionnement (et est tr�s lisible pour un brevet).

<p>Nous allons, tout au long de ce document, revenir sur chaque
�l�ments de la d�finition, mais en quelques mots Forth peut-�tre
r�sum� � :

LISTE(un langage � piles;,

un langage extensible et auto-�volutif (r�-entrance[,] m�taprogrammtion);,

semi-compil� (embarquant son propre compilateur hybrid� avec un interpr�teur);,

peut �tre vu comme un syst�me d'exploitation car il est � la fois un
langage, une machine virtuelle, sait g�rer sa propre m�moire de masse
et dispose d'entr�es/sorties;,

il est � la fois un langage bas-niveau (manipulant de l'assembleur et
des registres hardware) et un langage haut-niveau (abstraction des
donn�es[,] faible couplage[,] etc);,

bien que la plupart des langages soient complets au sens de Turing[,]
Forth offre � l'utilisateur la possibilit� d'acc�der directement aux
diff�rents �l�ments d'une machine de Turing (ruban infini[,] t�te de
lecture/�criture[,] registre d'�tat[,] table d'actions.))

SUBSECTION(ICON_EYES[]Forth un langage alg�brique,algebre)

<p>Forth un langage alg�brique (context-free langage en anglais), qui
contrairement aux langages tels que le C ou Python, n'a pas de
grammaire ambigu�, ne n�cessite pas de r�tro-action lexicale, etc.  Un
script Forth est une simple suite de mots (dont la signification est
proche de celle du langage naturel) s�par�s par des
espaces. L'interpr�teur Forth qui va parser un script (donn� sur le
flux d'entr�e) n'a besoin que d'extraire le mot courant (qui doit �tre
un mot connu) et parfois le mot suivant (quand celui-ci n'est pas
encore connu). Par convention un mot Forth est form� de n'importe
quelle suite de charact�res ASCII (historiquement la taille maximale
d'un mot Forth est de 31 charact�res ASCII mais cette limitation a
disparue sur certains Forth tels que gForth).

<p>Forth utilise la notation polonaise invers�e � savoir que les
op�randes (param�tres) sont not�es avant les op�rateurs. Cette
notation �vite l'utilisation de parenth�ses palliant l'ordre de
priorit� des op�rateurs (par exemple math�matique comme la priorit� de
la multiplication sur l'addition) et �vitant ainsi l'utilisation d'une
grammaire inutilement complexe.

<p>Le code suivant :
CODE
2 3 4 + *
ENDCODE
<p>�quivaut � l'expression arithm�tique 2 * (3 + 4) alors que le code
  suivant :
CODE
2 3 4 * +
ENDCODE
<p>�quivaut � l'expression arithm�tique 2 + (3 * 4).

SUBSECTION(ICON_GEAR[]Forth un langage � piles,pile)

<p>Des langages tels que le C ou python cachent d�lib�r�ment au
d�veloppeur l'utilisation de la pile de donn�es, comme par exemple la
sauvegarde du contexte (param�tres des fonctions, variables locales)
lors d'un appel � une fonction. Ceci pouvant entra�ner des p�nalit�s
en temps d'ex�cution du programme et des d�bordements de la pile (par
exemple soit en passant par copie des donn�es trop grosses, soit en
utilisant la r�cursivit� sur des languages non adapt�s � la r�cursion
terminale tels que le C).

<p>Avec la notation polonaise invers�e, les op�randes sont stock�s
dans une pile de donn�es (structure de type
dernier-entr�-premier-sorti) et les op�rateurs (�quivalent aux
fonctions C mais que l'on nommera d�sormais STRONG(mots) par
convention) les consomment. Par cons�quent, contrairement � des
langages comme le C, la pile �vite � Forth l'utilisation de variables
temporaires nomm�es (�quivalent aux variables locales du C) comme
moyen de stockage de r�sultats interm�diaires et de passage aux
param�tres pour les op�rateurs. N�anmoins Forth offre la possibilit�
d'utiliser des constantes et des variables mais qui doivent �tre vues
comme des noms sur des emplacements m�moire de longue-dur�e
(�quivalent aux globales du C) � savoir que leur dur�e de vie est li�
� celle du programme.

<p>Le code suivant :
CODE
2 DUP + .
ENDCODE

<p>Va empiler l'op�rande 2 dans la pile, puis le mot DUP va dupliquer
le sommet de la pile de donn�es, le mot + consommera les deux valeurs
de la pile et les additionnera et remettre le r�sultat dans la pile
(soit 4) et le mot . consommera le sommet de la pile affichera la
valeur. Apr�s ex�cution de ce script, on notera que la profondeur de
pile des donn�e n'a pas �t� modifi�e.

<p>La pile de donn�es des Forth historiques permet uniquement de
manipuler des entiers (sign�s et non sign�s) ou des adresses de la
machine virtuelle (qui sont finalement vues comme un entier), les
Forth historiques ne g�rant pas nativement les floatants (float et
double du langage C) une biblioth�que devait alors �tre charg�e pour
les g�rer.

<p>En fait, Forth n'utilise pas une seule pile mais deux piles. La
deuxi�me, appel�e pile de retour, sert � l'interpr�teur Forth pour
m�moriser l'ordre d'ex�cution des mots. Cette pile est automatiquement
manipul�e par lui mais laisse, quand m�me, � l'utilisateur la
possibilit� de d�placer et stocker temporairement des �l�ments de la
pile de donn�es (ce qui n'est pas toujours sans risque). Nous y
reviendrons plus tard.

<p>Des Forth modernes peuvent ajouter nativement des piles de donn�es
suppl�mentaires comme une pile d'entiers (appel�s pile alternative)
et/ou une pile des floatants. En g�n�ral, la pile de donn�e
suppl�mentaire pour les entiers permet d'�viter l'utilisation
de la pile de retour comme stockage temporaire.

<p>Un syst�me de s�curit� permet de v�rifier que les piles ne
d�bordent pas (par le haut ou par le bas) et pr�vient l'utiliateur en
arr�tant l'ex�cution du mot en cours. Charles H. Moore quand � lui
pr�f�re utiliser un buffer circulaire par rapport � une pile. Il n'y a
plus de risque possible de d�bordement de m�moire mais il n'a pas
ajout� de syst�me pour p�venir l'utilisateur car selon lui le
d�veloppeur doit ma�triser le nombre d'op�randes qu'il manipule. De
plus, ce syst�me permet de d�cider � tout instant la pile comme �tant
vide.

SUBSECTION(ICON_GEAR[]Dictionnaire Forth: une machine virtuelle,dico)

<p>Forth est un langage extensible : � partir de quelques mots de base
on peut cr�er un nouveau mot plus �volu�. Par exemple, le code
suivant :

CODE
: FOO 2 DUP + . ;
ENDCODE

<p>Permet de d�finir un nouveau mot Forth FOO via les mots : et ; qui
jouent le r�le de d�but et de fin de d�finition. Une fois le mot FOO
d�fini, quand il sera ex�cut�, affichera la valeur 4.

<p>Les mots Forth et leur d�finition sont stock�s dans une structure
de donn�e appel�e par convention dictionnaire. La norme Forth laisse
libre l'impl�mentation du dictionnaire. Les premiers Forth
l'impl�mente comme une liste chain�e; certains Forth s�parent les
entr�es des d�finitions; d'autres utilisent une table de hashage, etc.

<p>Sous la forme d'une liste chain�e, le dictionnaire peut �tre vu
comme le ruban infini divis� en cases cons�cutives de Turing :

CODE
<--- DICTIONARY ENTRY (HEADER) -------->
+--------------+--------+--------------+--------------- - - - -
| LENGTH/FLAGS | NAME   | [LINK] POINTER | DEFINITION
+--------------+--------+--------------+--------------- - - - -
ENDCODE

<p>LISTE(

STRONG(LENGTH :) est le nombre de caract�res ASCII du nom du
mot STRONG(NAME) et est cod� sur les 5 bits de poids faible;,

STRONG(FLAGS) code sur les 3 bits de poids fort les informations
suivantes dont nous reviendrons plus tard en d�tail : LISTE(si le mot
est bien form� (smudge bit);, si le mot doit �tre consid�r� comme
imm�diat;, et le dernier bit toujours � 1 servant de rep�re pour
d�limiter entre-elles les entr�es du dictionnaire.),

STRONG(NAME :) est le nom du mot Forth et le nombre d'octet est
variable mais allant jusqu'� 2<sup>5</sup>-1 caract�res (octets).,

STRONG(lINK POINTER :) est l'adresse de l'entr�e pr�c�dente du
dictionnaire (la liste cha�n�e). L'adresse peut �tre relative ou
absolue[,] la premi�re permettant de d�placer des ensembles d'entr�es
sans devoir modifier les adresses. Le nombre d'octets d'une adresse
d�pend de l'architecture choisie.,

STRONG(DEFINITION :) est une suite d'identifiant ou d'adresse du
dictionnaire pointant sur les mots d�j� existants. Le nombre d'octets
pour coder une adresse ou un indentifiant d�pend de l'architecture
choisie.)

<p>Le dictionnaire poss�de deux informations suppl�mentaires dans son
contexte qui sont eux m�mes des mots Forth :

LISTE(l'emplacement de la derni�re d�finition du dernier mot ins�r�
(mot Forth LATEST);,

le premier emplacement libre du dictionnaire qui peut �tre d�plac�
sorte de t�te de lecture/�criture (mots Forth DP et/ou HERE selon le Forth.).)

Par exemple, le code suivant :
CODE
: FOO * * ;
: BAR FOO . ;
ENDCODE

<p>va cr�er les deux entr�es dans le dictionnaire de la fa�on suivante :
CODE
                   +--------------------+
                   |              +---- | ----------------------------------------+------------+
                   v              v     |                                         |            |
---------------- - - - ---------------- | --------------------------------------- | -----------|------------
| 0x81 | * |            | 0x83 | FOO |     | DOCOL | * | * | EXIT | 0x83 | BAR |    | DOCOL | FOO | . | EXIT
---------------- - - - ------------------------|-----|---|----|--------------------------|-------------------
         ^                                     |     |   |    |                          |
         |                     <-- - - - ------+     |   |    v          <-- - - - ------+
         +-------------------------------------------+---+
ENDCODE

<p>Les fl�ches repr�sentent les adresses vers les autres mots du
dictionnaire. Vu que BAR a �t� ins�r� dans le dictionnaire apr�s FOO
son STRONG([link] POINTER) pointe vers FOO et LATEST pointe vers
BAR. Les litt�raux 0x81, 0x83 (notation base 16) sont les tailles des
mots avec le marqueur de s�paration des entr�es du dictionnaire. Les
mots Forth DOCOL et EXIT sont des mots particuliers que l'on d�crira
plus tard.

<p>A chaque fois qu'un mot est ins�r� � la d�finition d'un mot, c'est
le mot HERE qui indique l'emplacement. Apr�s l'ajout HERE est d�plac�
pour toujours pointer sur un emplacement libre.

<p>Forth se pr�te bien � la r�cursivit� mais la syntaxe varie
fortement d'un Forth � un autre.
CODE
: FACTORIELLE
 DUP 1 >
  IF
   DUP 1 - FACTORIELLE *
 THEN ;
ENDCODE

<p>Une recherche dans un dictionnaire se fait lin�airement depuis
LATEST en comparant les noms des mots avec celui � rechercher donc une
recherche en temps O(n). C'est l'inconv�nient majeur de ce type de
dictionnaire. Pour palier � ce probl�mes des mots Forth peuvent �tre
regroup�s en vocabulaires. Le vocabulaire est l'anc�tre des espaces
des langages modernes. Un dictionnaire peut �tre vu comme un arbre o�
une recherche partirait d'un feuille (le vocabulaire sp�cifi�) et se
terminerait � la racine de l'arbre. Cela � pour inconv�nient que si
l'on cherche depuis le mauvais vocabulaire un mot ne peut pas �tre
retrouv�.

<p>Moore avec son colorForth est pass� � une table de hashage et pour
compresser les noms des mots Forth utilise un codage de Huffman.

<p>Rappelons qu'un des flags dans l'ent�te d'une entr�e indique si le
mot est valide ou non (c'est le smudge bit). S'il est mis, alors il
sera ignor� lors d'une recherche. Selon le Forth utilis�, lorsqu'une
ent�te est cr��e dans le dictionnaire LATEST ne pointe pas encore
dessus ou le smudge bit est mis tant que le mot ; n'est pas ex�cut�
effa�ant le bit. Ceci peut poser des probl�mes de syntaxe avec la
r�cursivit� sur certain Forth (o� il faut utiliser le mot SMUDGE dans
la d�finition qui commute le flag en question).

<p>La recherche s'arr�tant au premier mot trouv�, on peut donc
�craser une ancienne d�finition comme il suit :
CODE
: FOO * * ;
: BAR FOO . ;
: FOO + + ;
: BAR FOO . ;
ENDCODE

<p>Le mot FORGET suivit d'un mot existant (par exemple FORGET FOO)
permet de tronquer toutes les d�finitions du dictionnaire jusqu'� ce
mot. FORGET change simplement la valeur de LATEST. On prendra garde �
ne pas supprimr tout le dictionnaire en tentant par exemple de
supprimer le premier mot du dictionaire.


SUBSECTION(ICON_GEAR[]Fonctionnement de interpr�teur externe,interpreteur)

<p>Un interpr�teur Forth fonctionne tr�s simplement : tant que le flux
d'entr�e n'est pas fini, les mots sont lus les uns apr�s les
autres. L'interpr�teur poss�de deux modes : soit il est mode
ex�cution, soit il est en mode compilation.

<p>En mode EXECUTION : LISTE(Si le mot lu est connu du dictionnaire
alors il est alors ex�cut�;, sinon le parseur v�rifie que le mot lu
n'est pas un nombre (dans la base actuelle) : si c'est le cas alors un
nombre est alors d�pos� dans la pile de donn�es;, sinon le mot n'est
pas connu et n'est pas un nombre : une erreur pr�vient l'utilisateur
et arr�te le processus.)

<p>En mode COMPILATION les mots non-imm�diats qui sont lus, s'ils sont
connus du dictionnaire, sont ajout�s les uns � la suite des autres au
dans la d�finition courante du dictionnaire. Si un mot n'est pas connu
une erreur pr�vient l'utilisateur et arr�te le processus.

<p>Des peux de mots Forth que l'on a vus, c'est le mot : qui force le
mode COMPILATION de l'interpr�teur alors que le mot ; le fait passer
en mode EXECUTION. On peut d�ja se poser la question comment l'inter
peut passer en mode ex�cution avec le mot ; s'il ne fait que compiler
tous les mots qu'il voit; logiquement, il ne devrait jamais s'arr�ter
de compiler. La r�ponse vient du champ STRONG(FLAGS) o� l'un des bits
permet de rendre un mot Forth imm�diat. Par imm�diat on sous-entend
que le mot sera imm�diatement ex�cut� m�me si l'interpr�teur est en
mode compilation. Attention: un mot imm�diat ne commute pas le mode de
l'interpr�teur : il est simplement interpr�t� !

On raffine donc le d�finition et l'on profite pour ajouter un cas
particulier :
<p>En mode COMPILATION : LISTE(les mots non imm�diats lus[,] s'ils
sont connus du dictionnaire[,] sont ajout�s les uns � la suite des
autres au dictionnaire dans la d�finition courante;, Si le mot est
imm�diat et connu du dictionnaire il est alors interpr�t�;, si le mot
n'est pas connu il est test� pour savoir si c'est un nombre : si oui,
il est ajout� � la d�finition mais on intercalera avant le mot
LITTERAL pour ne pas l'interpr�ter comme un mot Forth; sinon le mot
n'est pas connu une erreur pr�vient l'utilisateur et arr�te le
processus.)

<p>Si l'inter lit tous les mots les uns apres les autres, avec le code
CODE
: FOO * * ;
ENDCODE
<p>FOO n'etant pas d�fini, l'interpr�teur devrait d�clencher une
erreur. En fait non, car comme on l'a dit l'interpr�teur sait lire le
mot suivant et le mot : quand il est ex�cut� va lire le mot suivant, �
savoir FOO afin de cr�er une nouvelle entr�e dans le dictionaire. Par
cons�quent le mot suivant que l'interpr�teur va lire sera *.

<p>L'interpr�teur Forth � deux modes (�tats) soit il est en mode
interpr�tation soit en mode compilation. Des mots comme : et ;
permettent respectivement de passer en mode compilation puis
interpr�tation.  LISTE(En mode interpr�tation[,] la d�finition des
mots lus sont recherch�s dans le dictionnaire puis ex�cut�s., En mode
compilation[,] une ent�te dans le dictionnaire est cr��e afin de
permettre de retrouver le nouveau mot[,] puis chaque mot lus[,] s'ils
ne sont pas consid�r�s comme imm�diats[,] sont recherch�s dans le
dictionnaire et leur r�f�rence stock�e dans la d�finition du mot en
  cours de d�finition.)

<p>Le mot IMMEDIAT rend imm�diat le dernier mot du dictionnaire. Voici
un exemple plus �volu� : on se propose d'ajouter un syst�me de
commentaires � Forth. Pour cela on suppose que le mot TYPE existe d�j�
(ce qui en g�n�ral le cas) ce mot permet d'ignorer les caract�res du
tampon d'entr�e jusqu'au charact�re indiqu� comme param�re.

CODE
: ( ')' TYPE ; IMMEDIATE
ENDCODE

<p>D�s que le parseur ex�cutera le mot ( il ignorera tous les mots
jusqu'� trouver le mot ) et comme il est imm�diat il va fonctionner
dans une d�finition (quand l'interpr�teur sera en mode
compilation). Notons qu'il existe un autre type de commentaire Forth
le mot \ ignore enti�rement la ligne courante.

SUBSECTION(ICON_GEAR[]Fonctionnement de interpr�teur interne,interpreteur)

SUBSECTION(ICON_GEAR[]Variables et constante,var)

<p>Nous avons vu que Forth permet de stocker des
dnl https://fr.wikiversity.org/wiki/Forth/Conserver_des_donn%C3%A9es

divert(DIVERT_FOOTER_CODE)

END_BODY(simtadyn,Le projet SimTaDyn,,)

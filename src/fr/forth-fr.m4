dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Interpr�teur Forth)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_3D)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Introduction,#intro,Aper�us du jeu,#view,T�l�chargement,#download,Au coeur du Forth,#heart,Liens,#links), BANNIERES)

divert(DIVERT_BODY_CODE)

SUBSECTION(Histoire du Forth,intro)

<p>Ce document est une tentative de faire d�couvrir ou red�couvrir ce
langage, d'expliquer son fonctionnement interne ainsi que de mieux
faire comprendre certains mots dits BOLD(de haut niveau) en
esp�rant ne pas �tre un Ni�me tutoriel.

<p>Forth est un langage invent� par Charles H. Moore dans les ann�es
1970 afin de palier la lourdeur des langages de l'�poque incompatibles
pour des applications temps r�el, Moore travaillant � l'�poque �
l'Observatoire National de Radio-Astronomie des Etats-Unis. Forth a
�t� con�u pour �tre le plus simple et minimaliste possible o� avec
environ 150 mots du langage, un petit syst�me d'exploitation peut �tre
cr��. Forth fut, par la suite, devenu un langage largement utilis�
dans ce milieu (comme la NASA) mais aussi pour des machines
personnelles telle que le Machintosh avec le MacForth (pour ne citer
que lui). Actuellement, le prix du stockage m�moire ayant fortement
baiss� et la puissance brute en calcul augment�e, l'optimisation des
ressources en m�moire des syst�mes embarqu�s est devenu moins
critique, ce langage est devenu beaucoup moins � la mode l� o� le C
demeure toujours en ma�tre.

<p>Comme nous le verrons plus tard, faire son propre interpr�teur
Forth est tr�s simple, chacun pouvant poss�der le sien mais pas
forc�ment compatible avec celui d'un autre. Cela fut un point noir de
ce language qui malgr� plusieurs tentatives de standards (78, 83,
2012 ...) pour normaliser les mots les plus courants ne furent pas
forc�ment b�n�fique au langage.

<p>Pour information, Charles H. Moore est toujours actif. Il a quitt�
le consortium, jugeant que cela nuisait � l'innovation, il a ainsi pu
continuer � simplifier les structures Forth comme expliqu� dans
EXTLINK(https://www.rfc1149.net/download/documents/ifi/forth.pdf,le
lien suivant) (section Structures simplifi�es). Avec
EXTLINK(https://blogs.msdn.microsoft.com/ashleyf/2013/11/02/the-beautiful-simplicity-of-colorforth/,colorForth)
Moore a ajout� un r�le aux mots en leur ajoutant une couleur. Il a
�galement fond� GreenArrays Inc qui produit des puces
EXTLINK(http://bitlog.it/programming-languages/getting-started-with-the-ga144-and-arrayforth/,GA144)
qui contiennent un r�seau communicant de sous-processeurs Forth dont
le EXTLINK(https://www.google.com/patents/US7752422,brevet) explique
clairement le fonctionement (et est tr�s lisible pour un brevet).

<p>Nous allons, tout au long de ce document, revenir sur chaque
�l�ments de la d�finition, mais en quelques mots Forth peut-�tre
r�sum� � : LISTE(un langage � piles;, � la fois langage bas-niveau
(manipulant de l'assembleur et des registres hardware) et langage
haut-niveau (abstraction des donn�es[,] faible couplage[,] etc);, un
langage auto-�volutif/modifiant (r�-entrance[,] m�taprogrammtion);,
semi-compil� (embarquant son propre compilateur hybrid� avec un
interpr�teur);, embarquant sa propre machine virtuelle (servant de
stockage au byte-code g�n�r� par le compilateur et de stockage aux
ressources du syst�me).)

SUBSECTION(Forth un langage alg�brique,algebre)

<p>Forth un langage alg�brique (context-free langage en anglais), qui
contrairement aux langages tels que le C ou Python, n'a pas de
  grammaire ambigu�, ne n�cessite pas de r�tro-action lexicale, etc.

<p>Un script Forth est une simple suite de mots (dont la signification
est proche de celle du langage naturel) s�par�s par des
espaces. L'interpr�teur Forth qui va lire un flux d'entr�e n'a besoin
que d'extraire le mot courant (qui doit �tre un mot connu) et parfois
le mot suivant (quand celui-ci n'est pas encore connu). Par convention
un mot Forth est form� de n'importe quelle suite de charact�res ASCII
(historiquement la taille maximale d'un mot Forth est de 31
charact�res ASCII mais cette limitation a disparue sur certains Forth
tels que gForth).

<p>Forth utilise la notation polonaise invers�e � savoir que les
op�randes (param�tres) sont not�es avant les op�rateurs. Cette
notation �vite l'utilisation de parenth�ses palliant l'ordre de
priorit� des op�rateurs (par exemple math�matique comme la priorit� de
la multiplication sur l'addition) et �vitant ainsi l'utilisation d'une
grammaire inutilement complexes.

<p>Le code exemple suivant :
CODE
  2 3 4 + *
ENDCODE
<p>�quivaut � l'expression arithm�tique 2 * (3 + 4) alors que le code
  suivant :
CODE
  2 3 4 * +
ENDCODE
<p>�quivaut � l'expression arithm�tique 2 + (3 * 4).

SUBSECTION(Forth un langage � piles,pile)

<p>Gr�ce � la notation polonaise invers�e les op�randes sont stock�s
dans une pile de donn�es (structure de type
dernier-entr�-premier-sorti) et les op�rateurs (�quivalent aux
fonctions C mais que l'on nommera d�sormais BOLD(mot) par convention)
les consomment.

<p>Des langages tels que le C ou python cachent d�lib�rement au
d�veloppeur l'utilisation de cette pile. Par exemple la sauvegarde du
contexte (param�tres des fonctions, variables locales) lors d'un appel
� une fonction ce qui peut entrainer des p�nalit�s en temps
d'�xecution du programme et des d�bordements de piles (par exemple
soit en passant par copie des donn�es trop grosses, soit en utilisant
la r�cursivit� sur des lanaguages non adapt�s � la r�cursion terminale
tels que le C).

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

<p>La pile de donn�es des Forth historiques permet de manipuler
uniquement des entiers sign�s (et non sign�s) ou des adresses de la
machine virtuelle (qui sont finalement vues comme un entier) et ne
g�rent pas nativement les floatants (float et double du langage C) une
biblioth�que devait �tre charg�es pour cela.

<p>En fait, Forth n'utilise pas une seule pile mais deux. La deuxi�me
appel�es pile de retour sert � l'interpr�teur Forth pour m�moriser
l'ordre d'ex�cution des mots. Cette pile est automatiquement g�r�e par
lui mais laisse quand m�me � l'utilisateur la possibilit� de stocker
temporairement des �l�ments de la pile de donn�es (ce qui n'est pas
toujours sans risque). Nous y reviendrons plus tard.

<p>Des Forth modernes peuvent ajouter nativement des piles de donn�es
suppl�mentaires comme une pile d'entiers (appel�s pile alternative)
et/ou une pile des floatants natifs. En g�n�ral la pile de donn�e
suppl�mentaire pour les entiers permet d'�viter l'utilisation
temporaire de la piles de retour.

<p>Un syst�me de s�curit� permet de v�rifier que les piles ne
d�bordent pas par le haut ou par le bas (overflow/underflow) et
pr�vient l'utiliateur. Charles H. Moore quand � lui pr�f�re utiliser
un buffer circulaire � la place d'une pile. Il n'y a plus de risque
possible de d�bordement de m�moire mais il n'a pas ajout� de syst�me
pour p�venir l'utilisateur car selon lui le d�veloppeur doit ma�triser
le nombre d'op�randes qu'il manipule. De plus ce syst�me permet de
d�cider � tout instant la pile comme �tant vide.

SUBSECTION(Dictionnaire,dico)

<p>Forth est un langage qui auto-�volue: � partir de quelques mots de
base on peut cr�er un nouveau mot plus �volu�. Par exemple, le code
suivant:

CODE
: FOO 2 DUP + . ;
ENDCODE

Permet de d�finir un nouveau mot Forth FOO via les mots : et ; qui
jouent le r�le de d�but et de fin de d�finition. Une fois d�finie, le
moto FOO quand il sera ex�cut� affichera la valeur 4.

<p>Les mots Forth et leur d�finition sont stock�s dans une structure
de donn�e appel�e dictionnaire permettant de rechercher la d�finition
d'un mot existant, d'ajouter une nouvelle d�finition et, on le verra
plus tard, servant �galement de tas (heap) que les d�veloppeurs C/C++
utilisent connaissent pour allouer/d�sallouer des ressources. La norme
Forth n'impose pas

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

<p>Autre exemple plus �volu�, s'il l'on suppose que le mot TYPE existe
  et qu'il ignore les caract�res du tampon d'entr�e (l� o� un
  utilisateur Forth va �crire son code) jusqu'au charact�re indiqu�,
  on peut facilement modifier l'interpr�teur Forth pour la gestion des
  commentaires.
CODE
: ( ')' TYPE ; IMMEDIATE
ENDCODE
<p>D�s que le parseur ex�cutera le mot ( il ignorera tous les mots
  jusqu'� trouver le mot ) on notera que le mot rendu imm�diat via
  IMMEDIATE sera ex�cut� lorsqu'il sera rencontr� dans une
  d�finition. Dans notre cas cela permet d'ajouter des commentaires �
  l'int�rieur


<p>Forth peut �tre vu comme une machine virtuelle



SUBSECTION(Langage �volutif,evol)

<p>Forth est un langage qui auto-�volue: � partir de quelques mots de
base on peut cr�er un nouveau mot plus �volu�.



  qui, par exemple pourra
�ventuellement modifier le comportement de l'interp�teur, ou cr�er sa
propre structure de langage comme ajouter les IF THEN ELSE, boucle FOR
WHILE.



SUBSECTION(R�f�rences,ref)

Voici une s�lection d'ouvrages et de liens concernant le langage Forth que je
recommande: le parseur s�parant les

LISTE(
EXTLINK(https://www.forth.com/starting-forth/,Starting Forth)
est le cours d'introduction p�dagogique recommand� pour le d�butant.,

EXTLINK(https://www.amazon.fr/Concept-Forth-Langage-syst%C3%A8me-dexploitation/dp/2866990110,
Le Concept Forth) de Pascal Courtois (fran�ais). Explique les mots de
base[,] comment fonctionne un interpr�teur Forth mais est moins
complet que le livre Forth de W.P. Salman.,

EXTLINK(http://lars.nocrew.org/forth2012/index.html,forth2012) le
glossaire Forth ANSI 2012.,

EXTLINK(https://www.amazon.com/FORTH-W-P-SALMAN/dp/0387912568/,Forth)
W.P. Salman[,] O. Tisserand[,] B. Toulout. Edition Macmillan (english
version) ou Edition Eyrolles (french version) 1983. (ISBN-13:
978-0387912561[,] ISBN-10: 0387912568) est un excellent livre
d�crivant de fa�on compl�te le fonctionnement d'un interp�teur
Forth. Avec ce livre seul[,] il est possible de re-cr�er son propre
Forth. A noter que la version fran�aise 1983 contient quelques erreurs
de typographie dans le code Forth (probablement corrig�s dans la
version de 1984).,

EXTLINK(http://git.annexia.org/?p=jonesforth.git;a=blob;f=jonesforth.S;h=45e6e854a5d2a4c3f26af264dfce56379d401425;hb=HEAD,JonesForth)
Un exc�llent tutoriel sur l'impl�mentation d'un interp�teur Forth
�crit en assembleur. Cet document compl�te le livre de W.P. Salman
pour la claret� de son code assembleur.,

EXTLINK(http://jpb.forth.free.fr/,Entrer dans le monde du Forth) Tr�s
belle r�alisation de cartes �lectroniques pour syst�mes Forth.,

EXTLINK(http://thinking-forth.sourceforge.net/,Thinking Forth) Livre
pour les d�veloppeurs d�butants donnant des conseils sur comment bien
programmer et penser son projet en Forth.,

EXTLINK(https://blogs.msdn.microsoft.com/ashleyf/2013/11/02/the-beautiful-simplicity-of-colorforth/,ColorForth)
Charles H. Moore, l'inventeur de ce langage, ayant d�cid� de quitter
le consortium car selon lui la normalisation du lanaguage emp�chait
d'innover, a d�velopp�

EXTLINK(http://christophe.lavarenne.free.fr/ff/,FreeForth) un Forth fait
par Christophe Lavarenne.
)

SUBSECTION(Au coeur du Forth,heart)



SUBSECTION(T�l�chargement,download)

TABLEAU(3,LINK(myforth/quentin_quadrat-myforth_0.3.tar.bz2,Version 0.3),
LINK(myforth/quentin_quadrat-myforth_0.2.tar.bz2,Version 0.2),
LINK(myforth/quentin_quadrat-myforth_0.1.tar.bz2,Version 0.1),
ICON_TGZ,ICON_TGZ,ICON_TGZ,
2 Mo --- format BZ2,
2 Mo --- format BZ2,
2 Mo --- format BZ2)

SUBSECTION(Liens)

<p>Vous pouvez telecharger le livre BOLD(Le concept FORTH) de Pascal COURTOIS (avec son aimable autorisation) sur :
LINKFORTH.</p>
<p>D'autres liens int�r�ssants :</p>
LISTE(
LINK(http://jpb.forth.free.fr/,Entrer dans le monde du Forth) Tr�s belle carte �lectronique.,
LINK(http://christophe.lavarenne.free.fr/ff/,FreeForth) fait par Christophe Lavarenne.,
LINK(http://forth.free.fr/,Site sur le Forth) o� on peut t�l�charger les scans du livre BOLD(Le concept FORTH).)

divert(DIVERT_FOOTER_CODE)

END_BODY(simtadyn,Le projet SimTaDyn,,)

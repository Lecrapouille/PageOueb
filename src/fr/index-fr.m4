dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

dnl DEF_TITLE(Quentin QUADRAT - Ing�nieur informaticien des syst�mes temps r�el (EPITA))
DEF_TITLE(Page personelle de Quentin QUADRAT)
DEF_KEYWORDS(Programmation temps r�el systeme embarque tutorial Scicos SynDEx
Scilab jeux 3D opengl delphi forth quadrirotor quadricoptere drone)
DEF_DESCRIPTION(Page personelle de Quentin QUADRAT)
MENU_ACTIF(MENU_HOME)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(
LEFT_RUBRIC(Projets sur le temps r�el,Projet H�licopt�re quatre
rotors,helico_intro-LANG.html,Suivi automatique de voiture
CyCab,stages_travail2-LANG.html),

LEFT_RUBRIC(Tutoriels sur le TR,Le logiciel Scilab/Scicos,tuto_scicos-LANG.html,Le logiciel SynDEx,tuto_syndex-LANG.html,
Programmation du port s�rie,comm_rs232-LANG.html),

LEFT_RUBRIC(Projets Informatiques,Interpr�teur
Forth,myforth-LANG.html,SimTaDyn,simtadyn-LANG.html,Ecstasy,ecstasy-LANG.html,SpeedWay,speedway-LANG.html),

LEFT_RUBRIC(Tutoriels,Dynamique d'une voiture,tuto_dyna-LANG.html,Les
arbres de partitionnement binaire de l'espace,tuto_bsp-LANG.html,Chargeur
de fichier ASE,tuto_ase-LANG.html,Programmation avec le langage de macro M4,tuto_m4-LANG.html),

LEFT_RUBRIC(Exp�rience professionnelle,CV,cv-LANG.html,Stages �
l'INRIA Rocquencourt,tuto_syndex-LANG.html),BANNIERES)

divert(DIVERT_BODY_CODE)

<!-- ICON_BUILD STRONG(ATTENTION l'ensemble de ce site est en construction) -->

<!-- <p>STRONG(Chapitrage :)</p>
<ul>
<li>LINK(helico_intro-LANG.html,Construction d'un h�licopt�re quatre rotors)</li>
<li>LINK(stages_travail2-LANG.html,Voiture CyCab)</li>
<li>LINK(myforth-LANG.html,Interpr�teur Forth)</li>
<li>LINK(simtadyn-LANG.html,Le projet SimTaDyn)</li>
<li>LINK(ecstasy-LANG.html,Le projet Ecstasy)</li>
<li>LINK(speedway-LANG.html,Le projet SpeedWay)</li>
<li>LINK(dyna-LANG.html,Dynamique simplifi�e d'une voiture)</li>
<li>LINK(bsp-LANG.html,Elimination des parties cach�es)</li>
<li>LINK(ase-LANG.html,Le format ASE)</li>
<li>LINK(stages_presentation-LANG.html,Stages)</li>
</ul> -->

SECTION(Projets sur les syst�mes embarqu�s et le temps r�el,tr)
SUBSECTION(ICON_GEAR[]Construction d'un h�licopt�re quatre rotors,helico,helico_intro)

<p>Etude et r�alisation d'une plateforme volante � quatre
   rotors du type Dragonflyer, X-UFO ou Engager.</p>
<p>Cette �tude comprend les parties suivantes :</p>
LISTE(construction de la carcasse de l'h�licopt�re et du banc de test, r�alisation
de la carte �lectronique, programmation des microcontr�leurs de
la commande automatique, communication avec un ordinateur non
embarqu�.)

<p>ICON_BUILD STRONG(PROJET EN COURS DE REALISATION).</p>

SUBSECTION(ICON_GEAR[]Stage � l'INRIA sur du suivi automatique de voitures
CyCab,cycab,stages_travail2)

<p>Le CyCab est un v�hicule �lectrique de 300 Kg d�velopp� �
   l'INRIA destin� au transport de deux personnes dans des
   environnements urbains et p�ri-urbains encombr�s. Sa longueur
   n'exc�de pas celle d'un v�lo, c'est-�-dire 1.9 m�tre pour une
   largeur de 1.2 m�tre. Le but de mon stage � l'INRIA Rocquencourt a
   �t� de poursuivre un travail men� sur le suivi automatique de
   CyCabs avec une cam�ra bas co�t et les logiciels Scilab, Scicos et
   SynDEx.</p>

SECTION(Tutoriels concernant le temps r�el,tutotr)

SUBSECTION(ICON_READ[]Le logiciel de de mod�lisation et de simulation
Scicos,tuto_scicos,tuto_scicos)
<p>Scicos est un logiciel de mod�lisation graphique pour
  syst�mes dynamiques et est une boite � outil inclus dans le logiciel
  Scilab. Avec Scicos on peut cr�er des blocs diagrammes pour
  mod�liser et simuler la dynamique de syst�mes hybrides et compiler
  des mod�les dans un code ex�cutable. Scicos est utilis� pour le
  traitement du signal et la commande automatique et �tudier des
  syst�mes physique et biologiques.</p>

<p>Comme ce logiciel est utilis� pour le d�veloppement de mon
   MYLINK(helico_intro,h�licopt�re quatre rotors), j'explique ici son
   fonctionnement, comment lier des biblioth�ques C dans ses blocs
   diagrammes et comment le configurer pour l'interfacer dans une
   application temps r�el (en boucle avec un syst�me embarqu�).</p>

SUBSECTION(ICON_READ[]Le logiciel SynDEx,tuto_syndex,tuto_syndex)

<p>SynDEx est un logiciel de CAO bas� sur la m�thodologie AAA
   "algorithm-architecture adequation", pour le prototypage rapide et
   l'optimisation de l'impl�mentation d'applications temps r�el
   distribu�e sur des architectures multicomposents. Il a �t� design�
   puis d�velopp� � l'INRIA Rocquencourt par l'�quipe AOSTE.</p>

<p>Comme ce logiciel est utilis� pour le d�veloppement de mon
   MYLINK(helico_intro,h�licopt�re quatre rotors), j'explique ici son
   fonctionnement, comment utiliser son IHM et comment convertir des
   blocs diagrammes Scicos vers SynDEx.</p>

SUBSECTION(ICON_READ[]Programmation du port s�rie au standard POSIX,comm_rs232,comm_rs232)
<p>ICON_BUILD[]Ce tutoriel explique le fonctionnement du port s�rie et
  la norme RS232, puis montre les fonctions POSIX pour d�velopper son
  propre protocole.</p>

SECTION(Projets en informatique,infos)
SUBSECTION(ICON_GEAR[]Interpr�teur Forth,myforth,myforth)

<p>MyForth est un interpr�teur de langage Forth en cours de
   r�alisation qui devrait �tre, � terme, multit�che. Le Forth est un
   langage � pile qui poss�de un dictionnaire de mots agissant sur la
   pile. Un programme Forth d�finit de nouveaux mots qui s'ajoutent �
   ce dictionnaire. Il poss�de des m�canismes simples et g�n�raux
   permettant de construire de nouveaux types de donn�es
   efficaces.</p>

<p>ICON_BUILD STRONG(PROJET ARRETE).</p>


SUBSECTION(ICON_GEAR[]SimTaDyn,simtadyn,simtadyn)

<p>SimTaDyn est un prototype de tableur sp�cialis� dans la gestion
   d'objets dynamiques 2D comme les cartes g�ographiques ou les
   mailleurs 2D.  Il permet l'�dition d'objets 2D qui sont des pavages
   du plan manipulables comme des cellules d'une feuille d'un
   tableur. A chaque pav� peut-�tre associ� � une dynamique d�finie
   par un mot Forth. Un pav� est polygonal, ses bords et ses sommets
   sont eux aussi vus comme des cellules d'un tableur. On peut donc
   aussi leur associer des mots Forth.</p>

SUBSECTION(ICON_GEAR[]Ecstasy,ecstasy,ecstasy)

<p>Ecstasy est un jeu en 3D. Le joueur conduit un voiture dans une
  ville de type am�ricaine construite sur un tore. Elle est
  constitu�e d'immeubles, de terrains, d'un fleuve et d'une
  centaine de voitures qui s'arr�tent aux feux tricolores.
  Chaque voiture est un mod�lis�e par un syst�me
  m�canique � 9 degr�s de libert�.</p>


SUBSECTION(ICON_GEAR[]SpeedWay,speedway,speedway)

<p>Speedway est un jeu de tirs en 3D, o� des voitures divis�es en deux
   camps se combattent.  On peut jouer sur une demie douzaine de
   cartes et avec une dizaine de v�hicules diff�rents.</p>

SECTION(Tutoriels)
SUBSECTION(ICON_READ[]Programmation avec le langage de macro M4,qqm4,tuto_m4)
<p>ICON_BUILD[]Ce tutoriel explique le fonctionnement du langage de
  macro M4.</p>


SUBSECTION(ICON_READ[]Dynamique d'une voiture,dynavoit,tuto_dyna)

<p>Comment simuler une voiture avec sa suspension dans un jeu ? Tout
   d'abord, vous trouverez un bref rappel sur le principe de la
   moindre action.  Apr�s, on abordera l'�tude du tangage d'une moto :
   le v�hicule est mod�lis� en 2D, par une carcasse repr�sent�e par
   une barre de masse ponctuelle � laquelle sont accroch�es deux roues
   par des ressorts. Enfin, on attaquera l'�tude du roulis et du
   tangage d'une voiture : le v�hicule est mod�lis� en 3D, par une
   plaque � laquelle sont accroch�es quatre roues par des
   ressorts.</p>


SUBSECTION(ICON_READ[]Les arbres de partitionnement binaire de l'espace,bsp,tuto_bsp)

<p>L'un des probl�mes importants lors d'une projection d'une sc�ne
   graphique, qu'elle soit en 2D ou en 3D, est d'�liminer ses parties
   cach�es. Cet expos� va pr�senter un algorithme pour r�soudre ce
   probl�me : l'algorithme de partitionement binaire de l'espace
   (Binary Space Partition en Anglais ou BSP), qui permet d'afficher
   les objets les plus �loign�s aux plus proches.</p>


SUBSECTION(ICON_READ[]Le format ASE de 3D Studio Max,ase,tuto_ase)
<p>Lorsque vous utilisez 3D Studio Max, il se peut que vous voulez
   exporter votre dessin pour pouvoir l'utiliser dans votre jeu. L'un
   des nombreux formats d'exportation est le format ASE (ASCII Scene
   Export). Quelle est sa syntaxe ? Quelles sont les similitudes avec
   celle d'OpenGL ? Vous trouverez ici comment exporter une sc�ne
   statique compos�e d'une cam�ra et de plusieurs objets ainsi que
   leur texture.</p>

SECTION(Exp�rience professionnelle)
SUBSECTION(ICON_EYES[]Aide � la conception de noyau applicatif pour le
logiciel SynDEx,syndex,stages_presentation)
<p>Mes deux stages � l'INRIA Rocquencourt, au sein de l'�quipe AOSTE.</p>

SUBSECTION(ICON_EYES[]Curriculum Vitae,cv,cv)

<p>Acc�der � mon curriculum vitae (format html et pdf).</p>

divert(DIVERT_FOOTER_CODE)

END_BODY(,,plansite,Plan du site)

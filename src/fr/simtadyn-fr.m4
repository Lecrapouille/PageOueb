dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Projet SimTaDyn : Simulation Tableur Dynamique)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_3D)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Pr�sentation,#intro,Aper�us de SimTaDyn,#view,Telechargement,#download,Au coeur de SimTaDyn,#heart,Liens,#links),BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Le projet SimTaDyn)
SUBSECTION(ICON_READ[]Pr�sentation,intro)

<p>SimTaDyn (acronyme pour Simulation Tableur Dynamique) est un
   prototype de tableur sp�cialis� dans la gestion dynamique de cartes
   g�ographiques. Le but est de dessiner une carte g�ographique puis
   de la manipuler comme une feuille de tableur en faisant dessus des
   calculs complexes gr�ce � un langage interpr�t�. Un exemple typique
   est la r�solution de syst�me par la m�thode des �l�ments finis.</p>

<p>SimTaDyn est un projet info sp� EPITA (2003-2004) libre et gratuit,
   m�me les sources. Il a �t� fait en C, GTK, Opengl et MySQL.  Il
   fonctionne sur Mac Os X 10.3 avec X11 et sur une distribution Linux
   (Mandrake 9.1 par exemple) ou Unix. Il n'a pas �t� test� sur
   Windows !!!</p>

<p>Les auteurs sont :</p>
LISTE(Minh-Long NGUYEN,Benoit MARCOT,Quentin QUADRAT)

<p>STRONG(NOTE :) Cela fait exactement SIMTADYN_ANNIVERSARY ans que
  mes deux comparses, qui m'ont servis d'esclaves-d�veloppeurs, n'ont
  strictement rien compris au but de ce logiciel !? Ca fait plaisir
  ;0) !!</p>

SUBSECTION(ICON_EYES[]Aper�us de SimTaDyn,view)

TABLEAU(3,CAPTION(simtadyn/window.jpg),
CAPTION(simtadyn/utilisation.jpg),
CAPTION(simtadyn/squelette.jpg))
CENTER(Cliquer sur les images pour les agrandir.)


SUBSECTION(ICON_GEAR[]Au coeur de SimTaDyn,heart)


<p>Un tableur est un �diteur de feuilles de calcul, � savoir des
   tables de cellules formant un pavage rectangulaire. Chaque cellule
   contient des donn�es de type divers y compris des fonctions
   susceptibles de faire du calcul sur son contenu et celui des autres
   cellules.</p>

<p>Un Syst�me d'Information G�ographiques (SIG) est un autre type
   d'�diteur manipulant des tables contenant des champs ayant des
   interpr�tations g�ographiques. Elles sont repr�sent�es par des
   cartes permettant d'acc�der facilement aux champs n'ayant pas
   d'interpr�tations g�ographiques. De plus, les SIG ne contiennent
   pas de fonctions susceptibles d'agir sur la table donc sur la
   carte. L'acc�s aux champs non g�ographiques est obtenu en pointant
   sur un objet particulier. Seuls les champs de l'objet d�sign� sont
   affich�s contrairement aux tableurs qui essaient toujours de
   montrer l'ensemble des donn�es. Par contre, leurs outils d'�dition
   de cartes sont tr�s puissants.</p>

<p>Les fonctionnalit�s des tableurs et des SIG ont donc toujours �t�
   dissoci�es. SimTaDyn est un prototype de synth�se de ces deux types
   de fonctionnalit�s. Il manipule des tables dynamiques c.�.d. des
   tables pouvant contenir en plus des donn�es standards des fonctions
   capables de modifier la table elle-m�me. Il repr�sente les donn�es
   g�ographiques en positionnant les objets correspondants dans le
   plan. Il essaie de viualiser simultan�ment tous les objets de m�me
   type.</p>

<p>SimTaDyn, � la diff�rence des tableurs standards, ne poss�de plus
   forc�ment un pavage de cellules rectangulaires mais un pavage
   polygonal quelconque du plan. De plus, les fronti�res des pav�s ---
   qui sont des lignes bris�es donc, finalement, une union de
   segments --- sont consid�r�es comme des cellules � part enti�re. De
   m�me, les bords des segments sont des sommets eux m�mes consid�r�s
   comme des cellules � part enti�re. Donc finalement, SimTaDyn,
   poss�de trois types de cellules : les sommets, les segments et les
   pav�s. Les cellules contiennent aussi plusieurs champs, dont
   certains peuvent �tre des fonctions math�matiques.</p>

SUBSECTION(ICON_DOWNLOAD[]T�l�chargement,download)


TABLEAU(2,LINK(simtadyn/simtadyn_soutenance4.pdf,Le rapport),
LINK(simtadyn/simtadyn_sources.tar.gz,Les Sources de SimTaDyn),
ICON_PDF,ICON_TGZ,
400 Ko --- format PDF,
500 Ko --- format TAR.GZ )

<p>SimTaDyn fonctionne sur Mac Os X 10.3 avec X11 et sur une
   distribution Linux (Mandrake 9.1 par exemple) ou Unix. Il n'a pas
   �t� test� sur Windows !!!</p>

<p>STRONG(D�pendances.) Pour installer SimTaDyn il faudra installer au par
   avant les outils suivants :</p>

LISTE(Un compilateur C,MySQL EXTLINK(http://www.mysql.org).,
      GTK+2.0 EXTLINK(http://www.gtk.org).,
      GtkGLExt EXTLINK(http://www.gtkglext).,
      OpenGL EXTLINK(http://www.opengl.org).)

divert(DIVERT_FOOTER_CODE)

END_BODY(ecstasy,Le projet Ecstasy,myforth,Interpr�teur Forth)

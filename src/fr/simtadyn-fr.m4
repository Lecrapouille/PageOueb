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

<p>SimTaDyn (acronyme pour Simulation Tableur Dynamiquge) est un
prototype de tableur sp�cialis� dans la gestion dynamique de cartes
g�ographiques. Le but est de dessiner une carte g�ographique puis de
la manipuler comme une feuille de tableur en faisant dessus des
calculs complexes gr�ce � un langage interpr�t� tel que
  MYLINK(forth,Forth) rempla�ant avantageusement Visual Basic.</p>

<p>Des exemples typiques de SimTaDyn seraient: LISTE(la r�solution de
syst�me par la m�thode des �l�ments finis;,refaire un SimCity;,faire un
outil de bloc diagrammes fa�on SCICOS;, et bien d'autres.)</p>

<p>SimTaDyn est � l'origine un projet info sp� EPITA (2003-2004) �crit
en C, Gtk+2.0, Opengl (Legacy), Forth et MySQL mais depuis fin 2016,
il a �t� repris en tant projet personnel et d�velopp� en C++,
Gtkmm-3.0, OpenGL 3.3, Forth. Notons que dans le cadre scolaire o� ce
projet a �t� initialement lanc�, un interpr�teur Forth complet (tel
que gForth) n'a pas �t� utilis� mais a �t� refait et ce dans un but
d'apprentissage.</p>

SUBSECTION(ICON_EYES[]Aper�us de SimTaDyn (version legacy),view)

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
interpr�tations g�ographiques. Elles sont repr�sent�es par des cartes
permettant d'acc�der facilement aux champs n'ayant pas
d'interpr�tations g�ographiques. De plus, les SIG ne contiennent pas
de fonctions susceptibles d'agir sur la table donc sur la
carte. L'acc�s aux champs non g�ographiques est obtenu en pointant sur
un objet particulier. Seuls les champs de l'objet d�sign� sont
affich�s contrairement aux tableurs qui essaient toujours de montrer
l'ensemble des donn�es. Par contre, leurs outils d'�dition de cartes
sont tr�s puissants.</p>

<p>Les fonctionnalit�s des tableurs et des SIG ont donc toujours �t�
dissoci�es. SimTaDyn est un prototype de synth�se de ces deux types de
fonctionnalit�s. Il manipule des tables dynamiques c.�.d. des tables
pouvant contenir en plus des donn�es standards des fonctions capables
de modifier la table elle-m�me. Il repr�sente les donn�es
g�ographiques en positionnant les objets correspondants dans le
plan. Il essaie de visualiser simultan�ment tous les objets de m�me
type.</p>

<p>SimTaDyn, � la diff�rence des tableurs standards, ne poss�de plus
forc�ment un pavage de cellules rectangulaires mais un pavage
polygonal quelconque du plan. De plus, les fronti�res des pav�s ---
qui sont des lignes bris�es donc, finalement, une union de segments
--- sont consid�r�es comme des cellules � part enti�re. De m�me, les
bords des segments sont des sommets eux m�mes consid�r�s comme des
cellules � part enti�re. Donc finalement, SimTaDyn, poss�de trois
types de cellules : les sommets, les segments et les pav�s. Les
cellules contiennent aussi plusieurs champs, dont certains peuvent
�tre des fonctions math�matiques.</p>

<p>Les calculs sur les cellules sont faits gr�ce � un langage
  interpr�t� de type Forth qui a �t� adapt� pour le projet. Forth
  �tant un langage minimaliste mais tr�s puissant car auto-�voluant,
  il remplace Visual Basic. Mon MYLINK(forth,document) est une
  introduction � ce langage.

SUBSECTION(ICON_DOWNLOAD[]T�l�chargement,download)

<p>Le code source est disponible sur
GITHUB(Lecrapouille/SimTaDyn,GitHub). La branche git master pointe sur
la version 2016 de SimTaDyn en cours de d�veloppement (mieux cod�e
mais pour le moment l'IDE �tant incompl�te) alors que la branche git
Original-Version-EPITA-2004 pointe sur la version legacy de SimTaDyn
(mal cod�e mais fonctionnelle) et sert de d�monstrateur.

<p>Les sources de la version legacy de SimTaDyn peuvent �galement �tre
t�l�charg�s ici. Cette version fonctionne sur une Ubuntu 16.04 et �
l'�poque sur Mac Os X 10.3 avec X11. La compilation n'a jamais �t�
test� pour Windows.

TABLEAU(2,LINK(simtadyn/simtadyn_soutenance4.pdf,Le rapport),
LINK(simtadyn/simtadyn_sources.tar.gz,Les Sources de SimTaDyn 2004),
ICON_PDF,ICON_TGZ,
400 Ko --- format PDF,
500 Ko --- format TAR.GZ) dnl REFAIRE la tarball legacy qui compile bien

SUBSECTION(ICON_GEAR[]Avancement,avancement)

<p>Le projet �tant relanc� et en cours de re-�criture, voici les
fonctionnalit�s qui doivent �tre d�velopp�s dans la nouvelle version
alors qu'elles �taient pr�sentes dans la version legacy:

LISTE(STRONG(Interpr�teur Forth:) fonctionnel mais manque encore des mots de
  haut niveau pour �tre pleinement utilisable seul ainsi que
  l'importation automatique de biblioth�ques partag�es (cod�es en C)
  en mots Forth.,

  STRONG(Mots Forth manipulant les �l�ments de la carte:) � impl�menter. Dans
  la version legacy c'�tait loin d'�tre optimal.,

  STRONG(Editeur de texte pour Forth:) une IDE minimale est faite (coloration
  syntaxique, d�tection de mots inconnus, auto-compl�tion) ce que ne
  proposait pas la version legacy. Il manque n�anmoins le mode
  interactif et des outils d'aide (comme l'affichage du
  dictionnaire[,] de la pile[,] du d�boguer) qui restent � faire.,

  STRONG(Editeur de carte:) compl�tement � faire alors que la version legacy
  proposait l'ajout/suppression et d�placement des cellules mais
  parfois bogu�s ou lourds en nombre de clics souris � faire.,

  STRONG(Import/Exportation de fichiers pour/vers des logiciels connus:) La
  version actuelle importe uniquement le format shapefile des GIS[,]
  mais pr�vois d'importer des fichiers de GIS tels que QGIS[,]
  OpenStreetMap[,] PostGIS. La version legacy utilise MySQL pour
  sauvegarder des cartes. Notons qu'aucune version ne propose un
  fichier de sauvegarde.,

  STRONG(Visualisation de la carte:) la version actuelle avec gtkmm-2.4
  utilisant OpenGL legacy affichait les noeuds 2D d'une carte mais le
  passage � gtkmm-3.0 et OpenGL 3.3 n�cessite a cass� l'affichage. La
  version legacy proposait un affichage 3D mais non manipulable.,

  STRONG(Application:) seule la version legacy proposait un petit exemple.)

divert(DIVERT_FOOTER_CODE)

END_BODY(ecstasy,Le projet Ecstasy,myforth,Interpr�teur Forth)

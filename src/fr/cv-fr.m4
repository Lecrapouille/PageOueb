dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Quentin Quadrat - Ing�nieur informaticien des syst�mes temps r�el (EPITA))
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_HOME)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(
LEFT_RUBRIC(Raccourcis,Coordonn�es,#coor,Etudes et comp�tences,#etudes,Projets informatiques � EPITA,#proj,Exp�rience professionnelle,#exp,Divers,#divers)
LEFT_RUBRIC(Download,CV en fran�ais,cv/QuentinQuadrat-cv-fr.pdf,CV in English,cv/QuentinQuadrat-cv-en.pdf),
BANNIERES)

divert(DIVERT_BODY_CODE)

<!-- CENTER(HUDGE(STRONG(Je recherche un CDI dans le domaine de l'informatique pour les syst�mes
temps r�el embarqu�s (je suis disponible d�s septembre 2007)))) -->

SECTION(Coordonn�es,coor)
BOX
<p id="coordo">
  <img id="photocoordo" src="img/quentin.jpg" alt="Quentin QUADRAT" />
  13 rue St�phane Mallarm�<br />
  78760 JOUARS-PONTCHARTRAIN<br />
  T�l. 01 34 89 37 02<br />
  T�l. 06 28 14 69 81<br />
  E-mail: <a href="mailto:quentin DOT quadrat @T free DOT fr">quentin DOT quadrat @T free DOT fr</a><br />
  dnl	Page web: <a href="http://quentin.quadrat.chez-alice.fr">http://quentin.quadrat.chez-alice.fr</a><br />
  Page web: LINK(http://quentin.quadrat.free.fr)<br />
  CV (format PDF): EXTLINK(cv/QuentinQuadrat-cv-en.pdf,English) ou EXTLINK(cv/QuentinQuadrat-cv-fr.pdf,Fran�ais).<br />
</p>
ENDBOX

SECTION(Etudes et comp�tences,etudes)
SUBSECTION(Cursus scolaire)
<ul>
<li>STRONG(2001 -- 2007) <p>Etudes effectu�es � l'EXTLINK(http:/www.epita.fr,EPITA) (Ecole Pour
  l'Informatique et les Techniques Avanc�es) avec la sp�cialisation GISTR
   (informatique des syst�mes temps r�el).</p>
</li>
<li>STRONG(2000 -- 2001)
<p>Bac scientifique au EXTLINK(http://www.ac-versailles.fr/etabliss/lyc-viollet-le-duc/,Lyc�e Polyvalent Viollet-le-Duc).</p></li>
</ul>


SUBSECTION(Langues pratiqu�es)
<ul>
  <li><b>Anglais</b> Niveau courant (TOEIC 775).</li>
  <li><b>Espagnol</b> Niveau lyc�e.</li>
</ul>

SUBSECTION(Connaissances en informatique)
<ul>
  <li>STRONG(Langages) C, C++, Java, OCaml, Delphi, Ruby, Scripts Shell,
    Forth, Common Lisp.</li>
  <li>STRONG(Langages outils) Flex, Bison, Camllex, Camlyacc, PostgreSQL, GTK,
    CamlTk, OpenGL, LaTeX, HTML, M4, CVS.</li>
  <li>STRONG(O.S.) Mac Os X, Linux, Unix BSD, Windows CE, QNX.</li>
  <li>STRONG(Mod�lisation) UML RT, SART.</li>
  <li>STRONG(Logiciels) Scilab (Matlab), Scicos (Simulink), SynDEx,
  Emacs, Eclipse, MaxPlus2, Mplab, Eagle, 3D Studio Max.</li>
  <li>STRONG(Notions) Automatique, �lectronique num�rique (assembleur PIC 16F877A, dsPIC 30F2010), commande de moteur �lectrique CC, acquisitions de donn�es (acc�l�rom�tre, gyroscope).</li>
</ul>


SECTION(Projets � l'EPITA,proj)
SUBSECTION(Projets temps r�el)
<ul>
  <li>STRONG(EXTLINK(helico_intro-LANG.html,Draganflyer)) (projet en cours) Etude
    et r�alisation d'un mod�le r�duit
    d'h�licopt�re autonome � quatre h�lices.</li>
  <li>STRONG(Microprocesseur) Conception et r�alisation d'un
    microprocesseur RISC en VHDL avec le logiciel MaxPlus2.
  </li>
</ul>



SUBSECTION(Programmation Unix)
<ul>
  <li>STRONG(C/Unix) Nombreux projets en C r�alisant
    les fonctionalit�s d'outils Unix (alloueur de m�moire,
    entr�es-sorties tamponn�es, pattern matching)
    ou utilisant des outils Unix (processus lourds et l�gers, signaux, watch dog).</li>
  <li>STRONG(Bash) Interpr�teur de commandes shell (Bash)
    �crit en C (1 mois, 6 personnes).</li>
</ul>



SUBSECTION(Th�orie des langages : interpr�teur et compilateur)
<ul>
  <li>STRONG(Tiger) Compilateur du langage Tiger � partir d'un code
    � trous �crit en C++, Flex et Bison (4 mois, 4 personnes).</li>
  <li>STRONG(Lisp) Interpr�teur Common Lisp en OCaml (7 jours, 3
    personnes).</li>
  <li>STRONG(Corewar) Machine virtuelle ex�cutant des programmes �crits en langage assembleur.</li>
  <li>STRONG(EXTLINK(myforth-LANG.html,Forth)) Interpr�teur Forth (projet personnel).</li>
</ul>



SUBSECTION(Projets math�matiques)
<ul>
  <li>STRONG(Recalage) Trouver la transformation rigide qui met en correspondance un nuage de points avec une surface.</li>
  <li>STRONG(EDP) R�solution d'une �quation aux d�riv�es partielles par la m�thode des diff�rences finies.</li>
  <li>STRONG(Bistro) Calculatrice ayant une  pr�cision arbitraire (15 jours, 2 personnes).</li>
</ul>



SUBSECTION(Projets libres durant le cycle pr�paratoire)
<ul>
  <li>STRONG(EXTLINK(simtadyn-LANG.html,SimTaDyn)) Syst�me d'informations 
    g�ographiques progammable en Forth ayant les fonctionnalit�s d'un
    tableur (1 an, 3 personnes, cahier des charges et rapport d'activit�).</li>
  <li>STRONG(EXTLINK(ecstasy-LANG.html,Ecstasy)) Simulation simplifi�e de la dynamique
    d'une voiture et de la circulation automobile dans une
    ville. Affichage en 3D (1 an, 2 personnes, cahier des charges et
    rapport d'activit�).</li>
<li>STRONG(EXTLINK(speedway-LANG.html,Speedway)) Jeu 3D, OpenGL, Delphi (1 an, 3 personnes, cahier des charges et rapport d'activit�).</li>
</ul>


SECTION(Exp�rience professionnelle,exp)

SUBSECTION(Eurogiciel : Ao�t 2007)
<!-- <p>D�veloppement sur des bus de communication pour la centrale inertielle de l'A400M (3 mois).</p> -->

SUBSECTION(INRIA : Janvier -- Juillet 2007)
D�veloppeur stagiaire �
l'EXTLINK(http:/www.inria.fr,INRIA). Sp�cification et r�alisation de
la loi de commande et du traitement d'image embarqu�es sur des
voitures EXTLINK(http://www-lara.inria.fr/cycabf/,CyCab) pour faire du
suivi automatique de v�hicules munis de cam�ras bon march�.
L'architecture du syst�me d'informations embarqu� comprend un Linux
RTAI, 2 processeurs MPC555, 1 bus CAN et les logiciels Scical, Scicos et SynDEx.


SUBSECTION(INRIA : Septembre -- D�cembre 2005)
<p>D�veloppeur stagiaire � l'INRIA pour cr�er un
outil d'aide � la conception de noyau applicatif temps r�el pour le
logiciel EXTLINK(http://www-rocq.inria.fr/syndex/,SynDEx), logiciel m�ttant en oeuvre la m�thodologie STRONG(Algorithme Architecture Ad�quation) pour l'optimisation de la mise en oeuvre d'applications distribu�es temps r�el embarqu�es :</p>
<ul>
  <li>Cr�ation d'une IHM pour formater automatiquement
    le code source de l'utilisateur dans un langage m4 avec
    un squelette sp�cifique � SynDEx.
    Langages utilis�s : OCaml, CamlTk, Camllex, Camlyacc.</li>
  <li>R�daction de tutoriels sur SynDEx et cr�ation d'une
    application simple en automatique. Logiciels utilis�s : SynDEx,
    Scilab, Scicos.</li>
</ul>



SUBSECTION(CERMICS : Juillet -- Ao�t 2004)
<p>D�veloppeur stagiaire au CERMICS. Interface Scilab-OpenGL dans le but d'am�liorer la vitesse et les fonctionnalit�s 3D de EXTLINK(http://www.scilab.org/,Scilab)</p>


SECTION(Divers,divers)
BOX
<ul>
  <li>Permis de conduire.</li>
  <li>Echecs, nombreuses  comp�titions jusqu'� l'�ge de 15 ans (niveau
  atteint : �lo 2000).</li>
  <li>Voyages linguistiques en Angleterre.</li>
</ul>

divert(DIVERT_FOOTER_CODE)

END_BODY(plansite,Plan du site,,)

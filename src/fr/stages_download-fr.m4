dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Stages � l'INRIA Rocquencourt, �quipe AOSTE)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_CV)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Raccourcis,Pr�sentation,#intro,Histoire de la conduite automatique,#histoire,Cyber Cabi,#cycab,Travail effectu�,#travail,R�sum�,#resume),
LEFT_RUBRIC(Pages suivantes,Pr�senation,stages_presentation-LANG.html,Stage INRIA 2,stages_travail2-LANG.html,
Stage INRIA 1,stages_travail1-LANG.html,Download,stages_download-LANG.html),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Stage 2)
SUBSECTION(Sujet)
<p>Le but de ce stage a �t� de poursuivre le travail men� sur le suivi automatique de CyCabs.
Il a fallu impl�menter un algorithme d'estimation de la distance entre deux v�hicules bas� sur de
la d�tection de contours dans des images. Il a fallu d�terminer l'asservissement longitudinal du
CyCab suiveur en simulation avec le logiciel Scilab. Enfin, il a fallu g�n�rer, gr�ce � la cha�ne
d'outils Scilab/Scicos/SynDEx le code temps r�el, avec ses communications et synchronisations
distribu�es sur chacun des processeurs embarqu�s.</p>

SUBSECTION(Download,down2)
TABLEAU(3,LINK(stages/Stage2/quadrat_q-rapport.pdf,Rapport),
LINK(stages/Stage2/quadrat_q-slides.pdf,Transparents soutenance),
LINK(stages/Stage2/CyCabWebCamera33.tar.bz2,Code source),
ICON_PDF,ICON_PDF,ICON_TGZ,
1.7 Mo --- format PDF,
6.7 Mo --- format PDF,
75.7 Mo --- format TAR.BZ2)

<p>Note:</p>
<p>Le poids de la tarball contenant le code source est assez important du aux nombreuses images contenues dedans.</p>

SUBSECTION(Videos)

TABLEAU(3,LINK(stages/Stage2/Chaise1.divx,Test banc),
LINK(stages/Stage2/manu.divx,Conduite manuelle),
Suivi automatique,
ICON_TGZ,ICON_TGZ,ICON_TGZ,
1.7 Mo --- format DIVX,
5.8 Mo --- format DIVX,
xxx)

<p>Note:</p>
<p>Avant de terminer mon stage, je n'ai pas eu le temps de faire une
vid�o ITALIQUE(souvenir) du suivi automatique.</p>

<p>Dans la vid�o de conduite manuelle, on observe des mouvements
saccad�s provenant du CyCab poss�dant la camera. En effet, le joystick
est assez sensible et les gains utilis�s pour les contr�leurs sont un
peu forts (ils n'ont pas �t� modifi�s apr�s avoir install� un nouveau
processeur plus rapide) ce qui donne des effets de braquage brusques
alors qu'on effleure � peine le joystick.  L'application de conduite
manuelle utilis� ici est un peu violente. Merci � Patrice Bodu pour
avoir conduit le CyCab de t�te ;0)</p>

SECTION(Stage 1)
SUBSECTION(Sujet)
<p>Le but de ce stage a �t� d'�tudier et de d�velopper un �diteur de noyaux applicatif. Cet
�diteur, int�gr� dans l'interface graphique de SynDEx, facilite en automatisant certaines t�ches
fastidieuses, la cr�ation de noyaux d'ex�cutif. Avant ce travail, l'utilisateur devait �crire pour
chaque op�ration un code source dans le langage choisi et �crire aussi le squelette en langage
m4 qui entoure ce code source. Maintenant, seul le code source reste � �crire, le squelette �tant
g�n�r� automatiquement par l'�diteur de Code.</p>

SUBSECTION(Download,down1)
TABLEAU(4,LINK(stages/Stage1/syndex_rapport.pdf,Rapport),
LINK(stages/Stage1/syndex_presentation.pdf,Presentation de SynDEx),
LINK(stages/Stage1/syndex_tutoriels.pdf,Tutoriels SynDEx),
LINK(stages/Stage1/syndex_application.zip,Tutoriels Exemples),
ICON_PDF,ICON_PDF,ICON_PDF,ICON_TGZ,
1.1 Mo --- format PDF,
1 Mo --- format PDF,
300 Ko --- format PDF,
500 Ko --- format TAR.GZ)

divert(DIVERT_HEADER_CODE)

END_BODY(stages_travail2,Stage 2,)
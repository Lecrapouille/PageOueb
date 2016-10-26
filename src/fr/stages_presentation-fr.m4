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

SECTION(Contexte du stage)
SUBSECTION(Pr�sentation du stage de fin de tronc commun,pres)

<p>J'ai �t� deux fois d�veloppeur stagiaire dans l'�quipe
   EXTLINK(http://www.inria.fr/recherche/equipes/aoste.fr.html,AOSTE)
   � l'EXTLINK(http://www.inria.fr/,INRIA Rocquencourt). Le but de mon
   premier stage �tait de concevoir un outil d'aide � la conception
   des noyaux d'ex�cutif temps r�el du logiciel
   EXTLINK(http://www-rocq.inria.fr/syndex/,SynDEx). Le deuxi�me �tait
   d'utiliser SynDEx, Scilab et Scicos pour cr�er une application de
   conduite automatique pour voiture CyCab.</p>

<p>SynDEx est un logiciel de CAO niveau syst�me, supportant la
   m�thodologie, pour le prototypage rapide et pour optimiser la mise
   en oeuvre d'applications distribu�es temps r�el embarqu�es.</p>

<p>C'est un logiciel graphique interactif qui offre les services
suivants :</p>
<ul>
  <li>sp�cification et v�rification d'un
  algorithme d'application saisi sous la forme d'un graphe flot de
  donn�es conditionn� (ou interface avec les langages
  Synchrones tels que SIGNAL),</li>
  <li>sp�cification d'un graphe d'architecture multicomposant
  (processeurs et/ou composants sp�cialis�s),</li>
  <li>heuristique pour la distribution et l'ordonnancement de l'algorithme
  d'application sur l'architecture, avec optimisation du temps de r�ponse,</li>
  <li>visualisation de la pr�diction des performances temps r�el pour le
  dimensionnement de l'architecture,</li>
  <li>g�n�ration des ex�cutifs distribu�s
  temps r�el, sans interblocage et principalement statiques, avec
  mesure optionnelle des performances temps r�el. Ceux-ci sont
  construits, avec un surco�t minimal, � partir d'un noyau
  d'ex�cutif d�pendant du processeur cible.  Actuellement
  des noyaux d'ex�cutifs sont fournis pour : SHARC, TMS320C40, i80386, MC68332,
  i80C196 et stations de travail Unix ou Linux.  Des noyaux pour
  d'autres processeurs sont facilement port�s � partir des
  noyaux existants.</li>
</ul>

<p>Puisque les ex�cutifs distribu�s sont g�n�r�s automatiquement, leur
   d�veloppement et leur mise au point sont �limin�s, r�duisant de mani�re
   importante le cycle de d�veloppement.</p>

SUBSECTION(L'INRIA Rocquencourt,rocq) <p>Faisant suite � l'IRIA cr�� en
1967, l'INRIA est un �tablissement public � caract�re scientifique et
technologique (EPST) plac� sous la double tutelle du ministre charg�
de la Recherche et de l'Industrie.</p>

<p>Les missions qui lui ont �t� confi�es sont :</p>
<ul>
<li>entreprendre des recherches fondamentales et appliqu�es,</li>
<li>r�aliser des syst�mes exp�rimentaux,</li>
<li>organiser des �changes scientifiques internationaux,</li>
<li>assurer le transfert et la diffusion des connaissances et du
savoir-faire,</li>
<li>contribuer � la valorisation des r�sultats de recherches,</li>
<li>contribuer, notamment par la formation, � des programmes de
coop�ration avec des pays en voie de d�veloppement,</li>
<li>effectuer des expertises scientifiques.</li>
</ul>

<p>Les chercheurs en math�matiques, automatique et informatique de l'INRIA
collaborent dans les cinq th�mes suivants :</p>
<ul>
<li>syst�mes communicants,</li>
<li>syst�mes cognitifs,</li>
<li> syst�mes symboliques,</li>
<li>syst�mes num�riques,</li>
<li> syst�mes biologiques.</li>
</ul>

SUBSECTION(Projet AOSTE Rocquencourt,aoste)
<p>Le sujet de ce stage s'inscrit dans les activit�s du projet
AOSTE : Mod�les et M�thodes pour l'Analyse et
l'Optimisation des Syst�mes Temps-R�el
Embarqu�s. Ce projet est bilocalis� �
Rocquencourt et Sophia Antipolis.</p>

<p>Les travaux de l'�quipe concernent quatre axes de recherche :</p>
<ul>
<li>la mod�lisation de tels syst�mes � l'aide de
la th�orie des graphes et des ordres partiels,</li>
<li>l'optimisation d'implantation � l'aide :
 -- d'algorithmes d'ordonnancement temps r�el dans le cas
    monoprocesseur, -- d'heuristiques de distribution et
    ordonnancement temps r�el dans le cas
multicomposant (r�seau de processeurs et de circuits
int�gr�s),</li><li>les techniques de
g�n�ration automatique de code pour processeur et pour
circuit int�gr�, en vue d'effectuer du
co-d�veloppement logiciel-mat�riel,</li>
<li>la tol�rance aux pannes.</li>
</ul>

<p>Tous ces travaux sont r�alis�s avec l'objectif de
faire le lien entre l'automatique et l'informatique en cherchant
� supprimer la rupture entre la phase de
sp�cification/simulation et celle d'implantation temps
r�el, ceci afin de r�duire le cycle de
d�veloppement des applications distribu�es temps
r�el embarqu�es.</p>

<p>Ils ont conduit d'une part � une m�thodologie
appel�e AAA (Ad�quation Algorithme Architecture) et
d'autre part � un logiciel de CAO niveau syst�me pour
l'aide � l'implantation de syst�mes distribu�s
temps r�el embarqu�s, appel� SynDEx.</p>

divert(DIVERT_FOOTER_CODE)

END_BODY(,,stages_travail1,Stage 1)

dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Aide � l'�criture de noyaux d'ex�cutif pour le logiciel SynDEx)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_CV)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Raccourcis,Pr�sentation,#intro,Histoire de la conduite automatique,#histoire,Cyber Cabi,#cycab,Travail effectu�,#travail,R�sum�,#resume),
LEFT_RUBRIC(Pages suivantes,Pr�senation,stages_presentation-LANG.html,Stage INRIA 2,stages_travail2-LANG.html,
Stage INRIA 1,stages_travail1-LANG.html,Download,stages_download-LANG.html),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Stage 1 : R�sum� des activit�s)
SUBSECTION(Travail accompli,trav)

<p>Apr�s ce stage, gr�ce � un outil que j'ai pu r�aliser, appel�
   Editeur de Code, il est d�sormais possible d'associer un
   code source � des op�rations provenant d'une application SynDEx. Un
   Editeur de Code est un simple �diteur de texte affichant le code
   source aux associ� aux diff�rentes phases d'une op�ration
   SynDEx.</p> <p>Le texte ins�r� par l'utilisateur est
   automatiquement format� dans un langage
   EXTLINK(http://www.gnu.org/software/m4/manual/m4.html,m4) avec un
   squelette sp�cifique � SynDEx. La syntaxe complexe du langage
   EXTLINK(http://www.gnu.org/software/m4/manual/m4.html,m4) est alors
   cach�e � l'utilisateur. Celui-ci n'a plus qu'� se soucier de
   l'impl�mentation de son code et la seule syntaxe reste celle du
   langage cible (C, assembleur, etc).</p>

SUBSECTION(Chronologie,chron)
<p>Mon stage s'est d�roul� de la fa�on suivante :</p>
<ul>
  <li>Compr�hension de la m�thodologie AAA en lisant de la
  documentation (comme
  LINK(http://pauillac.inria.fr/cdrom/www/syndex/pub/execv4/execv4.pdf,ExecV4)),
  de ma�triser le fonctionnement de SynDEx en lisant des
  EXTLINK(http://www-rocq.inria.fr/syndex/v6/tutorial/tutorial.html,tutoriels).</li>
  <li>Conception de l'�diteur de code sous la forme d'une IHM en
  CamlTk, d�boguage de l'IHM et portage sur Mac OS X.</li>
  <li>Trois semaines pour �crire un premier tutoriel concernant le
    fonctionnement de l'�diteur de code.</li>
  <li>Durant les trois premiers mois, en parall�le au stage, j'ai eu
    droit � une introduction � l'automatique et � utiliser Scicos
    l'�diteur de bloc diagrammes du logiciel Scilab. Cette initiative
    personnelle fut encourag�e par mon ma�tre de stage afin de cr�er
    un exemple en automatique pour montrer les capacit�s de
    SynDEx.</li>
  <li>Ecriture d'un deuxi�me tutoriel afin d'expliquer le
    fonctionnement de l'exemple. Il simule le fonctionnement d'une
    voiture suivant une autre et gardant une distance alors que la
    premi�re peut acc�l�rer ou ralentir. Cet exemple peut �tre
    t�l�charg� LINK(stages-downloads-LANG.html,ici)</li>
  <li>Participation � des r�unions avec un des utilisateur-clients
    principaux de SynDEx : MBDA.</li>
</ul>

SUBSECTION(Appr�ciations par l'utilisateur
industriel MBDA de l'Editeur de Code,app)

<p>Ce travail �tait demand� par un des principaux utilisateur-clients
de SynDEx. Ils ont pu tester mon travail et ont appr�ci� les points
suivants :</p>
<ul>
  <li>Les ports d'entr�es-sorties d'un op�rateur ne sont plus d�sign�s
  par leurs positions relatives mais, maintenant, par leurs noms. Ceci
  permet d'�viter de nombreux probl�mes lors de la g�n�ration de code
  lorsqu'elle devait �tre fait � la main.</li>
  <li>Le code est beaucoup plus lisible, puisque le squelette en langage
  m4 a disparu.</li>
  <li>Tous les moyens d'�dition de code sont directement int�gr�s dans
  l'IHM de SynDEx. Plus besoin d'�diter plusieurs fichiers textes pour
  faire la m�me chose.</li> </ul>

SUBSECTION(Exp�rience acquise,exp)
<p>Ce stage m'a permis de m'am�liorer dans les points suivants :</p>
<ul>
<li>De d�couvrir les probl�mes d'ordonnancement et de
temps r�el,</li>
<li>D'avoir eu une introduction aux probl�mes d'automatique.</li>
<li>De progresser dans la connaissance du langage OCaml (pour
l'anecdote : notre �quipe partage le m�me b�timent que les
cr�ateurs de Caml).</li>
</ul>

divert(DIVERT_FOOTER_CODE)

END_BODY(stages_presentation,Pr�sentation INRIA,stages_travail2,Stage 2)

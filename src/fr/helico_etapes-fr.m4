dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,Introduction,#intro,
Premi�re �tape: Balan�oire avec Scicos dans la boucle,#scios,
Deuxi�me �tape : Balan�oire Autonome,#auto,
Troisi�me et quatri�me �tape : Simulation et r�alisation d'un Quadrirotor,#quad),
BANNIERES)


divert(DIVERT_HEADER_CODE)


divert(DIVERT_NAVIGATION_CODE)


divert(DIVERT_BODY_CODE)

SECTION(Pr�vision du d�roulement du projet)

SUBSECTION(Introduction,intro)

<p>Le projet se d�compose en plusieurs �tapes, chaque �tape comprenant
   plusieurs phases.  Certaines phases peuvent �tre men�es en
   parall�le d'autres demandent la r�alisation de t�ches
   pr�alables. Une tentative de planification avec affectation des
   t�ches sera r�alis�e pour simuler les contraintes d'un projet
   industriel. L'absence d'exp�rience rendant tr�s peu pr�cise les
   estimations de temps, ce planning ne sera qu'indicatif.</p>

CENTER(CAPTION(helico/schemas/helicoiter.jpg))

SUBSECTION(Premi�re �tape: Balan�oire avec Scicos dans la
boucle,scicos)

<p>Le but de cette �tape est d'obtenir un ordinateur et un embryon
   d'h�licopt�re capables de communiquer entre eux. Cette �tape se
   d�compose en plusieurs t�ches.</p>

<!-- simul Scilab 1/4 helico -->
<p>La premi�re t�che consiste � mod�liser et � simuler la dynamique
   d'un quart d'h�licopt�re (que l'on appelle aussi demi
   balan�oire). La figure (LINK(helico/schemas/helicoiter.jpg,cliquer
   ici)) montre la demi balan�oire. La simulation et la conception de
   la commande est r�alis�e gr�ce � un logiciel de calcul num�rique
   (notre choix s'est port� sur le logiciel SCILAB qui est
   l'�quivalent de Matlab mais qui est libre). La commande est du type
   PID, placement de p�les ou LQG. La demi balan�oire est mod�lis�e
   comme un syst�me lin�aire mono entr�e (acc�l�rom�tre ou gyroscope)
   mono sortie (moteur/h�lice). Le but de cette t�che est de simuler
   la dynamique de la balan�oire et sa stabilisation �
   l'horizontale.</p>

<!-- %TODO: figure demi balan�oire -->

<!-- PIC  PC (RS232) Carte d'acquisition -->
<p>La deuxi�me t�che consiste � r�aliser un circuit �lectronique
   permettant la communication entre ordinateur (PC standard) et un
   microcontr�leur embarqu� (notre choix se porte sur des PIC du
   fabricant MICROCHIP pour des raisons de prix, de disponibilit� et
   de qualit� de la documentation disponible). Le microcontr�leur
   r�alise les entr�es-sorties et sous-traite:</p>

<ul>
<li> les calculs de la loi de commande (fonctionnement normal),</li>
<li> l'identification des param�tres le d�bugage de la loi de commande
� l'ordinateur (mode d�veloppement).</li>
</ul>

<p>En effet, un PC standard dispose d'une puissance de calcul et d'un
   environnement logiciel sans commune mesure avec ceux disponibles
   sur un microcontr�leur. Cette t�che permet de se doter d'outils
   analogues � ceux disponible dans les laboratoires d'�lectronique
   disposant de g�n�rateurs de signaux, d'oscilloscope, d'analyseur de
   spectre num�riques (10 bits) dans une bande de fr�quence de 0 �
   1 kHz.</p>

<p>La communication se fait soit par un port s�rie soit par un port
   USB (qui est beaucoup plus rapide que le port s�rie) soit par
   radiocommande (pour les consignes). Le laboratoire num�rique est
   alors la bo�te � outils SCICOS de Scilab qui est l'analogue de
   Simulink pour Matlab (�diteur de blocs diagrammes).</p>

<!-- Scilab dans la boucle. -->
<p>La troisi�me t�che consiste � construire (mat�riellement) la demi
   balan�oire avec le microcontr�leur embarqu�. Le bloc diagramme
   'dynamique' du logiciel de simulation est alors remplac� par la
   'v�ritable' dynamique de la balan�oire acquise gr�ce au
   microcontr�leur embarqu�. Scicos calcule le feedback en faisant des
   calculs flottants et renvoie le r�sultat au microcontr�leur qui
   impl�mente en ligne le r�sultat. En fin de compte le
   microcontr�leur de la balan�oire fait l'acquisition des donn�es du
   gyroscope (ou acc�l�rom�tre), les envoie � l'ordinateur. Ce dernier
   calcule la commande et renvoie le r�sultat au
   microcontr�leur. Celui-ci envoie par sa sortie PWM la commande au
   moteur (et donc � l'h�lice). La balan�oire doit se stabiliser.</p>


SUBSECTION(Deuxi�me �tape : Balan�oire Autonome,auto)

<p>Le but est de retirer l'ordinateur de la boucle et de le remplacer
   par un microcontr�leur sp�cialis� qui r�alise la loi de commande �
   la place du PC. Cette �tape se fait en plusieurs
   phases. L'ordinateur travaille en flottant et le microcontr�leur en
   entier 8 ou 16 bits, on doit v�rifier que la quantification
   (erreurs d'arrondis) se fait bien et que la balan�oire arrive
   encore � �tre stabilis�e en pr�sence de cette quantification.</p>

<!-- Simul Scilab 1/4 helico + emul dsPIC -->
<p>La premi�re t�che consiste, alors, � concevoir un logiciel �mulant
   le fonctionnant du microcontr�leur sp�cialis�, pour ajouter un bloc
   diagramme 'microcontr�leur' dans le logiciel de calcul
   num�rique. Ce nouveau bloc diagramme remplacera l'ancien bloc
   diagramme 'contr�leur'. Il permettra de v�rifier et de corriger les
   erreurs de la quantification en simulation.</p>

<!-- 1/4 helico autonome avec 2 PICs -->
<p>La deuxi�me t�che consiste � ins�rer le microcontr�leur sp�cialis�
   sur la balan�oire. Elle poss�de alors 2 microcontr�leurs. Le
   premier s'occupe de la communication avec l'ordinateur et fait
   l'acquisition des donn�es de l'acc�l�rom�tre (ou gyroscope) et continue
   � envoyer le signal au moteur. Le deuxi�me fait les calculs de la
   loi de commande. Il cumule les possibilit�s d'un microcontr�leur et
   d'un DSP on pense au dsPIC de Microchip pour rester consistant avec
   le choix du premier microcontr�leur. On peut penser � simuler le
   r�seau de microcontr�leurs au moyen de logiciels tel que
   SynDEx. L'ordinateur ne fait plus de calcul mais envoie des
   consignes et continue de g�rer le d�bugage. Il garde la possibilit�
   de demander au microcontr�leur (celui qui g�re la communication) la
   main pour faire les calculs ou l'acquisition de donn�es (mais en
   r�gime normal c'est le microcontr�leur sp�cialis� qui fait les
   calculs).</p>


SUBSECTION(Troisi�me et quatri�me �tape : Simulation et r�alisation
d'un Quadrirotor,quad)

<p>A cette �tape, la balan�oire peut marcher de fa�on autonome sans
   l'ordinateur, mais garde la possibilit� de communiquer avec lui
   (d�bugage, ajout rapide de filtres, etc.). Il reste ensuite �
   it�rer ces �tapes en complexifiant le mod�le de
   l'h�licopt�re. D'o�, simulation compl�te du quadrirotor avec Scilab
   et apprentissage de la m�canique du solide.</p>

<p>Si on dispose de suffisamment de temps, une r�alisation compl�te du
   quadrirotor sera faite en utilisant la m�thodologie mise au point
   sur la balan�oire (r�alisation d'une autre balan�oire) et ajout de
   la r�gulation des 3 axes de libert�s, d'abord sur le banc d'essai
   (sur une rotule) puis en vol libre.</p>

<p>Un r�sum� graphique des diff�rentes �tapes du projet est montr� sur
   la LINK(helico/schemas/helicoiter.jpg,figure suivante).
</p>

divert(DIVERT_FOOTER_CODE)

END_BODY(helico_intro,Pr�sentation du projet,helico_mecanique,Construction de la carcasse)

dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(D�veloppement d'un train virtuel de CyCabs avec Scilab/Scicos/SynDEx)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_CV)

divert(DIVERT_NAVIGATION_CODE)

ICON_NEW STRONG(Page en cours de r�daction).

LEFT_MENU(LEFT_RUBRIC(Raccourcis,Pr�sentation,#intro,Histoire de la conduite automatique,#histoire,Cyber Cabi,#cycab,Travail effectu�,#travail,R�sum�,#resume),
LEFT_RUBRIC(Pages suivantes,Pr�senation,stages_presentation-LANG.html,Stage INRIA 2,stages_travail2-LANG.html,
Stage INRIA 1,stages_travail1-LANG.html,Download,stages_download-LANG.html),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Stage 2 : R�sum� des activit�s)
SUBSECTION(ICON_READ[]Pr�sentation,intro)

<p>Le MYLINK(stages_download,rapport) de mon deuxi�me stage
pr�sente le travail r�alis� dans le cadre du stage de 7 mois (janvier
-- juillet 2007) de fin d'�tude pour l'EPITA, intitul�
ITALIQUE(D�veloppement d'un train virtuel de CyCabs avec
Scilab/Scicos/SynDEx) et s'est d�roul� � l'INRIA Rocquencourt sous la
direction de Yves Sorel, responsable du projet AOSTE dont l'�quipe
travaille sur des mod�les et des m�thodes pour l'analyse et
l'optimisation des syst�mes temps r�el embarqu�s. L'�quipe AOSTE est
en relation avec l'�quipe IMARA qui travaille sur des projets de route
automatis�e.</p>

<p>L'�quipe AOSTE d�veloppe le logiciel de CAO SYNDEX qui met en oeuvre
la m�thodologie AAA pour le prototypage rapide et l'optimisation de la
mise en oeuvre d'applications distribu�es temps r�el embarqu�es. A
partir d'un algorithme et d'une architecture donn�s sous forme de
graphe, SynDEx g�n�re une impl�mentation distribu�e de l'algorithme en
macro-code. La validation de l'algorithme a �t� faite avec les
logiciels de mod�lisation/simulation SCILAB/SCICOS, d�velopp�s par
l'�quipe Scilab/METALAU.</p>

PICTURE(cycab/cycab.jpg,Un CyCab)

<p>Le CyCab est un v�hicule �lectrique (sa longueur n'exc�de pas celle
d'un v�lo, c'est-�-dire 1,9 m�tre) destin� au transport de deux
personnes (largeur : 1,2 m�tre) dans des environnements urbains et
p�ri-urbains encombr�s : centres-villes, centres commerciaux, parcs
d'attractions, a�roports, etc. N'�tant pas pr�vu pour de longs
trajets, sa vitesse est limit�e � 30 kilom�tre � l'heure. De base, il
peut �tre command� manuellement par un joystick. Il sert d'application
directe au logiciel SynDEx. C'est ainsi qu'a �t� g�n�r� le code
distribu� sur les processeurs embarqu�s du CyCab pour la conduite
manuelle. A pr�sent, le but est d'effectuer un train de CyCabs li�s
�lectroniquement gr�ce � une cam�ra � bas-co�t.</p>

<p>Le but de mon stage a �t� de poursuivre le travail men� sur le
suivi automatique de CyCabs avec une cam�ra bas co�t. Il a fallu
impl�menter un algorithme d'estimation de la distance entre deux
v�hicules bas� sur de la d�tection de contours dans des images puis
d�terminer l'asservissement longitudinal du CyCab suiveur en
simulation avec le logiciel Scilab. Enfin, il a fallut g�n�rer, gr�ce
� la cha�ne d'outils Scilab/Scicos/SynDEx le code temps r�el, avec ses
communications et synchronisations distribu�es sur chacun des
processeurs embarqu�s.</p>

<!-- <p>Le MYLINK(rapport, stages_download) se compose de huit
parties. Dans la premi�re partie, on pr�sente l'architecture
mat�rielle du CyCab (les deux noeuds � coeur MPC, le PC embarqu�,
reli�s par un bus CAN). Dans la deuxi�me partie, on pr�sente le
syst�me d'exploitation du PC embarqu� bas� sur un Linux temps
r�el. Dans les parties trois et quatre, nous rappellerons les �l�ments
d'automatique et de traitement d'images utilis�s. Dans les parties
cinq et six, nous pr�sentons les logiciels de d�veloppement~:
Scilab/Scicos et SynDEx. Enfin, dans les parties sept et huit nous
parlons des logiciels g�n�r�s par Syndex pour faire de la conduite
manuelle puis automatique.</p> -->

SUBSECTION(ICON_READ[]Histoire de la conduite automatique,histoire)

<p>Dans le cadre de la route automatis�e, l'INRIA a imagin� un syst�me de
transport original de v�hicules en libre-service pour la ville de
demain. Ce syst�me de transport public est bas� sur une flotte de
petits v�hicules �lectriques sp�cifiquement con�us pour les zones o�
la circulation automobile doit �tre fortement restreinte. Pour tester
et illustrer ce syst�me, un prototype, nomm� CyCab (contraction pour
Cyber Cab), a �t� r�alis�.</p>

<p>Les chercheurs de l'INRIA et de l'Inrets (Institut National de
Recherche sur les Transports et leur S�curit�) travaillent depuis 1991
sur de nouveaux moyens de transport intelligent pour la ville. Ils
�tudient en particulier le concept du libre-service et celui de la
voiture automatique. Les premiers r�sultats de recherche ont d�bouch�
sur le projet Praxit�le (1993-1999), qui �tait en exploitation �
Saint-Quentin-en-Yvelines. Les partenaires industriels du projet
�taient CGFTE (la filiale transports publics de Vivendi), Dassault
Electronique, EDF et Renault.</p>

<p>Dans le cadre du projet Praxit�le l'INRIA a d�montr� la faisabilit� de
la conduite automatique sous certaines conditions : cr�neau et train
de v�hicule exp�riment� sur une Ligier �lectrique instrument�e � cet
effet.</p>

<p>Pour des raisons de l�gislation et de responsabilit� ces automatismes
de conduite n'ont pas pu �tre impl�ment�s sur les Clio �lectriques de
Saint-Quentin-en-Yvelines. Le CyCab a ensuite �t� d�velopp� par
l'INRIA avec l'aide de l'Inrets, de EDF, de la RATP et de la soci�t�
Andruet S.A. pour montrer le potentiel de l'informatique dans la
conduite de v�hicules. Le CyCab est un v�hicule �lectrique � quatre
roues motrices et directrices avec une motorisation ind�pendante pour
chacune des roues et pour la direction. Pour contr�ler et commander
les 9 moteurs du CyCab (4 de traction, 1 de direction et 4 de frein),
une architecture mat�rielle a �t� choisie. Elle est constitu�e de
noeuds intelligents pouvant g�rer les diff�rents moteurs du CyCab et
r�partie autour d'un bus de terrain CAN (Controller Area Network),
tr�s r�pandu dans le monde de l'automobile.</p>

<p>Le r�le des noeuds est d'asservir les moteurs en fonction des
consignes de vitesse et de braquage qui transitent sur le bus CAN soit
en provenance de la position du joystick, soit par un programme de
planification de trajectoires. Le noeud doit donc non seulement �tre
capable de fournir la puissance n�cessaire aux moteurs, mais aussi
ex�cuter les boucles d'asservissement de vitesse ou de position. Pour
ce faire il doit prendre en compte un certain nombre d'informations en
provenance des capteurs proprioceptifs : �tat, odom�trie, fins de
course, mesures de temp�rature, de courant, ...</p>

<p>Un train de v�hicules est constitu� d'un v�hicule de t�te pilot�
par un conducteur humain alors que les autres v�hicules sont
automatis�s, � savoir que chacun d'eux suit celui qui le pr�c�de. Ainsi
le premier v�hicule est suivi par le deuxi�me qui � son tour est suivi
par le troisi�me ... C'est donc une procession de v�hicules. Ce type
d'automatisation a �t� pens� pour les conduites sur autoroute ou dans
les p�riph�riques. Ce proc�d� a l'avantage de maximiser la vitesse des
v�hicules ainsi que leur nombre tout en minimisant les accidents.</p>

SUBSECTION(ICON_GEAR[]Cyber Cabi,cycab)
<p>Il existe diff�rents types de CyCab.  Celui utilis� a les caract�ristiques suivantes :</p>
<ul>
<li> longueur : 1,90 m.</li>
<li> largeur : 1,20 m.</li>
<li> poids total avec batteries : 300 kg.</li>
<li> 4 roues motrices et directrices.</li>
<li> vitesse th�orique maximale : 20 km/h.</li>
<li> autonomie : 2 heures d'utilisation continue.</li>
<li> capacit� d'accueil : 2 personnes.</li>
<li> conduite manuelle ou automatique.</li>
</ul>

<p>La figure suivante montre une vue en coupe de
l'architecture du CyCab qui est constitu�e de :</p>

TABLEAU(2,PICTURE(cycab/cycab.gif,Vue en coupe d'un CyCab),
PICTURE(cycab/noeud.jpg,Noeud avant d'un CyCab))

<ol>
<li>Un ensemble de batteries avec un gestionnaire automatique de
  charge et un bouton arr�t d'urgence qui est soit de type poussoir
  soit de type radiocommand�.</li>
<li>Deux cartes �lectroniques et d'acquisition de donn�es comprenant
  chacune un microprocesseur 32 bit Power PC (appel�s MPC555). Chaque
  carte permet de contr�ler 2 roues du CyCab (motricit� et
  direction). Elles sont plac�es � l'avant et � l'arri�re sous la
  coque.</li>
<li>Un PC embarqu�, plac� sous le si�ge du passager, poss�dant depuis
  ce stage, un processeur Intel cadenc� � 3 GHz, avec un Linux temps
  r�el, RTAI. L'ensemble est aliment� par une tension d'entr�e de -48V
  (350W) et non de 220V. Un �cran, un clavier et une souris sont
  reli�s au PC.</li>
<li>Deux bus CAN ind�pendants~: le bus CAN 0 permet la communication
  entre les 2 MPC555 et le PC embarqu�, alors que le bus CAN 1 permet
  d'ajouter d'�ventuels futurs composants �lectronique.</li>
<li> 4 moteurs et leurs freins �lectriques et contr�l�s par quatre
  contr�leurs de moteur appel�s Curtis PMC 1227 servant
  d'amplificateurs de puissance pour contr�ler la vitesse des
  roues. La consigne de vitesse est donn�e par une tension de 0 � 5V
  aux Curtis qui fourniront des signaux PWM ad�quats aux moteurs. Les
  Curtis prot�gent les noeuds des contre-courants des moteurs, quand
  par exemple, on les arr�te brusquement.</li>
<li>Quatre d�codeurs incr�mentaux donnant la vitesse des roues</li>
<li>Deux v�rins de direction �lectriques aliment�s par un signal PWM
  faisant pivoter les quatre roues.</li>
<li>Un encodeur absolu avec sortie SPI et donnant l'angle des
  roues.</li>
<li>Un joystick de direction fournissant deux courants indiquant : --
  la consigne de vitesse des roues, -- la consigne de direction des
  quatre roues.</li>
<li>Pour cette �tude, le CyCab poss�de une cam�ra
  EXTLINK(http://www.macway.com/fr/product/1167/camera-firewire-unibrain-fire-i-mac.html,FireI)
  se branchant sur un port FireWire du PC embarqu�.</li>
</ol>

<p>Le logiciel SynDEx va distribuer le programme de conduite sur les 2
noeuds et sur le PC embarqu� qui communiqueront gr�ce au bus CAN 0.
Le passager du CyCab peut communiquer avec le PC embarqu�
(clavier/souris/�cran, USB, FireWire, Ethernet, CAN 1) mais n'a acc�s
aux deux noeuds que par l'interm�diaire du bus CAN 1.</p>

<p>Le syst�me d'exploitation du PC est un Linux (distribution est une
Debian 4.0). Le noyau 2.6.18-52 a �t� patch� pour le temps r�el avec
RTAI 3.4 puis recompil�.</p>

<p>Linux a un noyau
EXTLINK(http://en.wikipedia.org/wiki/Monolithic_kernel,monolithique). Sa
m�moire est divis�e entre l'espace utilisateur et l'espace
noyau. L'espace utilisateur d�signe la r�gion m�moire d�di�e aux
applications, � l'exclusion du noyau lui-m�me, qui fonctionne dans son
propre espace m�moire. L'espace noyau est l'endroit o� le code r�el du
noyau r�side apr�s son chargement, et o� la m�moire est allou�e pour
les op�rations qui prennent place � son niveau.</p>

<p>Apr�s l'application du patch pour le temps r�el, on distingue deux
nouvelles partitions : un espace utilisateur fonctionnant avec le
temps r�el appel� LXRT et un espace noyau fonctionnant avec le temps
r�el appel� RTAI. Ces diff�rentes se distinguent de par l'utilisation
des diff�rents schedulers utilis�s et les espaces m�moire
utilis�s.</p>

<p>Une partie du programme de conduite (manuel ou automatique) va
tourner sous forme de module RTAI servant essentiellement de timer 10
ms aux deux noeuds MPC (c'est assez �trange comme fa�on de faire). Le
processus LXRT va g�rer les images de la cam�ra, appliquer le
traitement de l'image et communiquer avec RTAI via une m�moire
partag�e. Un processus Linux (non temps r�el) peut observer le flot de
donn�es pour, par exemple, pouvoir les faire rejouer en simulation (en
effet, � ce moment l�, le sondes CAN n'�taient pas encore
fonctionnelles).</p>

<p>Le programme de conduite s'ex�cute sur les deux noeuds. Il lit les
donn�es fournies par les capteurs (direction des roues, vitesse des
roues, ...).  Il calcule la r�gulation et puis envoie le r�sultat aux
diff�rents actuateurs g�rant les quatre roues du CyCab (traction et
direction). La communication se fait soit par sortie s�rie SPI, soit
par lecture analogique ou optique.</p>

SECTION(Travail effectu�,travail)

SUBSECTION(ICON_EYES[]Principe,principe)

<p>Le but du stage est de modifier un programme de conduite manuelle
   d'un CyCab pour obtenir un programme de conduite autonomme afin de
   faire du suivi longitudinal de CyCab. Le joystick est alors
   ITALIQUE(d�conect�) de l'application. On utilise � la place une
   cam�ra bas co�t.</p>

<p>Les figures suivantes expliquent le principe du suivi longitudinal
   entre deux CyCab. Nous souhaitons stabiliser le CyCab suiveur
   autour d'une distance STRONG(d) fix�e � l'avance par rapport au
   CyCab de t�te et quelque soit la vitesse de ce dernier. Vu que le
   seul capteur que nous poss�dons est une cam�ra, la vitesse du CyCab
   de t�te est � priori inconnue. Nous la voyons comme une
   perturbation � rejeter.</p>

<p>Comme il n'est pas facile d'estimer la distance STRONG(d) � partir
   d'une image, nous allons plut�t utiliser la hauteur STRONG(h) du
   CyCab sur l'image, comme observation. En effet, il est plus ais� de
   compter le nombre de pixel sur une image plut�t que de calculer la
   distance correspondante. On peut approximer la hauteur du Cycab
   comme valant proportionnellement � l'inverse de la distance.</p>

TABLEAU(3,CAPTION(cycab/suivi.jpg), CAPTION(cycab/petit.jpg),CAPTION(cycab/grand.jpg))
CENTER(Cliquez sur les images pour les agrandir.)

<p>Le rapport rentrera plus en d�tail sur l'algorithme utilis�. Pour
   r�sumer en voici ses principaux axes :</p>

 LISTE(Il utilise un filtre de Sobel pour d�terminer les contours du
   CyCab.,

   On utilise deux couleurs (rouge et bleu) pour mieux distinguer les
   contours entre eux.,

   Au d�marrage de l'application, on place les CyCabs � la distance
   voulue et l'utilisateur s�lectionne deux contours int�ressants
   d�finissant STRONG(h barre) la hauteur de consigne.,

   Un filtre de Kalman permet de pr�voir la position des contours
   s�lectionn�s sur l'image suivante.,

   L'erreur de hauteur STRONG(h) entre les contours observ�s et la
   hauteur de consigne STRONG(h barre) donne une consigne de vitesse
   au CyCab suiveur.,

   Cette consigne de vitesse correspond � la plage de valeur
   analogique utilis�e pour le joystick dans l'application de conduite
   manuelle. Une consigne de vitesse max. correspond � un humain qui
   d�placerait le joystick � son niveau max.,

   La conduite manuelle n'est pas particuli�rement
   agr�able. L'acc�l�ration est beaucoup trop brusque et trop forte
   lorsqu'on touche � peine le joystick et que le CyCab a une vitesse
   faible (d�marrage). Au final[,] la conduite avance par � coup car
   elle surprend le conducteur. Ces acc�l�rations font mal au dos du
   conducteur car ce dernier est pas mal solicit�.)


TABLEAU(2,CAPTION(cycab/exp1.jpg),CAPTION(cycab/exp1_1.jpg),CAPTION(cycab/exp2.jpg),CAPTION(cycab/exp2_2.jpg))
CENTER(Suivi des contours gr�ce � Kalman.)

SUBSECTION(ICON_READ[]R�sum�,resume)
<p>Du � des probl�mes de casse des cartes �lectroniques, je n'ai pu
  tester mon suivi que les deux derniers jours de mon stage ;0( Pour un
  premier test, les r�sultats obtenus ont �t� plus
  qu'honorables. Malheureusement des probl�mes restent � corriger :</p>

LISTE(Le traitement de l'image reste assez lourd et est g�r� que par
      le CPU. Je n'ai pas pu le faire traiter par la carte graphique
      (utilisation d'OpenGL et des pixel shader) vu que le premier PC
      du CyCab n'avait pas de carte graphique., La conduite
      automatique est dangereuse car le filtre de Kalman peut perdre
      l'observation des raies � cause d'un �l�ment parasite de
      l'environnement. Un nouveau mod�le plus robuste de d�placement
      des contours a �t� �crit mais n'a pu �tre test� (manque de
      temps)., Ce programme est encore � l'�tat de prototype car la
      cha�ne de g�n�ration automatique du code � partir de SCICOS n'a
      pas encore �t� mise en place[,] mais peut facilement �tre mise en place.)

<p>J'ai quand m�me pu explorer les domaines suivants :</p>
LISTE(STRONG(La r�tro-ing�nierie :)
     LISTE(En espionnant les �tats du CyCab.,
          En traduisant l'application de conduite manuelle SynDEx vers Scicos et o� j'ai �t�
          confront� � des probl�mes des erreurs entre les signaux observ�s et simul�s dus � des
          probl�mes d'arrondis.,
          En traduisant des morceaux de code assembleur en langage Scilab/Scicos.))

LISTE(STRONG(L'�lectronique :)
      LISTE(En dichotomisant les noeuds MPC afin d'isoler le probl�me des pannes des cartes.,
            En faisant de la maintenance �lectronique (pannes � d�tecter[,] fils � ressouder ... ),
            En espionnant la circulation des donn�es temps r�el sur un bus CAN.,
            En choisissant et rempla�ant les cartes du PC embarqu�.))

LISTE(STRONG(Le traitement d'images :)
      LISTE(En r�cup�rant les images d'une cam�ra FireWire.,
            En lisant des documents sur le traitement de l'image.,
            En appliquant des filtres de traitement d'images simples comme Sobel[[,]] Laplace ...
            En faisant une IHM pour visualiser/d�buger le traitement de l'image servant � l'estimation de distance entre les v�hicules.))

LISTE(STRONG(L'automatique :)
      LISTE(En d�terminant le r�gulateur de suivi de v�hicules.,
            En appliquant le filtrage de Kalman au suivi de contours.))

LISTE(STRONG(La programmation :)
      LISTE(En d�couvrant le Linux temps r�el RTAI (installation, configuration et l'utilisation).,
            En approfondissant ma connaissance du noyau et des modules Linux.,
            En d�couvrant la biblioth�que Xlib.,
            En apprenant � me servir des logiciels Scilab[,] Scicos et SynDEx.))


SUBSECTION(Pages suivntes,tdm)

LISTE(MYLINK(stages_presentation,INRIA Rocquencourt),
MYLINK(stages_travail1,Mon premier stage),
MYLINK(stages_download,Download))

divert(DIVERT_FOOTER_CODE)

END_BODY(stages_travail1,Stage 1,stages_download,T�l�chargement)

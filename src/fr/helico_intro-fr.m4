dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

dnl ICON_UPDATED STRONG(Page en cours de r�daction).

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,Objectif du projet,#intro,
Principe de d�placement de la plateforme,#deplac,
Contraintes du projet,#contraintes,
Avancement du projet,#historique,
Table des mati�res,#tdm),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Pr�sentation du projet,intro)
SUBSECTION(Objectif)
<p>Ce document pr�sente la r�alisation d'un mod�le r�duit
   d'h�licopt�re � quatre rotors et son banc d'essai
   �lectrom�canique. Ce travail a d�but� en 2006 dans le cadre d'un
   projet de fin d'�tude de l'EPITA en sp�cialisation temps r�el
  (GISTR) est toujours en cours de r�alisation (apr�s une longue pause
   d'au moins 6 mois) .</p>

<p>Les caract�ristiques principales de mon h�licopt�re sont les
   suivantes. Il est constitu� d'une croix de 20 cm de long en fibre
   de carbone assembl�e au moyen d'une pi�ce en aluminium fa�onn�e �
   la main<!-- dans une plaque de ce m�tal-->. Quatre moteurs
   �lectriques � courant continu avec collecteur sont attach�s sur la
   croix de fibre de carbone par des attaches en aluminium (fa�onn�es,
   elles aussi, � la main). <!-- Dans chacun des tubes creux en
   carbone sont ins�r�es des pattes en laiton sur lesquelles peut
   reposer l'h�licopt�re--> Sur la croix est attach�e une carte
   �lectronique contenant les capteurs inertiels servant � la
   stabilisation de l'appareil : trois gyroscopes un axe, un
   acc�l�rom�tre deux axes, un capteur de proximit� out ou rien
   commutant � une quarantaine de centim�tre d'un obstacle.</p>

LOWPICTURE(helico/photos/h4hpattes,Carcasse de l'h�licopt�re)

<!-- <p>L'�lectronique de puissance, l'�lectronique de commande et la
   source d'�nergie ne sont pas, pour l'instant,
   embarqu�es. L'alimentation �lectrique est assur�e par une
   alimentation de PC standard 12V, suivie d'un r�gulateur, qu'il a
   fallu r�aliser, fournissant du 5V et du 8.5V avec une intensit�
   maximale de 5A. L'�lectronique de puissance consiste en quatre
   MOSFET command�s par des entr�es PWM. L'�lectronique de commande
   consiste en deux microcontr�leurs PIC 16F876 de MICROCHIP reli�s
   entre eux par un bus I2 C connect�s � un PC standard par un bus
   s�rie. Ces deux microcontr�leurs font l'acquisition des donn�es et
   envoient au MOSFET les commandes PWM calcul�es par le PC. La
   stabilisation est calcul�e par le PC avec des logiciels de hauts
   niveaux SCILAB-SCICOS qui sont les analogues libres du couple
   Matlab-Simulink. Pour tester la stabilisation de l'appareil, un
   banc d'essai, r�alis� en Lego, permet de maintenir et de limiter
   les mouvements de l'h�licopt�re en lui laissant un nombre limit� de
   degr�s de libert�.</p> -->

<p>La construction de l'h�licopt�re fait appel � plusieurs sp�cialit�s
   de l'ing�nierie � savoir :
   LINK(helico_mecanique-LANG.html,construction m�canique),
   LINK(helico_electronique-LANG.html,�lectronique),
   LINK(helico_logiciel-LANG.html,informatique),
   LINK(helico_asservissement-LANG.html,automatique). Chacun de ces
   aspects sera discut� plus en d�tail dans la suite de ce
   document.</p>

<p>Des helicopt�res similaires sont commercialis�s sous les noms de
   Draganflyer, Engager, X-UFO, Microdrones. Il existe �galement des
   projets r�alis�s par des �tudiants dans le cadre de leurs �tudes
   (comme l'�cole de Lausanne) ou par des modelistes comme le
   MIKROKOPTER ou l'UAVPL (voir la
   LINK(helico_biblio-LANG.html#xufo,bibliographie)).</p>

TABLEAU(3,
CAPTION(helico/xufo.jpg),
CAPTION(helico/engager.gif),
CAPTION(helico/draganflyer.jpg),
Le site du X_UFO,
Le site du ENGAGER,
Le site du DRAGANFLYER)

<p>En g�n�ral ces h�licopt�res sont radio-command�s ce qui ajoute la
  difficult� de la r�alisation de la radio commande mais qui simplifie
  la stabilisation puisque l'op�rateur est capable d'observer et de
  compenser les d�rives des gyroscopes. En g�n�ral ces h�licopt�res
  poss�dent deux moteurs tournant dans un sens et deux autres tournant
  dans l'autre afin de stabiliser le lacet du � la rotation des
  moteurs. Parfois, sur des mod�les de petites tailles, pour �viter
  l'inversion du sens de rotation des moteurs, qui implique
  l'utilisation d'h�lices propulsives difficiles � trouver, les
  moteurs sont inclin�s de fa�on � cr�er une pouss�e compensant le
  lacet.  Voir le JOSEJ. Nous adopterons ce point de vue faute d'avoir
  pu trouver des h�lices propulsives de petites tailles adapt�es aux
  moteurs choisis.</p>

SUBSECTION(Principe de d�placement de la plateforme,deplac)
<p>Allez voir CRACMIKE. Puis cliquez sur 'Comment ca marche'.</p>

SUBSECTION(Contraintes du projet,contraintes)

<p>STRONG(D�placement.) Dans un premier temps, la plate-forme devra
  rester stationnaire � 40 cm du sol.</p>

<p>STRONG(Contraintes de dimension et de poids de l'h�licopt�re.) La
   plate-forme se veut �tre de dimension et de poids les plus r�duits
   possible (envergure inf�rieure a 20 cm, poids en dessous des 200
   g). On a choisi de ne pas utiliser de cartes d'acquisitions du
   commerce � cause de leur poids et de leur prix. L'acquisition des
   donn�es est r�alis�e par deux microcontr�leur dsPIC. Actuelement, �
   cause de son poids, la carte �lectronique n'est pas prevue d'�tre
   embarqu�e sur la plate-forme.</p>

<p>STRONG(Robustesse � son environnement.) L'appareil est pr�vu pour
   fonctionner en int�rieur, avec un minimum de perturbation
   atmosph�rique.</p>

<p>STRONG(Communication avec un ordinateur non embarqu�.)
   L'h�licopt�re communique avec un ordinateur non embarqu� au moyen
   d'un port s�rie. Le microcontr�leur envoie les donn�es de la
   centrale inertielle � l'ordinateur. Ce dernier fait les calculs
   flottants de stabilisation et les communique au microcontr�leur
   embarqu�.</p>

<p>STRONG(Source d'�nergie.) L'h�licopt�re ne dispose pas de batterie,
   il est aliment� par une source d'�nergie au sol au moyen de fils
   �lectriques. Ce qui permet une �conomie de poids importante et une
   autonomie infinie, mais qui implique l'existence des fils reliant
   l'h�licopt�re au sol, pouvant le d�stabiliser. L'embarquement de la
   source d'�nergie �lectrique pose en effet un gros probl�me, car les
   plus petits moteurs consommant de l'ordre de 10W chacun l'autonomie
   est souvent tr�s r�duite. Certains mod�les du commerce peuvent
   avoir une autonomie de quelques minutes seulement.</p>

SUBSECTION(Avancement du projet,historique)

<p>STRONG(Juillet -- D�cembre 2006.) Le projet de fin d'�tudes EPITA
   s'est termin� avec un embryon d'h�licopt�re � deux rotors qui ne
   pouvait pas se soulever (carcasse trop lourde pour les 2
   moteurs). Un probl�me dans la communication I2C entre les deux PIC
   16F876A emp�chait l'utilisation des quatre moteurs.</p>

<p>STRONG(Octobre 2007.) Apr�s un longue pause. Cette date marque la
   timide reprise du projet. Une nouvelle version de la carte
   �lectronique � base de dsPIC a �t� r�alis�e. Une cha�ne de logiciel
   est entrain de se mettre en place pour permettre un d�veloppement
   plus ais� du firmwire et du hardware de l'h�licopt�re. On peut
   citer les logiciels MYLINK(tuto_scicos,Scilab/Scicos),
   MYLINK(tuto_syndex,SynDEx), PROTEUS et MPLAB. Une biblioth�que en
   langage C pour dsPIC30F avec SynDEx est en cours d'�criture.</p>

<p>STRONG(Janvier 2008.) L'utilisation du logiciel Proteus a permis de
  trouver des probl�mes dans la conception dans la carte
  �lectronique. La g�n�ration automatique de code a bien avanc�e :
  gr�ce � SynDEx et � la biblioth�que en langage C pour dsPIC30F, il
  est presque possible � partir de Scicos de g�n�rer automatiquement
  un calcul distribu� sur l'architecture de l'h�licopt�re.  Il reste
  cependant � d�velopper pas mal de code pour g�rer les p�riph�riques
  du dsPIC. A suivre donc ;o)</p>

<p>STRONG(Avril 2008.) Bient�t la reprise des tests sur balancoire !
  Pour l'instant le dsPIC et Scicos communiquent � 50Hz. Les valeurs
  analogiques brutes sont envoy�es par le dsPIC et l'ordinateur les
  affiche. Les PWM semblent aussi marcher. A suivre : remettre � jour
  les blocs diagrammes Scicos de la r�gulation. Pour l'instant la
  g�n�ration de code avec SynDEx ne donnera pas de bons r�sultats. Son
  developpement est suspendu en attendant la sortie d'une premiere version
  fonctionnelle (cod� � la main) du soft.</p>

  <!-- : de par son fonctionnement, SynDEx g�n�re un code dont les
  threads de communication et de calculs sont synchronis�es et
  s'attendent. Il y a donc un probl�me g�nants sur la vitesse du
  traitement des donn�es qui sera limit�e par la vitesse du port s�rie
  (m�me si ce dernier est uniquement utilis� pour rafra�chir les
  consignes de pilotage et donc n'est en principe pas bloquant).-->

<p>STRONG(Juin 2008.) Le projet n'a pas trop avanc� par manque de
   temps. Les signaux PWM de l'interface de puissance sont plus
   propres : ils sont moins d�form�s et donc les moteurs semblent
   tourner plus fort. Un probl�me de retard pur sur la vitesse de
   commutation d'un transistor a �t� minimis� (� d�faut d'�tre
   supprim� par manque de connaissance sur ce sujet). Ceci peut
   minimiser un comportement non lin�aire entre le rapport cyclique du
   PWM et le courant induit du moteur qui a �t� d�tect� lors de la
   premi�re version du prototype. Le protocole de communication entre
   l'ordinateur et les dsPIC a �t� en partie d�bogu�. Un probl�me
   majeur (c�t� Linux ?) reste non r�solu : les r�ceptions sont
   ralenties lorsque les transmissions sont activ�es. Ce comportement
   est en cours de d�bugage. Un gestionnaire d'historique des bugs du
   syst�me a �t� ajout� : toutes les erreurs et les codes de retours
   des fonctions les plus importantes sont stock�s ainsi que la date
   d'apparition. Ceci est bien utile pour le d�boguage (par exemple
   apr�s un break point). Il fonctionne � la fois pour le dsPIC et
   Linux.</p>

<p>STRONG(D�but ao�t 2008.) Cette date marque les premiers essais
   concluants de la r�gulation de l'h�licopt�re en mode balan�oire
   gr�ce au PC (note: on est donc au m�me point d'avancement qu'en
   d�cembre 2006 sauf que les diff�rentes parties sont plus
   abouties). Avant cela, le soft de l'h�licopt�re souffrait encore de
   nombreux bugs. Vu qu'il n'existait pas de tests rigoureux sur le
   code, il a donc �t� d�cid� de mettre en place et une bonne fois
   pour toute des proc�dures de test unitaires (et trac�es par des
   documents PDF) afin d'aider � prouver le bon fonctionnement du soft
   et de d�tecter des probl�mes de r�gression du code. Par cons�quent,
   le probl�me de ralentissement de l'automate de communication (voir
   Juin 2008) a �t� corrig�. Son code a �t� simplifi� et n'entraine
   plus de retard dans les �changes de messages. Les communications
   entre PC et dsPIC sont temps r�elles � 20 ms (50 Hz). L'automate
   est suffisament g�n�rique pour int�grer des protocoles comme le SPI
   sans modifier une seule ligne de code. Le module SPI pour dsPIC est
   en cours de d'�criture. Il va permettre de faire communiquer les
   deux axes de la plate-forme. Le premier filtre num�rique sur 16
   bits a �t� �crit pour le dsPIC. Les premiers tests sont
   concluants. D'ici la fin du mois d'ao�t la boucle de r�gulation du
   courant dans les moteurs va �tre int�gr�e dans les dsPIC.  Enfin,
   contrairement � ce qu'il a �t� esp�r� la boucle de r�gulation du
   courant dans les moteurs ne se fera plus � 1 KHz mais � 300
   Hz. Cette ITALIQUE(r�gression) est due aux balais du moteur �
   courant continu qui font apparaitre des oscillations de 300
   Hz qui correspondent � la rotation du moteur 20 Ktours/min.</p>

<p>STRONG(D�but Septembre 2008.) Bon avancement du projet : la
   r�gulation de l'angle de la balan�oire ainsi que les courants des
   moteurs est maintenant faite par le dsPIC sans l'aide du PC. Un
   bootloader a �t� ajout� afin que l'utilisateur puisse, depuis le
   PC, envoyer les gains des diff�rents r�gulateurs PID ainsi que
   d'autres param�tres. Ceci permet de ne pas � avoir � reprogrammer
   et flasher le dsPIC � chaque modification. Le bootloader fournit
   une option pour choisir si le PC intervient ou pas dans l'un des
   calculs de r�gulation (courant moteur, assiette, ...) ou s'il doit
   uniquement envoyer les consignes d'angles et de puissance du
   moteur.</p>

<p>STRONG(Mi Septembre 2008.) La r�gulation autonome de la balan�oire
  �tant fonctionnelle, la balan�oire s'est vue greff�e un deuxi�me axe
  contr�l� par un deuxi�me dsPIC (en mode esclave). Nous avons donc
  (enfin !), une plate-forme � quatre rotors. La carcasse est
  maintenant suspendue � un fil au lieu d'�tre attach�e par des
  briques en LEGO. Le bootloader a �t� modifi� afin de faire
  communiquer le dsPIC esclave avec PC via le dsPIC ma�tre (qui g�re
  les communications SPI et UART). Le r�gulateur va �tre mis � jour
  afin de r�guler les deux axes et le lacet. La carcasse pourra se
  soulever apr�s changement de la tension des moteurs (qui passera de 5V
  � 8V).</p>

SUBSECTION(Table des mati�res,tdm)

<p>Pour plus de facilit�, l'�tude d�taill�e de la construction de cet h�licop�re a �t�
  r�partie sur plusieurs pages html:</p>
LISTE(MYLINK(helico_etapes,Etapes de la construction),
MYLINK(helico_mecanique,Construction de la carcasse),
MYLINK(helico_electronique,Construction de la carte �lectronique),
MYLINK(helico_logiciel,Partie logicielle),dnl G�n�ration automatique de code),
MYLINK(helico_asservissement,Asservissement de l'h�licopt�re),
MYLINK(helico_download,T�l�chargement),
MYLINK(helico_biblio,Bibliographie),
MYLINK(tuto_scicos,Pr�sentation du logiciel de mod�lisation et de simulation Scilab/Scicos),
MYLINK(tuto_syndex,Pr�sentation du logiciel de SynDEx),
MYLINK(comm_rs232,Introduction au port s�rie (RS232)),
MYLINK(helico_photos,Photos et vid�os.))

<p>Cette table des mati�res est �galement accessible depuis le menu
  gauche (couleur bleue). Les liens en bas de page permettent
  d'acc�der � la page suivante ainsi qu'� la page pr�c�dente.</p>

dnl <p>Certaines de ces pages se r�f�rent � certains logiciels, protocoles ou notions
dnl pr�sent�s sur ce site :</p>

dnl LISTE(MYLINK(tuto_scicos,Le logiciel Scilab/Scicos),
dnl MYLINK(tuto_syndex,Le logiciel SynDEx), MYLINK(comm_rs232,Le protocole
dnl RS232).)

divert(DIVERT_FOOTER_CODE)

END_BODY(,,helico_etapes,Etapes de la construction)

dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

dnl ICON_UPDATED STRONG(Page en cours de r�daction).

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,
Rappel du cahier des charges,#cdc,
Download du sch�ma de la carte �lectronique,#schema,
Explication des diff�rents capteurs et des fonctionnalit�s de la carte,#expl,
L'altim�tre infrarouge,#alti,
L'acc�l�rom�tre deux axes,#acc,
Les gyroscopes un axe,#gyro,
L'�lectronique de puissance,#puis,
D�termination de la bonne fr�quence du PWM,#freq),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Partie �lectronique � coeur (ds)PIC,partie_electro)

SUBSECTION(Contexte)

<p>Ce document explique le fonctionnement de la carte �lectronique de
   l'h�licopt�re. La premi�re version utilisait un unique
   microcontr�leur PIC16F876A qui contr�lait deux moteurs. La deuxi�me
   version qui utilisait deux PIC16F876A pour g�rer les quatre moteurs
   n'a jamais �t� compl�tement d�bogu�e. La troisi�me version,
   pr�sent�e ici, est bas�e sur deux dsPIC30F2010 et corrige quelques
   erreurs. Cette carte est en cours de validation. Pour l'instant, on
   ne pr�sente que les simulations obtenues gr�ce au logiciel
   PROTEUS.</p>

<p>Cette page est organis�e de la fa�on suivante:</p>
LISTE(LINK(#cdc,Rappel du cahier des charges),
LINK(#schema,Sch�ma de la carte �lectronique),
LINK(#alti,Altim�tre infrarouge),
LINK(#acc,Acc�l�rom�tre deux axes),
LINK(#gyro,Gyroscopes un axe),
LINK(#puis,Electronique de puissance),
LINK(#freq,D�termination de la fr�quence des sorties PWM))

SUBSECTION(Rappel du cahier des charges,cdc)

<p>Au minimum, gr�ce � ses deux dsPIC, l'�lectronique de l'h�licopt�re doit g�rer :</p>
LISTE(Une entr�e num�rique pour l'observation de l'altitude de la carcasse.,

    Neuf entr�es analogiques :
    LISTE(Les quatre courants circulant dans les moteurs.,

          Les trois vitesses angulaires donn�es par les gyroscopes (roulis,
          tangage, lacet).,

          Les deux acc�l�rations permettant l'estimation de
          la verticale par exemple lorsque le v�hicule est au repos.),

  Quatre sorties PWM (Pulse Width Modulation) commandant les moteurs
  gr�ce � une interface de puissance.,

  Un port de communication avec l'ordinateur au sol pour le d�boguage[,]
  la communication des consignes de vol[,] le data logging[,]...,

  Des sorties dites ITALIQUE(discr�tes) pour afficher certaines
  informations avec des LED.)


<p>Les microcontr�leurs de MICROCHIP ont �t� choisis � cause de leur
  popularit�, de leurs prix, de leurs disponibilit�s, de la
  documentation disponible
  (BIGONOFF et LINUXMAG) et de la distribution gratuite des logiciels
  (PC et Linux) pour les programmer et les d�boguer (JDM).</p>

<p>Pour la premi�re version de la carte on a choisi le PIC 16F876A
   plut�t qu'un dsPIC. En effet, �tant novice dans ce domaine, ce
   choix s'imposait (quitte � devoir r��crire plus tard les programmes
   pour le dsPIC et bien qu'il faille programmer ce PIC en assembleur)
   car l'excellent cours de Bigonoff �tait une aide pr�cieuse pour la
   compr�hension de l'architecture des processeurs Microchip en
   commen�ant par les plus simples d'entre eux. En effet pour le
   dsPIC, on ne dispose que de la documentation du constructeur
   (EXTLINK(http://ww1.microchip.com/downloads/en/DeviceDoc/70046E.pdf,Family
   Reference), Programmer's Reference, datasheet, ...), qui bien que
   tr�s riche, est beaucoup moins p�dagogique que le cours de
   Bigonoff.  On a choisi le 16F876A au lieu du 16F877 pour son
   meilleur compromis puissance/poids-nombre de pattes. Le 16F877 est
   beaucoup plus lourd et comporte 40 pattes (voir plus) contre 28
   pour 16F876.</p>

LOWPICTURE(helico/photos/electronik,Electronique g�rant 1 axe de l'h�licopt�re.)

<p>Pour la derni�re version de la carte, on utilisera deux
   dsPIC30F2010 car, en plus du tr�s grand nombre d'entr�es/sorties
   disponibles, ils disposent d'un multiplieur int�gr� (DSP)
   permettant de mettre en oeuvre plus facilement les contr�leurs et
   les filtres n�cessaires. L'utilisation de deux petits dsPIC plut�t
   qu'un gros permettra de parall�liser l'ex�cution du programme
   (gr�ce au logiciel SYNDEX) et de s'initier aux protocoles de
   communications classiques (USART, SPI, I2C, CAN). De plus le nombre
   r�duit des pattes (28) de ce processeur all�ge le poids de la carte
   �lectronique.</p>

<p>Le logiciel PROTEUS sera utilis� pour v�rifier en simulation les
   filtres analogiques et l'�lectronique de puissance. Cependant, dans
   la version actuelle (7.2) il ne permet pas de simuler le
   fonctionnement des dsPIC (les gammes en dessous oui).</p>


<!-- <p>On notera que les dsPIC peuvent �tre programm�s en langage C. On
   utilisera alors l'IDE MPLAB de Microchip pour Windows et le
   compilateur C30LINK qui est un gcc modifi�. Comme gcc est sous
   licence GPL, il est possible de recompiler les sources de C30 pour
   l'utiliser sous Linux et Macintosh. Dans un premier temps, on fera
   confiance sur la qualit� de l'assembleur g�n�r� par ce compilateur
   pour passer ensuite � l'�criture en assembleur.</p>

<p>Enfin, notons qu'il existe une librairie Microchip 16BPERIPH qui
   permet de g�rer les p�riph�riques (USART, PWM, timer, ...). Elle
   est assez peu fournie, donc on ne l'utilisera pas.</p> -->

SUBSECTION(Sch�ma de la carte �lectronique,schema)

<p>La derni�re version du sch�ma �lectronique n'est pas encore
   disponible en t�l�chargement. Les parties de la carte valid�es en
   simulation sont donn�es dans cette page. En attendant, le sch�ma de
   la deuxi�me version (� base de PIC16F) est toujours t�l�chargeable
   au format PDF, PNG ou EAGLE.</p>

<p>STRONG(ATTENTION : N'�tant pas �lectronicien de formation[,] il est
   probable que ces sch�mas ne soient pas optimaux voir peuvent
   contenir des bugs aberrants ! Ils ne sont donn�s qu'� titre
   indicatif.)</p>

TABLEAU(3,LINK(helico/schemas/h4h_schematic.pdf,Sch�ma au format PDF),
LINK(helico/schemas/h4h_schematic.png,Sch�ma au format PNG),
LINK(helico/schemas/h4h_schematic.sch,Sch�ma au format SCH),
ICON_PDF,ICON_TGZ,ICON_TGZ,400Ko,200Ko,250Ko)


SECTION(Explication des diff�rents capteurs et des fonctionnalit�s de la carte,expl)
SUBSECTION(L'altim�tre infrarouge,alti)

<p>L'altim�tre infrarouge
   EXTLINK(http://info.hobbyengineering.com/specs/SHARP-gp2y0d340_j.pdf,GP2Y0D340)
   est le plus simple et le moins cher des capteurs de distance infra rouge. Il commute
   de 0 � 1 en pr�sence d'un obstacle � moins de 40 cm. Il se
   branche sur une patte num�rique du PIC. Apr�s un test tr�s rapide,
   la distance de commutation semble d�pendre de la couleur de
   l'obstacle. Le capteur est dirig� vers le haut de l'h�licopt�re (et
   non vers le bas) afin qu'un utilisateur puisse contr�ler l'altitude
   de la plate-forme en pr�sentant au dessus une cible � suivre � une distance
   voulue.</p>

PICTURE(helico/schemas/GP2Y0D340.jpg,Le capteur GP2Y0D340.)

SUBSECTION(L'acc�l�rom�tre deux axes,acc)

<p>Un acc�l�rom�tre deux axes
  EXTLINK(http://www.analog.com/UploadedFiles/Data_Sheets/ADXL320.pdf,ADXL320)
  plac� horizontalement au centre de gravit� (suppos� immobile) de
  l'h�licopt�re, permet de d�tecter la verticale. C'est le capteur le
  plus important dans la phase d'essai o� le centre de gravit� de
  l'h�licopt�re sur son banc d'essai est maintenu immobile (cas de la
  balan�oire). Un unique acc�l�rom�tre 5G de AnalogDevice est alors
  suffisant pour stabiliser l'h�licopt�re.  Malheureusement, les
  acc�l�rom�tres bons march�s sont disponibles dans des bo�tiers
  petites tailles (4 mm x 4 mm) et sont donc tr�s difficiles � souder � la
  main sur une carte �poxy standard (le ITALIQUE(truc) consiste �
  faire un gros p�t� de soudure sur l'acc�l�rom�tre et les fils, puis
  d'�liminer progressivement l'exc�s de soudure avec la pane du fer �
  souder).</p>

LOWPICTURE(helico/photos/accelero,Zoom sur une soudure faite � la main.)


<p>Le traitement des donn�es de l'acc�l�rom�tre se d�compose en deux �tapes : -
  Recentrage et normalisation du signal, - Filtrage anti-repliement de
  spectre.</p>

<p>STRONG(Etape 1 : Recentrage et normalisation du signal.)
   L'acc�l�rom�tre choisi donne un signal utile compris entre +1.3V (�
   l'horizontale) et +1.7V (� 90 degr�s) qui doit donc �tre recentr�
   et normalis� entre 0V et +5V afin d'obtenir une pr�cision maximale
   apr�s la conversion analogique num�rique sur le dsPIC. Pour cela,
   on doit d�terminer G et r solution du syst�me lin�aire suivant
   :</p> LISTE(G(1.3 - r) = 0, G(1.7 - r) = 5,)

<p>o� G est le gain et r la tension de r�f�rence. On trouve G = 12.5
   et r = 1.3. On utilisera un AOP en montage soustracteur. On en
   d�duit G = R5 / R1 (= R4 / R2) et Vref = r. Vacc �tant la sortie de
   l'acc�l�rom�tre.</p>

TABLE(2,LOWPICTURE(helico/schemas/filtre_aop/accelero_aop1,AOP en
montage
soustracteur.),LOWPICTURE(helico/schemas/filtre_aop/accelero_plot1,Simulation
sous Proteus.))

<p>L'AOP utilis� est un LM324. Afin de faire un montage simple ayant
  une alimentation 5V unique, l'AOP LM324 sera aliment� en 0/+5V
  (alimentation non sym�trique) il sature alors � 4V. On r�duit alors
  le gain G � 10 au lieu de 12.5 afin d'�viter la saturation � 4V (ce
  qui �tait le cas avec les anciennes versions des cartes). Vref vaut
  toujours 1.3V.</p>

<p>STRONG(Etape 2 : Filtre des signaux d'attitude.) La fr�quence
   de coupure des signaux d'attitude de l'h�licopt�re est fix� � 25
   Hz. Ce choix est li� aux limitations de la vitesse d'acquisition de
   l'ordinateur au sol d'une part. D'autre part
   cette fr�quence est de l'ordre de grandeur de celle utilis�e en radio-commande
   pour le mod�lisme.
   Ces signaux devront donc �tre �chantillonn�s
   � au moins 50 Hz pour ne pas perdre de l'information. Nous
   �chantillonnerons en fait tous les signaux � 1 kHz pour pouvoir
   r�guler suffisamment rapidement le courant passant dans le moteur.
   Rappelons qu'un signal �chantillonn� � 5O Hz doit �tre filtr�
   au pr�alable � 25 Hz afin d'�viter l'apparition de signaux
   parasites (repliement de spectre).
   Nous utilisons un filtre analogique d'ordre 2 � 25 Hz.
   Le signal acquis � 1 kHz sera filtr� � l'ordre 2 � 25 Hz �
   l'int�rieur du dsPIC. Finalement les signaux d'attitude seront
   filtr�s � l'ordre 4 � 25 Hz.</p>

TABLE(2,LOWPICTURE(helico/schemas/filtre_aop/accelero_aop2,Filtre
passe-bas d'ordre
deux.),LOWPICTURE(helico/schemas/filtre_aop/accelero_bode,Diagramme de
Bode du gain sous Proteus.))

<p>Sur le sch�ma de gauche, nous retrouvons l'AOP en montage
  soustracteur (avec R1, R2, R4 et R5). Nous lui avons ajout� R3 et R6
  sous forme de pont diviseur de tension pour que Vref soit � 1.3V.
  Notons que nous utilisons cet AOP aussi pour filtrer � l'ordre 2 le signal
  gr�ce aux condensateurs C1, C2 et C3.</p>

<p>Comme l'acc�l�rom�tre a une r�sistance interne de 32K&Omega;
   (voir le datasheet) (R1,C1) r�alise filtre passe-bas du
   premier ordre. C2 et C3 dans la d�finition du gain de
   l'amplificateur r�alise un filtre passe bas d'ordre 1. Au total on
   dispose d'un filtre d'ordre. La courbe du gain du diagramme
   de Bode est donn�e dans la figure de droite (le d�phasage n'est pas
   trac�).</p>

<p>V�rifions que le diagramme de Bode est correct. Pour une fr�quence
   de 100 Hz, le gain est presque de 20 dB (18.8 db pour �tre exact,
   soit un facteur multiplicateur de 10, ce qui correspond � ce qu'on
   au choix indiqu� � �tape 1). Le gain de coupure moins 3 db vaut
   15.8 et a pour fr�quence de 20 Hz. La pente entre 20 Hz et 120 Hz
   vaut -20 db/decade. Apres la pente sera de -40 db/decade (car
   filtre du deuxi�me ordre). Ce filtre n'est pas optimal car on
   pourrait obtenir, au moins th�oriquement, plus rapidement la pente
   de -40 db/decade. Il a l'avantage d'�tre simple � comprendre. On
   s'en contentera dans un premier temps.</p>

<!-- <p>Pour r�sumer, voici des exemples de signaux d'entr�e et de sortie de l'amplificateur :</p>

LISTE(LINK(helico/schemas/filtre_aop/accelero_plot1_big.jpg,� 1 Hz),
LINK(helico/schemas/filtre_aop/accelero_plot100.jpg,� 100 Hz),
LINK(helico/schemas/filtre_aop/accelero_plot500.jpg,� 500 Hz))

<p>Donc plus la fr�quence du signal d'entr�e (de l'acc�l�rom�tre) est
   �lev�e plus le signal de sortie est att�nu�. Entre 1Hz et 25Hz
   les signaux ont � peu pr�s le gain souhait� de 10. A 500Hz ils
   sont bien amortis.</p> -->

<!-- SUBSECTION(Etude de l'influence entre AOP id�al et AOP r�el,filtr)

<p>Avec LINK(helico/schemas/filtre_aop/accelero_aop2_big.jpg,notre
   circuit) nous avons r�ussi � fusionner un montage soustracteur, un
   filtre passe-bas du deuxi�me ordre et un pont diviseur de tension
   avec un seul AOP. La coupure � 25 Hz n'est pas tr�s franche : on
   aurait pu essayer de trouver couper plus franchement � 25Hz
   avec un filtre passe-bas du second ordre comme le filtre de
   Rauch. Bien qu'en th�orie ces filtres devraient �t� meilleurs l'
   impl�mentation avec un AOP r�el donn� fait perdre une grand partie
   de leurs qualit�s.</p>

PICTURE(helico/schemas/filtre_aop/filtre_2nd_ordre_rauch.jpg,Filtre de
Rauch passe-bas du deuxi�me ordre)

<p>La th�orie nous dit que la fonction de transfert STRONG(T) du
  filtre de Rauch est : STRONG(-1 / (1 + 2mj w/w0 + (jw/w0)^2)) o�
  la fr�quence de coupure est STRONG(w0 = 1 / sqrt(R C1 C2)) et le coefficient d'amortissement
  vaut STRONG(m = 3/2 sqrt(C1 / C2)). La fa�on plus ou moins franche de couper
  avec ue pente de 40 db/decade d�pend du coefficient d'amortissement
  STRONG(m). Pour STRONG(m < 0.7) la coupure devient franche.
Le diagramme de Bode du montage est donn�e ci dessous :</p>

TABLEAU(2,LOWPICTURE(helico/schemas/filtre_aop/bode_rauch_ideal,Diagramme
de Bode avec un AOP id�al.),
LOWPICTURE(helico/schemas/filtre_aop/bode_rauch_lm324,Diagramme de
Bode avec un LM324.))

<p>A gauche, nous avons obtenu  le diagramme de Bode
   du gain avec un AOP id�al. En ajustant les valeurs des r�sistances et des
   capacit� pour obtenir STRONG(m) inf�rieur � 0.7, on a obtenu
   une coupure nette. A droite, le  m�me sch�ma mais r�alis� un AOP
   LM324 fait appara�tre une coupure beaucoup moins nette proche
   de celle que l'on a obtenu dans notre montage. On en d�duit
   qu'il n'est pas utile d'essayer d'adapter ce filtre optimal a notre
   situation gain de 10 et soustraction de la tension de
   r�f�rence.</p> -->

SUBSECTION(Les gyroscopes un axe,gyro)

<p>Les gyroscopes sont des capteurs qui mesurent la vitesse angulaire.
  Il en existe au moins deux sortes qui peuvent nous int�resser : les
  m�caniques et les pi�zo-�lectriques. Les m�caniques sont en g�n�ral
  lourds donc on ne va pas en utiliser. Nous pr�f�reront utiliser
  trois gyroscopes pi�zo-�lectriques un axe PG03 (s�ries ENC) de
  Murata. Pour info : en avionique, on utilise des gyros lazer.</p>

<p>A l'�tat actuel d'avancement du projet, ces gyroscopes
   pi�zo-�lectriques semblent avoir les inconv�nients suivants :</p>

<ul>
  <li>Ils donnent un signal utile dans une bande de fr�quence de
    l'ordre de l'hertz � quelques dizaines de hertz. Ils sont
    difficilement utilisables pour maintenir l'h�licopt�re dans une
    position stationnaire (objectif principal de ce projet) mais seront
    utiles pour le contr�le de trajectoire impliquant des vitesses
    plus grandes.</li>
  <li>Il n'est pas clair qu'il soit possible de stabiliser la
    plate-forme avec les seuls acc�l�rom�tres, lorsque le centre de
    gravit� de l'h�licopt�re n'est pas maintenu fixe. Dans ce dernier
    cas, on peut penser � une stabilisation gr�ce aux gyroscopes
    recal�s par des acc�l�rom�tres.</li>
</ul>

<p>Les capteurs
  EXTLINK(http://www.murata.com/catalog/s42e3.pdf,Gyrostar) sont
  difficiles � trouver, mais sont le coeur de gyroscopes bon march�
  utilis�s en a�romod�lisme comme les EXTLINK(,GWS PG03). Les PG03 sont con�us,
  par exemple, pour �tre branch�s entre la t�l�commande et le
  servomoteur sur l'anti-couple d'un h�licopt�re RC. Ils disposent
  donc de l'�lectronique pour moduler le signal de t�l�commande. Deux
  choix sont alors possibles :</p>
<ul>
<li>r�cup�rer le signal analogique du Gyrostar avec la carte du PG03
  (il faut d�monter le capot prot�geant l'�lectronique),</li>
<li>utiliser directement la sortie du PG03 (� savoir la modulation de
  type PWM).</li>
</ul>
<p>Le premier choix �limine la contrainte de vitesse du signal
  t�l�command� modul� � 50 Hz des PG03 mais n'utilise plus son circuit
  d'amplification. Il semble facile de dessouder le capteur de la
  carte �lectronique (avec un d�capeur thermique) mais il est moins
  dangereux de souder un fil sur la patte Out (num�ro 4) du Gyrostar
  directement sur la carte du PG03 LINK(,figure de droite). C'est la
  m�thode utilis�e ici. L'inconv�nient est l'encombrement augment�
  sur la carte �lectronique.</p>

TABLEAU(2,CAPTION(helico/photos/gyro.jpg),
CAPTION(helico/photos/gyro1.jpg))

<p>Contrairement � l'acc�l�rom�tre qui utilisait un filtre passe-bas
   du deuxi�me ordre. Le filtre des gyroscopes sera un filtre
   passe-bande du second ordre ordre (ordre 1 pour le filtrage basse
   fr�quence, ordre pour le filtrage haute fr�quence). Il s'inspire du
   filtre utilis� dans LATOUR, lui m�me inspir� du datasheet du
   capteur.</p>

<p>Sur le sch�ma de gauche, on a toujours R1 et R2 en pont diviseur de
   tension pour obtenir 2V. On a toujours C3 et C1 pour obtenir un
   filtre passe-bas. Par contre on a C3 et R3 servent au filtre
   passe-haut. Les valeurs ont �t� choisies par essais successifs sur
   Proteus pour que notre filtre amortisse les basses fr�quences
   inf�rieure � 1Hz et les fr�quences sup�rieures 25Hz.</p>

<p>Note: on aurait pu d�coupler par exemple R1 et R2 du reste du
   sch�ma gr�ce � un autre AOP. Ici, pour pouvoir embarquer la carte
   sur la plate-forme on pr�f�re minimiser le nombre d'AOP pour des
   raisons de poids et de place.</p>

TABLEAU(2,LOWPICTURE(helico/schemas/filtre_aop/gyro_aop, Filtre passe
bande d'ordre 1.), LOWPICTURE(helico/schemas/filtre_aop/gyro_bode,
Diagramme de Bode du gain sous Proteus.))

<!-- <p>Pour r�sumer, voici des exemples de signaux d'entr�e et de sortie que l'on obtient
   pour diverses fr�quences :</p>

LISTE(LINK(helico/schemas/filtre_aop/gyro_1.jpg,� 1Hz),
LINK(helico/schemas/filtre_aop/gyro_10.jpg,� 10Hz),
LINK(helico/schemas/filtre_aop/gyro_100.jpg,� 100Hz),
LINK(helico/schemas/filtre_aop/gyro_1000.jpg,� 1KHz))

<p>On remarque, qu'� 10Hz, les signaux ne sont pas d�phas�s.</p> -->

SUBSECTION(L'�lectronique de puissance,puis)
<p>Cette partie alimente un moteur, agit sur sa vitesse et observe
  le courant passant dans le moteur. Elle fait intervenir des
  puissances importantes de l'ordre 2A sous 8.5V (17W)
  (par rapport au PIC qui consomme du  20mA sous 5V (0.1W). Pour
  des raisons de simplicit�, cette version d'h�licopt�re utilise
  uniquement des moteurs �lectrique DC � balais (courant direct) que
  l'on fait tourner que dans un seul sens.</p>

LOWPICTURE(helico/schemas/ctrl_moteur/ctrl_moteur,Sch�ma de l'�lectronique de puissance.)

<p>STRONG(Update:) si on branche ce montage sur la sortie d'un dsPIC
   il faut ajouter une r�sistance de pull-up avant R3. Cela �vite de
   faire tourner les moteurs quand le dsPIC est en reset (d�marrage,
   arret, programmation, ...). </p>

<p>Les composants du sch�ma sont :</p>
LISTE(2 r�sistances classiques : R1 (1K&Omega;) et R3 (1.5K&Omega;),
1 resistance de puissance : R2 (1&Omega;[,] 5W),
1 capacit� : C1 (2&micro;F),
1 MOSFET N : Q1 (IRF530),
1 transistor NPN : Q2 (BC547),
1 diode de puissance 6A (roue libre),
1 moteur �lectrique courant continu � balais)

<p>Le principe est le suivant : un signal carr� (PWM) de +5V/0V g�n�r�
  par un dsPIC est envoy� dans la base du transistor Q2 ce qui le fait
  saturer ou bloquer alternativement. Quand le dsPIC n'envoie pas de
  courant dans la base du transistor, ce dernier est bloqu� et le
  courant du collecteur devient nul. Il n'y a pas de chute de tension
  dans R1 et la tension au borne de la grille du MOSFET Q1 est de
  +8V. Inversement, quand le dsPIC envoie un courant dans la base de
  Q2, alors le transistor est satur�, la tension entre le collecteur
  et l'�metteur est presque nulle. Le MOSFET est un transistor
  command� en tension. D�s qu'il existe une tension non nulle entre sa
  grille et sa source il laisse passer un courant drain-source, ce qui
  alimente le moteur. Pour plus de renseignements voir XNICO, section
  ITALIQUE(transistors).</p>

<p>L'observation du courant du moteur se fait gr�ce � un AOP en
   montage soustracteur (gain de 1) qui permet d'obtenir la diff�rence
   de potentiel aux bornes de la r�sistance de puissance R2 (1&Omega;,
   5W). L'inconv�nient de cette m�thode est la perte par effet Joule
   dans la r�sistance. La capacit� C1 permet de filtrer le courant du
   moteur. Le choix de sa valeur est expliqu� dans la section
   suivante. Le transistor Q2 permet d'isoler le dsPIC de la partie
   puissance dans laquelle des courants importants alimentant le
   moteur circulent. La diode de puissance D1 permet au courant dans
   le moteur de circuler lorsque le MOSFET est bloqu� (roue
   libre).</p>

PICTURE(helico/schemas/ctrl_moteur/bobine.jpg,N�cessit� de la roue libre.)

<p>La tension U aux bornes d'une bobine vaut LdI/dt. Lorsque le MOSFET
   est satur� il se comporte comme un interrupteur ferm� et le courant
   I augmente pour que U atteigne Vcc. La d�riv�e du courant est
   positive. Quand U est non nul et que l'on coupe le MOSFET, celui-ci
   se comporte comme un interrupteur ouvert et donc la valeur de I
   passe de tr�s grande � nulle. Sa d�riv�e est donc un dirac n�gatif
   et le courant change de sens avec une tension �norme en B avec VB
   >> VA. La diode prot�ge le circuit car le courant va la traverser
   de B vers A.</p>

SUBSECTION(D�termination de la bonne fr�quence du PWM,freq)

<p>Nous savons d�sormais faire tourner le moteur en envoyant un signal
   PWM dans la base de Q2. On sait aussi observer le courant du moteur
   gr�ce � R2. Gr�ce � une s�rie d'exp�riences on identifiera la
   fonction (non lin�aire) de transfert qui aux consignes des courant
   des divers moteurs associe l'attitude de l'h�licopt�re. Cette
   fonction sera expliqu�e dans le chapitre consacr� �
   l'MYLINK(helico_asservissement,asservissement).</p>

<p>Sachant que le quartz du dsPIC est de 6.5 MHz, qu'il utilise un
   multiplieur de fr�quences par 16 et qu'il faut 4 tops d'horloge
   pour ex�cuter une instruction, on en d�duit que la fr�quence
   d'ex�cution d'une instruction est de 26 MHz. Sachant aussi que le
   rapport cyclique du PWM est cod� sur un registre de 16 bits, on
   peut calculer la fr�quence du PWM. En utilisant le maximum de
   pr�cision (16 bits) pour coder le signal, on obtient un PWM � 400
   Hz, ce qui n'est pas rapide. A chaque bit de pr�cision perdu du
   rapport cyclique, on double la fr�quence possible du PWM. En
   utilisant 10 bits on peut monter PWM � 25 KHz. En utilisant 7 bits
   on atteint 200 KHz. Plus on augmente la fr�quence du PWM mieux le
   moteur et la capacit� � ses bornes filtrent le signal PWM d'entr�e
   et plus le moteur se comporte comme s'il �tait aliment� en courant
   continu du point des de vue d'une commande � une fr�quence donn�e.
   Il faut faire un compromis entre rapidit� du PWM qui permet un
   meilleur filtrage et donc une meilleure r�alisation de la consigne
   et la pr�cision du rapport cyclique qui d�termine la pr�cision avec
   laquelle est donn�e la consigne.<p>

<p>Pour stabiliser notre h�licopt�re en vol, on aimerait mettre en
   place :</p>

LISTE(Une boucle d'asservissement du courant de chaque moteur �
STRONG(500Hz) avec une consigne suivie avec une
pr�cision de 7 bits., Une boucle d'asservissement
d'attitude de l'h�licopt�re � STRONG(25 Hz) agissant sur la consigne
de la  boucle de courant.
Le signal PWM  STRONG(200 KHz) peut �tre g�n�r� avec 7 bits de
pr�cisions sur le dsPIC cadenc� comme indiqu� ci dessus[,] )

<p>On aimerait filtrer les parasites du � la commande PWM du  moteur :</p>
LISTE(Eliminer les hautes fr�quence du signal PWM en particulier le 200 KHz et
et conserver sans modification les signaux � basse fr�quence contenant
l'information utile pour r�aliser la boucle de courant.
Typiquement une sinuso�de � 500 Hz cod�e dans le signal PWM doit
rester intacte avec une pr�cision de 7 bits.)

<p>Pour ce dernier point c'est la capacit� C1 de 2 &micro;F mont�e en
  parall�le du moteur qui va jouer le r�le du filtre. Il reste encore
  � justifier et valider le choix de cette capacit� et de la fr�quence
  du PWM. Cette justification vient des simulations r�alis�es avec
  Proteus.</p>

<p>Ces exp�riences consistent � simuler le montage de puissance vu
   pr�c�demment, avec des valeurs de capacit� diff�rentes et d'envoyer
   des signaux PWM � diff�rentes fr�quences. On regarde la courbe du
   courant provenant moteur qui en r�sulte. On r�duit les parasites
   (engendr�es par l'alimentation PWM) du courant du moteur en
   augmentant la capacit� de filtrage ou en augmentant la fr�quence
   PWM choisie.  Chaque fois qu'on augmente la fr�quence PWM on
   diminue la pr�cision de la consigne. Chaque fois que l'on augmente
   la valeur de la capacit� les hautes fr�quences PWM sont mieux
   att�nu�es donc la pr�cision de suivie d'une consigne constante est
   am�lior�e mais le signal variable utile est aussi att�nu�. Pour
   conserver un signal basse fr�quence (inf�rieur � 500 Hz) non
   d�form� la fr�quence PWM 200 Khz conduisant � une consigne de 7
   bits de pr�cision suivie exactement gr�ce � une capacit� de 2
   &micro;F sont les bons compromis.</p>

<p>Les moteurs r�els utilis�s pur l'h�licopt�re sont des
  MYMOTEURS_GRAUPNER (ou MYMOTEURS_GWS). Voici les caract�ristiques de
  ces moteurs selon le site CLAYESDUCIEL.</p>

MYTABLE(3,50,Caract�ristiques du moteur,valeur,unit�,
poids,15,g,
Nombre de tours par volt, 3691,tr/V,
R�sistance interne du moteur, 1,&Omega;,
Courant absorb� par le moteur � vide, 0.28,A,
Pas de l'h�lice utilis�e, 2, pouce,
Diam�tre de l'h�lice utilis�e, 3, pouce,
Vitesse rotation moteur, 25000, tr/min)

<!-- <p>Voici le tableau du pourcentage de fluctuation du courant en
   fonction de la fr�quence du PWM et de la capacit� obtenu par
   simulation sous Proteus. On voit que pour
   C1=2&micro;F et en passant de 100KHz a 200KHz, que �a ne sert �
   rien de vouloir gagner des 1/2^16 de pr�cision sur la g�n�ration
   des cr�neaux alors que la fluctuation du courant est de 4%.</p>

MYTABLE(5,75,Capa\PWM,1KHz,200KHZ,100KHZ,50KHz,
2uF,LINK(helico/schemas/ctrl_moteur/capa2uf_pwm1k.jpg,plot),LINK(helico/schemas/ctrl_moteur/capa2uf_pwm200k.jpg,2%),,,
20uF,,,,,
50uF,,,,,
100uF,,,,,
1000uF,,,,)
CENTER(Etude de l'influence de la capa sur le filtrage de courant. %err)
-->

SUBSECTION(Filtre analogique sur l'observation du courant du moteur,icur)

<p>Ce circuit est en cours de modification. La fr�quence de coupure
  (actuellement de 500 Hz) est mal plac�e. Il faut couper � 150 Hz. La
  sortie de ce circuit se branche dans l'une des entr�es analogiques
  du dsPIC. Pour la r�gulation de la plate-forme, il faudra avoir
  un circuit par moteur, soit quatre au total.</p>

TABLEAU(3,LOWPICTURE(helico/schemas/ctrl_moteur/FiltreCrtMoteur),
LOWPICTURE(helico/schemas/ctrl_moteur/FiltMot_VitMot_20Ktrmin_1),
LOWPICTURE(helico/schemas/ctrl_moteur/FiltMot_VitMot_20Ktrmin_2))

<p>A gauche : l'interface de puissance et le filtre passe bas qui doit
  �tre mis � jour (fr�quence de coupure � 500 Hz et gain de 1). Au
  centre : le r�sultat du filtre en situation r�elle (en jaune
  l'entr�e de l'AOP, en vert la sortie). On voit que les hautes
  fr�quences sont att�nu�es mais il existe une oscillation basse
  fr�quence � 300 Hz g�nante pour la r�gulation du courant (zoom sur
  l'image de droite). Apr�s recherche cette fr�quence correspond � la
  vitesse de rotation du moteur (ici 20K tours/min) et donc aux
  imperfections des contacts des balais.</p>

divert(DIVERT_FOOTER_CODE)

END_BODY(helico_mecanique,Construction de la carcasse,
helico_logiciel,Software)

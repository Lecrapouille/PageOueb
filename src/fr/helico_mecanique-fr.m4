dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

ICON_UPDATED STRONG(Page en cours de r�daction).

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,Liste du mat�riel,#matos,
Construction de la croix,#croix,
Construction des attaches des moteurs,#moteur,
Construction des pieds,#pieds,
Construction des pieds de la balan�oire,#balanc),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Partie mat�rielle)
SUBSECTION(Contexte)

<p>Cette page explique comment construire la carcasse de
   l'h�licopt�re. Le design a �t� pens� pour que l'h�licopt�re soit le
   plus simple � fabriquer et qu'il soit de petite taille (taille
   d'une main soit 25 cm environ). Avec l'exp�rience, une journ�e
   suffit pour construire la croix, les pattes et les attaches des
   moteurs.</p>

<p>Cette page a �t� d�coup�e selon les points suivants :</p>
LISTE(LINK(#matos,Liste du mat�riel � acheter),
LINK(#croix,Construction de la croix),
LINK(#moteur,Construction des attaches des moteurs),
LINK(#pieds,Construction des pieds,#pieds),
LINK(#balanc,Construction des pieds de la balan�oire))

<p>La construction de la carte �lectronique n'est pas encore � l'�tude
  car elle est actuellement non embarqu�e.</p>

<!--<p>Vu que l'appareil est 'fait main' il reste quelques probl�mes
  de solidit� (colle qui l�che). Les caract�ristiques de cet h�licopt�re
  s'inspire de JOSEJ. Le site XNICO et CRACMIKE d�crivent
  d'autre m�thodes pour construire un h�licopt�re de taille et de
  poids plus important.</p>-->


SUBSECTION(Liste du mat�riel � acheter,matos)

<p>Voici une liste minimale et non exhaustive de composants qu'il faut
  avoir pour construire son h�licopt�re. Il vous faudra aussi un
  certain nombre de r�sistances (et, bien que non optimal, au moins
  quatre r�sistances de puissance 1&Omega; et 5W), condensateurs,
  diodes de roues libres, MOSFET et transistors.</p>

<p><!-- Des outils comme : une carte � essai, un oscilloscope et un
  voltm�tre sont utiles.--> Pour l'usinage des pi�ces, les outils
  suivants ont �t� utiles : un petit marteau, un �tau, une petite
  scie, des ciseaux et une colle (il faut bien la choisir car elle
  peut faire des r�actions chimiques avec des mat�riaux comme le
  polystyr�ne).</p>

MYTABLE(4,90,STRONG(Nom),STRONG(Quantit�),STRONG(Prix unitaire
(euro)),STRONG(Remarques), Moteur �lectrique courant continu
� balais
MYMOTEURS_GRAUPNER,4,5,Poids: 16 g. Pouss�e max.: xxg en lui
fournissant 8.5V et 1.2A (avec 1 r�sistance 1&Omega; en
s�rie). Equivalent au moteur
MYMOTEURS_GWS.,H�lice
� pas fixe invers�,2,?,Des h�lices de cette taille
�tant introuvables ...,H�lice � pas
fixe,4,2,... on est oblig� d'utiliser quatre h�lices
� pas fixe
EXTLINK(http://www.gws.com.tw/english/product/powersystem/edp50.htm,EP3020)
(taille: 3 pouces, pas: 2 pouces).,Gyroscope
py�zo-�lectrique
EXTLINK(,GWS PG03),3,25 sur Ebay,Ce qui nous int�resse ici
c'est uniquement le capteur gyro ENC-03
EXTLINK(http://www.murata.com/catalog/s42e3.pdf,datasheet). Cette
m�thode est la plus �conomique (prix et
difficult� des soudures � r�aliser) mais n�cessite de
ITALIQUE(bidouiller) le gyroscope (voir LINK(helico_electro-LANG.html,ici)).,
Acc�l�rom�tre EXTLINK(http://www.analog.com/UploadedFiles/Data_Sheets/ADXL320.pdf,ADXL320),1,5,C'est le capteur le plus utile
: il indique la verticale quand l'h�licopt�re a une vitesse constante. Vu la taille petite (4x4 mm) il est dur de
le souder manuellement mais il en existe d�j� EXTLINK(http://www.robotshop.ca/accueil/fournisseurs/spark-fun-fr/accelerometre-adxl320-spark-fun.html,soud�).,T�l�m�tre
EXTLINK(http://info.hobbyengineering.com/specs/SHARP-gp2y0d340_j.pdf,GP2Y0D340),1,15,Passe de l'�tat 0 � 1 � 40 cm d'un
obstacle.,Microcontr�leur
EXTLINK(http://ww1.microchip.com/downloads/en/DeviceDoc/39582b.pdf,PIC16F876A),2,4,Bien
pour s�buter et apprendre l'architecture PIC avec le cours de
BIGONOFF mais limit� en puissance de calcul.
,Microcontr�leur dsPIC LINK(,dsPIC20F10),2,3,le dsPIC n'a que trois
sorties PWM. On peut en choisir un plus gros. Ici j'en ai choisi 2,Programmeur (ds)PIC,1,30
sur Ebay,On peut se construire son propre programmeur
JDM PIC., C�ble
de rallonge pour port s�rie (m�le/femelle point � point),1,4,Utile pour la communication
dsPIC/PC. Si on veut faire communiquer 2 PC il faut utiliser un c�ble
null modem (c�ble crois�, notamment Rx et Tx).,Tube de carbone creux
(diam�tre 6 mm; longueur >
20 cm),2,?,Pour construire les deux axes de l'h�licopt�re.,Plaque
d'aluminium,1,?,Pour construire l'attache qui maintiendra les 2 tubes de
carbon entre eux.,Tube rond de laiton 2 x 0.3 - 1 m,1,2,Serviront � Pour
construire les pieds qui rentreront dans les tubes de
carbone.,Cheville,4,1,Cheville que l'on met dans les murs pour mettre
une visse. Ici[,] sert � coincer les tiges de laiton dans les tubes de carbone.,
Alimentation de PC,1,60,Il n'y aura pas de batterie � cause de
leur poids. L'h�licopt�re sera branch� sur une alimentation
externe sortant du 12V[,] 9A max., STRONG(Total : h�licopt�re 4
rotors),STRONG(1),STRONG(230 min.),
Un X-UFO co�te dans les 150 euro)

<p>STRONG(Note:) Avant l'utilisation des moteurs Micro Speed, des
   moteurs �lectrique � balais
   EXTLINK(http://www.netshop.nl/shop/krikkem/contents/nl/d231_01.html,Graupner
   Speed 195) (�quivalent au moteur
   EXTLINK(http://www.gws.com.tw/english/product/powersystem/edp.htm,GW/EDP-05))
   �taient utilis�s car ils �taient les plus petits/legers du
   march�. Leur poids est de 7 grammes pour ont une pouss�e de 30
   grammes maximum. Ils ont �t� remplac�s par les microspeed car pas
   assez puissants.</p>

dnl SECTION(Construction de l'h�licopt�re,helico)
SUBSECTION(Construction de la croix,croix)

<p>La structure de l'h�licopt�re est constitu�e de deux tubes en fibre
   de carbone maintenus ensembles par deux pi�ces en aluminium
   fa�onn�es � la main. L'ensemble est coll�.</p>

<p>Les axes � de l'h�licopt�re sont obtenus en coupant deux tubes en
  fibre de carbone de 20 cm de longueur. Ces tubes sont creux (diam�tre
  6 mm) afin de pouvoir ins�rer les tiges de laiton qui serviront de
  pieds. Ces fibres de carbone constituent un mat�riau tr�s l�ger mais
  qui amortit peu les vibrations. Il faut donc �tre attentif aux
  EXTLINK(http://fr.wikipedia.org/wiki/R%C3%A9sonance,modes propres)
  de la structure. Dans notre cas, du fait de la petite dimension de
  l'h�licopt�re, ces modes propres ne sont pas g�nants.</p>

<p>Les deux tubes de carbone sont attach�s ensemble gr�ce � la plaque
  d'aluminium. Il faut d�couper deux carr�s de longueur arbitraire
  MATHS(C) dans la plaque d'aluminium et dessiner sur chaque carr� le
  LINK(helico/schemas/patron_croix.jpg,patron de la figure ci dessous
  gauche).</p>

TABLEAU(2,CAPTION(helico/schemas/attaches/patron_croix.jpg),
LOWCAPTION(helico/photos/croix),Le patron,Les 2 attaches obtenues)

<p>Sur ce patron nous avons trois formes g�om�triques :</p>
<ul>
  <li>Les deux petits triangles (en pointill�) qui sont des
    parties � �liminer;</li>
  <li>Les deux grands triangles qui sont des parties � coller avec
    les deux autres triangles de la deuxi�me plaque;</li>
  <li>Le rectangle de longueur MATHS(L) arbitraire et de largeur
    MATHS(&pi;D) (o� D doit �tre le diam�tre des
    tubes de l'h�licopt�re donc, ici, 6 mm)
    va s'enrouler autour d'une des deux tiges/axes de
    l'h�licopt�re.</li>
</ul>

<p>Avec l'aide d'un �tau, on plie les triangles le long des ar�tes du
  rectangle et on enroule les rectangles sur les tubes de
  carbone. Avec de la colle super forte on colle l'ensemble. Avec des
  pinces � linge on presse les triangles afin de bien les coller
  ensemble. On obtient la LINK(helico/photos/croix_big.jpg,figure haut
  droit). Le fait de limer la surface des triangles aide � mieux
  coller les 2 plaques entre elles.</p>
<p>Attendre un jour entier, que la colle prenne ;-(</p>



SUBSECTION(Construction des attaches des moteurs,moteur)

<p>On va reprendre le m�me principe que pour la croix. Avec la
  plaque d'aluminium, on coupe quatre pi�ces selon le patron
  dessin� en dessous.</p>

TABLEAU(2,CAPTION(helico/schemas/attaches/patron_attache.jpg),
LOWCAPTION(helico/photos/attachehelicev2),Le patron,L'attache
obtenue.)

<p>Le rectangle de longueur 1.88 cm (&pi;D) et de largeur 1 cm va
s'enrouler autour du tube en fibre de carbone. Les deux rectangles
verticaux (1 x 4cm) se retrouveront c�te � c�te. Ils vont permettent
d'entourer le moteur. La surface du moteur est alors enti�rement
recouverte. D'o� une bonne surface de fixation pour la colle. Une
partie facultative (et qui n'a pas �t� utilis�e) est le capuchon trou�
(1 x 1.5 cm) qui se rabat sur le haut du moteur.</p>


SUBSECTION(Construction des pieds,pieds)

<p>On usinera la tige de laiton pour cr�er les quatre pieds de
   l'h�licopt�re.  Comme les deux axes de l'h�licopt�re reposent l'un
   sur l'autre, on coupera deux tiges parmi les quatre l�g�rement plus
   longues que les autres.  La diff�rence de longueur est le diam�tre
   de l'axe de l'h�licopt�re. Avec l'�tau, on plie les pieds en forme
   de L (figure ci dessous gauche).</p>

<p>Si les tiges de laiton sont trop fines pour entrer dans les axes de
   l'h�licopt�re, on peut s'aider en les ins�rant de
   LINK(helico/cheville.jpg,cheville) en plastique pour mettre des visses
   dans les murs.</p>

TABLEAU(3,LOWCAPTION(helico/photos/pieces_patte),
LOWCAPTION(helico/photos/pieces_croix),
LOWCAPTION(helico/photos/h4hpattes),
Cheville et tige de laiton,
Les diff�rentes parties � usiner,
h�licopt�re final)


SUBSECTION(Construction de la carte des capteurs,capt)

<p>Cette carte est une plaque d'essai en epoxy que l'on peut d�tacher
  de la croix. Elle contient, pour l'instant, un gyroscope, un
  acc�l�rom�tre et un capteur de distance IR. Il reste de la place
  pour deux gyroscopes et un AOP avec ses r�sistances. Pour l'instant
  on utilise les cartes compl�tes des gyroscopes pour plus de facilit�
  au niveau �lectronique mais elles prennent beaucoup de place. On
  optimisera la place plus tard en r�cup�rant uniquement le
  capteur.</p>

TABLEAU(2,LOWCAPTION(helico/photos/capteurdessus),
LOWCAPTION(helico/photos/capteurdessous),Carte des capteurs vue de
dessus,Carte des capteurs vue de dessous)

<p>Cette carte est plac�e au dessus la croix de l'h�licopt�re. Une
   deuxi�me carte �lectronique d�tachable portant l'�lectronique de
   contr�le et de puissance (PIC, AOP, MOSFET, r�gulateur), plus
   lourde, sera plac�e en dessous. Le centre de gravit� de
   l'h�licopt�re sera ainsi plac� en dessous de la structure alors que
   le centre de pouss�e des h�lices, lui, est plac�e au dessus.
   L'h�licopt�re sera stable. Les deux cartes s'embo�teront
   ensemble.</p>

<p>En l'absence de la deuxi�me carte �lectronique, les moteurs sont
   retourn�s et la carte des capteurs se trouve en dessous de la
   structure. Ainsi, lorsque l'h�licopt�re est attach� sur le banc
   d'essai, son centre de gravit� se trouve ainsi sous l'axe de
   rotation. A l'�quilibre stable, les h�lices sont dirig�es vers le
   haut et l'h�licopt�re se comporte m�caniquement comme un pendule
   standard.</p>

<p>Le chapitre sur LINK(helico_asservissement-LANG.html,la partie
   asservissement) sera plus explicite sur comment stabiliser
   l'h�licopt�re. Le chapitre sur
   LINK(helico_electronique-LANG.html,la parte �lectronique) sera plus
   explicite sur comment utiliser les signaux des capteurs.</p>

SUBSECTION(Construction des pieds de la balan�oire,balanc)

<p>Le but du banc d'essai et de limiter les degr�s de libert� laiss�s
   aux mouvement de l'h�licopt�re. Les degr�s libres sont : une
   rotation que l'on appellera tangage, une translation verticale pour
   pouvoir tester une version simplifi�e du vol.  Lorsque le banc
   d'essai permet le seul tangage, on parlera de balan�oire pour
   l'ensemble h�licopt�re-banc d'essai. Le banc d'essai a �t� fait
   en Lego Technique pour des raisons de simplicit�. Il doit �tre
   suffisamment haut pour pouvoir tester le capteur de proximit�
   commutant � quarante centim�tre. Elle doit aussi �tre
   suffisamment large pour pouvoir l'utiliser avec les quatre
   moteurs.</p>

<p>Un mod�le simple de rotule a �t�, mis en place sur la version 1 de
   la balan�oire, mais n'a pas (encore) servi.</p>

TABLEAU(3,LOWCAPTION(helico/photos/balancoirev1),
LOWCAPTION(helico/photos/helico_balan1),
LOWCAPTION(helico/photos/balancoirev2),
Version 1 avec rotule,Version 1 sans rotule,Version 2)

<p>Les trous dans les briques sont assez grands pour laisser passer la
   tige de laiton (alias pieds de l'h�licopt�re).  L'ajout de tiges
   horizontales LEGO sur chacun des coins de la balan�oire permet de
   bloquer les pieds (plac�s vers le haut) de l'h�licopt�re s'il
   bascule trop (version 1 bis).</p>

<p>La version 2 de la balan�oire a �t� agrandie avec des briques DUPLO
   et mesure maintenant 40 cm de haut. Deux barres verticales de LEGO,
   lisses et parall�le entre elles, ont �t� ajout�es afin d'�tudier la
   r�gulation en altitude de l'h�licopt�re. Le but est de laisser
   l'h�licopt�re coulisser verticalement o� un �lastique permet de
   limiter sa chute (mais cr�e des frottements).</p>

divert(DIVERT_FOOTER_CODE)

END_BODY(helico_etapes,Etapes de la construction,helico_electronique,Construction de la carte �lectronique)

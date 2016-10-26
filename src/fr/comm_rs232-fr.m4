dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Port s�rie sous *nix)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

ICON_BUILD STRONG(Page en cours de r�daction. Les phrases sont
int�lligibles ! C'est normal[,] je viens juste d'�crire le plan.)

divert(DIVERT_BODY_CODE)

SECTION(Port s�rie sous Linux,serie)
SUBSECTION(Qu'est ce que la liaison s�rie asynchrone ?,dd)

<p>Un ordinateur, un terminal, une imprimante est un �l�ment
   susceptible d'�changer des donn�es avec un r�seau mais il ne permet
   pas de se connecter directement � la ligne de transmission. On
   utilise le terme DTE (Data Terminal Equipment) pour parler de ces
   �l�ments. Deux DTE ne peuvent a priori pas communiquer entre
   eux. Ils doivent passer par un DCE (Data Communications Equipment)
   pour la transformation des signaux. Un �quipement DCE bien connu
   est le modem qui permet � deux ordinateurs de communiquer �
   distance entre eux via une ligne t�l�phonique.</p>

<p>Dans ce document, par abus de langage, on enploiera les termes :</p>

LISTE(D'ordinateur (PC, Mac, ...) pour parler de terminal et donc
      DTE., De modem pour parler de l'�quipement de communication et
      donc DCE. Plus tard dans ce document[,] on remplacera le terme
      de modem par microntr�leur dsPIC vu que dans le projet
      MYLINK(helico_intro,H4H) on desire faire communiquer un PC avec
      un dsPIC.)

<p>La liaison s�rie a �t� concue pour permettre l'interfa�age entre un
   �quipement terminal de donn�es (DTE : Data Terminal Equipment) et
   un �quipement de communication de donn�es (DCE : Data
   Communications Equipment) employant des �changes de donn�es en
   s�rie, � savoir bit apr�s bit (par oposition avec le port parall�le
   qui �met un mot � la fois, � savoir un ensemble de bits). Il existe
   diff�rentes normes pour v�hiculer l'information : la plus simple
   (et celle que l'on va parler ici) est la norme RS-232 : elle est
   pr�sente sur les PC personnels (mais tend de plus en plus � �tre
   remplac�e par le bus USB).</p>

SUBSECTION(Connectique)

<p>Nous nous int�resserons uniquement aux connecteurs 9 broches
   appel�s DB9 qui sont encore utilis�s sur les PC. Il existe des
   connecteurs males et femmelles. Les connecteurs utilis�s surles PC
   sont du genre male. Voici des photos des connecteurs ainsi que les
   num�ros des broches qui changent selon le genre.</p>

TABLEAU(4,PICTURE(comm/DB9F.jpg,DB9 Femmelle),
PICTURE(comm/con_db9F.jpg,DB9 Femmelle),
PICTURE(comm/DB9M.jpg,DB9 Male),
PICTURE(comm/con_db9m.jpg,DB9 Male))

<p>Voici les num�ro des br�ches correspondant aux images pr�c�dentes
   ainsi que leur acronyme, nom anglais et fran�ais et si c'est une
   entr�e ou une sortie. Nous d�finirons plus tard le r�le de chaque
   broche.</p>

MYTABLE(5,80,Num�ro broche,E/S,Acronyme,Nom,Traduction,
1,entr�e,DCD,Data Carrier Detect,D�tection de porteuse,
2,entr�e,RxD,Receive Data,R�ception de donn�es,
3,sortie,TxD,Transmit Data,Emission de donn�es,
4,sortie,DTR,Data Terminal Ready,Terminal de donn�es pr�t,
5,X,GND,GrouND,Masse,
6,entr�e,DSR,Data Set Ready,Poste de donn�es pr�t,
7,sortie,RTS,Request to Send,Demande d'�mission,
8,entr�e,CTS,Clear To Send,Pr�t � �mettre,
9,entr�e,RI,Ring Indicator,Indicateur de liaison)

SUBSECTION(Brochage le plus simple entre un ordinateur et un modem)

<!-- <p>Il existe deux modes d'�change de donn�es pour le port s�rie : le
   mode synchrone et le mode asynchrone. Nous nous int�resserons au
   deuxi�me mode.</p>

<p>Le mode synchrone n�c�ssite, en plus des deux lignes pour
   communiquer, l'utilisation d'un signal de synchronisation entre
   l'�m�tteur et le r�cepteur qui leur permettent de savoir le d�but
   et la fin d'un octet. Ce mode a l'inconv�nient d'utiliser un fil
   suppl�mentaire.</p>

<p>Le mode asynchrone permet de se passer de ce signal suppl�mentaire
   de synchronisation. Emetteur et r�cepteur doivent alors communiquer
   avec la m�me vitesse et se synchroniser avec un bit de start et de
   stop. Le mode asynchrone n'ayant pas besoin de ligne d'horloge, il
   reste alors deux lignes pour communiquer, chacune �tant d�dicac�e �
   un sens de transfert ce qui permet d'envoyer et recevoir des
   donn�es en m�me temps mais on doit alors connaitre la vitesse �
   l'avance la vitesse de transmission des donn�es. On parlera de
   alors liaison full-duplex. La liaison half-duplex impose la
   r�ception ou la transmission d'une donn�e � la fois. Voir le cours
   sur les PIC16F877 de BIGONOFF pour plus de d�tail sur les
   diff�rents modes de transmission.</p>-->

<p>La figure suivante montre la connexion la plus simple pour �mettre
   et recevoir des donn�es.</p>

CENTER(STRONG(<p RxD  -> TxD</p>
<p>(ordi) TxD  <-  RxD (modem)</p>
<p>GND <-> GND</p>))</p>

<p>Le probl�me majeur est que les ordinateurs et les modems sont des
   composants h�t�rogenes de part leur vitesse de traitement des
   donn�es ainsi que la taille du tampon de m�moire qui permet de
   stocker provisoirement les donn�es avant leur traitement. Aucun des
   deux protagonistes ne peut v�rifier si son correspondant est pret �
   �mettre ou � recevoir des donn�es, s'il est sous tension ou si son
   buffer n'est pas satur� (par exemple si l'ordinateur �met plus de
   donn�es que ne peut accepter le modem).</p>

<p>C'est pour cela qu'il existe diff�rents contr�les de flux aussi
   appel�s protocole d'accord ou encore handshaking (poign�e de
   main). Il en existe trois. Nous y viendrons plus tard.</p>

LISTE(Contr�le mat�riel utilise les broches DTR/DSR et/ou RTS/CTS.,
      Controle logiciel aussi appel� Xon/Xoff � cause des octets
      sp�ciaux qui sont envoy�s., et XXX.)

SUBSECTION(Protocole de communication entre deux ordinateurs via leur modem)
<!-- ordi1 <==> modem1 <==> modem2 <==> ordi2 -->

CENTER(Copier Figure 11)

<p>La figure, montre un ordinateur (O1) en communication avec un autre
   ordinateur (O2) via leur modem (M1 et M2). Voici la description de
   leur protocole d'�change.</p>

<p>Lorsque l'oridateur O1 d�sire envoyer des donn�es � O2, il envoie
   une demande d'�mission � son modem M1 avec la broche RTS (Request
   To Send). Lorsque M1 d�tecte ce signal, il �met une porteuse
   non-modul�e � M2. Cette porteuse est re�ue et d�tect�e par le modem
   M2 qui le signale � l'ordinateur O2 gr�ce � la broche DCD (Data
   Carrier Detect). Le modem M1 envoie � O1 un signal 'pr�t � �mettre'
   via la broche CTS (Clear To Send). L'ordinateur la percois et
   envoie � son modem les donn�es sur la ligne d'�mission (TxD). Le
   modem M1 module alors le signal de donn�es sur la porteuse. La
   porteuse modul�e est re�ue et d�modul�e par le modem M2 pour �tre
   transmise � l'ordinateur O2 via la ligne de r�ception (RxD).</p>

<p>D'autres signaux sont �chang�s entre l'ordinateur et son modem, il s'agit
   du signal DTR (Data Terminal Ready) lorsque l'ordinateur est pr�t et
   du signal DSR (Data Set Ready) lorsque le modem est pr�t.</p>

SUBSECTION(D�finissions des broches)

<p>Nous comprenons maintenant pourquoi malgr� le fait que les
   communications soient de type asynchrone et full duplex, les
   connecteurs DB9 ont 9 broches.</p>

<p>Nous pouvons maintenant donner l'utilit� de toutes les broches du
  DB9. Pour cela, on se placera du c�t� de l'ordinateur.</p>

<p>RxD et TxD sont les deux signaux Gnd

<p>DCD: (ou CD) d�tection de porteuse ou Data Carrier Detect. Le
   modem indique � l'ordinateur qu'une liaison avec un autre modem est
   �tablie (ou dit autrement qu'il y a un lien de connection entre les 2 modems). Le
   signal est alors � l'�tat haut. Il n'est pas utilis� directement
   pour le flux de contr�le principalement comme une indication.</p>

<p>RTS et CTS: L'utilisation d'origine est : ITALIQUE(I Request To
   Send to you) Je demande � vous envoyer. L'ordinateur demande �
   son modem s'il peut envoyer des donn�es � l'autre ordinateur. CTS:
   le modem est pret a recevoir les donnees de l'ordinateur pour les
   envoyer a l'autre modem. ceci ne prot`ege le flux que dans une
   direction : de l'ordinateur (ou du terminal) vers le modem (is,
   that the DTE can always handle incomming information faster than
   the DCE In the past, this was true.).</p>

DTR et DSR: Joue le meme role que RTS/CTS
DTR: l'ordinateur indique au modem qu'il est pret. The DTE uses the DTR signal
to signal that it is ready to accept information,

DSR: le modem indique a l'ordi qu'il est pret.

RI: le modem veut initier avec l'ordinateur.

Copier figure 10.


SUBSECTION(Controle de flux (ou comment proteger le modem de l'ordinateur))

<p>Certains pensent que le contr�le de flux mat�riel est fait par le
   mat�riel mais (sauf si vous utilisez une carte s�rie intelligente
   avec plusieurs ports s�rie) c'est en r�alit� votre syst`eme
   d'exploitation qui s'en charge.</p>

<p>logiciel Xon/Xoff : surtout utilie quand on veut envoyer des
   caracteres ascii (et pas de donnees binaires) car il y a des plages
   de valeurs ou la. Si utilisation du binaire alors car il faut
   doubler les Xon/Xoff ce qui est chiant.</p>

<p>logiciel ETX/ACK ACK pour ackitement</p>

SUBSECTION(Connexion par c�ble null-modem)

<p>Parfois on d�sire faire communiquer deux ordinateurs entre eux. The
   main use of null modem cables is file transfer between two
   computers. L'idee est de faire croire que l'ordinateur 1 parle avec
   un modem B plutot qu'avec un autre ordinateur. On utilise alors un
   cable null-modem (cable croise).<p>

LINK(http://www.lammertbies.nl/comm/info/RS-232_null_modem.html)

SUBSECTION(Format des trames)


SECTION(Programmer le port s�rie avec Linux)
SUBSECTION()
- ouverture, fermeture
- vitesse, nb bit start, nb bits stop, parite,
- mode raw, mode canonique
- controle des broches : raise drop
- ecrire, lire
- dessiner la machine a etat pour controle de flux.

SUBSECTION(D�finition de notre protocole de communication entre Linux (ou Mac) et un dsPIC)

<p>Le choix de la vitesse est arbitraire.</p>
<p>Le choix du format est : 8 bits de donnes utulisation du mark/space
   parity afin de re-synchroniser les messages entre eux (Voir cours
   de Bigonoff pour plus de detail USART).  1 bit de stop. Check sum
   materiel.  Flow de control logiciel et materiel desactive (on
   prefera utiliser notre propre protocole de flot de controle) Ici :
   on utilisera les broches DTR et DSR.  Contrairement a ce qu'on a
   dit precedement on direra que ces broches servent � indiquer "Pret
   a recevoir" afin de proteger le buffer</p>

<p>D'apres des experiences antereieurs j'ai remarque : Le dsPIC jouera
   le role du modem. Contrairement a ce qu'on a dit ici nous avons un
   modem (joue par le PIC) plus reactif que le PC mais dont le buffer
   est plus petit donc a proteger contre les overflow. Pour le PC il
   faudra eviter qu'il soit noye dans le flux de donnee 'bombarde' par
   le dsPIC (si on utilise Scilab). Comme on envoie des donnees
   binaires on ne peut pas utiliser le Xon/Xoff car il faut doubler
   les Xon/Xoff ce qui est chiant.</p>

<p>Pour tester le programme du cote ordi : un cable null-modem "Null modem with full handshaking" ou "Null modem with partial handshaking"</p>

<p>du cote on utilisera un simple Max232 on utilisera toutes ces pattes (Rx/Tx,DTR/DSR)</p>

LINK(http://www.greyc.ensicaen.fr/~emagarot/pdf/CM_InfoIndus_2007.pdf)

<p>Scicos ne poss�de pas de moyen de communication avec l'ext�rieur,
   d'o� son impossibilit� de contr�ler l'h�licopt�re. Il a fallu cr�er
   un bloc diagramme qui puisse envoyer et �couter des donn�es sur un
   port s�rie.</p>

<p>Ceci est facilement r�alisable, car Scilab permet de faire de
   l'�dition de liens sur des fonctions C et de les lier � des blocs
   diagrammes Scicos. Pour construire un bloc Scicos, deux fichiers
   sont n�cessaires, donc deux fonctions :
   LINK(tuto_scicos-LANG.html#simulation,fonction de simulation) et
   LINK(tuto_scicos-LANG.html#interface,fonction d'interface).</p>

<p>En cr�ant la fonction de calcul et d'interface pour le port
s�rie, Scicos devient un oscilloscope num�rique 50Hz (on
peut les t�l�charger sur
LINK(helico_download-LANG.html,download)). Il lit les donn�es
des capteurs de l'h�licopt�re sur le port s�rie,
les affiche sous forme de courbes, calcule la loi de commande et
envoie les consignes PWM sur le port s�rie. La vitesse du port
s�rie est de 19200 bauds, 8 bits de donn�es, 1 bit de
stop et aucun flot de contr�le (ni mat�riel ni
logiciel).</p>

divert(DIVERT_FOOTER_CODE)


END_BODY(,)

dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

ICON_BUILD STRONG(Page en cours de r�daction).

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Partie logicielle : Communication inter composant de la plate-forme)
SUBSECTION(Rappel du cahier des charges)

<p>Le cahier des charges propose que notre plate-forme volante puisse
   communiquer avec un PC non embarqu�. Ceci pour permettre le
   d�boguage, la communication des consignes de vol, le data logging,
   la prise en main d'un calcul trop complexe par l'ordinateur. La
   carte �lectronique de la plate-forme volante contient deux
   microcontr�leurs qui doivent pouvoir communiquer entre eux. Nous
   utiliserons, le protocole UART (norme RS-232 ou port s�rie) pour la
   communication entre le PC et le dsPIC ma�tre car il est plus simple
   � mettre en place que l'USB. Le dsPIC ma�tre communique avec le
   dsPIC esclave par SPI. Ces choix ont �t� faits car le SPI �tant
   plus rapide que l'I2C et que les dsPIC 30F2010 n'ont pas de bus CAN
   ni d'USB.</p>

SUBSECTION(Pourquoi utiliser un protocole de communication ?)
<p>Nous avons vu LINK(comm_rs232-LANG.html,ici) (d�sol� ! Cette page
   n'est pas encore �crite) comment �crire un programme C, s'ex�cutant
   sur un syst�me Unix, capable d'envoyer et recevoir un paquet
   d'octet sur le port s�rie. Question : cela suffit il pour que le PC
   puisse communiquer avec notre plate-forme ? La r�ponse est oui (il
   suffit de voir les nombreux projets sur le web) mais cela n'est pas
   id�al pour notre projet. On va expliquer, dans ce document,
   pourquoi et voir comment am�liorer la robustesse des �change de
   donn�es.</p>


<p>Les deux dsPIC et le PC peuvent communiquer ensemble par envoi et
   r�ception successif d'un paquet d'octet. Cela fonctionne
   parfaitement sauf le jour o� des perturbations ext�rieures viennent
   parasiter et corrompre les donn�es envoy�es. L'exemple le plus
   flagrant pour ce projet est la pr�sence des moteurs qui vont
   perturber la masse et provoquant des chutes de tension (j'ai �t�
   confront� � ce probl�me sur le premier prototype). Nos composants
   communicants doivent comprendre les messages qu'ils re�oivent et
   pouvoir d�tecter puis supprimer un message erron� (perte ou ajout
   d'un ou plusieurs octet, modification de la valeur d'un octet) et
   pouvoir se resynchroniser sur le d�but de la trame suivante apr�s
   suppression d'un message d�fectueux. Comme nous n'avons pas de puce
   �lectronique capable de d�tecter toute seule ces probl�mes (je
   pense � l'USB et au CAN), nous serons oblig� de mettre en place un
   automate logiciel.</p>

<p>L'automate utilis� pour ce projet s'inspire du document suivant
   LAB11 qui explique la mise en place d'un petit automate capable de
   comprendre un protocole BSC simplifi� (pour Binary Synchronous
   Communication invent� par IBM). Nous allons, ici, expliquer le
   fonctionnement de notre automate <!-- que l'on va appel� BSC bien
   que nous utiliserons--> qui sera asynchrone contrairement au BSC.</p>

<p>Notre automate utilise 3 des 7 couches du mod�le
   EXTLINK(http://www.frameip.com/osi/,OSI) : physique, liaison,
   applicative. Voici leur d�finition g�n�rale :</p>

LISTE(STRONG(Physique) : cette couche se contente d'envoyer une suite
      brute de bit. Le codage des bits d�pend des caract�ristiques
      physiques du m�dia employ� (�lectrique[,] onde[,] lumi�re[,]
      IR[,] son[,] ...). Par exemple[,] la valeur 1 peut �tre cod�e
      lorsque la tension �lectrique vaut +5V ou -12V[,] de m�me le 1
      peut �tre d�fini comme �tant la pr�sence d'un son et le 0 comme
      l'absence de son. Pour notre application nous utiliserons la
      norme RS232 entre le PC et le dsPIC Ma�tre. Nous utiliserons le
      SPI entre les deux dsPIC. Ce sont des communications s�rielle �
      savoir que les bits sont envoy�s les uns apr�s les autres (par
      opposition au port parall�le). Il se peut que dans un futur
      proche nous utiliserons l'I2C et les radios fr�quences.,

      STRONG(Liaison) : Si on branche les bons c�bles entre les deux
      dsPIC ils sont capables[,] gr�ce � leur couche physique[,] de
      s'envoyer des suites de bits (que l'on appellera trame). <!-- Les
      donn�es ainsi envoy�es n'ont aucune signification
      particuli�re.--> Le r�le de la couche liaison est de d�tecter les
      erreurs sur la couches physique. Elle doit pour cela �tre
      capable de comprendre o� une trame d�bute et o� elle se termine
      parmi la suite d'octets (bien que la fronti�re des trames n'est
      pas toujours �vidente). Enfin[,] cette couche peut envoyer des
      acquittements positifs ou n�gatifs en cas de d�tection de trames
      erron�es ou correctes ou en cas de d�tection de d�bordement des
      m�moire tampons stockant les trames.,

      STRONG(Applicative) : Cette couche fait le contact entre l'utilisateur
      et les services des couches en dessous.)

<p>Ce document explique l'automate de la couche liaison utilis� pour
   ce projet. J'informe le lecteur que je ne suis ni sp�cialiste des
   couches OSI ni du protocole BSC. Ce document a pour unique but de
   faire d�couvrir au lecteur la m�thode que j'ai employ�e pour ce
   projet plut�t que donner un cours exhaustif et pr�cis sur les
   protocoles de communication.</p>

SUBSECTION(Apercu rapide du protocole BSC)
<p>Le protocole BSC, tel que d�crit dans le document ci dessus, permet
   d'envoyer des messages ascii. Il utilise des octets d'informations
   (que l'on va appel� tags) de d�but et fin de texte pour d�limiter
   les fronti�res des trames. A cela s'ajoute une somme de contr�le
   (checksum en anglais) afin de garantir l'int�grit� du message
   contenu dans la trame.</p>

<p>Voici comment est constitu�e une trame la plus simple :</p>
LISTE(STRONG(STX) : Start of Text. Tag informant le d�but du message
      ou de la trame.,

      STRONG(Message) : une suite de code ascii constituant le
      message. La taille du message est arbitraire.,

      STRONG(ETX) : End of Text. Tag informant la fin du message.,

      STRONG(CHK) : Checksum. La somme de contr�le du message.)

<p>Il existe plusieurs type de calcul de checksum. Le plus simple (et
   celle que l'on utilise) consiste � appliquer l'op�rande xor (ou
   exclusif) sur chaque octet du message. Malgr� cela, l'int�grit�
   totale n'est pas pr�serv�e par exemple 42 xor 42 donne le m�me
   r�sultat que 3 xor 3 xor 3 = 0. Il a l'avantage de pas co�ter cher
   en temps de calcul. Une autre forme de contr�le est d'ajouter un
   bit de parit� sur chaque octet. La encore aucune garantie de
   d�tecter un message corrompu � 100%.</p>

<p>Il faut signaler que le protocole BSC sert � envoyer des messages
   purement ascii (par opposition aux messages binaires). En effet les
   octets non ascii sont utilis�s pour les tags des trames car ils
   pourraient entrer en conflit (par exemple un octet du message
   pourrait avoir la valeur STX ou ETX).</p>

<p>Si on veut n�anmoins envoyer des messages binaires, � chaque fois
   que l'on rencontre un octet du message qui correspond � un tag il
   suffit de le doubler dans le message (de la m�me mani�re que les
   doubles \ pour les syst�mes Unix).</p>

<p>Note : des informations suppl�mentaires peuvent �tre ajout�s � la
   trame (et avant le d�but du message) comme par exemple
   l'identifiant du destinataire et de l'envoyeur. Cela est utile pour
   les couches au dessus de notre couche liaison (les quatre couches
   que l'on a pass�es sous silence). Une trame est pr�lev�e d�s que le
   destinataire et l'envoyeur correspondent, sinon elle est rejet�e ou
   bien est redirig�e sur le r�seau.</p>

SECTION(Apercu rapide de notre protocole)
SUBSECTION(Apercu d'une trame)
<p>Notre protocole s'inspire de ce que nous avons vu du protocole
   BSC. On veut utiliser les tags informatifs et envoyer des messages
   binaires, et ce, sans doubler les octets du message correspondant
   aux tags. Nous allons aussi essayer de minimiser au maximum la
   taille des trames car la vitesse des m�dias de communication sont
   tr�s lente et un message long a plus de chance d'�tre corrompu. En
   effet si le d�bit du port s�rie vaut 9600 bauds (9600 bits par
   secondes) �a nous donne environ 1 octet envoy� ou re�u � chaque
   milliseconde. Ceci est tr�s lent � comparer aux 25K instructions
   par millisecondes du dsPIC.</p>

<p>Comme les convertisseurs analogiques du dsPIC fournissent des mots
   de 10 voir 12 bits qui doivent au final �tre stock�s dans des mots
   de 16 bits, cela nous donne quatre bits utiles pour coder une
   information sur la trame. En �clatant un mot de 16 bits en deux
   mots de 8 bits (plus grand commun multiple entre les mots envoy�s
   par la couche physique du port s�rie et du SPI) nous avons 2 bits
   d'informations pour chaque octet � envoyer. Ils seront plac�s dans
   le MSB (Most Significant Bits). Voici une trame octet par octet de
   notre protocole.</p>

LISTE(Tag STX + longueur du message. Avec STX valant 01 en binaire.,

      Message avec des mots de 16 bits d�coup�s en mots de 8
      bits. Nous avons donc : MSB + octet2 et LSB + octet1 avec MSB et
      LSB valant respectivement 00 et 11 en binaire. La longueur du
      message est connue car donn�e dans l'octet d'en t�te.,

      Tag ETX + Checksum. Avec ETX vallant 10 en binaire.)

<p>Donc tous nos octets sont �tiquet�s. Il n'y a pas de confusion
   possible. Il nous reste plus qu'� voir comment mettre en place
   l'automate de reconnaissance des trames. Par exemple le message
   ITALIQUE(Hello World !!) sera cod� par la suite d'octet : 0x5c 0x01
   0xc8 0x01 0xe5 0x01 0xec 0x01 0xec 0x01 0xef 0x00 0xe0 0x01 0xd7
   0x01 0xef 0x01 0xf2 0x01 0xec 0x01 0xe4 0x00 0xe0 0x00 0xe1 0x00
   0xa1 0x1c. Il est �galement possible de supprimer tous les octet
   MSB dont la valeur vaut 0.</p>

SUBSECTION(Automate de reconnaissance d'une trame bien form�e)
<p>STRONG(En cours de r�daction.)</p>
<p>M�mes moyens que ceux employ�s par les automates syntaxiques pour
   les compilateurs (voir ).</p>

SUBSECTION(R�sultats)
<p>L'avantage d'avoir d�composer notre communication par couche est
   que le code est plus g�n�rique. Les avantages sont les suivants
   :</p>

LISTE(STRONG(Validation) Si on valide la couche liaison sur une
      architecture X alors on est garanti qu'elle va fonctionner pour
      une architecture Y car le code est ind�pendant de l'architecture
      choisie (il est donc portable).,

      STRONG(G�n�rique) La couche liaison se compile ind�pendamment du
      contr�leur de la couche physique. Dans notre cas la couche
      liaison appelle les fonctions ITALIQUE(open)[,] ITALIQUE(close)[,]
      ITALIQUE(read_1_byte)[,] ITALIQUE(write_1_byte) de la couche
      physique associ�e. Il suffit donc pour chaque architecture et
      pour chaque couche de coder ces 4 fonctions. Elles seront
      appel�es par l'automate de la couche liaison. Par exemple UART
      pour le dsPIC[,] UART pour Linux[,] UART pour Windows[,] SPI pour
      dsPIC.,

      STRONG() Si on change la couche physique la validation de
      l'automate n'est pas � refaire.)

<p>Dans un future proche on remplacera la liaison RS232 par des radios
   fr�quences (via une radio commande pour a�romod�lisme).</p>

<p>Voici une capture d'�cran d'un oscilloscope d'une communication sur
  le port s�rie avec notre protocole (115200 bauds). De couleur verte
  : les trames de 10 octets envoy�es par le dsPIC (p�riode : 50
  Hz). En jaune les acquittements positifs ou n�gatifs � leur r�ception
  par le PC.</p>

  PICTURE(helico/schemas/10oct_50Hz_115200bds.jpg,Espionnage des trames.)

divert(-1)
<p> C'est pour cela que l'on va mettre en place un syst�me de
   communication inspir� du protocole BSC (pour Binary Synchronous
   Communication). Ce protocole repose sur deux ITALIQUE(couches) :
   une couche physique et une couche xxx. Les modules du dsPIC UART
   et SPI permettent de v�hiculer un octet � la fois (en s�rie) :
   c'est la couche physique.  Cette couche pourrait suffire � elle
   m�me, dans le sens o� elle est suffisante pour transmettre et
   transmettre des messages de plusieurs octets. Le probl�me est qu'il
   est difficile de savoir si le message re�u est erron� ou pas et de
   savoir o� d�bute le message et o� il se termine (le message peut
   avoir perdu ou gagn� un octet en cours de route � cause d'une
   perturbation). C'est pour cela que l'on rajoute une deuxi�me couche
   logique : un automate permettant de v�rifier la validit� du
   message. Seul les messages correctement constitues seront acceptes.</p>

<p>Nous allons voir ici, comment mettre en place le protocole
   BSC. Cette �tude s'inspire fortement du document LAB11.</p>

<p>Ce que l'on va appeler par la suite un message est une suite
   d'octet dont :</p>

LISTE(le premier octet est l'octet indiquant le d�but de trame. Il est nomm� STX (pour Start of Text),

      il est suivi par une suite d'octet constituant le message proprement
      dit. La taille du message est arbitraire.,

      l'avant dernier octet est l'octet indiquant la fin de la
      trame. Il est nomm� ETX (pour End of Text),

      un checksum[,] � savoir un contr�le de validit� du message.)

<p>Mettre image</p>

<p>Apr�s r�ception du message, le destinataire envoie un message
   constitu� d'un unique octet permettant d'indiquer � l'�metteur si
   le message re�u est correct ou non. C'est un acquittement au
   message re�u. Il peut �tre soit positif (ACK) soit n�gatif (NACK).</p>

<p>Communication dsPIC ==> PC : 14 octets envoy�s (dont 10 octets de
  donn�es et 4 d'ent�t�, checksum) sur le port s�rie, tous les 50 Hz �
  la vitesse de 115200 bauds. Le PC envoie un octet d'acquittement.</p>
<p> Note: 1 carreau == 10 ms.</p>

divert(0)



divert(-1)
SECTION(G�n�ration automatique de code distribu�)

SUBSECTION(Etude du programme prototype 1 bas� sur PIC)

<p>Lors du d�veloppement du programme embarqu� sur les PIC 16F876A
  pour le prototype 1 de l'plate-forme, j'ai d�fini l'ordre dans
  lequel devait de se faire la communication entre les
  microcontr�leurs et l'ordinateur. Dans ce diagramme suivant, les
  num�ros encercl�s d�finissent cet ordre. Ceci a du �tre fait
  manuellement.</p>

PICTURE(helico/schemas/comm.jpg,Chronogramme des communications)

<p>ENUM(Le PIC ma�tre et le PIC esclave lisent les valeurs
   (analogiques et num�riques) des capteurs (acc�l�rom�tre[,]
   gyroscopes[,] altim�tre).,

  Scilab envoie au PIC ma�tre les consignes des signaux PWM des
  quatre moteurs.,

  <!-- Le PIC ma�tre re�oit une interruption.-->Les consignes
  PWM sont traduites en signal PWM pour les moteurs 1 et
  2. Parall�lement[,] le PIC ma�tre envoie au PIC esclave
  les consignes PWM des moteurs 3 et 4 gr�ce au module
  I2C.,

  Le PIC esclave r�pond au PIC ma�tre en lui envoyant les r�sultats
  des lecture de ses capteurs.,

  Pendant que le PIC ma�tre envoie � l'ordinateur l'ensemble des
  lectures des capteurs (provenant du ma�tre et de l'esclave)[,] le
  PIC esclave traduit les consignes PWM des moteurs 3 et 4 en signal
  PWM r�el.)</p>

<p>Le PIC ma�tre communique avec un PC non embarqu� gr�ce au protocole
   UART (norme RS232) et avec un PIC esclave gr�ce au protocole
   I2C.</p>

<!--<p>Le PIC ma�tre, configur� en mode UART (Universal Synchronous
   Asynchronous Receiver Transmitter) communique de fa�on asynchrone
   un avec un ordinateur via ses pattes Rx (r�ception) et Tx
   (transmission) branch�es sur un port s�rie. La vitesse de
   transmission est de 19200 bauds, 8 bits de donn�es, parit� paire, 1
   bit de stop et aucun contr�le de flux.  Le composant MAX232 est une
   porte NON qui convertit les signaux du port s�rie (+12V/-12V) en
   signaux adapt�s au PIC (0V/+5V). Le site de BIGONOFF explique en
   d�tail comment fonctionne l'ensemble et fournit un programme type �
   charger sur le microcontr�leur et un programme PC pour tester la
   communication s�rie.</p>

<p>TODO: Comm I2C</p>-->


SUBSECTION(Chronogramme des interruptions,chrono)

<p>Les PIC permettent de lancer plusieurs op�rations en parall�le. Les
   fins de calcul sont signal�es par des interruptions. Les programmes
   des PIC ont �t� con�us pour faire tourner en parall�le deux timers,
   une conversion analogique, la g�n�ration de deux signaux PWM, la
   r�ception et l'�mission d'un octet sur le port s�rie et le module
   I2C. Le chronogramme des interruptions est illustr� sur la figure
   suivante.</p>

PICTURE(helico/schemas/chronointerrup.jpg,interruptions du PIC)

<p>Le PIC ma�tre contient deux buffers permettant de communiquer
avec l'ordinateur~:</p>
<ul>
<li>un premier pour la r�ception, que l'on appellera
  ITALIQUE(BufRec);</li>
<li>un deuxi�me pour l'�mission, que l'on appellera
  ITALIQUE(BufEm).</li>
</ul>

<p>Chaque r�sultat des conversions analogiques est
sauvegard� dans ITALIQUE(BufEm). A chaque fin, une interruption
est lanc�e (repr�sent�e par une fl�che noire sur
le chronogramme). Vu que le PIC permet une seule conversion analogique
� la fois, on doit alors changer de patte analogique � chaque
fois qu'une conversion se termine. Il faut attendre que~:</p>
<ul>
  <li>les condensateurs de la nouvelle patte se chargent;</li>
  <li>la conversion analogique se finisse.</li>
</ul>
<p>Comme ces dur�es d�pendent de la tension et de la
chaleur du PIC, on utilise le timer 0 avec une p�riode assez
grande pour pouvoir relancer une nouvelle lecture sans risque de
corruption de la lecture (interruption en vert sur le chrono).</p>

<p>Scilab envoie alors les consignes PWM par le port s�rie, ce
qui cr�e une interruption (orange sur le chrono). Le PIC les
lie et les stocke dans ITALIQUE(BufRec). Il profite de cette
interruption pour envoyer le contenu de ITALIQUE(BufEm).</p>

<p>Les consignes PWM, stock�es dans ITALIQUE(BufRec), sont les
nouvelles valeurs des comparateurs du PIC. Deux comparateurs sont
pr�sents et fonctionnent avec le timer 2. Lorsque la
valeur du timer 2 atteint celle du comparateur ITALIQUE(x) , +5V est
g�n�r� sur la patte CCPx du PIC jusqu'au
d�bordement du Timer 2, qui permet de terminer un cycle d'un
signal PWM, en mettant � la masse les sorties des pattes
CCP. La vitesse de notre signal PWM est de 5 kHz avec un PIC
poss�dant un quartz de 20MHz.</p>

<p>Enfin, avant qu'une interruption de d�bordement du Timer 2
soit lanc�e, quatre interruptions de d�bordement du
Timer 0 sont lanc�es.</p>



SECTION(Code prototype version 2 bas� sur dsPIC)

On a vu que c'etait chiant de faire a la mano :

-- quand et comment et dans quel ordre les proc communiquent

-- gerer l'ordre du code (timer, inter, ...)

On va generer ca a automatiquement

Exemple photos SynDEx, Scicos ....
divert(0)


divert(DIVERT_FOOTER_CODE)

END_BODY(helico_electronique,Construction de la carte �lectronique,
helico_asservissement,Asservissement de la plate-forme)

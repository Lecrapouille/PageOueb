dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

dnl ICON_UPDATED STRONG(Page en cours de r�daction).

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,
Les projets amateurs existants,#xufo,
Les projets commerciaux existants,#comm,
Livres sur la m�canique des h�licopt�res,#bouquins,
Logiciels utilis�s,#logo,
Documentation des logiciels,#doclog,
Livres et cours d'automatique,#auto,
Microcontr�leur et �lectronique,#elec),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Bibliographie et liens,biblio)

SUBSECTION(Les projets amateurs concernant les quadricopt�res,xufo)

<p>Voici en vrac les liens qui ont retenus mon attention, concernant
  la construction de quadricopt�re et autre croix volante. N'h�sitez
  pas � m'envoyer un mail pour compl�ter cette page.</p>

<ul>
  <li>DRAP_FR XBIRD L'indispensable forum fran�ais o� tous les
      passionn�s de croix volante viennent se rencontrer pour
      partager leur connaissance.</li>

dnl CENTER(CAPTION(img/xbird.gif,http://forum.xbird.fr/))

  <li>DRAP_FR CRACMIKE Un excellent projet fran�ais de
      construction de plate-forme volante de grande taille. Avantages
      de ce site : les caract�ristiques de l'�lectronique et de la
      m�canique y sont d�crites. Inconv�nients : le sch�ma
      �lectronique, le programme et le mod�le physique de
      l'h�licopt�re ne sont pas expliqu�s.
  </li>

  <li>DRAP_FR XNICO Un autre projet fran�ais de plate-forme
      volante (non fini). Des explications tr�s claires y sont donn�es
      concernant l'�lectronique (transistors), le dsPIC, et la
      carcasse de l'engin.</li>

  <li>DRAP_FR SPACEMAN Blog concernant la construction de
      nombreux prototypes de quadricopt�re. Explications et code
      source pour dsPIC fournis.</li>

  <li>DRAP_FR SERGIO Site concernant de nombreux projets en
      a�romod�lisme dont un projet quadricopt�re.</li>

<li>DRAP_FR PHIL Autre projet fran�ais. Tr�s belle carcasse et
      qui a aussi �t� mod�lis�e en 3D.</li>

  <li>DRAP_DE UAVPL Projet allemand open source.</li>

  <li>DRAP_DE MIKROKOPTER Un autre projet allemand.</li>

  <li>DRAP_DE PLUSPETITSH4H Projet allemand avec des engins de
      petites tailles.</li>

  <li>DRAP_EN JOSEJ Autre h�licopt�re de petite
      taille. Contrairement aux projets de l'EPFL (voir ci apr�s),
      JoseJ utilise quatre moteurs tournant dans le m�me sens au lieu
      de deux dans le sens direct et deux dans les sens indirect. Il
      stabilise l'h�licopt�re (force de torsion) avec un
      aileron. Citation : ITALIQUE(I had constructed other multirotor
      helis (bigger) but they have the disadvantage that I need to
      make CW and CCW propellers to correct and control the torque
      effect. This micro heli use standard and cheap motors and props
      (no CW and CCW props) and I correct the torque effect with a
      twist in the two ailerons motors, so I have yaw control).</li>

  <li>EXTLINK(http://www.rcgroups.com/forums/showthread.php?t=394375,rcgroups)
    Les soucoupes volantes existent belle et bien et pour preuve ...</li>

  <li>DRAP_FR
      EXTLINK(http://asl.epfl.ch/research/projects/VtolIndoorFlying/indoorFlying.php,ASL/EPFL)
      et EXTLINK(http://asl.epfl.ch/member.php?SCIPER=149618,ASL/EPFL) Des
      �l�ves et des professeurs de l'Ecole Polytechnique F�d�rale de
      Lausanne (EPFL) ont aussi �tudi� et r�alis� des plateformes
      volantes.
  </li>

  <li>DRAP_EN
    Samir Bouabdallah, Pierpaolo Murrieri, Roland Siegwart,
    LINK(http://asl.epfl.ch/aslInternalWeb/ASL/publications/uploadedFiles/325.pdf,Design and Control of an Indoor Micro Quadrotor),

    Samir Bouabdallah,
    LINK(http://asl.epfl.ch/aslInternalWeb/ASL/publications/uploadedFiles/330.pdf,PID
    vs. LQ Control Techniques Applied to an Indoor Micro Quadrator)

    Ce sont les documents les plus importants concernant la
    mod�lisation physique et la stabilisation d'un h�licopt�re.
  </li>

  <li>DRAP_EN DRAP_FR Pierre-Olivier Latour, ITALIQUE(Computer based
      control system for a model helicopter), 2002.  Andr� Noth,
      ITALIQUE(Synth�se et impl�mentation d'un contr�leur pour Micro
      H�licopt�re � 4 rotors), F�vrier 2004, Marc Kunze,
      ITALIQUE(H�licopt�re indoor), F�vrier 2003.

      Documents r�aliser par des �l�ves de l'APFL (le meilleur est le
      premier de la liste). On peut les t�l�charger respectivement
      LATOUR, NOTH, KUNZE.</li>
</ul>

SUBSECTION(Projets commerciaux,comm)

<ul>
  <li>DRAP_EN MICRODRONE S�rement les plus belles plates-formes volantes
      ... et les plus ch�res </li>

  <li>DRAP_EN X_UFO ENGAGER DRAGANFLYER D'autres versions mais � des
      prix plus abordables.</li>

 <li>DRAP_FR EXTLINK(http://ovirc.free.fr/Tribelle.php) Il est
     possible d'enlever un moteur au quadrirotor on obtient une
     tribelle ou Y-UFO.</li>

</ul>

SUBSECTION(Livres sur la m�canique des h�licopt�res,bouquins)
<ul>
<li>Bible 1</li>
<li>Bible 2</li>
<li>Histoire H�licopt�re BD</li>
<li>Histoire h�licopt�re</li>
</ul>

SUBSECTION(Logiciels utilis�s pour la construction de mon H4H,logo)

<ul>
  <li>DRAP_EN DRAP_FR La page principale de SCILAB. C'est un logiciel
      libre pour le calcul scientifique, c'est un interpr�teur de
      langage manipulant des objets math�matiques typ�s
      dynamiquement. Il inclut de nombreuses fonctions sp�cialis�es
      pour le calcul num�rique organis�es sous forme de librairies ou
      de boites � outils qui couvrent des domaines tels que la
      simulation, l'optimisation, et le traitement du signal et du
      contr�le.
  </li>

  <li>DRAP_EN DRAP_FR La page principale de SCICOS. C'est une des
      boites � outils les plus importantes de Scilab. C'est un �diteur
      graphique de bloc diagrammes permettant de mod�liser et de
      simuler des syst�mes dynamiques. Il est particuli�rement utilis�
      pour mod�liser des syst�mes o� des composants
  </li>

  <li>DRAP_EN La page principale de SYNDEX. C'est un logiciel de CAO
      mettant en oeuvre la m�thodologie Ad�quation Algorithme
      Architecture (AAA) pour le prototypage rapide et l'optimisation
      de la mise en oeuvre d'applications distribu�es temps r�el
      embarqu�es. A partir d'un algorithme et d'une architecture
      donn�s sous forme de graphe SynDEx g�n�re une impl�mentation
      distribu�e de l'algorithme en macro-code m4.
  </li>

  <li>DRAP_EN l'IDE MPLAB de Microchip. Tourne seulement sous Windows
      et permet de compiler des programmes pour PIC et dsPIC puis de
      les flasher et de le d�boguer. Il faut installer le compilateur
      C30 pour dsPIC.</li>

  <li>DRAP_EN La page principale de PROTEUS. C'est un logiciel de
      simulation de circuit �lectronique (analogique et num�rique). Il
      peut s'interfacer avec Mplab et simuler un microcontr�leur PIC
      sur sa carte.</li>

  <li>DRAP_EN La page principale de KTechlab :
      EXTLINK(http://ktechlab.org/)</li>

<li>DRAP_EN La page principale de Qucs :
    EXTLINK(http://qucs.sourceforge.net/screenshots.html)
    KTechlab et Qucs sont des simulateurs de circuits int�gr�s
    gratuits. Je ne les ai personnellement pas test�s.</li>
</ul>


SUBSECTION(Documentation des logiciels,doclog)

<ul>
  <li>DRAP_EN Stephen L. Campbell, Jean-Philippe Chancelier and Ramine
      Nikoukhah, ITALIQUE(Modeling and Simulation in Scilab/Scicos),
      Springer, 2005.

      Ce livre est un tutoriel sur l'utilisation de Scilab et de
      Scicos et s'attarde sur ses outils de simulation et de
      mod�lisation.
  </li>

  <li>DRAP_FR \bibitem{scibook}XXX TODO

    Ce livre est un autre tutoriel sur l'utilisation de Scilab et de
    Scicos en plus simple mais il date un peu.
  </li>

  <li>DRAP_FR SAPHIR Tutoriels sur Scilab/Scicos tir�s du LINUXMAG.
  </li>

  <li>DRAP_FR Thierry Grandpierre, Christophe Lavarenne, Yves Sorel,
      EXECV4, INRIA, 1998.  Ce document s'adresse aux concepteurs
      d'applications distribu�es temps r�el embarqu�es, qui d�sirent
      optimiser l'implantation de leurs algorithmes de commande et de
      traitement du signal et des images sur des architectures
      multiprocesseurs. Il s'adresse ensuite plus particuli�rement aux
      utilisateurs du logiciel SynDEx qui supporte la m�thodologie
      AAA.
  </li>

  <li>DRAP_FR Yves Sorel, ITALIQUE(G�n�ration automatique d'ex�cutifs
      distribu�s temps r�el embarqu�s optimis�s pour SoC) G�n�ration
      automatique d'ex�cutifs avec le logiciel SynDEx.
  </li>
</ul>


SUBSECTION(Livres et cours concernant l'automatique,auto)

<ul>
  <li>DRAP_FR Pierre Faure et Michel Depeyrot, ITALIQUE(El�ments
      d'automatique), Dunod, 1974. Livre sur l'automatique, complet
      mais pas le plus simple pour d�buter.
  </li>

  <li>DRAP_EN ITALIQUE(Control System Design). Karl Johan &Aring;str�m est un
      personnage important dans l'univers de l'automatique. Ses cours
      sont t�l�chargeables sur son site
      EXTLINK(http://www.control.lth.se/~kja/) Ils sont complets et
      tr�s biens pour d�buter dans l'automatique.
  </li>
</ul>

SUBSECTION(Microcontr�leur et �lectronique,elec)

<ul>
  <li>DRAP_FR EXTLINK(http://www.abcelectronique.com/bigonoff/) Le site de
      Bigonoff contenant tous les cours INDISPENSABLES ET GRATUITS
      pour ma�triser la programmation assembleur des PIC de Microchip
      (16F84, 16F876, 16F877, 16F87x(A), 18Fxx8). Merci Bigonoff pour
      cette aide pr�cieuse !
  </li>
</ul>

divert(DIVERT_FOOTER_CODE)

END_BODY(helico_photos,Photos et vid�os,,)

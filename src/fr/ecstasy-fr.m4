dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Projet Ecstasy)
DEF_KEYWORDS(3D game)
DEF_DESCRIPTION(3D game in opengl and delphi)
MENU_ACTIF(MENU_3D)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Raccourcis,Introduction,#intro,Aper�us du
jeu,#view,T�l�chargement,#download,Au coeur
d'Ecstasy,#heart,Liens,#links), BANNIERES)

divert(DIVERT_BODY_CODE)

SUBSECTION(ICON_READ[]Pr�sentation,intro)

<p>Ecstasy est un projet �tudiant d'info-sup fait � l'�cole EPITA
   (2002-2003), r�alis� en OpenGl et Borland Delphi et ayant pour buts
   de simuler la dynamique d'une voiture (conf�re mon
   MYLINK(tuto_dyna,tutoriel)), et de repr�senter en 3D la circulation
   automobile d'une ville de type am�ricaine (c'est � dire ayant une
   forme g�om�trique r�guli�re).</p>

<p>Les dessins 3D des voitures proviennent de nombreux sites web
  consacr�s au jeu
  EXTLINK(https://fr.wikipedia.org/wiki/Midtown_Madness_2,Midtown
  Madness II), sont t�l�chargeables gratuitement puis ont �t�
  converties au format 3D Studio Max et enfin export�es au format
  ASE. Si leurs auteurs ne veulent pas les voir dans ce jeu, qu'ils
  me fasse signe et je les retirerais aussit�t du programme.</p>

SUBSECTION(ICON_EYES[]Aper�us du jeu,view)

TABLEAU(3,CAPTION(ecstasy/saut.jpg),
CAPTION(ecstasy/pont.jpg),
CAPTION(ecstasy/menu.jpg))
CENTER(Cliquer sur les images pour les agrandir.)

SUBSECTION(ICON_DOWNLOAD[]T�l�chargement,download)

<p>Ce projet n'est plus d�velopp� mais le code source est disponible
sur GITHUB(Lecrapouille/Ecstasy,GitHub). Il vous faudra un Delphi
Borland (version 5 de m�moire) pour compiler les sources. Certaines
ressources graphiques et sonores n'y ont pas �t� mises sur le repo git
(pour des soucis de poids) mais vous pouvez les t�l�charger ci-dessous.</p>

TABLEAU(3,LINK(ecstasy/ecstasy1_setup.rar,Ecstasy version 0.1),
LINK(ecstasy/ecstasy1_light.rar,Version l�g�re version 0.1),
LINK(ecstasy/ecstasy1_sources.rar,Les sources version 0.1),
ICON_TGZ,ICON_TGZ,ICON_TGZ,
9 Mo --- format RAR,
3.4 Mo --- format RAR,
1.7 Mo --- format RAR,
LINK(ecstasy/ecstasy2.rar,Ecstasy version 0.2),
LINK(ecstasy/ecstasy2_sources.rar,Les sources version 0.2),
LINK(ecstasy/ecst_sout4.pdf,Le rapport),
ICON_TGZ,ICON_TGZ,ICON_PDF,
6 Mo --- format RAR,
1.5 Mo --- format RAR,
500 Ko --- format PDF)

<p>Remarques:</p>
<ul>
<li>Ce projet fonctionne pour Windows 98, XP mais n'a pas �t� test� sur
  des versions plus r�centes.</li>
<li>Ce projet n'a pas �t� con�u pour fonctionner pour Linux, Mac OS
  X (Window �tant impos� par nos professeurs).</li>
<li>Programmeurs novices � l'�poque, nous n'avons omis de mettre
  un cadenceur pour la boucle d'it�ration du jeu (en g�n�ral 30 ou 60
  images par secondes). Donc, selon la puissance de votre PC, le jeu
  peut �tre extr�mement rapide, le rendant injouable.</li>
<li>Dans la version 0.2, les immeubles suivent mieux l'altitude de la
  route, la vitesse du jeu est plus rapide que dans la premi�re
  version et le roulis a �t� rajout� � la voiture du
  joueur. Toutefois, il subsiste une erreur dans la dynamique des
  voitures et c'est pour cela, qu'il n'y a qu'un seul type de voiture
  dans cette version (le jeu reste tout � fait jouable). </li>
<li>La version 0.1 contient un setup qui permet d'installer et de
  supprimer correctement le jeu (il y aura aucun risque de plantage
  pour votre Windows car l'installation consiste simplement � copier
  l'ex�cutable � l'endroit d�sir� par l'utilisateur et rien de
  plus). Dans la version 2, il n'y aura pas de setup (vu que je n'ai
  pas le temps de recr�er le setup).</li>
</ul>


SUBSECTION(ICON_GEAR[]Au coeur d'Ecstasy,heart)

<p>Si un joueur veut d�finir lui-m�me sa propre voiture
dans 3D Studio Max. Il peut facilement l'importer dans Ecstasy de la
fa�on suivante :</p>
<ul>
<li>Cr�er un nouveau dossier avec le nom de la voiture dans le
    dossier STRONG(data\Voitures).</li>
<li>Dessiner une carcasse de voiture avec 3D Studio Max et l'exporter
    au format ASE (ascii) dans le nouveau dossier sous le nom de STRONG(carcasse.ase). La
    voiture doit avoir une longueur de 12 unit�s et 5
    unit�s de largeur et doit avoir sa t�te
    orient�e vers la droite dans la fen�tre STRONG(Top)
    (LINK(ecstasy/export0.jpg,voir l'image)). Attention toutes les
    meshes doivent avoir leur texture : si un seul triangle ne
    poss�de pas sa texture Ecstasy ne d�marre pas. Pensez
    � centrer la voiture sur l'origine !</li>
<li>Pour l'exporter en ASE cochez les options comme dans l'image
    suivante (LINK(ecstasy/export1.jpg,voir l'image)).</li>
<li>Dessiner �galement la roue gauche centr�e sur
l'origine et l'exporter sous STRONG(roue.ase).</li>
<li>Prendre une photo de la voiture et la nommer
    STRONG(photo.jpg).</li>
<li>Mettre les textures (au format bmp, tga ou jpeg) dans le dossier
    STRONG(data\Textures).</li>
<li>Cr�er un fichier STRONG(info.txt) et mettre les
    param�tres de la voiture (poids de la roue, de la carcasse,
    raideur des ressort, position des roues, etc).</li>
<li>Lancer le programme, s�lectionner la nouvelle voiture et
jouer.</li>
</ul>

TABLEAU(2,CAPTION(ecstasy/export0.jpg),CAPTION(ecstasy/export1.jpg))
CENTER(Cliquer sur les images pour les agrandir.)

<p>Trois remarques :</p>
<ul>
<li>Si la voiture ne pla�t pas au joueur, alors celui-ci peut la supprimer directement du
    dossier. Ecstasy doit avoir au moins une voiture pour pouvoir s'ex�cuter.</li>
<li>Si un ou plusieurs des fichiers suivants (carcasse.ase, roue.ase,
    photo.jpg ou info.txt) n'existe pas (ou porte un autre nom) un
    message d'erreur appara�t et la voiture ne sera pas prise en
    compte dans le jeu.</li>
<li>Modifier les param�tres de la voiture, sans comprendre ce
    que l'on fait, peut conduire � des probl�mes
    num�riques; par exemple, si la r�action du sol est
    trop forte ou le pas en temps est trop grand des
    instabilit�s num�riques peuvent appara�tre et
    entra�ner l'arr�t du programme.</li>
</ul>


SUBSECTION(ICON_GEAR[]Liens utiles pour la programmation OpenGL,links)


<p>Voici quelques sites qui ont retenu mon attention concernant OpenGL
  et Delphi. La plupart des liens sont malheureusement morts, mais je
  les laisse au cas ou.</p>
<ul>
  <li>OpenGl et Delphi :
    <ul>
      <li>Le site de Martin Beaudet : utile pour apprendre �
      cr�er sa premi�re fen�tre et ses primitives
      en OpenGl-Delphi :
      EXTLINK(http://iquebec.ifrance.com/eraquila/).</li>
      <li>Le site de Jan Horn : excellent site sur OpenGl en Delphi :
      EXTLINK(http://www.sulaco.co.za/).</li>
      <li>Le site Delphi3D : Programmes int�ressants et leurs
      codes �
      t�l�charger. EXTLINK(http://www.delphi3d.net/).</li>
      <li>Glscene : un composant OpenGl pour Delphi (freeware)
      EXTLINK(http://glscene.sourceforge.net/index.php).</li>
      <li>MnOgl : un autre composant OpenGl pour delphi, mais moins
      �volu� que Glscene
      EXTLINK(http://www.delphi32.com/vcl/4731/).</li>
    </ul>
  </li>
  <li>OpenGl et C (et autres langages) :
    <ul>
      <li>Le site The OpenGL Challenge :
      EXTLINK(http://videogamer.dhs.org/).</li>
      <li>Le site de nehe avec de nombreux tutoriaux :
      EXTLINK(http://nehe.gamedev.net/).</li>
      <li>Le site de GameTutorials : EXTLINK(http://www.gametutorials.com).</li>
    </ul>
  </li>
</ul>

divert(DIVERT_FOOTER_CODE)

END_BODY(speedway,Le projet SpeedWay,simtadyn,Le projet SimTaDyn)

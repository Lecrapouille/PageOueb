dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Projet SpeedWay)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_3D)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Introduction,#intro,Aper�us du jeu,#view,Telechargement,#download,Au coeur de SpeedWay,#heart,Liens,#links), BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Le projet SpeedWay)
SUBSECTION(ICON_READ[]Pr�sentation,intro)

<p>Speedway est un doom-like 3D, o� des voitures divis�es en deux
   camps se combattent jusqu'� l'un des deux camps ait r�duit le
   nombre d'adversaire � z�ro ! On peut jouer sur une demi douzaine
   d'univers et de voitures diff�rentes.</p>

<p>Speedway fut, pour l'ensemble de l'�quipe, notre premier projet (en
   �quipe) et nos premiers pas dans le monde de la programmation. Ce
   projet n'est plus d�velopp�.</p>

<p>Speedway est un projet EPITA (2001-2002) libre et gratuit, m�me les
   sources. Il a �t� fait en Opengl, Delphi 5 et DirectSound.
   Fonctionne uniquement pour Windows 95/98/2000/XP.</p>

<p>Les auteurs sont :</p>
LISTE(Joel GRIGNON,
Priscillien MEERMANN,
Quentin QUADRAT.)

SUBSECTION(ICON_EYES[]Aper�us du jeu,view)

TABLEAU(3,CAPTION(speedway/blackmesa.jpg),
CAPTION(speedway/carte.jpg),
CAPTION(speedway/ville.jpg),
CAPTION(speedway/hell.jpg),
CAPTION(speedway/foret.jpg),
CAPTION(speedway/tank.jpg))
CENTER(Cliquer sur les images pour les agrandir.)

SUBSECTION(ICON_DOWNLOAD[]T�l�chargement,download)

TABLEAU(3,LINK(speedway/speedway_soutenance4.pdf,Le
rapport),LINK(speedway/speedway.rar,SpeedWay version
0.1),LINK(speedway/speedway_sources.rar, Les Sources Delphi),
ICON_PDF,ICON_TGZ,ICON_TGZ, 100 Ko --- format PDF, 10 Mo --- format
RAR, 750 Ko --- format RAR )


SUBSECTION(ICON_GEAR[]Au coeur de SpeedWay,heart)

<p>Les �l�ments de programmation du jeu sont :</p>
LISTE(Dessins (voitures et cartes) dessin�s gr�ce au
    logiciel 3D Studio Max.,

    Conversion de fichiers ASE de 3D Studio Max en une liste de
    triangles directement utilisables pour OpenGL.,

    D�tection de collision sur les triangles de la carte
    (avec la cam�ra et les voitures).,

    Champs de force entre voitures et sur les murs (attractifs et
    r�pulsifs).,

    Tirs des voitures.,

    Quelques effets avec OpenGl comme des explosions (avec des
    particules ou uniquement avec des textures)[,] des arcs
    �lectriques[,] des effets d'�blouissements.,

    Sons.,

    Sc�nario du jeu, bonus, HUD, armes, etc.)

<p>Le sc�nario est tr�s simple : �liminer toutes les voitures ennemies
   en leur tirant dessus et en convertissant les morts. La conversion
   se fait en se rapprochant de la voiture d�truite et cette derni�re
   ressuscite instantan�ment et devient un alli�. Go�ter alors aux
   plaisirs de la n�cromancie m�canique ^^.</p>

<p>Pour jouer, vous devez conna�tre les touches suivantes :</p>
LISTE(STRONG(HAUT/BAS/DROIT/GAUCHE) : avance/recule/droite/gauche.,
    STRONG(1 � 6) : change d'armes.,
    STRONG(ESPACE) : tirer.,
    STRONG(HOME) : arme suivante.,
    STRONG(A) : change de vue (3 diff�rentes).,
    STRONG(TABULATION) (change de voitures).)



SUBSECTION(ICON_GEAR[]Liens utiles pour la programmation OpenGL,links)

<p>Voici quelques sites qui ont retenu mon attention concernant OpenGL :</p>
LISTE(OpenGl et Delphi :
      LISTE(Le site de Martin Beaudet : utile pour apprendre � cr�er
           sa premi�re fen�tre et ses primitives en OpenGl-Delphi :
           EXTLINK(http://iquebec.ifrance.com/eraquila/).,

           Le site de Jan Horn : excellent site sur OpenGl en Delphi :
           EXTLINK(http://www.sulaco.co.za/).,

           Le site Delphi3D : Programmes int�ressants et leurs codes �
           t�l�charger. EXTLINK(http://www.delphi3d.net/).,

           Glscene : un composant OpenGl pour Delphi (freeware)
           EXTLINK(http://glscene.sourceforge.net/index.php).,

           MnOgl : un autre composant OpenGl pour delphi, mais moins
           �volu� que Glscene
           EXTLINK(http://www.delphi32.com/vcl/4731/).),

      OpenGl et C (et autres langages) :
      LISTE(Le site The OpenGL Challenge :
            EXTLINK(http://videogamer.dhs.org/).;,

            Le site de nehe avec de nombreux tutoriaux :
            EXTLINK(http://nehe.gamedev.net/).,

            Le site de GameTutorials : EXTLINK(http://www.gametutorials.com/).)
)

divert(DIVERT_FOOTER_CODE)

END_BODY(,,ecstasy,Le projet Ecstasy)

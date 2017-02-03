dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Les arbres de partitionnement binaire de l'espace (BSP))
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Contexte,#contexte,Sommaire du rappot,#som,
Voir le rapport,#rap,Liens,#links),BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Les BSP)
SUBSECTION(ICON_EYES[]Contexte,contexte)

<p>L'un des probl�mes importants lors d'une projection d'une
sc�ne graphique, qu'elle soit en 2D ou en 3D, est
d'�liminer les parties cach�es de la sc�ne. Cet
expos� va pr�senter un algorithme pour r�soudre
ce probl�me : l'algorithme de partitionnement binaire de
l'espace (Binary Space Partition en Anglais ou BSP), qui permet
d'afficher les objets les plus �loign�s avant d'afficher
les plus proche. Ce proc�d� est utilis� par des
jeux tels que Half-Life ou Doom.</p>

<p>Ce rapport a �t� r�alis�, en fran�ais, pour le cours de micro
informatique EPITA (2001-2002). Il a �t� �crit en LaTex et le code
source est disponibles sur GITHUB(Lecrapouille/BSPtree,GitHub).</p>


SUBSECTION(ICON_READ[]Sommaire du rapport,som)

LISTE(Sc�ne 3D,
      Rappel de g�om�trie et de calcul matriciel :
      LISTE(Calcul matriciel,
            G�om�trie 2D,
            G�om�trie projective 2D,
            G�om�trie projective 3D),
       Algorithme de partitionnement binaire de l'espace (BSP) :
       LISTE(Partitionnement binaire d'un ensemble,
             Repr�sentation d'une sc�ne 2D par un BSP,
             Algorithme du peintre),
       Annexes :
       LISTE(D�termination de l'appartenance d'un point � un demi-espace,
             Partition d'une sc�ne 2D en deux sc�nes par une coupure,
             R�f�rences))

SUBSECTION(ICON_READ[]Voir le rapport,rap)

TABLEAU(1,LINK(bsp/bsp.pdf,Le rapport),ICON_PDF,format PDF -- 70 Ko)

SUBSECTION(ICON_GEAR[]Liens concernant les arbres BSP,links)


<p>Voici quelques sites qui ont retenu mon attention concernant les
  arbres BSP :</p>
<ul>
  <li>La FAQ sur les arbres BSP :
  EXTLINK(http://www.faqs.org/faqs/graphics/bsptree-faq/)</li>
  <li>Un livre de M. Abrash en fran�ais : ITALIQUE(Le zen de la
  programmation graphique) Edt. International Thomson Publishing,
  France 1997.</li>
  <li>Beaucoup d'autres sites web parlent et impl�mente des arbres
  BSP dans leur jeu
  (EXTLINK(http://www.gametutorials.com/,Gametutorials),
  EXTLINK(http://www.gamedev.net/,GameDev). Google est votre ami
  !</li>
</ul>

divert(DIVERT_FOOTER_CODE)

END_BODY(,)

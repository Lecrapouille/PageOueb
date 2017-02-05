divert(DIVERT_HEADER_CODE)

DEF_TITLE(Dynamique d'une voiture et principe de la moindre action)
DEF_KEYWORDS(principle of least action)
DEF_DESCRIPTION(Dynamics of a car with the principle of least action)
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Raccourcis,Introduction,#intro,
Aper�us,#view,T�l�chargement,#download), BANNIERES)

divert(DIVERT_BODY_CODE)

SUBSECTION(ICON_READ[]Pr�sentation,intro)

<p>Comment simuler simplement la dynamique d'une voiture pour
l'impl�menter dans un jeu ?  Attention : ceci n'est pas un cours de
mod�lisation d'une voiture r�elle, mais juste une aide pour un
simulateur tr�s simple. Pour voir un effet de cette dynamique vous
pouvez t�l�charger mon jeu : LINK(dyna-LANG.html,Ecstasy).</p>

<p>Je tiens � remercier mon p�re pour m'avoir expliqu� le principe de
la moindre action.</p>

<p>Vous trouverez sur cette page, de difficult� croissante :</p>

LISTE(Une br�ve introduction au LINK(dyna/dyna_action.pdf,principe de
      la moindre action)[,] avec un exemple le plus simple possible.,

      LINK(dyna/dyna_monocycle.pdf,L'�tude d'un monocycle) : le
      v�hicule est mod�lis� en 2D[,] par une carcasse de masse
      ponctuelle accroch�e � une roue par un ressort.,

      LINK(dyna/dyna_moto.pdf,L'�tude d'une moto) : le v�hicule est
      mod�lis� en 2D[,] par une carcasse repr�sent�e par une barre de
      masse ponctuelle � laquelle sont accroch�es deux roues par des
      ressorts. La carcasse n'a pas d'inertie et seul le tangage est
      mod�lis�.,

      LINK(dyna/dyna_voit.pdf,L'�tude d'une voiture) : le v�hicule est
      mod�lis� en 3D[,] par une carcasse repr�sent�e par une plaque de
      masse ponctuelle � laquelle sont accroch�es quatre roues par des
      ressorts. Par rapport au sujet pr�c�dent[,] on �tudie en plus le
      roulis et la carcasse a une inertie.,

      LINK(dyna/dyna_mvt_horizon.pdf,Le mouvement horizontal de la
      voiture) : comment le v�hicule tourne lorsqu'on tourne le
      volant.)

SUBSECTION(ICON_EYES[]Aper�us,view)

TABLEAU(3,CAPTION(dyna/ressort.jpg),
CAPTION(dyna/moto.jpg),
CAPTION(dyna/voiture.jpg))
CENTER(Cliquer sur les images pour les agrandir.)

SUBSECTION(ICON_DOWNLOAD[]T�l�chargement,download)

<p>Les documents ont �t� �crits en LaTex et les codes sources sont
disponibles sur GITHUB(Lecrapouille/PrincipeMoindreAction,GitHub).</p>

TABLEAU(3,
LINK(dyna/dyna_action.pdf,principe de la moindre action),
LINK(dyna/dyna_monocycle.pdf,L'�tude d'un monocycle),
LINK(dyna/dyna_moto.pdf,L'�tude d'une moto),
ICON_PDF,ICON_PDF,ICON_PDF,
37 Ko--- format PDF,
44 Ko --- format PDF,
49 Ko --- format PDF,
dnl
LINK(dyna/dyna_voit.pdf,L'�tude d'une voiture),
LINK(dyna/dyna_mvt_horizon.pdf,Le mouvement horizontal de la voiture),
,
ICON_PDF,ICON_PDF,,
67 Ko --- format PDF,
42 Ko --- format PDF,)

divert(DIVERT_FOOTER_CODE)

END_BODY(,)

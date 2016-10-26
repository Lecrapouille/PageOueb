dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

dnl ICON_UPDATED STRONG(Page en cours de r�daction).

LEFT_MENU(CHANGE_LANG, HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,
Vid�os du prototype version 1,videos,
Photos en vrac du prototype version 1,photos),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Vid�os du prototype version 1,videos)
BOX
<!-- Ces vid�os ont �t� compress�es au format Divx 4~:
<ul>
  <li>Vid�o STRONG(tangage) (d�cembre) : comportement de
    l'h�licopt�re en r�ponse � des
    �chellons de consigne d'inclinaison.</li>
  <li> Vid�o STRONG(limitepuissance) (octobre) : avec deux
    moteurs, au maximum de leur puissance, ce n'est sont pas encore
    suffisant pour faire d�coller l'h�licopt�re.
  <li> Vid�o STRONG(instable) (d�cembre) : avec deux
    moteurs au maximum de leur puissance, des probl�mes de
    stabilit� surviennent.</li>
</ul>-->

TABLEAU(3,
MOVIE(helico/videos/tangage.jpg,helico/videos/tangage.avi),
MOVIE(helico/videos/puissance.jpg,helico/videos/limitepuissance.avi),
MOVIE(helico/videos/instable.jpg,helico/videos/instable.avi),
Tangage,
Limite de puissance,
Instabilit�,
3 Mo -- format DIVX,
4 Mo -- format DIVX,
3 Mo -- format DIVX)
ENDBOX

SECTION(Photos en vrac du prototype version 1,photos)
BOX
TABLEAU(3,
LOWCAPTION(helico/photos/carc),
LOWCAPTION(helico/photos/helicov2),
LOWCAPTION(helico/photos/h4hpattes),

LOWCAPTION(helico/photos/carte_capt1),
LOWCAPTION(helico/photos/capteurdessus),
LOWCAPTION(helico/photos/capteurdessous),
dnl Un ami a utilis� la m�thodologie EXTLINK(http://www.la-rache.com/,La RACHE) pour r�diger le cahier des charges. Malheureusement le CDC s'est vu refus� la norme ISO-1664.,La rotule qui va maintenir l'h�licopt�re.,,
LOWCAPTION(helico/photos/pieces_croix),
LOWCAPTION(helico/photos/croix),
LOWCAPTION(helico/photos/attachehelicev2),
dnl Pi�ces de la partie mat�rielle, La croix, Une h�lice,
LOWCAPTION(helico/photos/balancoirev1),
LOWCAPTION(helico/photos/helico_balan1),
LOWCAPTION(helico/photos/balancoirev2),
dnl H�lico sans ses pattes, Quatre pattes de l'h�lico, Tige de laiton et ,
LOWCAPTION(helico/photos/balancoire3),
LOWCAPTION(helico/photos/electronik),
LOWCAPTION(helico/photos/electronik1),

dnl Plein d'autres photos sont � venir,
dnl Partie �l�tronique: PIC 16f876; Max232; port s�rie; acc�l�rom�tre; aop, Partie �l�tronique vue de haut, Helico et accelero sur sa balancoire,

LOWCAPTION(helico/photos/h4h_sans_pattes1),

dnl Carte des capteurs,helico et sa carte � clips,Partie mat�rielle finale,

LOWCAPTION(helico/photos/oscillo),
CAPTION(helico/schemas/helico_main.jpg)
)

divert(DIVERT_FOOTER_CODE)

END_BODY(helico_download,T�l�chargement,
helico_biblio,Bibliographie)

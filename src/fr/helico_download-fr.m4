dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

dnl ICON_UPDATED STRONG(Page en cours de r�daction).

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,
Rapports � t�l�charger,#rapports,
Programmes � t�l�charger,#prog,
Sch�mas � t�l�charger,#schemas,
Vid�os � t�l�charger,#videos),
BANNIERES)


divert(DIVERT_BODY_CODE)

SECTION(Downloads,download)

SUBSECTION(Rapports d'avancement du projet,rapports)

<p>Derni�re mise � jour : 02 d�cembre 2006. Je projette de faire une
  r�vision 4 pour fin mars.</p>
TABLEAU(3,
LINK(helico/h4hConceptionR3.pdf,Le rapport final) (R�vision 3),
LINK(helico/helico_cdc.pdf,Le cahier des charges),
LINK(helico/helico_spec.pdf,Le cahier des spec),
ICON_PDF,ICON_PDF,ICON_PDF,
2.6 Mo -- format PDF,
216 Ko -- format PDF,
170 ko -- format PDF)


SUBSECTION(Programme de l'h�licopt�re,prog)

<p>Les archives contiennent en vrac :</p>
LISTE(Des sch�mas de la carte �lectronique pour Proteus.,
Le code source SynDEx et M4 pour les deux dsPIC.,
Des fichiers Scicos contenant les blocs diagrammes pour la commande
automatique de l'h�licopt�re., Le code source en C pour le
fonctionnement du port s�rie sous Mac/Unix[,]dsPIC et la gestion des
p�riph�riques pour dsPIC.,Pour la v2[,] le code C pour la gestion d'un
joystick pour Linux et une camera FireWire pour Mac/Linux et balbutiement d'un traitement de l'image en OpenGL et Cg.)

<p>Derni�re version faite le: DATE.</p>

TABLEAU(2,
LINK(helico/prog/H4H_v2/H4H-2.0.2.2_released_[]H4HDATE[].tar.bz2,Sources prototype 2 (H4H-2.0.2.2_released_[]H4HDATE[])),
LINK(helico/prog/H4H_v1/quadrat_q-h4h_0.1.8.tar.bz2,Sources prototype 1),
ICON_TGZ,
ICON_TGZ,
700 Ko -- format TAR.BZ2,
3 Mo -- format TAR.BZ2)
<p>La d�compression d'une archive xxx.tar.bz2 se fait avec la
commande: tar jxvf xxx.tar.bz2</p>

SUBSECTION(Sch�ma de la carte �lectronique,schemas)

<p>La derni�re version du sch�ma �lectronique n'est pas encore
   disponible en t�l�chargement. En attendant, le sch�ma du ptototype
   1 t�l�chargeable au format PDF, PNG ou EAGLE.</p>

<p>STRONG(ATTENTION : N'�tant pas �lectronicien de formation[,] il se
   peut que ce sch�ma contienne des erreurs ou qu'il ne soit pas
   optimal !)</p>

TABLEAU(3,
LINK(helico/schemas/h4h_schematic.sch,Sch�ma),
LINK(helico/schemas/h4h_schematic.png,Sch�ma),
LINK(helico/schemas/h4h_schematic.pdf,Sch�ma),
ICON_TGZ,ICON_TGZ,ICON_PDF,
260 Ko -- format SCH,200 Ko -- format PNG,420 Ko -- format PDF)

divert(DIVERT_FOOTER_CODE)

END_BODY(helico_asservissement,Asservissement de l'h�licopt�re,
helico_photos,Photos et vid�os)


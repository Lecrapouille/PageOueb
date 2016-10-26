dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

ICON_BUILD STRONG(Page en cours de r�daction.)

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Asservissements,asservi)

SUBSECTION(ICON_READ[]Contexte)

<p>L'asservissement de l'attitude de la plate-forme volante �tant,
   bien �videment, la partie la plus dure du projet, elle est
   actuelement en cours de r�alisation. Cependant, la r�gulation d'un
   axe de la plate-forme avec son centre de gravit� fix� est
   fonctionel. Le PC envoie une consigne d'angle et la plate-forme
   modifie la puissance des moteurs afin de suivre la consigne.</p>

<p>La r�gulation d'un axe de la plateforme (prototype 1) est d�crite
   dans le document PDF t�l�chargable
   EXTLINK(helico_download-LANG.html,ici). Actuelement j'en suis au
   prototype 2 (changement de microcontr�leurs). La diff�rence
   fonctionnelle entre ces deux prototypes est que la carte
   �lectronique peut �tre ind�pendante du PC pour les calculs de la
   r�gulation.</p>

<p>Voici une liste des parties �tudi�es :</p>
LISTE(Etude th�orique d'un moteur DC et asservissement en courant.,
Mod�le de l'h�licopt�re et asservissement du tangage et en altitude.,
Sch�mas blocs Scicos)

PICTURE(helico/schemas/helico_main.jpg,Sch�ma bloc Scicos pour
l'asservissement de l'h�licopt�re.)

SECTION(Filtres num�riques et r�gulateur PID num�rique)

<p>Une question qui revient souvent sur le forum XBIRD est comment
   ITALIQUE(coder en C) un filtre (passe bas, haut, bande) et un
   r�gulateur PID. Ce n'est pas expliqu� sur mon rapport. Je mets ici
   mon code � dispostion.</p>

SUBSECTION(ICON_GEAR[]Filtre num�rique passe bas,bas)

<p>Un filtre passe-bas est un filtre qui laisse passer les basses
   fr�quences et qui att�nue les hautes fr�quences. Sa fonction de
   transfert (temps continu) est :</p>

CODE
         1
X = -------------- U
       1 + S / w[]SUB(c)
ENDCODE

<p>S la variable de Laplace (exprimee en radian par seconde). U
   l'entree, X la sortie et w[]SUB(c) la fr�quence de coupure
   d�sir�e. Ecrit tel quel, cette formule n'est pas exploitable par un
   ordinateur car S d�signe l'op�rateur deriv�e dans le domaine de
   Laplace.</p>

<p>En utilisant la transform�e en Z, on peut approximer S par (Z - 1)
  / h o� Z est l'op�rateur d'avance et h le pas de temps.</p>

<p>La fonction de transfert (temps discret) s'�crit :</p>
CODE
x[]SUB(n+1) = (1 - a) x[]SUB(n) + a u[]SUB(n)
ENDCODE

SUBSECTION(ICON_GEAR[]Filtre num�rique passe bas,haut)

divert(DIVERT_FOOTER_CODE)

END_BODY(helico_logiciel,Software,
helico_download,T�l�chargement divers et vari�s)

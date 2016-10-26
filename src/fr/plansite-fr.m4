dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Plan du site)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_HOME)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(
LEFT_RUBRIC(Projets sur le temps r�el,Projet H�licopt�re quatre
rotors,helico_intro-LANG.html,Suivi automatique de voiture
CyCab,stages-travail2-LANG.html),

LEFT_RUBRIC(Tutoriels sur le TR,Le logiciel Scilab/Scicos,tuto_scicos-LANG.html,Le logiciel SynDEx,tuto_syndex-LANG.html,
Programmation du port s�rie,comm_rs232-LANG.html),

LEFT_RUBRIC(Projets Informatiques,Interpr�teur
Forth,myforth-LANG.html,SimTaDyn,simtadyn-LANG.html,Ecstasy,ecstasy-LANG.html,SpeedWay,speedway-LANG.html),

LEFT_RUBRIC(Tutoriels,Dynamique d'une voiture,dyna-LANG.html,Les
arbres de partitionnement binaire de l'espace,bsp-LANG.html,Chargeur
de fichier ASE,ase-LANG.html),

LEFT_RUBRIC(Exp�rience professionnelle,CV,cv-LANG.html,Stages �
l'INRIA Rocquencourt,syndex_presentation-LANG.html),BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Acc�s d�taill�)
BOX
LISTE(
    Projets temps r�el :
    LISTE(H�licopt�re quatre rotors :
        LISTE(MYLINK(helico_intro,Pr�sentation),
	      MYLINK(helico_etapes,Etapes de la construction),
	      MYLINK(helico_mecanique,Construction de la carcasse),
	      MYLINK(helico_electronique,Construction de la carte �lectronique),
	      MYLINK(helico_codegene,G�n�ration automatique de code),
	      MYLINK(helico_asservissement,Asservissement de l'h�licopt�re),
	      MYLINK(helico_download,T�l�chargement),
	      MYLINK(helico_biblio,Bibliographie),
              MYLINK(tuto_scicos,Pr�sentation du logiciel de mod�lisation et de simulation Scilab/Scicos),
              MYLINK(tuto_syndex,Pr�sentation du logiciel de SynDEx),
              MYLINK(comm_rs232,Introduction au port s�rie (RS232)),
	      MYLINK(helico_obsolete,Trucs obsol�tes)
        ),
        Voiture CyCab :
	LISTE(MYLINK(stages_travail2,Travail effectu�),
	      MYLINK(stages_downloads,T�l�chargement),
              MYLINK(tuto_dyna,Etude simple de la dynamique d'une voiture)
        ),
        Interpr�teur Forth (stop�) :
	LISTE(MYLINK(myforth,Forth))
    ),
    Projets informatiques (3D) :
    LISTE(MYLINK(speedway,Projet SpeedWay),
          MYLINK(ecstasy,Projet Ecstasy),
          MYLINK(simtadyn,Projet SimTaDyn)
    ),
    Tutoriels :
    LISTE(MYLINK(tuto_dyna,Etude simple de la dynamique d'une voiture),
          MYLINK(tuto_bsp,Elimination des parties cach�es dans une sc�ne 3D),
          MYLINK(tuto_ase,Format ascii d'exportation de sc�ne 3D de 3D Studio Max),
          MYLINK(tuto_scicos,Pr�sentation du logiciel de mod�lisation et de simulation Scilab/Scicos),
          MYLINK(tuto_syndex,Pr�sentation du logiciel de SynDEx),
          MYLINK(comm_rs232,Introduction au port s�rie (RS232))
    ),
    Exp�rience professionelle :
    LISTE(Stages � l'INRIA Rocquencourt (�quipe AOSTE) :
	LISTE(MYLINK(stages_presentation,Pr�sentation),
	      MYLINK(stages_travail1,Stage 1),
              MYLINK(stages_travail2,Stage 2),
	      MYLINK(stages_downloads,T�l�chargement)
        )
    ),
    MYLINK(cv,Mon C.V.)
)

divert(DIVERT_FOOTER_CODE)

END_BODY(index,Page d'acceuil,maj,Mise � jour du site)
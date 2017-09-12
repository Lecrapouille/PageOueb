dnl -*- html -*- Coloration Syntaxique pour Emacs
TITLE(Auto-chargement d'une biblioth�que dynamique)
KEYWORDS()
DESCRIPTION()

SECONDARY_HEAD_MENU(SECONDARY_HEAD_MENU_3D)
divert(DIVERT_NAVIGATION_CODE)
LEFT_MENU(LEFT_RUBRIQUE()) dnl TABLE_OF_CONTENTS))
dnl Sommaire,Introduction,#intro,Aper�us du jeu,#view,T�l�chargement,#download,Au coeur du Forth,#heart,Liens,#links), BANNIERES)

BEGIN_BODY

SECTION(ICON_READ,Introduction,intro)

<p>J'�cris cet article suite � la d�couverte de ce
EXTLINK(http://runtimecompiledcplusplus.blogspot.fr,projet) (dont les
sources sont disponibles sur
GITHUB(RuntimeCompiledCPlusPlus/RuntimeCompiledCPlusPlus,GitHub))
qui propose une m�thode perm�ttant de charger � la vol�e du code
C/C++, un language compil�, et ainsi imiter le comportement d'un
language interpr�t�. Le but recherch� est de minimiser le temps de
compilation et de ne pas avoir � relancer l'application � chaque fois
qu'on l'a compile. Cette m�thode repose sur l'utilisation des
biblioth�ques dynamiques. Dans la vid�o du blog, l'auteur modifie une
ligne de code C++ permettant de changer la couleur d'un objet 3D dans
une application de type jeu vid�o. Lorsque l'auteur sauve le fichier C++,
la couleur change sans devoir red�marrer l'aplication. Gain de
temps.</p>

<p>Le but de mon article n'est pas de faire un cours sur les
m�canismes d'une biblioth�que dynamique, le lecteur est invit� � faire
sa propre recherche sur internet avec comme mot clef "shared library"
(par exemple:
EXTLINK(http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html,c
HOWTO Linux)). Le but est d'expliquer tr�s simplement comment
fonctionne puis d'�crire un code tr�s basique expliquant le
comportement. En effet le projet initial, malgr� la pr�sence d'un
wiki, explique mal la m�thode g�n�rale et le code est trop compliqu�:
il n'a pas �t� con�u de fa�on g�n�rique. En effet les auteurs, pour la
r�lalisation d'un projet professionel (jeu 2D) ont ajout� cette
m�thode optimisant leur temps de d�velopement mais il aurait �t� plus
logique, pour un soucis p�dagogique, de faire l'inverse: pr�senter
l'algorithme puis comme exemple de pr�senter l'application utilisant
cette m�thode.</p>

SECTION(ICON_READ,biblioth�que dynamique,bibl)

<p>Une biblioth�que dynamique (Shared Library en anglais) ... TODO
]  bref rappel.</p>

SUBSECTION(ICON_READ,Cr�ation d'un biblioth�que dynamique,crea)

<p>Cr��ons un fichier C nomm� lib.c dont le code suivant affiche la
  chaine de caract�re "Hello world":</p>
CODE[]#include &#60;stdio.h&#62;

void helloworld(void) { printf("Hello word\n"); }ENDCODE

<p>Pour cr��r la biblioth�que dynamique associ�e que l'on nommera, par exemple sur Mac
  OS X: livecode.dylib. Le fichier lib.o ne nous int�resse pas. Un peu plus loin dans cet article, nous r�-�crirons ce code dans un Makefile.<p>
CODE[]gcc -c -W -Wall lib.c
gcc -dynamiclib -undefined suppress -flat_namespace lib.o -o livecode.dylib
ENDCODE

 <p>Si tout se passe bien, deux fichiers auront �t� cr��s: lib.o et
 livecode.dylib (ou bien livecode.so ou bien livecode.dll selon l'architecture
 utilis�e). Par s�cutit�, v�rifions que la fonction helloworld est bien pr�sente
   dans la biblioth�que:</p>
CODE[]nm livecode.dylib
0000000000000f70 T _helloworld
                 U _printf
                 U dyld_stub_binder
 ENDCODE

 <p>Nous voyons que le symbole _helloworld est bien d�fini: il a une
 addresse 0f70.</p>

SUBSECTION(ICON_READ,Utilisation d'une biblioth�que dynamique,util)

<p>Nous utiliserons pour cela la classe
EXTLINK(https://developer.gnome.org/glibmm/stable/classGlib_1_1Module.html,Module)
de la biblioth�que glibmm qui est une surcouche (wrapper) C++ de la version C
EXTLINK(https://developer.gnome.org/glib/stable/glib-Dynamic-Loading-of-Modules.html,glib)
utilis�e pour le projet EXTLINK(https://www.gtk.org,GTK+). La raison
est la suivante: �tre multi-plateforme (Linux, OSX, Windows). On
  aurait tout aussi bien pu utiliser la biblioth�que EXTLINK(https://pocoproject.org,
POCO) (conf�re sa
EXTLINK(https://pocoproject.org/slides/120-SharedLibraries.pdf, documentation)).</p>

CODE[]1  #include &#60;iostream&#62;
2  #include &#60;glibmm/module.h&#62;
3
4  typedef void (*fptr)();
5
6  int main()
7  {
8    Glib::Module module("livecode.dylib");
9    if (module)
10   {
11      void* func = nullptr;
12      bool found = module.get_symbol("helloworld", func);
13      std::cout &#60;&#60; "found " &#60; &#60; found &#60; &#60; std::endl;
14      if (found)
15        {
16          fptr my_fptr = reinterpret_cast&#60;fptr&#62;(reinterpret_cast&#60;long&#62;(func)) ;
17          my_fptr();
18        }
19    }
20  else
21    {
22      std::cout &#60;&#60; "Not loaded" &#60;&#60; std::endl;
23    }
24
25  return 0;
26 }ENDCODE

<p>Explication du code:</p>
<p>Ligne 2: Utilisation de la classe Module fournie par la
  glibmm.</p>
<p>Ligne 4: d�finition d'un pointeur sur fonction sans param�tre et
  retournant void.</p>
<p>Ligne 8: On charge la biblioth�que dynamique livecode.dylib et si
  elle est correctement charg�e, ligne 12, on recup�re la fonction
  helloworld et que l'on cast ligne 16.</p>
<p>Ligne 17: on execute le pointeur sur fonction qui doit afficher
  "Hello World" sur stdout.</p>
<p>Ligne 26: module est d�truit, l'appel de son destructur permet de
 d�charger la biblioth�que.</p>

SUBSECTION(ICON_READ,Chargement automatiquement d'une biblioth�que dynamique,charg)

<p>Fort de cette connaissance, nous allons modifier le code pr�c�dent
pour �muler le comportement dynamique d'un language
interpr�t�. Cr��ons le fichier module.cpp avec le code qui
suit. module.cpp sera compil� sous la forme d'un ex�cutable et sera
nomm� "module". Ce que nous voulons que cet ex�cutable fasse: il
chargera la fonction helloworld de livecode.dylib (issu de lib.c) et
d�s que l'utilisateur modifie le code du fichier lib.c un moyen (�
d�terminer) indiquera � module qu'il a �t� chang�. Une fois notifi�,
le fichier lib.c sera compil� puis recharg� � nouveau dans
l'application module. Par exemple, si l'on se contente de modifier le
texte "hello world" par un autre texte, � chaque fois que le fichier
lib.c est sauvegard�, le nouveau texte sera affich�
automatiquement.</p>

<p>Voici la premi�re partie du code de module.cpp:</p>
CODE[]1   #include &#60;iostream&#62;
2   #include &#60;glibmm/module.h&#62;
3
4   typedef void (*fptr)();
5
6   static long prevUpdateTime = 0;
7   static Glib::Module *module = nullptr;
8   static const std::string c_livefile = "lib.c";
9   static const std::string c_livefunc = "helloworld";
10  static const std::string c_livelib = "livecode.dylib";
11
12  static bool reload()
13  {
14   bool ret = false;
15
16   // Don't forget to clean up
17   if (nullptr != module)
18     {
19       std::cout &#60;&#60; "delete module" &#60;&#60; std::endl;
20       delete module;
21     }
22
23   module = new Glib::Module(c_livelib);
24   if ((nullptr != module) && (*module))
25     {
26       std::cout &#60;&#60; "Success loading "
27                 &#60;&#60; c_livelib &#60;&#60; "'"
28                 &#60;&#60; std::endl;
29
30       void* func = nullptr;
31       if (module->get_symbol(c_livefunc, func))
32         {
33           std::cout &#60;&#60; "found the function "
34                     &#60;&#60; c_livefunc &#60;&#60; "()"
35                     &#60;&#60; std::endl;
36           fptr my_fptr = reinterpret_cast &#60; fptr&#62;(reinterpret_cast &#60; long&#62;(func));
37           my_fptr();
38
39           ret = true;
40         }
41       else
42         {
43           std::cerr &#60;&#60; "Couldn't find the function "
44                     &#60;&#60; c_livefunc &#60;&#60; "() '"
45                     &#60;&#60; module->get_last_error()
46                     &#60;&#60; "'" &#60;&#60; std::endl;
47         }
48     }
49   else
50     {
51       std::cerr &#60;&#60; "Error: No dice loading '"
52                 &#60;&#60; c_livelib &#60;&#60; "'"
53                 &#60;&#60; std::endl;
54     }
55   return ret;
56 }ENDCODE

<p>Lignes 8 � 10 nous d�finissons respectivement les noms du fichier,
 de la fonction et de la biblioth�que. Ligne 6 d�finit la variable
 prevUpdateTime qui est utilis�e pour d�tecter une modification du
 fichier lib.c.</p>

<p>La fonction reload() permet de recharger la biblioth�que
  livecode.dylib. Si elle est d�j� pr�sente, elle est d'abord
  d�charg�e (lignes 17 � 21) puis recharg�e (lignes 23 � 56) de la
  m�me mani�re que vu pr�c�dement.</p>

<p>Voici la deuxi�me partie du code de module.cpp:</p>
CODE[]57
58 #include &#60;cstdlib&#62; // system
59
60 static void recompileAndReload()
61 {
62   std::cout &#60;&#60; "#################################" &#60;&#60; std::endl;
63
64   std::string cmd = "make lib";
65   system(cmd.c_str());
66   reload();
67 }ENDCODE

<p>Ligne 60, la fonction recompileAndReload permet de compiler le
 fichier lib.c et de cr�er le fichier livecode.dylib en appellant le
 Makefile via l'appel system system(). Ici nous lui demanderons
 d'ex�cuter la r�gle lib. Le contenu du Makefile sera d�taill� plus
  loin dans cet article.</p>

<p>Ligne 66: la fonction reload() est appel�e.</p>

<p>Voici la troisi�me partie du code de module.cpp:</p>
CODE[]68
69 #  include &#60; sys/stat.h&#62; // stat
70
71 void checkAndUpdate(std::string const & livefile)
72 {
73   struct stat fileStat;
74
75   if (stat(livefile.c_str(), &fileStat) &#60; 0)
76     {
77       std::cerr &#60;&#60; "Couldn't stat file " &#60;&#60; livefile &#60;&#60; std::endl;
78       return;
79     }
80
81   long currUpdateTime = fileStat.st_mtime;
82   if (currUpdateTime != prevUpdateTime)
83     {
84       std::cout &#60;&#60; "Compile reload" &#60;&#60; std::endl;
85       recompileAndReload();
86     }
87   prevUpdateTime = currUpdateTime;
88 }ENDCODE

<p>La fonction checkAndUpdate permet de v�rifier que le fichier lib.c
 n'a pas �t� modifi�. Ici on se contente simplement de comparer la
 date de modification du fichier. Notons qu'une date modifi�e
 n'implique pas forc�ment que le contenu du fichier ait chang�. Le
 lecteur pourra consolider la condition de rechargement par exemple
 avec l'article
 EXTLINK(http://nullprogram.com/blog/2014/12/23,suivant).</p>

<p>Voici la derni�re partie du code de module.cpp:</p>
CODE[]89
90 #include &#60; unistd.h&#62; // sleep
91
92 int main()
93 {
94   while (true)
95     {
96       checkAndUpdate(c_livefile);
97       usleep(100000);
98     }
99
100  return 0;
101 }ENDCODE

<p>On se contente toutes les 100 ms de v�rifier que le fichier n'a pas
 �t� modif�. En alternative � cette boucle, on peut penser � utiliser
 des notifications comme par exemple
 EXTLINK(https://fr.wikipedia.org/wiki/Inotify,inotify) pour Linux
  (non portable).</p>

<p>Finallement voyons le dernier fichier important le Makefile:</p>
CODE[]all: module

.PHONY: module
module:
        g++ -W -Wall --std=c++11 `pkg-config --cflags --libs gtkmm-3.0` module.cpp -o module

.PHONY: lib
lib:
        gcc -c -W -Wall lib.c
        gcc -dynamiclib -undefined suppress -flat_namespace lib.o -o livecode.dylib

clean:
        rm -fr *~ *.o *.dylib module
ENDCODE

<p>La r�gle par d�fault "all" compile uniquement l'ex�cutable
 module. On doit appeller la r�gle lib pour compiler le fichier lib.c
 et avoir le fichier livecode.dylib. Rappelez vous que c'est la
 fonction recompileAndReload qui appelle le Makefile avec la r�gle
 lib.</p>

SUBSECTION(ICON_READ,Test et conclusion,test)

<p>TODO: tarball</p>

<p>Testons le projet:</p>
CODE[]make
./module
ENDCODE

<p>Devrait afficher:</p>
CODE[]Compile reload
#################################
gcc -c -W -Wall lib.c
gcc -dynamiclib -undefined suppress -flat_namespace lib.o -o livecode.dylib
Success loading livecode.dylib'
found the function helloworld()
Hello word
ENDCODE

<p>Modifions le fichier lib.c, rempla�ons "Hello world" par "Bonjour
  tout le monde". Sauvegardons le fichier. Dans la console, on doit
  voir appara�tre le nouveau texte:</p>
CODE[]Compile reload
#################################
gcc -c -W -Wall lib.c
gcc -dynamiclib -undefined suppress -flat_namespace lib.o -o livecode.dylib
Success loading livecode.dylib'
found the function helloworld()
Hello word
Compile reload
#################################
gcc -c -W -Wall lib.c
gcc -dynamiclib -undefined suppress -flat_namespace lib.o -o livecode.dylib
Success loading livecode.dylib'
found the function helloworld()
Bonjour tout le monde
ENDCODE

<p>En conclusion, nous avons vu comment une m�thode qui permet
d'utiliser le language C comme un language interpr�t� tout en
gardantl'avantage d'un language compil�. Cette technique est
certainement tr�s utile pour des applications visuelles (jeux vid�os)
ou d'asservissement (loi de contr�le) afin d'appr�cier un comportement
tel que le tuning de param�tres (comme un moteur de particule pour le
jeu vid�o ou bien le r�glage d'un asservissement PID par exemple) sans
avoir � red�marer l'application: modifier le code, sauvegarder et voir
le changement de comportement.</p>

<p>Nous n'avons pas aborder les sujets suivants: chargement d'un code
 en C++, comment sauvegarder et restaurer le contexte (�tats) de
 l'application avant et apr�s chargement de la biblioth�que,
 d�sactiver ce comportement pour le mode release (code destin� �
 l'utilisateur final). ni comment se prot�ger d'un segfault avec le code
 charg� dynamiquement.</p>

END_BODY(simtadyn,Le projet SimTaDyn,,)
undivert(DIVERT_TABLE_OF_CONTENT)

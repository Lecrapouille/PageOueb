dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(G�n�ration d'un site en HTML avec le langage M4)
DEF_KEYWORDS(m4 generation html)
DEF_DESCRIPTION(Generation HTML website with M4 language)
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Contexte,#contexte),BANNIERES)

divert(DIVERT_BODY_CODE)

SUBSECTION(ICON_READ[]Pr�sentation,intro)

<p>Dans ce document, j'explique comment fonctionne mon outil de
g�n�ration de pages HTML afin de cr��r de petits sites internet
statiques. Toutes les pages de ce site (donc celle que vous �tes
entrain de lire) ont �t� g�n�r�es par cet outil. Par "site internet
statique" j'entends un site qui ne requi�re pas de logique sp�ciale
c�t� serveur pour fonctionner, les pages sont rapidements mises en
forme, peuvent �tre mises en cache, etc. A l'oppos�, un site dynamique
doit s'encourir de plus de moyen en utilisant un serveur de requ�tes
donc avec un temps d'affichage de la page th�oriquement plus lente.</p>

<p>Cet outil utilise le langage de macro-procession LINKM4. M4 est
utilis� en g�n�ral avec les autotools et sert � la cr�ation de
fichiers configure qui g�n�reront des makefiles, qui ces derniers,
servent � compiler des projets. L'id�e de base de M4 �tait de pouvoir
faire des copier/coller de code facilement.</p>

<p>Un macro-processeur prend en entr�e un fl�t de texte, recherche des
chaines de charact�res (qu'on lui aura auparavant sp�cifi�es) et les
remplace par d'autres chaines de charact�res (�galement
sp�cifi�es). Il va it�rer un certain nombre de fois jusqu'� ce qu'il
n'y ait plus chaines � remplacer. Comme exemple, on peut citer le
pr�processeur de GCC est aussi un macro-processeur : il va parser les
#define et autres #ifdef dans un code en C avant d'attaquer la
compilation des fichiers.</p>

<p>Ce document n'est pas un cours sur le langage M4, je suis trop
d�butant dans ce langage, mais plutot un des exemples de code pour
vous donnez des id�es d'automatisation de cr�ation de page html. Les
gourous de ce langage trouveront certainement des solutions plus
�l�gantes. Pour ceux qui pr�f�rent apprendre le langage M4, je leur
conseille de lire le document
EXTLINK(http://mbreen.com/m4.html,suivant) pour mieux comprendre
toutes les subtilit�s du langage M4 (et elles sont nombreuses et pas
�videntes).</p>

<p>M�me si vous n'aimez pas le look de ce site, vous verez comment
adapter cet outil pour changer la forme du votre. Je tiens � pr�ciser
que la programmation de sites web n'a jamais �t� une passion chez moi,
pour les raisons suivantes qui m'ont pouss� � d�velopper cet
outil :</p>

LISTE(

je trouve que l'�dition manuelle de page HTML devient vite �puisante
car le code devient vite illisible : le texte � �crire �tant noy� dans
une couche de balises verbeuses et noy� une deuxi�me fois par la
syntaxe des accents. Comme preuve concr�te regardez le contenu HTML de
ma page d'MYLINK(index,acceuil) (touche Controle et touche U sous
Firefox) et comparez la avec son
LINK(https://github.com/Lecrapouille/PageOueb/blob/master/src/fr/index-fr.m4,code
en M4);,

il y a longtemps[,] j'avais test� des outils de cr�ation de sites
web : c'�tait certe amusant mais la page devenait tr�s vite trop
lourde � d�buger;,

l'incompatibilit� des navigateurs � afficher correctement la m�me page
web (Internet Explorer �tant le premier � ne jamais respecter la
norme) faisant perdre un temps pr�cieux pour une mise en page qui
fonctionne sur un navigateur mais pas sur l'autre;,

je n'�tais pas particuli�rement int�r�ss� par l'apprentissage du
langage PHP et les derni�res technologies web g�n�rent[,] certes de
beaux sites[,] mais n'ont �t� cr��s[,] � mon avis[,] que pour g�n�rer
des sites
EXTLINK(https://fr.wikipedia.org/wiki/Pi%C3%A8ge_%C3%A0_clics,p---s �
clics) : mais ceci est un autre d�bat et pour plus de renseignement
vous pouvez consultez cette excellente vid�o :
EXTLINK(https://youtu.be/81rTkCGTM4Y?list=PLyIecIQvrWsGJ8_ZkrRxKYu1eEr7G3bxI,UnDropDansLaMare
S03 E01: Internet en 2025).,

Les gestionnaires de pages wiki et de blogs sont lourds � mettre en
place : n�cessitant de mettre en place de nombreux scripts php[,] des
bases de donn�es SQL[,] de g�rer des administrateurs[,] des mots de
passes. Par cons�quents pouvant offrir autant de failles de s�curit�
(du v�cu).)

<p>Par cons�quent j'ai d�cid� de d�velopper un petit outil fait maison
d'aide � la g�n�ration de pages HTML. L'id�e d'utiliser M4 vient :</p>

LISTE(d'avoir toujours �crit mes documents en LaTeX et jamais avec
l'�diteur Word. LaTeX est un langage pour g�n�rer des documents texte
en PDF de qualit� professionelle. C'est un langage proche de HTML mais
sa philosophie est : "occupez vous du contenu de votre document[,] je
m'occupe pour vous de sa mise en page". J'ai voulu me raproch� de
cette id�e : me contenter d'�crire uniquement le texte et de laisser
mon outil g�n�rer le code HTML.,

la lecture d'un article sur le journal Linux Magazine traitant de ce
sujet (j'ai oubli� le num�ro).,

la syntaxe markdown des wiki.,

mon stage o� j'ai appris le langage M4.)

SUBSECTION(ICON_DOWNLOAD[]T�l�chargement,download)

<p>Le code source du g�n�rateur est disponible sur
GITHUB(Lecrapouille/PageOueb,GitHub).</p>

SUBSECTION(ICON_GEAR[]Au coeur de M4,heart)

<p>Pour la suite de ce document, je propose une convention non
officielle. J'aime bien utiliser l'extension fichier STRONG(m4x) quand
il s'agit d'un fichier o� l'on va stocker ses macros (x pour
ex�cutable, par exemple webgenerator.m4x). Par contre, quand il s'agit
d'un fichier STRONG(m4) que l'on va macro-processer pour obtenir un
fichier html je pr�f�re garder l'extension m4 (par exemple
mapage.m4).</p>

<p>M4 comprend des caract�res sp�ciaux pour d�limiter des chaines :
ils servent � supprimer la macro-procession. Par default les
d�limiteurs sont les caract�res ` pour d�buter et ' pour terminer. M4
supprime ces delimiteurs avant de renvoyer la chaine de caract�res en
sortie. M4 permet de changer les d�limiteurs, par exemple pour
utiliser les crochets on �crira la commande suivante
[changequote([,])]

<p>Voici vos deux premi�res macros que l'on va nommer [ARROW_HOME] et
[STRONG] et � placer dans le fichier webgenerator.m4x : la premi�re
prend aucun param�tre alors que la deuxi�me prend un param�tre que
l'on note $1. Les virgules servent � s�parer les param�tres.</p>

CODE[changequote([,])
define([ARROW_HOME],[&lt;img class="icone5" src="img/home.png" alt="home"/&gt;])
define([STRONG],[&lt;strong&gt;$1&lt;/strong&gt;]) ]ENDCODE

<p>Si on lance M4 sur le fichier mapage.m4 :</p>
CODE Voici une image de maison [ARROW_HOME] et ceci un [STRONG(un texte en gras)]. ENDCODE

<p>il va g�n�rer la sortie suivante :<p>
CODE Voici une image de maison &lt;img class="icone5" src="img/home.png" alt="home"/&gt;
et ceci un &lt;strong&gt;texte en gras&lt;/strong&gt;. ENDCODE

<p>Que si l'on sauve dans un fichier html et l'affiche dans un
navigateur on verra appara�tre ARROW_HOME et STRONG(un texte en
gras).</p>

<p>Nous avons vu par ce simple exemple la puissance potentielle de cet
outil surtout si cette balise html doit �tre appel�e plusieurs fois
dans plusieurs pages html et que l'on veuille la remplacer, on va
optimizer notre travail car il suffira simplement de modifier le
ficher m4x � un seul endroit.</p>

<p>Voici comment appeller M4 dans un terminal de Linux (l'id�al
�tant d'�crire une r�gle dans un fichier Makefile) :</p>
CODE m4 webgenerator.m4x autrefichier.m4x mapage.m4 > mapage.html
ENDCODE

<p>Nous allons montrer tout au long de ce document d'autres macros
encore plus puissantes mais avant d'aller plus loin, je conseille de
lire le document EXTLINK(http://mbreen.com/m4.html,suivant) pour mieux
comprendre toutes les subtilit�s du langage M4 (et elles sont
nombreuses).</p>

SUBSECTION(ICON_GEAR[]Simplification de la gestion des liens,liens)

<p>Si la balise html &lt;a&gt; est trop complexe pour vous, alors cette
  macro conditionnelle reprenant l'id�e de la syntaxe markdown (wiki) peut vous �tre utile :</p>
CODE[define([LINK],[ifelse([$2],,[&lt;a href="$1"&gt;$1&lt;/a&gt;],[&lt;a href="$1"&gt;$2&lt;/a&gt;])])]

Exemple 1 : [LINK(https://www.google.fr,google)]
Exemple 2 : [LINK(https://www.google.fr)]
ENDCODE

<p>[ifelse] est un if-then-else testant la valeur du premier param�tre
(ici $2) avec la valaur deuxi�me param�tre (ici: vide) et selon le
r�sultat de la comparaison une action diff�rente sera faite. Dans
notre cas si le deuxi�me param�tre n'est pas donn� (donc non d�fini)
alors l'url compl�te sera affich�e LINK(https://www.google.fr) sinon
c'est le nom court qui sera affich�
LINK(https://www.google.fr,google).</p>

<p>En supposons que [LANG] est une macro d�j� d�finie, voici d'autres
macros du m�me genre. La premi�re macro permet de faire des liens vers
des pages du m�me site en prenant en compte automatiquement la langue
et sans qu'on la pr�cise. La deuxi�me macro permet d'afficher un petit
logo <img src="img/externallink.jpg"/> apres le nom de l'url :</p>

CODE[define([MYLINK],[ifelse([$2],,[&lt;a href="$1-LANG.html"&gt;$1&lt;/a&gt;],[&lt;a href="$1-LANG.html"&gt;$2&lt;/a&gt;])])]

[define([EXTLINK],[&lt;a href="$1" target="_blank"&gt;ifelse([$2],,[$1],[$2])
&lt;img src="img/externallink.jpg" alt="ext link"
border="0"/&gt;&lt;/a&gt;])
]ENDCODE

<p>Par exemple [MYLINK(tuto_m4,tutoriel M4)] donnera le resultat
suivant : MYLINK(tuto_m4,tutoriel M4) qui et pointera sur la page
correspondante � [LANG].</p>

<!-- <p>[dnl] est une macro qui permet d'ajouter des commentaires. Ici, la
commande �tant trop grande, elle est scind�e. [dnl] permet d'ignorer
les caract�res comme le retour chariot qui seraient ins�r�s dans le
code html. Cela rend laid le code m4x mais ce mal est parfois
n�c�ssaire. On notera que les espaces sont importants et peuvent �tre
pris en compte dans la sortie. L� encore, ne pas mettre d'espace entre
les s�parateurs de param�tres permet de s�curiser le code g�n�r� de
caract�re d'espace ind�sirables au d�triment de la lisibilit�.</p> -->

SUBSECTION(ICON_GEAR[]Changer la langue,lan)

<p>Une des probl�matiques sur les pages est la gestion des
langues. Pour chaque page dans une langue donn�e on souhaite pouvoir
acc�der � la page �quivalente dans une autre langue. Voici une
solution possible dans le cas d'une page bilingue (solution mais pas
tr�s esth�tique, en attendant d'avoir mieux).</p>

<p>A mettre dans le fichier m4x :</p>
CODE[define([RAP_FR],[&lt;img src="img/fr.png" alt="fr"/&gt;])
define([RAP_EN],[&lt;img src="img/en.png" alt="en"/&gt;])

ifdef([LANG],,[define([LANG],[fr])])

define([CHANGE_LANG],[&lt;p&gt;
ifelse(LANG,fr,[DRAP_FR LINK(THISFILE-en.html,DRAP_EN)],
[LINK(THISFILE-fr.html,DRAP_FR) DRAP_EN])&lt;/p&gt;])
]ENDCODE

<p>Les deux premi�res d�finitions permettent de dessiner un drapeau en
fran�ais et un drapeau en anglais. La troisi�me d�finition teste si la
macro [LANG] est d�finie et dans le cas o� elle ne l'est pas encore,
on lui force la valeur arbitraire fr (pour la langue fran�aise). La
derni�re d�finition permet de g�n�rer une image-lien vers la page dans
l'autre langue (du fran�ais vers l'anglais ou bien de l'anglais vers
le fran�ais). L'image du lien sera le drapeau de la langue de la
page point�e.</p>

<p>Que l'on compile avec :</p>
CODE m4 webgenerator.m4x -DTHISFILE=mapage -DLANG=fr autrefichier.m4x mapage-fr.m4 > mapage-fr.html
ENDCODE

<p>On pourra donc cr�er deux dossiers : anglais avec les fichiers
  mapage-en.m4.</p>

SUBSECTION(ICON_GEAR[]Titres[,] sections et sous-sections,sect)

<p>Basiquement ne font qu'appeler les balises de titres &lt;h1&gt;
  &lt;h2&gt; &lt;h3&gt; mais on peut complexifier leur comportement en
  cr�ant une ancre pour les menus sommaires rapides (� gauche en bleu)
  ainsi que leur donner un lien vers une page du site (page
  d'acceuil) :</p>

CODE[dnl $1: h1 h2 h3
dnl $2: title
dnl $3: anchor
dnl $4: link
define([_THE_SECTION_],
[ifelse($4,,[ifelse($3,,[&lt;$1&gt;$2&lt;/$1&gt;],[&lt;a id="$3" name="$3"&gt;&lt;/a&gt;&lt;$1&gt;$2&lt;/$1&gt;])],
[ifelse($3,,[&lt;$1&gt;&lt;a href="$4-]LANG[.html"&gt;$2&lt;/a&gt;&lt;/$1&gt;],dnl
[&lt;a id="$3" name="$3"&gt;&lt;/a&gt;&lt;$1&gt;&lt;a href="$4-]LANG[.html"&gt;$2&lt;/a&gt;&lt;/$1&gt;])])])
]ENDCODE

<p>Ensuite, pourquoi se contenter du seul titre ? Pour faire joli on
peut penser � mettre le texte dans une boite indent�e par rapport au
titre (avec la balise &lt;div&gt; et le code css qui va avec). Dans le code
suivant un titre ferme en fait la boite.</p>

CODE[define([SECTION],[_SECTION1_(h1,$@)])
define([SUBSECTION],[_SECTION2_(h2,$@)])
define([BOX],[&lt;div class="boite"&gt;])
define([ENDBOX],[RIGHT(LINK(#gotoup,ARROW_UP)) &lt;/div&gt;])

define([_IEME_SECTION_],[0])

define([_SECTION2_],[ifelse(_IEME_SECTION_,0,,[ENDBOX])
&lt;!-- Subsection --&gt;
_THE_SECTION_($@)BOX[]define([_IEME_SECTION_],[1])])

define([_SECTION1_],[ifelse(_IEME_SECTION_,0,,[ENDBOX])
&lt;!-- Section --&gt;
_THE_SECTION_($@)define([_IEME_SECTION_],[0])])
]ENDCODE

SUBSECTION(ICON_GEAR[]Cr�er de listes,list)

<p>Voici comment remplacer les listes html &lt;ul&gt; et
leurs �quivalents &lt;ol&gt;. La macro [shift] permet de faire une boucle (ici
recursive). [shift] supprime le param�tre de t�te et retourne la
queue de la liste. Dans notre premi�re d�finition on arreter de
'[shift]'er quand la liste est vide.</p>
CODE[define([LISTE_],[ifelse([$1],,,[&lt;li&gt;$1&lt;/li&gt; LISTE_(shift($@))])])
define([LISTE],[;&lt;ul&gt;LISTE_($@)&lt;/ul&gt;])]ENDCODE

<p>Exemple :</p>
CODE[LISTE(Je suis A;,Je suis B;LISTE(Je suis B1;,Je suis B2;),Je suis C.)]ENDCODE

<p>Sera affich� comme : </p>
LISTE(Je suis A;,Je suis B;LISTE(Je suis B1;,Je suis B2;),Je suis C.)

<p>Le lecteur attentif d�tectera le probl�me suivant : comment
afficher une virgule si cette derni�re est interpr�t�e comme un
sp�rateur de param�tre ? Sauf erreur de ma part M4 ne permet pas de
remplacer le caract�re virgule par un autre caract�re comme on a pu le
faire avec [changequote], donc la solution est d'�crire votre virgule
sous cette forme [[,]] pour la premi�re liste et [[[,]]] pour la
deuxi�me liste.</p>

CODE[LISTE(Je suis A[,],Je suis B[,]LISTE(Je suis B1[[,]],Je suis B2[[,]]),Je suis C.)]ENDCODE

LISTE(Je suis A[,],Je suis B[,]LISTE(Je suis B1[[,]],Je suis B2[[,]]),Je suis C.)

SUBSECTION(ICON_GEAR[]Cr�er des tableaux,table)

<p>Apres avoir cr�er des listes, voyons quelque chose de similaire :
  cr�er des tableaux html &lt;table&gt;</p>
CODE[define([forloop], [pushdef([$1], [$2])_forloop([$1], [$2], [$3], [$4])popdef([$1])])
define([_forloop],[$4[]ifelse($1, [$3], ,[define([$1], incr($1))_forloop([$1], [$2], [$3], [$4])])])

define([VECT_HEAD],[$1[]define([_list],[shift($@)])])

define([TABLEAU],[
define([COL],[$1]) dnl nombre de colonnes
define([_list],[shift($@)])
define([LIG],[eval($# / COL)]) dnl nombre de lignes
&lt;table width="90%" align="center"&gt;
forloop(iii,1,LIG,[    &lt;tr&gt;
forloop(jjj,1,COL,[        &lt;td align="center"&gt;VECT_HEAD(_list)&lt;/td&gt;
])    &lt;/tr&gt;
])
&lt;/table&gt;])
]ENDCODE

<p>Comme exemple concret, voyez ma page sur mon jeu
MYLINK(ecstasy,Ecstasy) section t�l�chargement ou aper�u du jeu
utilise ce code; sinon voici un exemple simple de tableau sur 3
colonnes.</p>
CODE[TABLEAU(3,
A1,B1,C1,
A2,B2,C2)
]ENDCODE

<p>Affichera :</p>
TABLEAU(3,A1,B1,C1,A2,B2,C2)

<p>On pourra �videment complexifier les param�tres du tableau en
ins�rant des macros M4 au lieu des simples chaines de caract�res A1,
A2 ...</p>

SUBSECTION(ICON_GEAR[]Du code source en couleur,code)

<p>Il se peut que vous souhaitiez afficher du code sur votre
page. Voici la solution la plus simple, sans couleur qui donnera les
cadres que vous voyez actuellement :</p>
CODE[define([CODE],[&lt;div class="code"&gt;&lt;pre&gt;&lt;code&gt;])
define([ENDCODE],[&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;])
]ENDCODE

<!-- <p>Associ� avec le fichier css suivant pour faire un cadre bleu avec
un fond blanc. Ce qui donnera les cadres que vous voyez actuellement.</p>
CODE .code {
     background-color:  #fff;
     border:            1px dotted #69c;
     margin:            10px 0 0 20px;
     padding:           0 1em;
     display:           block;
}
ENDCODE -->

<p>Modifions un peu le code m4x pour avoir une coloriation du
code. Par exemple, si nous souhaitons colorier en gras et bleu le mot
STRONG(BLEU(for)) quand nous �ditons du code C mais en gras et rouge
pour du STRONG(ROUGE(Java)).</p>

<p>D'abord d�finissons quelques macros d'aide. [CONCAT] permet de
concater deux chaines ensemble. [STRONG] permet de mettre en gras une
portion de texte, [COLOR_] permet de colorier une portion de code avec
la couleur pass�e en param�tre. Finallement [BLEU] et [ROUGE] deux
couleurs.</p>

CODE[define([CONCAT],[$1$2])
define([STRONG],[&lt;strong&gt;$1&lt;/strong&gt;])
define([COLOR_],[&lt;font color="$1"&gt;$2&lt;/font&gt;])
define([BLEU],[COLOR_(blue,$1)])
define([ROUGE],[COLOR_(red,$1)])
]ENDCODE

<p>Maintenant on peut modifer le code de [CODE] qui prend en
param�tre le nom du langage. [ENDCODE] est modifier pour oublier le
nom du langage (modification facultative):</p>
CODE[define([CODE],[define([CODE_],[$1])][&lt;div class="code"&gt;&lt;pre&gt;&lt;code&gt;])
define([ENDCODE],[&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;define([CODE_],)])
]ENDCODE

<p>Pour finir on va d�finir les macros pour colorier le mot clef for
  dans la bonne couleur.</p>
CODE[define([_FOR],[STRONG(for)])
define([C_FOR],[BLEU(_FOR)])
define([JAVA_FOR],[ROUGE(_FOR)])
define([FOR],[CONCAT(CODE_,[_FOR])])
]ENDCODE

<p>La premi�re ligne d�finie une couleur par defaut au mot for. La
deuxi�me ligne d�finie une couleur pour le langage C. La troisi�me
ligne d�finie une couleur pour le langage Java. Enfin, la derni�re
ligne affiche dans la bonne couleur le mot for. En effet lors de la
premi�re it�ration M4 va processer cette ligne et retourner
[CONCAT(C,_FOR)] puis la deuxi�me it�ration retourner [C_FOR] qui
donnera la bonne balise html.</p>

<p>Exemple :</p>
CODE[CODE(C) FOR i ENDCODE
CODE(JAVA) FOR i ENDCODE
CODE FOR i ENDCODE
]ENDCODE

define([JAVA_FOR],[ROUGE(_FOR)])dnl
<p>Va afficher sur un navigateur.</p>
CODE(C) FOR i ENDCODE
CODE(JAVA) FOR i ENDCODE
CODE FOR i ENDCODE

SUBSECTION(ICON_GEAR[]Squelette d'une page,squ)

<p>Se fait seulement en qautre �tapes ! Vous pouvez oublier votre
�diteur propri�taire de documents html et �conomiser votre argent.</p>

<p>La macro [divert] permet de retarder les r�sultats
d'interpr�tations du flux d'entr�e. Dans notre cas elle permet de
s�parer le flux dans des flux temporaires (permettant de trier les
donn�es) puis de coller les flux entre eux de la fa�on voulue
(r�organiser) en appellant [undivert]. A savoir que les lignes
comprises entre [divert(-1)] et [divert(0)] sont des commentaires.</p>

<p>STRONG(Etape 1:) On commence par donner des identifiants aux diff�rents flux :</p>
CODE[define([DIVERT_FOOTER_CODE],[42])
define([DIVERT_BODY_CODE],[43])
define([DIVERT_NAVIGATION_CODE],[44])
define([DIVERT_HEADER_CODE],[45])
]ENDCODE

<p>STRONG(Etape 2:) On construit le squelette de notre page web. La
mienne est constitu�e des �l�ments suivants (les couleurs sont
indiqu�es pour vous aider � les rep�rer sur la page que vous �tes
entrain de lire. En effet, notre html g�n�r� ne g�re pas la couleur,
c'est le r�le de la feuille de style, un fichier avec l'extension
css) :</p>

LISTE(En haut une banni�re bleue avec le titre (en blanc) de la page;,

En dessous le menu g�n�ral du site (orange) et son sous-menu (bleu);,

A gauche en bleu le panneau de navigation stockant des boites tel que le sommaire;,

Plusieurs boites comme le sommaire;,

Le corps de la page de couleur grise contenant le document;,

Enfin en bleu les fl�ches de navigation.)

<p>STRONG(Etape 3:) Voici le code m4x du squelette page web. On le
  place dans un fichier m4x car c'est lui qui va g�n�rer la page html
  et de fa�on identique � toutes les pages du site :</p>
CODE[define([END_BODY],[
divert
_HTML_HEADER_
&lt;table id="page"&gt;
  &lt;!-- SKELETON BEGIN HEADER --&gt;
  &lt;tr&gt;
    &lt;td colspan="2"&gt;
      &lt;div id="header1"&gt;
        &lt;!-- BEGIN USER HEADER 1 --&gt;
        _META_TITLE_
        &lt;!-- END USER HEADER 1 --&gt;
        &lt;/div&gt;
    &lt;/td&gt;
  &lt;/tr&gt;

  &lt;tr&gt;
    &lt;td colspan="2"&gt;
      _MENU_DU_HAUT_
    &lt;/td&gt;
  &lt;/tr&gt;

  &lt;tr&gt;
    &lt;td colspan="2"&gt;
      _SOUS_MENU_
    &lt;/td&gt;
  &lt;/tr&gt;
  &lt;!-- SKELETON END HEADER --&gt;

  &lt;!-- SKELETON BEGIN NAVIGATION MENU --&gt;
  &lt;tr&gt;
    &lt;td id="navigation"&gt;
        &lt;!-- BEGIN USER NAVIGATION MENU --&gt;
        undivert(DIVERT_NAVIGATION_CODE)
        &lt;!-- END USER NAVIGATION MENU --&gt;
    &lt;/td&gt;
    &lt;!-- SKELETON END NAVIGATION MENU --&gt;


    &lt;!-- SKELETON BEGIN BODY --&gt;
    &lt;td id="content"&gt;
        &lt;!-- BEGIN USER BODY --&gt;

        undivert(DIVERT_BODY_CODE)
        &lt;/div&gt;
        &lt;!-- END USER BODY --&gt;
    &lt;/td&gt;
  &lt;/tr&gt;
  &lt;!-- SKELETON END BODY --&gt;

  &lt;!-- SKELETON BEGIN FOOTER --&gt;
  &lt;tr&gt;
    &lt;td colspan="2" id="footer"&gt;
          &lt;!-- BEGIN USER FOOTER --&gt;
          undivert(DIVERT_FOOTER_CODE)
          FINALBOX($@)
          &lt;!-- END USER FOOTER --&gt;
    &lt;/td&gt;
  &lt;/tr&gt;
  &lt;!-- SKELETON END FOOTER --&gt;
&lt;/table&gt;
HTML_FOOTER
&lt;!-- EOF --&gt;])
]ENDCODE

<p>Si un jour je d�cide de changer la mise en page, il me suffit de
changer l'organistion de cette 50aine de lignes sans que cela implique
une refctorisation du texte &lt;p&gt;Bla bla&lt;/p&gt; de l'�tape
4.</p>

<p>STRONG(Etape 4:) Il ne reste plus qu'� �crire votr fichier m4 avec
son texte, ses images, bref tout le contenu importants � �crire et
qui ne sera plus noy� par vos balises html. Il reste n�amoins les
balises &lt;p&gt; impossibles � mettre sous forme de macros car cela
allourdirait le document.</p>

CODE[divert(DIVERT_HEADER_CODE)

DEF_TITLE(Le langage de macro M4)
DEF_KEYWORDS(M4 HTML)
DEF_DESCRIPTION(generation de pages html avec m4)
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Introduction,#intro),BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(G�n�ration d'un site en HTML avec le langage M4)

SUBSECTION(Introduction,intro)

&lt;p&gt;Bla bla&lt;/p&gt;

divert(DIVERT_FOOTER_CODE)

END_BODY(page1,description page 1,page2,description page 2)
]ENDCODE

<p>[_HTML_HEADER_ _META_TITLE_ DEF_KEYWORDS DEF_DESCRIPTION] vont
g�n�rer les balises meta par exemple indiquant que l'on utilise XHTML
1.0 strict, etc. Le genre de code p�nible � �crire mais �
copier/coller pour chaque page web. Donc leur code est � placer dans
le fichier m4x.</p>

<p>[_MENU_DU_HAUT_ _SOUS_MENU_ HTML_FOOTER] sont du code commun �
toutes les pages du site. Donc leur code est � placer dans le fichier
m4x.</p>

<p>[LEFT_MENU(LEFT_RUBRIC(Sommaire,Introduction,#intro),BANNIERES)] sont
construits pour pointer vers les sections et sous sections du
  document.</p>

<p>[END_BODY] (de l'�tape 3) quand il sera appel� va g�n�rer la page
  web gr�ce au syst�me de [divert] et [undivert].</p>


SUBSECTION(ICON_GEAR[]Conclusion,conclusion)

<p>Nous avons vu comment g�n�rer des pages html en �crivant quelques
macros et � l'execption des balises paragraphes &lt;p&gt; un fichier
m4 ne contient plus de code html. Nous avons pu nous abstraire du
langage cible. Par la m�me occasion il est possible d'�crire un
fichier latexgenerator.m4x et g�n�rer un fichier LaTeX au lieu de html
et ce � partir du m�me fichier m4.</p>

<p>Avantages de M4 pour la g�n�ration de pages HTML :</p>

LISTE(Les pages sont statiques : contrairement � PHP une seule fois
suffit pour g�n�rer la page html. Il n'y a pas besoin d'avoir de
serveur php. Donc ressources minimalistes., Le fichier m4 est tr�s
lisible et ne contient plus que le texte essentiel sans aucune
balise.,La maintenance est donc ais�e et rep�rer les modifications du
fichier avec un outil comme git devient donc simple.)

<p>Inconv�nients de M4 pour la g�n�ration de pages HTML :</p>

LISTE(Les pages sont statiques : contrairement � PHP, une fois
g�n�r�es leur contenu ne peut plus �tre modifi�. Mais on peut penser
qu'un serveur fasse tourner le macro-processeur M4 au lieu d'utiliser
PHP, modifie le contenu du fichier M4 et reg�n�re du HTML., M4 utilise
la macro [[divert]] pour placer les flux de donn�es o� l'on souhaite
dans un fichier mais ne permet pas de rediriger le flux dans plusieurs
fichiers (on a forc�ment une entr�e et une sortie)., La syntaxe M4
n'est pas simple et cr�er ses propres macros devient vite impossible �
relire.,Un mot du texte peut entrer en conflit avec par l'une des
macros provoquant soit son remplacement par un texte ind�sirable (ou
vide) soit en faisant un appel r�cursif soit en modifiant l'ordre des
param�tres. Par exemple [[LINK]] ou [[LISTE]] est une macro et on ne
peut plus l'utiliser dans un texte sans devoir leur ajouter des quotes
suppl�mentaires et le symbole virgule ne peut plus �tre utlis�
simplement � l'int�rieur d'une [[LISTE]] sans �tre quot�. Par
exemple[,] pour afficher dans le navigateur le mot [[LISTE]] depuis
une macro [[LISTE]] (ce qui est le cas ici)[,] je dois l'�crire
&#91;&#91;[[LISTE]]&#93;&#93; dans le fichier m4 sinon il sera
interpr�t�.)

<p>Pour finir sur le ton de la blague et de la rigeur non scientifique
que M4 peut �tre vu comme une sorte de syst�me de
EXTLINK(https://fr.wikipedia.org/wiki/Vases_communicants,vases
communicants) : on constatera que plus les fichiers m4 seront clairs,
propres, minimalistes, plus les fichiers m4x seront gros, touffus et
devenant incompr�hensibles.</p>

divert(DIVERT_FOOTER_CODE)

END_BODY(,)

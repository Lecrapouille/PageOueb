dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Le langage de macro M4)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Contexte,#contexte),BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(G�n�ration d'un site en HTML avec le langage M4)

SUBSECTION(ICON_READ[]Pr�sentation,intro)

<p>Dans ce document, j'explique comment fonctionne mon outil de
g�n�ration de pages HTML pour aider � g�n�rer de petits sites
internet. L'outil fonctionne gr�ce au langage de macro-procession
LINKM4. Les pages de mon site (et donc la page ques vous �tes entrain
de lire :) ont �t� g�n�r�es � partir de cet outil.</p>

<p>Je tiens � pr�ciser que la programmation de sites web n'a jamais
�t� une passion chez moi, pour les raisons suivantes :</p>

LISTE(

je trouve que l'�dition manuelle de page HTML devient vite illisible :
le texte � �crire �tant noy� dans une couche de balises verbeuses et
noy� une deuxi�me fois par la syntaxe des accents. Comme preuve
concr�te regardez le contenu HTML de ma page d'MYLINK(index,acceuil)
(touche Controle et touche U sous Firefox) et comparez la avec son
LINK(https://github.com/Lecrapouille/PageOueb/blob/master/src/fr/index-fr.m4,code
en M4);,

il y a longtemps[,] j'avais test� des outils de cr�ation de sites web :
c'�tait amusant mais la page devenait tr�s vite trop lourde � d�buger;,

l'incompatibilit� des navigateurs � afficher correctement la m�me page
web[,] Internet Explorer �tant le premier � ne jamais respecter la
norme;,

je n'�tais pas particuli�rement int�r�ss� par l'apprentissage du
langage PHP et les derni�res technologies web g�n�rent[,] certes de
beaux sites[,] mais n'ont �t� cr��s[,] � mon avis[,] que pour g�n�rer
des sites
EXTLINK(https://fr.wikipedia.org/wiki/Pi%C3%A8ge_%C3%A0_clics,p... �
clics) : leur absence de contenu ne brillant que par leur quantit� de
pubs mais ceci est un autre d�bat et pour plus de renseignement vous
pouvez consultez cette vid�o :
EXTLINK(https://youtu.be/81rTkCGTM4Y?list=PLyIecIQvrWsGJ8_ZkrRxKYu1eEr7G3bxI,UnDropDansLaMare
S03 E01: Internet en 2025).,

Les gestionnaires de pages wiki et de blogs sont lourds � mettre en
place: n�cessitant de mettre en place de nombreux scripts php[,] des
bases de donn�es SQL[,] de g�rer des administrateurs[,] des mots de
passes. Par cons�quents pouvant offrir autant de failles de s�curit�.)

<p>Par cons�quent j'ai d�cid� de d�velopper un petit outil d'aide � la
  g�n�ration de pages HTML. L'id�e d'utiliser M4 vient de :</p>

LISTE( avoir toujours �crit mes documents en LaTeX et jamais avec
l'�diteur Word. LaTeX est un langage pour g�n�rer des documents texte
en PDF de qualit� professionelle. C'est un langage proche de HTML mais
sa philosophie est : "occupez vous du contenu de votre document[,] je
m'occupe pour vous de sa mise en page". J'ai voulu me raproch� de
cette id�e : me contenter d'�crire uniquement le texte et de laisser
mon outil g�n�rer le code HTML.,

la lecture d'un article sur le journal Linux Magazine traitant de ce
sujet (j'ai oubli� le num�ro).,

mon stage o� j'ai appris le langage M4.)

SUBSECTION(ICON_DOWNLOAD[]T�l�chargement,download)

<p>Le code source du g�n�rateur qui a fait ce site est disponible sur
GITHUB(Lecrapouille/PageOueb,GitHub).</p>

SUBSECTION(ICON_GEAR[]Au coeur de M4,heart)

<p>Ce langage est utilis� en g�n�ral pour la cr�ation des makefiles
Unix et est fourni avec les autotools. C'est un langage de
macro-procession : le macro-processeur lit un fl�t de texte, cherche
des chaines de charact�res qu'on lui aura auparavant sp�cifi�es et les
remplace par d'autres chaines de charact�res �galement sp�cifi�es. Il
va it�rer un certain nombre de fois jusqu'� ce qu'il n'y ait plus
chaines � remplacer.</p>

<p>Le pr�processeur de GCC est aussi un macro-processeur : il va
parser les #define et autres #ifdef dans un code en C avant d'attaquer
la compilation des fichiers.</p>

<p>Pour la suite de ce document, je propose une convention non
officielle. J'aime bien utiliser l'extension fichier m4x quand il
s'agit d'un fichier o� l'on va stocker ses macros (x pour ex�cutable,
par exemple webgenerator.m4x). Par contre, quand il s'agit d'un
fichier m4 que l'on va macro-processer pour obtenir un fichier html je
pr�f�re garder l'extension m4 (par exemple mapage.m4).</p>

<p>Les deux macros suivantes � �crire dans le fichier
  webgenerator.m4x. La premi�re prend aucun param�tre alors que la
  deuxi�me prend un param�tre :</p>
CODE
[define([ARROW_HOME],[&lt;img class="icone5" src="img/home.png" alt="home"/&gt;])]
[define([STRONG],[&lt;strong&gt;$1&lt;/strong&gt;])]
ENDCODE

<p>En parsant le fichier mapage.m4 :</p>
CODE
Voici une image de maison [ARROW_HOME] et ceci un [STRONG(un texte en gras)].
ENDCODE

<p>Va g�n�rer le code html suivant :<p>
CODE
Voici une image de maison &lt;img class="icone5" src="img/home.png" alt="home"/&gt;
et ceci un &lt;strong&gt;texte en gras&lt;/strong&gt;.
ENDCODE

<p>Et qui donnera le rendu suivant dans un navigateur : ARROW_HOME et
STRONG(un texte en gras).</p>

<p>Nous avons vu par ce simple exemple la puissance potentielle de cet
outil surtout si cette balise doit �tre appel�e plusieurs fois dans
une page html et que l'on veuille mettre � jour la page, il suffira
simplement de modifier le ficher m4x. Voici comment appeller l'outil
dans un terminal de Linux (l'id�al �tant d'�crire une r�gle dans un
fichier Makefile) :</p>
CODE
m4 webgenerator.m4x autrefichier.m4x mapage.m4 > mapage.html
ENDCODE

<p>Nous allons montrer tout au long de ce document d'autres macros
encore plus puissantes.</p>

SUBSECTION(ICON_GEAR[]Simplification des liens,liens)

<p>Si la balise html &lt;a&gt; est trop complexe pour vous, alors cette
  macro conditionnelle reprenant l'id�e de la syntaxe markdown (wiki) peut vous �tre utile :</p>
CODE
[define([LINK],[ifelse([$2],,[&lt;a href="$1"&gt;$1&lt;/a&gt;],[&lt;a href="$1"&gt;$2&lt;/a&gt;])])]

Exemple 1 : [LINK(https://www.google.fr,google)]
Exemple 2 : [LINK(https://www.google.fr)]
ENDCODE

<p>[ifelse] est un if-then-else testant la valeur du deuxi�me
param�tre et faisant une action diff�rente selon sa valeur: si le
deuxi�me param�tre n'est pas donn� (donc non d�fini) alors l'url sera
affich�e LINK(https://www.google.fr) sinon c'est le nom court qui sera
affich� LINK(https://www.google.fr,google).</p>

<p>Voici d'autres macros de m�me famille. La premi�re macro permet de
faire des liens vers des pages du m�me site en prenant en compte
automatiquement la langue et sans qu'on la pr�cise (nous verrons que
[LANG] est une macro qui vaut LANG sur cette page). La deuxi�me macro
permet d'afficher un petit logo <img src="img/externallink.jpg"/>
apres le nom de l'url :</p>

CODE
[define([MYLINK],[ifelse([$2],,[&lt;a href="$1-LANG.html"&gt;$1&lt;/a&gt;],[&lt;a href="$1-LANG.html"&gt;$2&lt;/a&gt;])])]

[define([EXTLINK],[&lt;a href="$1" target="_blank"&gt;ifelse([$2],,[$1],[$2])dnl
&lt;img src="img/externallink.jpg" alt="ext link" border="0"/&gt;&lt;/a&gt;])]
ENDCODE

<p>[dnl] est une macro qui permet d'ajouter des commentaires. Ici, la
commande �tant trop grande, elle est scind�e. [dnl] permet d'ignorer
les caract�res comme le retour chariot qui seraient ins�r�s dans le
code html. Cela rend laid le code m4x mais ce mal est parfois
n�c�ssaire. On notera que les espaces sont importants et peuvent �tre
pris en compte dans la sortie. L� encore, ne pas mettre d'espace entre
les s�parateurs de param�tres permet de s�curiser le code g�n�r� de
caract�re d'espace ind�sirables au d�triment de la lisibilit�.</p>

SUBSECTION(ICON_GEAR[]Changer de langues,lan)

<p>Une des probl�matiques sur les pages est la gestion des
langues. Pour chaque page dans une langue une page dans une autre
langue doit lui �tre li�e. Voici une solution possible (mais pas tr�s
esth�tique).</p>

<p>Dans le fichier m4x :</p>
CODE
[define([RAP_FR],[&lt;img src="img/fr.png" alt="fr"/&gt;])]
[define([RAP_EN],[&lt;img src="img/en.png" alt="en"/&gt;])]

[ifdef([LANG],,[define([LANG],[fr])])]

[define([CHANGE_LANG],[&lt;p&gt;dnl
ifelse(LANG,fr,[DRAP_FR LINK(THISFILE-en.html,DRAP_EN)],dnl
[LINK(THISFILE-fr.html,DRAP_FR) DRAP_EN])&lt;/p&gt;])]
ENDCODE

<p>Les deux premi�res lignes permettent de dessiner un drapeau en
fran�ais et un drapeau en anglais. La troisi�me ligne teste si la
macro [LANG] est d�finie ou non et dans le cas o� elle est ind�finie
on lui force la valeur arbitraire fr. La derni�re ligne permet de
g�n�rer un lien vers la page dans l'autre langue (fran�ais vers
anglais ou bien anglais vers fran�ais).</p>

A compiler avec :
CODE
m4 webgenerator.m4x -DTHISFILE=mapage -DLANG=fr autrefichier.m4x mapage-fr.m4 > mapage-fr.html
ENDCODE

SUBSECTION(ICON_GEAR[]Section,sect)

SUBSECTION(ICON_GEAR[]Squelette d'une page,squ)

<p>Se fait en trois �tapes max !</p>

<p>La macro [divert] permet de s�parer le flux dans des flux
temporaires (permettant de trier les donn�es) puis de coller les flux
entre eux de la fa�on voulue (r�organiser) en appellant
[undivert].</p>

<p>STRONG(Etape 1:) On commence par donner des identifiants aux diff�rents flux :</p>
CODE
[define([DIVERT_FOOTER_CODE],[42])
define([DIVERT_BODY_CODE],[43])
define([DIVERT_NAVIGATION_CODE],[44])
define([DIVERT_HEADER_CODE],[45])]
ENDCODE

<p>STRONG(Etape 2:) On construit le squelette de notre page web. La mienne est la
suivante (les couleurs sont indiqu�es pour vous aider � les rep�rer,
le html ne g�re pas la couleur, c'est le r�le de la feuille de style,
fichier avec l'extension css) :</p>

LISTE(en haut une banni�re bleue et le titre (en blanc);,

En dessous le menu g�n�ral du site (orange) et son sous-menu (bleu);,

A gauche en bleu le panneau de navigation stockant des boites tel que le sommaire;,

Les boites tel que le sommaire;,

Le corps de la page de couleur grise contenant le document;,

Enfin en bleu les fl�ches de navigation.)

<p>STRONG(Etape 3:) Voici le code m4x de la page web :</p>
CODE
[define([END_BODY],[
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
      MENU_DU_HAUT
    &lt;/td&gt;
  &lt;/tr&gt;

  &lt;tr&gt;
    &lt;td colspan="2"&gt;
      _SSMENU_
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
&lt;!-- EOF --&gt;])]
ENDCODE

<p>Si un jour je d�cide de changer la mise en page, il me suffit de
changer l'organistion de cette 50aine de lignes sans que cela impacte
le contenu du texte &lt;p&gt;Bla bla&lt;/p&gt;.</p>

<p>Voici finalement un extrait du code m4 de la page :</p>
CODE
[divert(DIVERT_HEADER_CODE)

DEF_TITLE(Le langage de macro M4)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Contexte,#contexte),BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(G�n�ration d'un site en HTML avec le langage M4)

SUBSECTION(ICON_READ[]Pr�sentation,intro)

&lt;p&gt;Bla bla&lt;/p&gt;

divert(DIVERT_FOOTER_CODE)

END_BODY(speedway,Le projet SpeedWay,simtadyn,Le projet SimTaDyn)]
ENDCODE


SUBSECTION(ICON_GEAR[]Avantages et inconv�nients,avan)

<p>Avantages :</p>
LISTE(Les pages sont statiques : contrairement � php, une seule fois
suffit pour g�n�rer la page html. Il n'y a pas besoin d'avoir de
serveur php. Donc ressources minimalistes).

<p>Inconv�nients :</p>

LISTE(Les pages sont statiques : contrairement � PHP, une fois
g�n�r�es leur contenu ne peut plus �tre modifi�. Mais on peut penser
qu'un serveur fasse tourner le macro-processeur M4 au lieu d'utiliser
PHP, modifie le contenu du fichier M4 et reg�n�re du HTML.,
M4 utilise la macro [divert] pour placer les flux de donn�es o� l'on
souhaite dans un fichier mais ne permet pas de rediriger le flux dans
plusieurs fichiers.,
La syntaxe M4 n'est pas simple et cr�er ses propres macros devient vite
impossible � relire)


divert(DIVERT_FOOTER_CODE)

END_BODY(,)

bonjour,

normalement il n'y a rien a modifier dans le code
or ,il faut en premier créer la base de donnée, je fournis donc le fichier de création de base (de mon livrable 1)
si erreur de connection a la base (?)
ouvrir le fichier serveur.py et modifier les lignes de configuration mysql

merci!

/!\ ATTENTION
j'ai remarqué que le package cryptography de pymysql n'est pas utilisé et nécessite donc de s'etre connecté a phpmyadmin/SGBDR au préalable
si vous avez une erreur disant que le package cryptography est manquant, démarrez votre SGBDR (wampserveur,phpmyadmin,etc...)
et relancez le serveur



contenu de l'archive:
-serveur.py
mon serveur cherrypy,a démarrer ,bien evidemment

-html/
dossier qui regroupe les pages statiques, a savoir la page index.html,page de présentation

-static/
dossier regroupant:
- les fichiers images (static/assets/...)

- les fichiers css (static/css/)

- les fichiers js (static/js/)

-templates/
dossier regroupant les templates qui seront gérés par MAKO


le fichier create_base, qui permet de créer la base 
le fichier csvimport qui permet d'importer des données via CSV




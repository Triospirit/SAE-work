import pymysql
from mako.template import Template
import os
import cherrypy

# Obtenir le chemin absolu du répertoire statique
current_dir = os.path.dirname(os.path.abspath(__file__))
static_dir = os.path.join(current_dir, 'static')

# Configuration de la connexion à la base de données MySQL
db_config = {
    'user': 'admin',
    'password': 'admin',
    'host': 'localhost',
    'database': 'bd_tir',
}

def get_informations_armes():
    conn = pymysql.connect(**db_config)

    try:
        with conn.cursor(pymysql.cursors.DictCursor) as cursor:
            # Requête SQL pour récupérer les informations relatives aux armes
            sql = "SELECT * FROM arme"
            cursor.execute(sql)
            result = cursor.fetchall()
        return result

    finally:
        conn.close()

def get_informations_competitions():
    conn = pymysql.connect(**db_config)
    
    try:
        with conn.cursor(pymysql.cursors.DictCursor) as cursor:
            # Requête SQL pour récupérer les informations relatives aux compétitions
            sql = "SELECT nom, lieu, date FROM competition"
            cursor.execute(sql)
            result = cursor.fetchall()
        
        return result
    
    finally:
        conn.close()

def get_informations_score(): #a finir
    conn = pymysql.connect(**db_config)
    
    try:
        with conn.cursor(pymysql.cursors.DictCursor) as cursor:
            # Requête SQL pour récupérer les informations relatives aux compétitions
            sql = "SELECT competiteur_num, competition_nom, score FROM score"
            cursor.execute(sql)
            result = cursor.fetchall()
        
        return result
    
    finally:
        conn.close()

class MyApp:
    @cherrypy.expose
    def index(self):
        with open(os.path.join(current_dir, 'html/index.html'), 'r') as file:
            return file.read()

    @cherrypy.expose
    def competiteurs(self):
        with open(os.path.join(current_dir, 'templates/competiteurs.mako'), 'r') as file:
            return file.read()

    @cherrypy.expose
    def competitions(self):
        with open(os.path.join(current_dir, 'templates/competitions.mako'), 'r') as file:
            return file.read()

    @cherrypy.expose
    def save_data(self, **kwargs):
        try:
            # Récupérer les données du formulaire
            nom = kwargs.get('nom')
            prenom = kwargs.get('prenom')
            dnaiss = kwargs.get('dnaiss')
            nFFT = kwargs.get('nFFT')
            categorie = kwargs.get('categorie')
            possesseurarme = kwargs.get('possesseurarme')
            nclub = kwargs.get('nclub')
            adresse = kwargs.get('adresse')

            # Connexion à la base de données MySQL
            conn = pymysql.connect(**db_config)
            cursor = conn.cursor()

            # Requête d'insertion des données
            sql = "INSERT INTO competiteur (nom, prenom, date_naissance, nFFT, categorie, possesseur_arme, nclub, adresse) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
            values = (nom, prenom, dnaiss, nFFT, categorie, possesseurarme, nclub, adresse)
            cursor.execute(sql, values)

            # Valider les modifications dans la base de données
            conn.commit()

            # Fermer la connexion
            cursor.close()
            conn.close()

            return "Données insérées avec succès, vous pouvez revenir en arrière et fermer le popup!"
        except pymysql.Error as error:
            return f"Erreur lors de l'insertion des données : {error}"
        
    @cherrypy.expose
    def inscr_comp(self, **kwargs):  #nomcompet, lieu, datecomp, categorie, epreuve, prix_inscription, descriptif, unprix
        try:
            # Récupérer les données du formulaire
            nomcompet = kwargs.get('nomcompet')
            lieu = kwargs.get('lieu')
            datecomp = kwargs.get('datecomp')
            categorie = kwargs.get('categorie')
            epreuve = kwargs.get('epreuve')
            prix_inscription = kwargs.get('prix_inscription')
            descriptif = kwargs.get('descriptif')
            unprix = kwargs.get('unprix')

            # Connexion à la base de données MySQL
            conn = pymysql.connect(**db_config)
            cursor = conn.cursor()

            # Requête d'insertion des données
            sql = "INSERT INTO competition (nom, lieu, date, categorie, epreuve, prix_inscription, descriptif, 1_prix) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
            values = (nomcompet, lieu, datecomp, categorie, epreuve, prix_inscription, descriptif, unprix)
            cursor.execute(sql, values)

            # Valider les modifications dans la base de données
            conn.commit()

            # Fermer la connexion
            cursor.close()
            conn.close()

            return "Données insérées avec succès, vous pouvez revenir en arrière et fermer le popup!"
        except pymysql.Error as error:
            return f"Erreur lors de l'insertion des données : {error}"
        

    @cherrypy.expose
    def desinscription_competiteur(self, **kwargs):
        try:
            # Récupérer les données du formulaire
            nFFT = kwargs.get('nFFT')
            nom = kwargs.get('nom')
            # Connexion à la base de données MySQL
            conn = pymysql.connect(**db_config)
            cursor = conn.cursor()

            # Requête de suppression des données
            sql = "DELETE FROM competiteur WHERE `competiteur`.`nFFT` = %s AND `competiteur`.`nom` = %s"
            values = (nFFT,nom)
            cursor.execute(sql, values)
            print(values) #debug
            
            # Valider les modifications dans la base de données
            conn.commit()

            # Fermer la connexion
            cursor.close()
            conn.close()

            return "Données supprimées avec succès, vous pouvez revenir en arrière et fermer le popup!"
        except pymysql.Error as error:
            return f"Erreur lors de la suppression des données : {error}"
        

    @cherrypy.expose
    def update_competiteur(self, **kwargs): #mise a jour des données d'un competiteur
        try:
            # Récupérer les données du formulaire
            nom = kwargs.get('nom')
            prenom = kwargs.get('prenom')
            dnaiss = kwargs.get('dnaiss')
            categorie = kwargs.get('categorie')
            possesseurarme = kwargs.get('possesseurarme')
            nclub = kwargs.get('nclub')
            adresse = kwargs.get('adresse')
            nFFT = kwargs.get('nFFT')        #pour des raisons de securité le numéro FFT ne peut etre changé
            # Connexion à la base de données MySQL
            conn = pymysql.connect(**db_config)
            cursor = conn.cursor()

            # Requête de suppression des données
            sql = "UPDATE `competiteur` SET `nom` = %s, `prenom` = %s, `date_naissance` = %s, `categorie` = %s, `possesseur_arme` = %s, `nclub` = %s, `adresse` = %s WHERE `competiteur`.`nFFT` = %s"
            values = (nom, prenom, dnaiss, categorie, possesseurarme, nclub, adresse, nFFT)
            cursor.execute(sql, values)
            print(values) #debug
            
            # Valider les modifications dans la base de données
            conn.commit()

            # Fermer la connexion
            cursor.close()
            conn.close()

            return "Données supprimées avec succès, vous pouvez revenir en arrière et fermer le popup!"
        except pymysql.Error as error:
            return f"Erreur lors de la suppression des données : {error}"
        

    @cherrypy.expose
    def update_competition(self, **kwargs): #mise a jour des données d'un competiteur
        try:
            # Récupérer les données du formulaire
            lieu = kwargs.get('lieu')
            categorie = kwargs.get('categorie')
            epreuve = kwargs.get('epreuve')
            descr = kwargs.get('description')
            prix_inscription = kwargs.get('prix_inscription')
            descriptif = kwargs.get('descriptif')
            unprix = kwargs.get('unprix')
            nom = kwargs.get('nom')
            date = kwargs.get('date')
            # Connexion à la base de données MySQL
            conn = pymysql.connect(**db_config)
            cursor = conn.cursor()

            # Requête de suppression des données
            sql = "UPDATE `competition` SET `lieu` = %s,  `categorie` = %s, `epreuve` = %s, `descriptif` = %s, `prix_inscription` = %s, `1_prix` = %s WHERE `competition`.`nom` = %s and `competition`.`date` = %s"
            values = (lieu,categorie,epreuve,prix_inscription,descriptif,unprix,nom,date)
            cursor.execute(sql, values)
            print(values) #debug
            
            # Valider les modifications dans la base de données
            conn.commit()

            # Fermer la connexion
            cursor.close()
            conn.close()

            return "Données supprimées avec succès, vous pouvez revenir en arrière et fermer le popup!"
        except pymysql.Error as error:
            return f"Erreur lors de la suppression des données : {error}"



    

    @cherrypy.expose
    def suppr_comp(self, **kwargs):  #nomcompet, lieu, datecomp, categorie, epreuve, prix_inscription, descriptif, unprix
        try:
            # Récupérer les données du formulaire
            nomcompet = kwargs.get('nomcompet')
            datecomp = kwargs.get('datecomp')

            # Connexion à la base de données MySQL
            conn = pymysql.connect(**db_config)
            cursor = conn.cursor()

            # Requête d'insertion des données
            sql = "DELETE FROM competition WHERE `competition`.`nom` = %s AND `competition`.`date` = %s"
            values = (nomcompet, datecomp)
            cursor.execute(sql, values)

            # Valider les modifications dans la base de données
            conn.commit()

            # Fermer la connexion
            cursor.close()
            conn.close()

            return "Données supprimées avec succès, vous pouvez revenir en arrière et fermer le popup!"
        except pymysql.Error as error:
            return f"Erreur lors de la suppression des données : {error}"
        

    @cherrypy.expose
    def get_upcoming_competitions(self):
        # Récupérer les informations sur les compétitions à venir depuis votre base de données
        upcoming_competitions = get_informations_competitions()

        # Utilisation de Mako pour générer le contenu du popup
        template = Template(filename=os.path.join(current_dir, 'templates/competitions.mako'))
        content = template.render(competitions=upcoming_competitions)

        # Renvoyer le contenu généré
        return content
        
    
    # @cherrypy.expose
    # def get_score(self):
    #     # Récupérer les informations sur les compétitions à venir depuis votre base de données
    #     scores = get_informations_score()

    #     # Utilisation de Mako pour générer le contenu du popup
    #     template = Template(filename=os.path.join(current_dir, 'templates/competitions.mako'))
    #     content = template.render(scores=get_informations_score)

    #     # Renvoyer le contenu généré
    #     return content    

    @cherrypy.expose
    def competiteurs(self):
        # Récupérer les informations depuis la base de données
        informations = get_informations_competitions()

        # Charger le template Mako
        template = Template(filename=os.path.join(current_dir, 'templates/competiteurs.mako'))

        # Rendre le template avec les données récupérées
        rendered_template = template.render(informations=informations, css=cherrypy.url('/static/css/styles.css'))
        print('test')
        return rendered_template
    
    @cherrypy.expose
    def competitions(self):
        # Récupérer les informations depuis la base de données
        scores = get_informations_score()

        # Charger le template Mako
        template = Template(filename=os.path.join(current_dir, 'templates/competitions.mako'))

        # Rendre le template avec les données récupérées
        rendered_template = template.render(scores=scores, css=cherrypy.url('/static/css/styles.css'))
        print('test')
        return rendered_template
        

class MonServeur(object):

    @cherrypy.expose
    def index(self):
        # Récupérer les informations depuis la base de données
        informations = get_informations_armes()
        # Charger le template Mako
        template = Template(filename=os.path.join(current_dir, 'templates/store.mako'))

        # Rendre le template avec les données récupérées
        rendered_template = template.render(informations=informations, css=cherrypy.url('/static/css/styles.css'))

        return rendered_template

    @cherrypy.expose
    def store(self):
        # Charger le template Mako
        template = Template(filename=os.path.join(current_dir, 'templates/store.mako'))

        # Rendre le template
        rendered_template = template.render()

        return rendered_template

    
    


if __name__ == '__main__':
    app_dir = os.path.dirname(os.path.abspath(__file__))

    cherrypy.config.update({'log.screen': True})
    cherrypy.tree.mount(MonServeur(), '/store', config={            #config différente car je souhaitais séparer la partie store du reste
        '/static': {
            'tools.staticdir.on': True,
            'tools.staticdir.dir': os.path.join(app_dir, 'static'),
        },
    })


    cherrypy.tree.mount(MyApp(), '/', config={
        '/inscr_comp': {'tools.response_headers.on': True,
            'tools.response_headers.headers': [('Content-Type', 'text/plain')]},
        '/suppr_comp': {'tools.response_headers.on': True,
            'tools.response_headers.headers': [('Content-Type', 'text/plain')]},
        '/static': {
            'tools.staticdir.on': True,
            'tools.staticdir.dir': os.path.join(app_dir, 'static'),
        },
        # '/competitions.mako': {
        #     'tools.staticfile.on': True,
        #     'tools.staticfile.filename': os.path.join(app_dir, 'templates/competitions.mako'),
        # },
        '/css/styles.css': {
            'tools.staticfile.on': True,
            'tools.staticfile.filename': os.path.join(app_dir, 'static/css/styles.css'),
        },
        '/css/popupstyle.css': {
            'tools.staticfile.on': True,
            'tools.staticfile.filename': os.path.join(app_dir, 'static/css/popupstyle.css'),
        },
        '/js/bootstrapbundle.js': {
            'tools.staticfile.on': True,
            'tools.staticfile.filename': os.path.join(app_dir, 'static/js/bootstrapbundle.js'),
        },
        '/js/scripts.js': {
            'tools.staticfile.on': True,
            'tools.staticfile.filename': os.path.join(app_dir, 'static/js/scripts.js'),
        },
        '/assets/img/ipad.png': {
            'tools.staticfile.on': True,
            'tools.staticfile.filename': os.path.join(app_dir, 'static/assets/img/ipad.png'),
        },
        '/assets/img/demo-image-01.jpg': {
            'tools.staticfile.on': True,
            'tools.staticfile.filename': os.path.join(app_dir, 'static/assets/img/demo-image-01.jpg'),
        },
        '/assets/img/bg-masthead.jpg': {
            'tools.staticfile.on': True,
            'tools.staticfile.filename': os.path.join(app_dir, 'static/assets/img/bg-masthead.jpg'),
        }
    })

    cherrypy.engine.start()
    cherrypy.engine.block()
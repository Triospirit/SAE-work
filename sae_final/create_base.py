import pymysql
import time

# Connexion à la base de données MySQL
connection = pymysql.connect(
    host='localhost',
    user='admin',
    password='admin',
    db='MySQL'
)

try:
    with connection.cursor() as cursor:
        cursor.execute('CREATE DATABASE IF NOT EXISTS bd_tir')
        cursor.execute("USE bd_tir")
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS arme (
            num_identification INT NOT NULL,
            nom_arme TEXT NOT NULL,
            calibre TEXT NOT NULL,
            marque TEXT NOT NULL,
            etat ENUM('neuf', 'occasion') NOT NULL,
            prix FLOAT NOT NULL,
            classe ENUM('A', 'B', 'C', 'D') NOT NULL,
            type ENUM('longue', 'courte') NOT NULL,
            PRIMARY KEY (num_identification)
        )
    """)
        cursor.execute("""
        INSERT INTO arme (num_identification, nom_arme, calibre, marque, etat, prix, classe, type)
        VALUES
            (000, 'test_data', '0x0', 'test_data', 'neuf', 0, 'A', 'courte')
    """)
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS competiteur (
            nom TEXT NOT NULL,
            prenom TEXT NOT NULL,
            date_naissance DATE NOT NULL,
            nFFT INT NOT NULL,
            categorie ENUM('enfant', 'adulte') NOT NULL,
            possesseur_arme ENUM('oui', 'non') NOT NULL,
            nclub INT NOT NULL,
            adresse TEXT NOT NULL,
            PRIMARY KEY (nFFT)
        )
    """)
        cursor.execute("""
        INSERT INTO competiteur (nom, prenom, date_naissance, nFFT, categorie, possesseur_arme, nclub, adresse)
        VALUES
            ('test_data', 'test_data', '0000-00-00', 00, 'adulte', '0', 0000, 'test_data')
    """)
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS competition (
            nom TEXT NOT NULL,
            lieu TEXT NOT NULL,
            date DATE NOT NULL,
            categorie ENUM('arme longues', 'arme courtes') NOT NULL,
            epreuve ENUM('precision', 'rapidite') NOT NULL,
            prix_inscription FLOAT NOT NULL,
            descriptif TEXT NOT NULL,
            1_prix TEXT NOT NULL,
            PRIMARY KEY (date, categorie, epreuve)
        )
    """)
        cursor.execute("""
        INSERT INTO competition (nom, lieu, date, categorie, epreuve, prix_inscription, descriptif, 1_prix)
        VALUES
            ('test_data', 'test_data', '0000-00-00', 'arme longues', 'precision', 0 , 'test_data', 'test_data')
    """)
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS `score` (
                `competiteur_num` int NOT NULL,
                `competition_nom` VARCHAR(69) NOT NULL,
                `score` int NOT NULL,
                PRIMARY KEY (`competiteur_num`,`competition_nom`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
        """)
        cursor.execute("""
        INSERT INTO score (competiteur_num, competition_nom, score)
        VALUES
            (00, 'test_data', 0)
    """)
    connection.commit()
    print('La base de données a été créée avec succès.')
except Exception as e:
    print(f'Erreur lors de la création de la base de données : {e}')

##time.sleep(15) #debug

# Fermeture de la connexion
connection.close

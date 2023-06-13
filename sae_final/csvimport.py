import csv
import pymysql

try:
    filename = input("Nom du fichier .csv : ")
    connection = pymysql.connect(
        host='localhost',
        user='admin',
        password='admin',
        database='bd_tir'
    )

    cursor = connection.cursor()
    with open(filename, 'r') as f:
        reader = csv.reader(f)
        for row in reader:
            table_name = row[0]
            data = tuple(row[1:])
            placeholders = ', '.join(['%s'] * len(data))
            insert_query = f"INSERT INTO {table_name} VALUES ({placeholders})"
            cursor.execute(insert_query, data)
            connection.commit()

    print(f"Données importées avec succès depuis le fichier {filename} dans la base de données.")
except FileNotFoundError:
    print(f"Aucun fichier nommé {filename} n'a été trouvé dans le répertoire de ce script. Assurez-vous que le fichier {filename} se trouve dans le même répertoire que ce script.")
except Exception as e:
    print(f"Erreur lors de l'importation des données depuis le fichier {filename} : {e}")




##filename = str(input("nom du fichier .csv :"))
##try:
##    import csv
##    import pymysql
##    connection = pymysql.connect(
##    host=localhost,
##    user=admin,
##    password=admin,
##    database=bd_tir
##    )
##    cursor = connection.cursor()
##    with open(filename, 'r') as f:
##        reader = csv.reader(f)
##        for row in reader:
##            table_name = row[0]
##            data = tuple(row[1:])
##            placeholders = ', '.join(['%s'] * len(data))
##            insert_query = f"INSERT INTO {table_name} VALUES ({placeholders})"
##            cursor.execute(insert_query, data)
##            connection.commit()
##    print(f"Données importées avec succès depuis le fichier {filename} dans la base de données")
##except FileNotFoundError:
##    print(f"Aucun fichier nommé {filename} n'a été trouvé dans le répertoire de ce script. Assurez-vous que le fichier {filename} se trouve dans le même répertoire que ce script.")
##except Exception as e:
##    print(f"Erreur lors de l'importation des données depuis le fichier {filename}: {e}")

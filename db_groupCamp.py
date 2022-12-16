import mysql.connector as mysql
from dataclasses import dataclass

db_config = {
    'host' : 'localhost',
    'user' : 'root',
    'password' : 'r00t_bd2',
    'database' : 'bd2_examenfinal'
}

@dataclass
class Usager:
  id: int = 0
  nom_usager: str = ""
  texte_apropos: str = ""
    

def SelectionUsager(nomUsager: str) -> Usager:
    usager = Usager()
    try:
        connection = mysql.connect(**db_config)
        cursor = connection.cursor()
        query = "select id, nom_usager, texte_apropos from usager where nom_usager = %(nom_usager)s;"

        
        cursor.execute(query, { 'nom_usager' : nomUsager })

        result = cursor.fetchone()

        if result:
            usager = Usager(result[0], result[1], result[2])

    except mysql.Error as erreur:
        print(erreur)
    finally:
        cursor.close()
        connection.close()

    return usager
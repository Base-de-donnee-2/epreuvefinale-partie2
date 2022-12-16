import os
from db_groupCamp import *

def cls():
    """
    Permet d'effacer la console
    """
    os.system('cls' if os.name=='nt' else 'clear')

def AfficherTitre(texte: str):
    """
    Affiche un texte encadré par des caractères *
    Arguments:
        texte: le texte à afficher (string)
    """
    titre = '=  {}  ='.format(texte)
    ligne = '=' * len(titre)
    print(ligne + '\n' + titre + '\n' + ligne + '\n')

def ConnexionUsager() -> Usager:
    """
    Demande un nom d'usager et boucle tant que le nom n'est pas valide
    Returns:
        Un dataclass Usager
    """
    while True:
        cls()
        AfficherTitre('Connexion à GroupCamp')
        
        nomUsager = input("Veuillez entrez votre nom d'usager (ctrl+c pour quitter) : ")
        usager = SelectionUsager(nomUsager)
        if(usager.id > 0):
            cls()
            return usager
        else:
            print("Le nom d'usager est invalide")

def AfficherCollection():
    # Complétez cette partie
    print('Afficher une collection')

def AjouterUnAlbum():
    # Complétez cette partie
    print('Ajouter un album')

def OptionMenu(usager: Usager) -> int:
    AfficherTitre('Page de profil')
    texteMenu = """{0} : {1}

Que voulez-vous faire

    1- Afficher ma collection
    2- Ajouter un album à ma collection
    3- Quitter

Veuillez choisir une option : """.format(usager.nom_usager, usager.texte_apropos)

    try:
        choix = int(input(texteMenu))
    except ValueError:
        print("Le choix est invalide")
    return choix

def AfficherMenuPrincipale():
    usager = ConnexionUsager()

    # la variable usager est un dataclass qui contient les informations de l'usager
    # qui a été sélectionné. À ce niveau elle ne peut être nulle. Voir dans le fichier
    # db_groupCamp.py pour la composition de la classe. Exemple pour afficher le nom de 
    # l'usager on fait usager.nom_usager, le id = usager.id, etc...

    while True:
        choixMenu = OptionMenu(usager)

        match choixMenu:
            case 1:
                AfficherCollection()
            case 2:
                AjouterUnAlbum()
            case 3:
                break

if __name__ == "__main__":
    AfficherMenuPrincipale()
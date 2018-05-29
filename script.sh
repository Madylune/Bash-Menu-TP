#!/usr/bin/env bash

menu() {
    echo "MENU PRINCIPAL:"
    echo "1: Se déplacer dans un dossier"
    echo "2: Afficher le contenu d'un fichier"
    echo "3: Accéder au menu 'fichier'"
    echo "4: Accéder au menu 'dossier'"
    echo "5: Afficher une image"
    echo "6: Rechercher un mot dans un fichier"
    echo "7: Sortir du menu"
}

menuFichier() {
    echo "MENU FICHIER:"
    echo "1: Supprimer un fichier"
    echo "2: Copier un fichier"
    echo "3: Déplacer un fichier"
    echo "4: Renommer un fichier"
    echo "5: Retour au menu principal"
}

menuDossier() {
    echo "MENU DOSSIER:"
    echo "1: Créer un dossier"
    echo "2: Copier un dossier"
    echo "3: Déplacer un dossier"
    echo "4: Renommer un dossier"
    echo "5: Retour au menu principal"
}

while [ -z $option ] || [ $option != 7 ]
do
menu
read -p "Choisir une option: " option; 
    case $option in
        1) 
            read -p "Entrer le nom du dossier: " repoName;
            cd $repoName
            ls
            pwd
            ;;
        2)
            read -p "Entrer le nom du fichier: " fileName;
            cat $fileName
            ;; 
        3) 
            while [ -z $opt1 ] || [ $opt1 != 5 ]
            do
            menuFichier
            read -p "Choisir une option: " opt1;
                case $opt1 in
                    1)
                        read -p "Nom du fichier: " fileName;
                        rm $fileName
                        echo "*** Le fichier $fileName a bien été supprimé ***"
                        ;;
                    2)
                        read -p "Nom du fichier: " fileName;
                        read -p "Nom du dossier destinataire: " repoName;
                        cp $fileName $repoName
                        echo "*** Le fichier $fileName a bien été copié dans le dossier $repoName ***"
                        ;;
                    3)
                        read -p "Nom du fichier: " fileName;
                        read -p "Nom du dossier destinataire: " repoName;
                        mv $fileName $repoName
                        echo "*** Le fichier $fileName a bien été déplacé dans le dossier $repoName ***"
                        ;;
                    4)
                        read -p "Nom du fichier: " fileName;
                        read -p "Nouveau nom: " newName;
                        mv $fileName $newName
                        echo "*** Le fichier $fileName a bien été renommé en $newName ***"
                        ;;
                    5)
                        echo "Retour au menu principal"
                        ;;
                esac
            done
            ;;
        4)
            while [ -z $opt2 ] || [ $opt2 != 5 ]
            do
            menuDossier
            read -p "Choisir une option: " opt2;
                case $opt2 in
                    1)
                        read -p "Nom du dossier: " repoName;
                        mkdir "$repoName"
                        echo "*** Le dossier $repoName a bien été créé ***"
                        ;;
                    2)
                        read -p "Nom du dossier: " repoName;
                        read -p "Nom du dossier destinataire: " newRepo;
                        cp -r $repoName $newRepo
                        echo "*** Le dossier $repoName a bien été copié dans le dossier $newRepo ***"
                        ;;
                    3)
                        read -p "Nom du dossier: " repoName;
                        read -p "Nom du dossier destinataire: " newRepo;
                        mv $repoName $newRepo
                        echo "*** Le dossier $repoName a bien été déplacé dans le dossier $newRepo ***"
                        ;;
                    4)
                        read -p "Nom du dossier: " repoName;
                        read -p "Nouveau nom: " newName;
                        mv $repoName $newName
                        echo "*** Le dossier $repoName a bien été renommé en $newName ***"
                        ;;
                    5)
                        echo "Retour au menu principal"
                        ;;
                esac
            done
            ;;
        5)
            xdg-open image/panda.jpg
            ;;
        6)
            read -p "Rechercher: " word;
            grep -r $word
            ;;
        7)
            echo "A bientôt !"
            ;;
    esac
done
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
    echo "1: Créer un fichier"
    echo "2: Supprimer un fichier"
    echo "3: Copier un fichier"
    echo "4: Déplacer un fichier"
    echo "5: Renommer un fichier"
    echo "6: Retour au menu principal"
}

menuDossier() {
    echo "MENU DOSSIER:"
    echo "1: Créer un dossier"
    echo "2: Copier un dossier"
    echo "3: Déplacer un dossier"
    echo "4: Renommer un dossier"
    echo "5: Retour au menu principal"
}

choixImage() {
    echo "1: Panda"
    echo "2: Lapin"
    echo "3: Renard"
    echo "4: Chat"
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
            while [ -z $opt1 ] || [ $opt1 != 6 ]
            do
            menuFichier
            read -p "Choisir une option: " opt1;
                case $opt1 in
                    1)
                        read -p "Nom du fichier: " fileName;
                        touch $fileName
                        echo "*** Le fichier $fileName a bien été créé ***"
                        ;;
                    2)
                        read -p "Nom du fichier: " fileName;
                        rm $fileName
                        echo "*** Le fichier $fileName a bien été supprimé ***"
                        ;;
                    3)
                        read -p "Nom du fichier: " fileName;
                        read -p "Nom du dossier destinataire: " repoName;
                        cp $fileName $repoName
                        echo "*** Le fichier $fileName a bien été copié dans le dossier $repoName ***"
                        ;;
                    4)
                        read -p "Nom du fichier: " fileName;
                        read -p "Nom du dossier destinataire: " repoName;
                        mv $fileName $repoName
                        echo "*** Le fichier $fileName a bien été déplacé dans le dossier $repoName ***"
                        ;;
                    5)
                        read -p "Nom du fichier: " fileName;
                        read -p "Nouveau nom: " newName;
                        mv $fileName $newName
                        echo "*** Le fichier $fileName a bien été renommé en $newName ***"
                        ;;
                    6)
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
            while [ -z $opt3 ] || [ $opt3 != 5 ]
            do
            choixImage
            read -p "Choisir une option: " opt3;
                case $opt3 in
                    1)
                        xdg-open 'https://www.thelocal.de/userdata/images/article/fa6fd5014ccbd8f4392f716473ab6ff354f871505d9128820bbb0461cce1d645.jpg'
                        ;;
                    2)
                        xdg-open 'https://static.wamiz.fr/images/news/facebook/article/lapinvhdrect-fb-57ff57e81968d.jpg'
                        ;;
                    3)
                        xdg-open 'https://positivr.fr/wp-content/uploads/2017/05/renard-sauve-heureux-UNE.jpg'
                        ;;
                    4)
                        xdg-open 'https://image.afcdn.com/story/20150323/chat-621527_w767h767c1cx1185cy841.jpg'
                        ;;
                    5)
                        echo "Retour au menu principal"
                        ;;
                esac
            done
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
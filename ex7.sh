#!/usr/bin/env bash

function createUsers() {
    separator=${2:-,}
    while read p; do
        username=$(echo "$p" | cut -d"$separator" -f 1)
        password=$(echo "$p" | cut -d"$separator" -f 2)
        echo $password | passwd $username --stdin
    done <./$1
}

if [[ "$1" ]]; then
    case $1 in
    "-h")
        print='Le fichier doit être séparé par un ";" avec le nom d"utilisateur avant le ";" et le mot de passe après.
Exemple: "username;password".
Pour changer le séparateur utilisez l"option -s, par exemple : "-s ; passwd.txt".
'
        printf "$print"
        ;;
    "-s")
        createUsers "$3" "$2"
        ;;
    *)
        createUsers "$1"
        ;;
    esac
else
    echo "Vous n'avez pas spécifié de paramètre"
fi

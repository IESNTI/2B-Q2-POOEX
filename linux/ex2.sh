#!/usr/bin/env bash
echo $#
# if [[ "$1" ]]; then
#     case $1 in
#     robert)
#         echo "bonjour robert"
#         ;;
#     test)
#         echo "attention ceci est un compte de test"
#         ;;
#     root)
#         echo "Bienvenue administrateur"
#         ;;
#     *)
#         echo "Erreur"
#         exit 1
#         ;;
#     esac
# fi
for var in "$@"; do
    case $var in
    robert)
        echo "bonjour robert"
        ;;
    test)
        echo "attention ceci est un compte de test"
        ;;
    root)
        echo "Bienvenue administrateur"
        ;;
    *)
        echo "Erreur"
        exit 1
        ;;
    esac
done

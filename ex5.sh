#!/usr/bin/env bash
if [[ -f "$1" ]]; then
    echo "Le fichier existe et son type est de $(file "$1")"
else
    echo "Ce fichier n'existe pas";
fi
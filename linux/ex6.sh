#!/usr/bin/env bash
while read p; do
    if [[ $(echo "$p" | cut -d ':' -f 3) -gt 500 ]]; then
        echo "L'utilisateur $(echo "$p" | cut -d ':' -f 1) a le shell $(echo "$p" | cut -d ':' -f 7)"
    fi
done </etc/passwd

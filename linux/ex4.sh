#!/usr/bin/env bash
for file in $(ls -a -R -p /var/log | grep -v /); do
    if [[ "$1" -eq "-l" ]]; then
        cat "/var/log/${file}"
    fi
    echo "$file"
done

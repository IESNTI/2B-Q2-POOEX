#!/usr/bin/env bash
case $1 in
a | b | c)
    echo "ok"
    ;;
*)
    exit 1
    ;;
esac

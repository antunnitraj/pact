#!/bin/bash

# Check if the first argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: pact <operation> <packages>"
  exit
fi

# Convert the first argument to lowercase
operation="${1,,}"
shift 1

# Switch case to handle different operations
case "$operation" in
  "update")
    pacman -Syy "$@"
    ;;
  "upgrade")
    pacman -Su "$@"
    ;;
  "full-upgrade")
    pacman -Syyu "$@"
    ;;
  "install")
    pacman -S "$@"
    ;;
  "remove")
    pacman -R "$@"
    ;;
  "purge")
    pacman -Rnscu "$@"
    ;;
  "autoremove")
    pacman -Qtdq | pacman -Rns -
    ;;
  "show")
    pacman -Si "$@"
    exit
    ;;
  "search")
    pacman -Ss "$@"
    exit
    ;;
  *)
    echo "Invalid operation: $operation"
    exit 1
    ;;
esac

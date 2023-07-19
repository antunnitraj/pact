#!/bin/bash

# Check if the script is run with sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "Error: $0 must be run with sudo privileges!"
  exit 1
fi

# Check if the first argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <command> <packages>..."
  exit 1
fi

# Convert the first argument to lowercase and store it in the 'operation' variable
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
  "show")
    pacman -Si "$@"
    ;;
  "install")
    pacman -S "$@"
    ;;
  "search")
    pacman -Ss "$@"
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
  *)
    echo "Invalid operation: $operation"
    exit 2
    ;;
esac
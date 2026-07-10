#!/bin/bash

read -p "Usuario: " usuario
[[ -z "$usuario" ]] && {
echo "Usuario nescessario"
exit 0
}

base="$( basename $(pwd) )"
git config --global --add safe.directory "$(pwd)"
echo "# $base" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:${usuario}/${base}.git
git push -u origin main

echo -e "\e[1;32mFinalizado com sucesso\e[0m"

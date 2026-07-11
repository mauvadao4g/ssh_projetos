#!/bin/bash
# MAUVADAO
# download_repos.sh

repos=(
"https://github.com/mauvadao4g/ssh_projetos.git"
)

mkdir -p repositorios
cd repositorios || exit 1

for repo in "${repos[@]}"; do
    nome=$(basename "$repo" .git)

    echo "======================================"
    echo "Baixando: $nome"

    if git clone --depth 1 "$repo" "$nome"; then
        rm -rf "$nome/.git"
        echo "[OK] $nome"
    else
        echo "[ERRO] Não foi possível baixar $repo"
    fi
done

echo
echo "Todos os repositórios foram processados."

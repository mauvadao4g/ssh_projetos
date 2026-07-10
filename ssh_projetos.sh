#!/bin/bash
# MAUVADAO
# download_repos.sh

repos=(
"https://github.com/ProverbioX9/SSHPLUS.git"
"https://github.com/MEGALODON-SSH/MEGA.git"
"https://github.com/Proverbiosx/copiador.git"
"https://github.com/leitura/SSHPLUS.git"
"https://github.com/AKBSIJSHSI/MASTER.git"
"https://github.com/kiritosshxd/SSHPLUS.git"
"https://github.com/alfainternet/SSHPLUS.git"
"https://github.com/F4K3R171337/SSHPLUS.git"
"https://github.com/ACKHTTP/ACKHTTP-SERVER-MANAGER.git"
"https://github.com/VENHABRABO/SSHPLUS.git"
"https://github.com/Niltonjuniorxd/fix-v2ray-nzx.git"
"https://github.com/Penguinehis/DragonCoreSSH-Beta.git"
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

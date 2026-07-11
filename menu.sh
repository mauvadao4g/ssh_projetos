#!/bin/bash
# menu.sh
# Menu para escolher e instalar um dos paineis deste repositorio.
# Deve ser executado como root, na VPS onde o painel sera instalado.

DIR="$(cd "$(dirname "$0")" && pwd)"

mostrar_menu() {
    clear
    echo "======================================"
    echo "        SSH_PROJETOS - INSTALADOR      "
    echo "======================================"
    echo " 1) MASTER"
    echo " 2) MEGA"
    echo " 3) SSHPLUS"
    echo " 4) DragonCoreSSH-Beta"
    echo " 5) socks5"
    echo " 6) copiador"
    echo " 0) Sair"
    echo "======================================"
}

instalar() {
    local nome="$1"
    local script="$2"

    if [ ! -f "$script" ]; then
        echo "[Erro] Script nao encontrado: $script"
        return 1
    fi

    echo "Você escolheu instalar: $nome"
    read -p "Confirma a instalação? [s/N]: " conf
    [[ "$conf" != "s" && "$conf" != "S" ]] && { echo "Cancelado."; return 0; }

    if [ "$(id -u)" -ne 0 ]; then
        echo "[Aviso] Este instalador normalmente precisa ser executado como root."
    fi

    chmod +x "$script"
    cd "$(dirname "$script")" || return 1
    bash "$(basename "$script")"
    cd "$DIR" || return 1
}

while true; do
    mostrar_menu
    read -p "Escolha uma opção: " opcao

    case "$opcao" in
        1) instalar "MASTER" "$DIR/MASTER/Plus" ;;
        2) instalar "MEGA" "$DIR/MEGA/ssh-plus" ;;
        3) instalar "SSHPLUS" "$DIR/SSHPLUS/Plus" ;;
        4) instalar "DragonCoreSSH-Beta" "$DIR/DragonCoreSSH-Beta/install.sh" ;;
        5) instalar "socks5" "$DIR/socks5/socks5.sh" ;;
        6) instalar "copiador" "$DIR/copiador/Plus" ;;
        0) echo "Saindo..."; exit 0 ;;
        *) echo "Opção inválida." ;;
    esac

    echo
    read -p "Pressione ENTER para voltar ao menu..." _
done

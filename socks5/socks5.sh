#!/bin/bash

# Nome: socks5.sh

echo "=== Instalação rápida do SOCKS5 ==="

# Verificar se está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "⚠️  Por favor, execute como root (use sudo)."
  exit 1
fi

# Atualizar repositórios e instalar dependências
echo "➡️  Instalando dependências (wget, screen)..."
apt-get update -y >/dev/null 2>&1
apt-get install -y wget screen >/dev/null 2>&1

# Confirmar se instalação foi bem-sucedida
if ! command -v wget >/dev/null || ! command -v screen >/dev/null; then
  echo "❌ Falha ao instalar wget ou screen. Verifique sua conexão."
  exit 1
fi

# Perguntar IP permitido
read -p "Digite o IP que deseja permitir (ex: 127.0.0.1): " IP_ALLOW

if [ -z "$IP_ALLOW" ]; then
  echo "❌ IP inválido. Abortando."
  exit 1
fi

# Baixar binário socks5
echo "➡️  Baixando binário SOCKS5..."
wget -q -O /usr/bin/socks5 https://github.com/mauvadao4g/ssh_projetos/raw/main/socks5/socks5

if [ $? -ne 0 ]; then
  echo "❌ Falha ao baixar o binário SOCKS5."
  exit 1
fi

chmod 777 /usr/bin/socks5

# Iniciar screen com o servidor socks5
echo "➡️  Iniciando serviço SOCKS5 na porta 1080 (allow=$IP_ALLOW)..."
screen -dmS socks5 bash -c "/usr/bin/socks5 -port 1080 -allow $IP_ALLOW"

# Finalização
echo ""
echo "✅ SOCKS5 iniciado com sucesso!"
echo "🔹 Sessão screen: socks5"
echo "🔹 Porta: 1080"
echo ""
echo "Comandos úteis:"
echo "  ➜ screen -ls                # listar sessões"
echo "  ➜ screen -r socks5          # entrar na sessão"
echo "  ➜ screen -S socks5 -X quit  # parar o serviço"

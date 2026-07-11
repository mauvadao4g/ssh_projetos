#!/bin/bash
# commit.sh
# Automatiza: git add -> git commit -> git push
#
# Uso:
#   ./commit.sh "mensagem do commit"
#   ./commit.sh            (usa mensagem padrão com data/hora)

set -e

cd "$(dirname "$0")"

branch=$(git rev-parse --abbrev-ref HEAD)
msg="${1:-Update: $(date '+%a %d %b %Y %H:%M:%S %z') - files add}"

git add -A

if git diff --cached --quiet; then
    echo "Nada para commitar."
    exit 0
fi

git commit -m "$msg"
git push origin "$branch"

echo "Enviado para origin/$branch"

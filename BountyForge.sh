#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

###############################################################################
#                           BountyForge Installer
#                    Professional Recon Environment Builder
###############################################################################

if [ "$EUID" -ne 0 ]; then
  echo "Por favor ejecuta este script con sudo o como root."
  exit 1
fi

USER_HOME="${SUDO_USER_HOME:-$(eval echo ~${SUDO_USER:-$USER})}"
GOPATH="${GOPATH:-$USER_HOME/go}"
GOBIN="$GOPATH/bin"
LOCAL_BIN="/usr/local/bin"

echo "Usuario objetivo: ${SUDO_USER:-$USER}"
echo "GOPATH: $GOPATH"
echo "GOBIN: $GOBIN"
echo "Enlaces a: $LOCAL_BIN"
sleep 1

echo "==> Actualizando apt e instalando dependencias base..."
apt update -y
DEBS=(
  git wget curl
  build-essential
  golang-go golang-src
  make python3 python3-pip
  ruby-full ruby-dev
  libcurl4-openssl-dev libssl-dev
  zip unzip
)
apt install -y "${DEBS[@]}"

echo "==> Creando GOPATH y GOBIN..."
mkdir -p "$GOBIN"
chown -R "${SUDO_USER:-$USER}":"${SUDO_USER:-$USER}" "$GOPATH"
export GOPATH="$GOPATH"
export PATH="$GOBIN:$PATH"

echo "==> Instalando herramientas no-Go..."

apt install -y nikto || true

if ! command -v sqlmap >/dev/null 2>&1; then
  pip3 install --upgrade pip setuptools
  pip3 install sqlmap
fi

if ! command -v wpscan >/dev/null 2>&1; then
  if ! gem install wpscan; then
    apt install -y wpscan
  fi
fi

echo "==> Instalando herramientas Go..."
GO_TOOLS=(
  "github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
  "github.com/projectdiscovery/httpx/cmd/httpx@latest"
  "github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest"
  "github.com/projectdiscovery/naabu/v2/cmd/naabu@latest"
  "github.com/projectdiscovery/chaos-client/cmd/chaos@latest"
  "github.com/ffuf/ffuf@latest"
  "github.com/lc/gau/v2/cmd/gau@latest"
  "github.com/tomnomnom/waybackurls@latest"
  "github.com/hakluke/hakrawler@latest"
  "github.com/tomnomnom/httprobe@latest"
  "github.com/tomnomnom/assetfinder@latest"
  "github.com/tomnomnom/meg@latest"
  "github.com/tomnomnom/ksubdomain@latest"
)

FAILED_GO=()
for tool in "${GO_TOOLS[@]}"; do
  echo "-> go install $tool"
  if sudo -u "${SUDO_USER:-$USER}" bash -lc "GOPATH='$GOPATH' PATH='$PATH' go install -v $tool"; then
    echo "   OK: $tool"
  else
    echo "   FALLÓ: $tool"
    FAILED_GO+=("$tool")
  fi
done

echo "==> Enlazando binarios..."
mkdir -p "$LOCAL_BIN"
for bin in "$GOBIN"/*; do
  [ -f "$bin" ] || continue
  bname="$(basename "$bin")"
  ln -sf "$bin" "$LOCAL_BIN/$bname"
  echo "   -> $bname"
done

if command -v nuclei >/dev/null 2>&1; then
  echo "==> Actualizando templates de nuclei..."
  sudo -u "${SUDO_USER:-$USER}" bash -lc "nuclei -update-templates" || true
fi

echo
echo "==> Instalación completada"
echo "Binaries instalados en: $GOBIN y enlazados a $LOCAL_BIN"

if [ "${#FAILED_GO[@]}" -ne 0 ]; then
  echo "Herramientas Go que fallaron:"
  printf ' - %s\n' "${FAILED_GO[@]}"
fi

echo
echo "Añade esto a ~/.profile o ~/.bashrc:"
echo "export GOPATH=\"$GOPATH\""
echo "export PATH=\"\$GOPATH/bin:\$PATH\""
echo
echo "Fin."

#!/usr/bin/env bash
# One-liner installer for daily-log CLI
set -e

INSTALL_DIR="${HOME}/.local/bin"
mkdir -p "$INSTALL_DIR"

echo "Downloading daily-log CLI to ${INSTALL_DIR}..."
curl -sSL "https://raw.githubusercontent.com/BerattCelikk/daily-engineering-log/main/scripts/daily-log.sh" -o "${INSTALL_DIR}/daily-log"
chmod +x "${INSTALL_DIR}/daily-log"

echo ""
echo "✅ Successfully installed daily-log CLI to ${INSTALL_DIR}/daily-log!"
echo "Run 'daily-log latest' or 'daily-log categories' to get started."

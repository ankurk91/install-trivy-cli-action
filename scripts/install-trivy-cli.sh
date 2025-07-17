#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "::debug::CACHE_ENABLED=$CACHE_ENABLED"
echo "::debug::CACHE_HIT=$CACHE_HIT"
echo "::debug::CACHE_PATH=$CACHE_PATH"

BIN_PATH="/usr/local/bin"

download_cli() {
  echo "Downloading Trivy CLI: $TRIVY_VERSION"

  mkdir -p "$CACHE_PATH"

  REMOTE_URL="https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh"

    curl -sfL \
      --retry 3 \
      --retry-delay 5 \
      --connect-timeout 15 \
      --max-time 60 \
      "$REMOTE_URL" | sh -s -- -b "$CACHE_PATH" "$TRIVY_VERSION"
}

install_cli() {
  echo "Installing..."
  chmod +x "$CACHE_PATH/trivy"
  # We have to leave the binary here in cache folder so that it can be saved in GitHub actions cache
  cp --force "$CACHE_PATH/trivy" $BIN_PATH
}

if [ "$TRIVY_VERSION" = "latest" ]; then
  echo "Skipping cache for 'latest' version"
  download_cli
else
  # For non-latest versions, respect cache settings
  if [ "$CACHE_ENABLED" = "false" ] || [ "$CACHE_HIT" = "false" ]; then
    download_cli
  fi
fi

install_cli

# Verify installation
trivy --version

echo "Trivy CLI installation script finished!"

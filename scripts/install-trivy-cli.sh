#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

install_trivy_cli() {
  echo "Installing trivy CLI: $TRIVY_VERSION"

  REMOTE_URL="https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh"

    curl -sfL \
      --retry 3 \
      --retry-delay 5 \
      --connect-timeout 15 \
      --max-time 60 \
      "$REMOTE_URL" | sh -s -- -b /usr/local/bin "$TRIVY_VERSION"

  trivy --version
}

install_trivy_cli

echo "Trivy CLI installation script finished!" 
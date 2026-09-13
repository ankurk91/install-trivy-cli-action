# Install Trivy CLI Action

[![tests](https://github.com/ankurk91/install-trivy-cli-action/actions/workflows/tests.yaml/badge.svg)](https://github.com/ankurk91/install-trivy-cli-action/actions)
[![lint](https://github.com/ankurk91/install-trivy-cli-action/actions/workflows/lint.yaml/badge.svg)](https://github.com/ankurk91/install-trivy-cli-action/actions)

Action to Install [Trivy](https://github.com/aquasecurity/trivy) CLI

### Features

* Pin an exact version, or always install the `latest` one
* Caches the binary between runs, keyed by version, operating system and architecture
* Runs on both GitHub and Gitea Actions
* Tested on Ubuntu runners, and should work on `X86_64` and `arm64`

### Usage

```yaml
on:
  push:
    branches:
      - main

jobs:
  Scanner:
    runs-on: ubuntu-latest
    steps:
      - name: Install Trivy CLI
        uses: ankurk91/install-trivy-cli-action@v2
        with:
          version: latest # or a specific version like 'v0.70.0'
          cache: true # or set to false, true by default

      - name: Run Trivy scan
        run: trivy --version
```

### Input options

| Name      | Required | Default  | Description                                     |
|-----------|----------|----------|-------------------------------------------------|
| `version` | No       | `latest` | Version to install (e.g. `v0.70.0` or `latest`) |
| `cache`   | No       | `true`   | Whether to cache the downloaded binary          |

### Must read

> [!TIP]
> The version must be `latest` or a valid tag like `v0.70.0`, the leading `v` is required.

> [!IMPORTANT]
> Cache will not work with `latest` version as this is intended to download latest version always.

> [!NOTE]
> This action uses bash scripts and requires `curl` to be available on the runner.

### Ref links

* https://github.com/aquasecurity/trivy

### License

This repo is licensed under MIT [License](LICENSE.txt).

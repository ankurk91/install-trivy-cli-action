# Install Trivy CLI Action

[![tests](https://github.com/ankurk91/install-trivy-cli-action/actions/workflows/tests.yaml/badge.svg)](https://github.com/ankurk91/install-trivy-cli-action/actions)
[![lint](https://github.com/ankurk91/install-trivy-cli-action/actions/workflows/lint.yaml/badge.svg)](https://github.com/ankurk91/install-trivy-cli-action/actions)

Action to Install [Trivy](https://github.com/aquasecurity/trivy) CLI

### Features

* Allow to specify a version to install
* Cache and restore the downloaded binary
* Tested on GitHub and Gitea Actions
* Tested on Ubuntu runner and should work on `X86_64` and `arm64`

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
          version: 'latest' # or a specific version like 'v0.64.0'
          cache: true # or set to false, true by default

      - name: Run Trivy scan
        run: trivy --version
```

### Input options

| Name      | Required | Default  | Description                                     |
|-----------|----------|----------|-------------------------------------------------|
| `version` | No       | `latest` | Version to install (e.g. `v0.64.0` or `latest`) |
| `cache`   | No       | `true`   | Whether to cache the downloaded binary          |

### Must read

> [!TIP]
> The version must be a valid tag, and usually start with `v`

> [!IMPORTANT]
> Cache will not work with `latest` version as this is intended to download latest version always.

> [!NOTE]
> This action uses bash scripts and requires `curl` to be available on the runner.

### Ref links

* https://github.com/aquasecurity/trivy

### License

This repo is licensed under MIT [License](LICENSE.txt).

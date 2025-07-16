# Install Trivy CLI Action

[![tests](https://github.com/ankurk91/install-trivy-cli-action/actions/workflows/tests.yaml/badge.svg)](https://github.com/ankurk91/install-trivy-cli-action/actions)
[![lint](https://github.com/ankurk91/install-trivy-cli-action/actions/workflows/lint.yaml/badge.svg)](https://github.com/ankurk91/install-trivy-cli-action/actions)

Action to Install [Trivy CLI](https://github.com/aquasecurity/trivy) 

### Features

* Allow to specify CLI version
* Tested on GitHub and Gitea Actions

### Usage

```yaml
on:
  push:
    branches:
      - main

jobs:
  Scan:
    runs-on: ubuntu-latest
    steps:
      - name: Install Trivy CLI
        uses: ankurk91/install-trivy-cli-action@v1
        with:
          trivy-version: 'latest' # or a specific version like 'v0.64.0'

      - name: Run Trivy scan
        run: trivy --version
```

### Inputs

| Name           | Required | Default  | Description                                      |
|----------------|----------|----------|--------------------------------------------------|
| `trivy-version`| No       | `latest`   | Version to install (e.g. 'v0.64.0' or 'latest') |

### Notes

> [!NOTE]
> This action uses bash scripts and requires `curl` to be available on the runner.

### Ref links

* https://github.com/aquasecurity/trivy

### License

This repo is licensed under MIT [License](LICENSE.txt).

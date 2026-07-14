#!/usr/bin/env bash
set -euo pipefail

# (1) download the provider plugins. Run once per project.
terraform init

# (2) a DRY RUN. Show exactly what would change — create nothing yet.
terraform plan

# (3) actually make reality match the config (asks for confirmation).
terraform apply

# (4) read the server's public IP back out of the state.
terraform output web_ip

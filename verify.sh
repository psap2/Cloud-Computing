#!/usr/bin/env bash
set -euo pipefail

# Read the server IP straight from Terraform's state.
IP="$(terraform -chdir=terraform output -raw web_ip)"
echo "Server IP: $IP"

# 1) Is the web port even open? (HTTP = port 80)
echo "Checking port 80..."
nc -z -w 5 "$IP" 80 && echo "port 80 open" || echo "port 80 CLOSED"

# 2) Does the server actually return our page?
echo "Fetching the home page..."
curl -fsS "http://$IP/" | grep -q "Hello from the cloud" \
  && echo "PASS: app is live and serving the expected page" \
  || echo "FAIL: page did not match"

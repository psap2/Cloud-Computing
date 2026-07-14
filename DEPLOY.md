# Deploy notes

## The full path, end to end

1. `terraform init` — download the DigitalOcean provider.
2. `terraform plan` — preview the server that will be created.
3. `terraform apply` — create the droplet; cloud-init configures it at boot.
4. `terraform output -raw web_ip` — get the public IP.
5. `./verify.sh` — confirm port 80 is open and the page is served.
6. Visit `http://<web_ip>/` in a browser.

## Verifying, not assuming

A deploy is not "done" because `apply` succeeded — that only means the *server*
exists. "Live" means a real request gets the expected response. Always verify
from the outside with `curl`, exactly as a user's browser would.

## Open-port checklist

If the page does not load, check in order:
- Is the droplet running? (`terraform output web_ip` returns an IP)
- Is port 80 open in the firewall / security group?
- Did cloud-init finish? (it can take a minute after boot)
- Does `curl http://<ip>/` return the HTML, or hang/refuse?

## Tearing down

    terraform destroy

This deletes the server so you stop paying. Because everything is code, you can
recreate it identically any time with another `apply`.

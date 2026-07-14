# After apply, print the server's public IP so we can SSH and deploy.
output "web_ip" {
  value       = digitalocean_droplet.web.ipv4_address
  description = "Public IP of the web server"
}

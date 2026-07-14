# A secret input, supplied at apply time — never written into the repo.
variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
  sensitive   = true
}

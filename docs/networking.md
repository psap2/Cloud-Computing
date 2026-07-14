# Cloud networking primer

A server in the cloud needs a *place* to live and *rules* for who may reach it.

## Regions and availability zones

- A **region** is a geographic location of data centers (e.g. `us-east-1` in
  Virginia, `eu-west-1` in Ireland). You pick one near your users for low
  latency, or for legal data-residency reasons.
- A region contains several **availability zones (AZs)** — physically separate
  data centers with independent power and network. Spreading across AZs means a
  single building's failure does not take you down.

## The VPC and subnets

- A **VPC (Virtual Private Cloud)** is your own isolated network inside the
  provider, with a private IP range like `10.0.0.0/16`.
- You carve it into **subnets**: a **public subnet** whose servers can reach the
  internet, and a **private subnet** for things that must not (a database).

## Security groups — the per-server firewall

A **security group** is a virtual firewall attached to a server. By default it
denies everything; you open only the ports you need:

- `22/tcp` from your IP only — SSH for administration.
- `80/tcp` and `443/tcp` from anywhere — public web traffic.

Closing everything else is the single most important cloud-security habit.

## Public vs private IPs

A public server gets a **public IP** reachable from the internet and a
**private IP** used inside the VPC. Databases usually get a private IP only, so
nothing outside your network can even attempt to connect.

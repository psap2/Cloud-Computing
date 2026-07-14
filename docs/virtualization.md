# Virtualization — how one box becomes many

A single physical server is powerful and expensive. Virtualization lets the
provider slice it into many **virtual machines (VMs)**, rent each one to a
different customer, and keep them isolated from each other.

## The hypervisor

A **hypervisor** is software that sits between the physical hardware and the
VMs. It hands each VM a slice of CPU, memory, and disk, and convinces that VM
it owns a whole computer. Two flavors:

- **Type 1 (bare metal):** runs directly on the hardware (Xen, KVM, ESXi).
  This is what clouds use — fast and lean.
- **Type 2 (hosted):** runs on top of a normal OS (VirtualBox on your laptop).

## Why this makes the cloud possible

- **Density.** One big machine safely runs dozens of customers' VMs, so the
  cost of the hardware is spread thin.
- **Isolation.** Your VM cannot see your neighbor's memory or disk.
- **Elasticity.** A VM is just software state — the provider can create,
  destroy, pause, or move it in seconds. That is why you can rent 100 servers
  for an hour.

## Containers, briefly

A **container** virtualizes the *operating system* instead of the hardware:
many containers share one OS kernel, so they are far lighter than VMs but
isolate less. VMs run whole guest OSes; containers run just a process tree.
We use VMs here; containers come later in the track.

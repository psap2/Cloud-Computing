# Cloud storage — two main kinds

The cloud sells storage in two very different shapes. Picking the right one
matters for cost, performance, and how your app uses it.

## Block storage

**Block storage** is a virtual disk you attach to one server. It looks and acts
like a hard drive: you format it, mount it, and your OS reads and writes files
and runs a database on it.

- Low-latency, high-IOPS — good for OS disks and databases.
- Attached to **one** server at a time.
- You pay for the size you provision, used or not.
- *Example: AWS EBS, a DigitalOcean volume.*

## Object storage

**Object storage** keeps whole files ("objects") in flat containers called
**buckets**, each retrieved by a key over HTTP. There is no filesystem and no
attaching to a server.

- Effectively unlimited, extremely durable (many copies across AZs).
- Reached by *any* number of servers over the network, via an API or URL.
- You pay per GB stored and per request.
- Great for images, backups, logs, static website files.
- *Example: AWS S3, Google Cloud Storage.*

## Choosing

- Need a disk for an OS or a database? **Block.**
- Need to store and serve lots of files to many clients? **Object.**

---
title:
- Installation
---

# Installation

There are three ways to install MAAS:

- [From an Ubuntu Server ISO](installconfig-server-iso.md). Install and
  configure a region controller or a rack controller during the ISO
installation of Ubuntu Server.
    - Recommended for new MAAS environments with a distributed design
    - Enables you to get started as quickly as possible 

- [From packages](installconfig-package-install.md). Install packages for
individual MAAS components.
    - Versatile: Put components where you want them (centralized or distributed)
    - Can access developmental versions of MAAS

- [Locally with LXD](installconfig-lxd-install.md). Create a self-contained
MAAS environment with LXD containers.
    - MAAS nodes also run as local containers
    - Ideal for testing and experimenting with MAAS
    - Can access developmental versions of MAAS

If you're new to MAAS, and have a distributed design, we recommend installing
from an [Ubuntu Server ISO](installconfig-server-iso.md).

Ubuntu 14.04 systems running MAAS 1.9 and 1.9.x can [upgrade to MAAS
2.0](installconfig-upgrade-to-2.md) via the system-wide upgrade to Ubuntu 16.04.
To best fit your requirements, MAAS offers several installation options:

-   **[Packages](installconfig-package-install.md)**. The recommended way to install MAAS. Versatile *deb*-based installation with manual control over where specific components are placed, when upgrades are applied, and where packages are installed from
-   **[Snap](installconfig-snap-install.md)**. Benefits from autonomous upgrades and direct access to beta and developmental versions
-   **[Ubuntu Server ISO](installconfig-iso-install.md)**. Conveniently install MAAS as you provision a new server

Additionally, you may want to consider an installation within [LXD containers](installconfig-lxd-install.md). This allows MAAS nodes to also run as local containers and is ideal for testing and experimenting with MAAS.

[note]
See [MAAS HA](manage-ha.md) for more information about installing MAAS via Snaps in high-availability environments.
[/note]

# Install from Packages

There are three packages to consider when installing MAAS:

-   `maas-region-controller` - region API server, database, DNS, [HTTP proxy](installconfig-network-proxy.md), and [web UI](installconfig-webui.md)
-   `maas-rack-controller` - [rack controller](installconfig-rack.md) and [DHCP](installconfig-network-dhcp.md)
-   `maas` - a metapackage that installs both the above packages to provide a complete MAAS environment

Each of the above packages has its own dependencies. That is, each will bring in other MAAS packages not listed above. The full list of MAAS packages can be obtained with the command:

``` bash
apt-cache search maas
```

The 'maas' metapackage is the recommended way to install MAAS. See the [Introduction](index.md#key-components-and-colocation-of-all-services) for more detail on colocating all services on a single host.

High availability with MAAS involves installing multiple region controllers and/or multiple rack controllers. See [MAAS HA](manage-ha.md).

## Package repositories

While MAAS is available in the normal Ubuntu archives, the available packages may be lagging behind non-archive, but still stable, versions. To install a newer stable version the following PPA can be used:

-   [ppa:maas/stable](https://launchpad.net/~maas/+archive/ubuntu/stable)

Development releases (not meant for production) are available here:

-   [ppa:maas/next](https://launchpad.net/~maas/+archive/ubuntu/next)

For example, to add the 'stable' PPA, type:

``` bash
sudo apt-add-repository -yu ppa:maas/stable
```

## Installation scenarios

The recommended way to set up an initial MAAS environment is to put everything on one machine:

``` bash
sudo apt install maas
```

For a more distributed environment, the region controller can be placed on one machine:

``` bash
sudo apt install maas-region-controller
```

and the rack controller (see [Rack controller](installconfig-rack.md) for details) on another:

``` bash
sudo apt install maas-rack-controller
sudo maas-rack register
```

<!-- LINKS -->


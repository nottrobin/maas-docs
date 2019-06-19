<!--
Todo:
- bug tracking: https://github.com/canonical-webteam/documentation-builder/issues/83
-->
MAAS supports the images it generates for stable Ubuntu releases and for CentOS 6.6 and CentOS 7. [Ubuntu Advantage](https://www.ubuntu.com/support) is needed to use Windows, RHEL and ESXi images to build a custom image for any operating system.

Images are stored in the region controller's database, from where the rack controller will automatically pull them onto its local disk.

Note that for ESXi images, network configuration is limited to:

-   DHCP
-   Static/auto IP assignments
-   Aliases
-   VLANs
-   Bonds -- bonds are mapped to NIC teaming as follows:
    -   balance-rr -- portid
    -   active-backup -- explicit
    -   802.3ad -- iphash, LACP rate and XMIT hash policy settings ignored

See [CLI Image Management](manage-cli-images.md) for information on advanced image management.

<h2 id="heading--boot-sources">Boot sources</h2>

The place from where a region controller downloads its images is known as a *boot source*. The main characteristics of a boot source are its location (URL) and its associated GPG public keyring.

[note]
A *boot resource* is another name for an image. So boot resources are found within a boot source.
[/note]

MAAS comes configured with a boot source that should suffice for most users:

[`https://images.maas.io/ephemeral-v3/daily/`](https://images.maas.io/ephemeral-v3/daily/)

The above URL points to the 'daily' stream (for the v3 format). See [Local image mirror](installconfig-images-mirror.md) for some explanation regarding the availability of other streams.

Although the backend supports multiple boot sources, MAAS itself uses a single source. If multiple sources are detected the web UI will print a warning and will be unable to manage images.

<h2 id="heading--select-and-import">Select and import</h2>

MAAS is only useful once it has images available to provision its nodes with. Therefore, one key task once MAAS is installed is to select and import images from the boot source. Once images have been imported MAAS will update them on an hourly basis (a sync mechanism is enabled by default).

See [Select and Import Images](installconfig-images-import.md) to get started with images.

<!-- LINKS -->


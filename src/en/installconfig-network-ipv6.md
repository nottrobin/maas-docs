---
title:
- Managing IPv6 Networks
---

# Managing IPv6 Networks

MAAS has limited IPv6 support for networking nodes. It works much like IPv4
support, but with a number of limitations:

-   Nodes still boot, register, and install using the IPv4 network.
-   IPv6 addresses are only configured when using the default
    Ubuntu installer.
-   Most BMCs can only be controlled (e.g. to power nodes on/off) using IPv4.
-   MAAS still uses IPv4 for its internal operation, installing nodes, etc.
-   For now, MAAS only supports IPv6 on networks where it also manages
    IPv4 DHCP.
-   A network interface on a node can only be on one IPv6 subnet.
-   A network interface on a cluster controller can manage only one
    IPv6 subnet.

The web user interface and REST API can be accessed in the same way on both
IPv4 and IPv6. To use an IPv6 address as the hostname in a URL, in your
browser or elsewhere, surround it with square brackets. For example, on the
local machine (`::1`, the IPv6 equivalent of `localhost`) you might request:

```nohighlight
http://[::1]/MAAS/
```

If your MAAS server has a DNS hostname that resolves to both IPv4 and IPv6
addresses, your browser may already be accessing the UI through IPv6 without
you noticing.

## Enabling IPv6

You enable IPv6 networking in the same way that you enable IPv4 networking:
configure a separate cluster interface for your IPv6 subnet, in addition to
the one you need for your IPv4 subnet. The IPv6 cluster interface must define
a static address range. Provided that you already have a functioning IPv6
network, that's all there is to it. The following sections will go into more
detail about what is supported, what is needed, and what to do if you don't
yet have a functioning IPv6 network.

An IPv6 cluster interface can use the same network interface on the cluster
controller as an existing IPv4 network interface. It just defines a different
subnet, with IPv6 addressing. A node that's connected to the IPv4 subnet will
also be connected to the IPv6 subnet on the same network segment.

### Configuring your IPv6 subnet

When you configure your IPv6 cluster interface, be sure to define a static IP
address range. Deployed nodes on the subnet will get static addresses in this
range.

IPv6 networks are normally 64 bits wide, so you can be generous with the
ranges' sizes. It also means that you can leave the netmask field blank.

(There are no broadcast addresses in IPv6, so leave the broadcast address
field blank as well.)

You may want MAAS to manage DHCP and DNS, but it's not required. In fact nodes
do not need a DHCP server at all for IPv6; MAAS configures static IPv6
addresses on the node's network interfaces while deploying it. A DHCPv6 server
can provide addresses for containers or virtual machines running on the nodes,
as well as devices on the network that are not managed by MAAS, but it is not
needed for the nodes themselves. MAAS will not be aware of any addresses
issued by DHCP, and does not guarantee that they will stay unchanged.

### Routing

In IPv6, clients do not discover routes through DHCP. Routers make themselves
known on their networks by sending out *route advertisements*. These *RAs*
contain other configuration as well: whether clients should statelessly
configure their own unique IP addresses based on their MAC addresses; whether
they should request stateless configuration from a DHCP server; and finally,
whether they should request a stateful IP address from a DHCP server. Since a
network interface can have any number of IPv6 addresses even on a single
subnet, several of these address assignment mechanisms can be combined.

However, when MAAS configures IPv6 networking on a node, it does not rely on
RAs. It statically configures your nodes' default IPv6 route to use the router
that is configured on the cluster interface, so that the nodes will know their
default gateway. They do not need DHCP and will not autoconfigure global
addresses.

However, if you are planning to operate DHCPv6 clients as well, e.g. on
machines not managed by MAAS or on virtual machines hosted by MAAS nodes, you
may still want to have RAs configured to make those clients obtain
configuration over DHCP.

If you need RAs but your gateway does not send them, install and configure
`radvd` somewhere on the network to advertise its route.

### Other installers and operating systems

Static IPv6 addresses are currently only configured on Ubuntu, when installed
using the "fast" installer. Other operating systems, or Ubuntu with the
classic Debian installer, will not have their IPv6 addresses configured. The
same applies when a user manually installs an operating system on a node, or
overwrites its networking configuration: the node will no longer have its
static IPv6 address configured, even if MAAS has allocated it to the node.

However, as long as the address remains allocated to the node, you may still
configure its operating system to use that address. The node can then use that
address as if it had been configured by MAAS.

## Disabling IPv4

For advanced users, there is an experimental capability to deploy nodes with
pure IPv6, with IPv4 networking disabled. To enable this on a node, check the
"Disable IPv4 when deployed" box on the node's Edit page. The process of
managing and deploying the node will still largely work through IPv4, but once
deployed, the node will have IPv6 networking only.

In practice nodes may not be functional without IPv4 networking. A few things
are known to be needed in any case:

### Configuring the MAAS URL

The *maas-cluster-controller* package has a configuration item for the URL
where nodes and cluster controllers can reach the MAAS region API.

By default, this URL is set based on the region controller's IPv4 address. To
make it work for nodes that won't have IP4, you must set the MAAS URL to use a
hostname instead of an IP address. The hostname must resolve to both IPv4 and
IPv6 addresses, and both on the cluster controller and on the nodes.

To change this setting, run:

```bash
dpkg-reconfigure maas-cluster-controller
```

It will prompt you for the URL, with its current setting as the initial value.
The topic of subnet management pertains to whether MAAS is in full control of a subnet or not. When a subnet is *managed*, all aspects of IP address allocation are handled by MAAS. This includes DHCP leases and assigned static addresses. Typically MAAS would have one managed subnet, but any additional subnets can be *unmanaged*. This allows for more control over which subnet gets used for DHCP and which ones do not. Additionally, as detailed below, an unmanaged subnet treats reserved IP ranges differently, and in a way that some administrators find more intuitive.

<h2 id="heading--managed-subnets">Managed subnets</h2>

When management is enabled for a subnet, MAAS will:

-   Lease addresses for DHCP from a *reserved dynamic IP range*
-   Assign static addresses not included in a *reserved IP range*, typically via 'Auto assign' IP allocation mode for a node.

See [Concepts and terms](intro-concepts.md#heading--ip-ranges) for an explanation of the two kinds of reserved IP ranges MAAS uses and [Post-commission configuration](nodes-commission.md#heading--post-commission-configuration) for information on IP allocation modes.

<h2 id="heading--unmanaged-subnets">Unmanaged subnets</h2>

When management is disabled for a subnet, the definition of a *reserved IP range* differs from the managed mode. Here, a *reserved IP range* tells MAAS to **only allocate addresses from this range** (via 'Auto assign'). In addition, DHCP will never lease addresses from an unmanaged subnet.

<h2 id="heading--controlling-subnet-management">Controlling subnet management</h2>

By default, a subnet is managed, but it is easy to change this.

To disable (or re-enable) subnet management navigate to the 'Subnets' page and select the subnet. Press the 'Edit' button so that changes can be made. The 'Managed allocation' field will become a slide switch. Click the label (or the switch icon itself) to toggle between enabled (dark blue) and disabled (grey) and click 'Save summary'.

![subnet management toggle](../media/installconfig-network-subnet-management__2.6-management-toggle.png)

See [MAAS CLI](manage-cli-common.md#heading--control-subnet-management) for how to do this with the CLI.

<h2 id="heading--ip-address-tracking">IP address tracking</h2>

MAAS will keep track of all assigned addresses, regardless of whether they come from managed or unmanaged subnets.

<!-- LINKS -->


<!--
Todo:
- Decide whether explicit examples are needed everywhere
- There is a nuance between a single reserved address and a single address in a range (start and end addresses being the same). this could use some digging
-->
This is a list of common tasks to perform with the MAAS CLI. See [MAAS CLI](manage-cli.md) on how to get started.

<h2 id="heading--list-nodes">List nodes</h2>

To list all nodes (and their characteristics) in the MAAS:

``` bash
maas $PROFILE nodes read
```

You can also specify various parameters to narrow your search. In the following example, MAAS will return any machines containing 'node2' in the `hostname` parameter.

``` bash
maas $PROFILE machines read hostname=node2
```

To see a list of all available search parameters:

``` bash
maas $PROFILE machines read --help
```

<h2 id="heading--determine-a-node-system-id">Determine a node system ID</h2>

You can use `jq` to determine a node's system ID. For example, here's how to output just the `hostname` and `system_id` when searching for a particular hostname:

``` bash
maas $PROFILE machines read | jq '.[] | .hostname, .system_id'
```

[note][`jq`][jq] is a command-line JSON processor.
[/note]

Output looks like this:

``` no-highlight
"node2"
"e8xa8m"
```

<h2 id="heading--commission-a-node">Commission a node</h2>

To commission a node:

``` bash
maas $PROFILE machine commission $SYSTEM_ID
```

[note]
To commission a node it must have a status of 'New'.
[/note]

To commission all nodes in the 'New' state:

``` bash
maas $PROFILE machines accept-all
```

See [Commission nodes](nodes-commission.md).

<h2 id="heading--acquire-a-node">Acquire a node</h2>

To acquire/allocate a random node:

``` bash
maas $PROFILE machines allocate
```

To acquire/allocate a specific node:

``` bash
maas $PROFILE machines allocate system_id=$SYSTEM_ID
```

[note]
To acquire a node it must have a status of 'Ready'.
[/note]

<h2 id="heading--deploy-a-node">Deploy a node</h2>

To deploy a node:

``` bash
maas $PROFILE machine deploy $SYSTEM_ID
```

To deploy a node as a KVM host:

``` bash
maas $PROFILE machine deploy $SYSTEM_ID install_kvm=True
```

[note]
To deploy with the CLI the node must have a status of 'Allocated'. See 'Acquire a node' above (or use the [web UI](nodes-deploy.md#acquire-nodes)).
[/note]

See [Deploy nodes](nodes-deploy.md).

<h2 id="heading--control-subnet-management">Control subnet management</h2>

To enable or disable subnet management:

``` bash
maas $PROFILE subnet update $SUBNET_CIDR managed=false|true
```

For example, to disable:

``` bash
maas $PROFILE subnet update 192.168.1.0/24 managed=false
```

The subnet's ID can also be used in place of the CIDR address.

See [Subnet management](installconfig-network-subnet-management.md).

<h2 id="heading--create-a-reserved-ip-range">Create a reserved IP range</h2>

See [Concepts and terms](intro-concepts.md#heading--ip-ranges) for an explanation of the two kinds of reserved IP ranges MAAS uses.

To create a range of dynamic IP addresses that will be used by MAAS for node enlistment, commissioning, and possibly deployment:

``` bash
maas $PROFILE ipranges create type=dynamic \
    start_ip=$IP_DYNAMIC_RANGE_LOW end_ip=$IP_DYNAMIC_RANGE_HIGH \
    comment='This is a reserved dynamic range'
```

To create a range of IP addresses that will not be used by MAAS:

``` bash
maas $PROFILE ipranges create type=reserved \
    start_ip=$IP_STATIC_RANGE_LOW end_ip=$IP_STATIC_RANGE_HIGH \
    comment='This is a reserved range'
```

To reserve a single IP address that will not be used by MAAS:

``` bash
maas $PROFILE ipaddresses reserve ip_address=$IP_STATIC_SINGLE
```

To remove such a single reserved IP address:

``` bash
maas $PROFILE ipaddresses release ip=$IP_STATIC_SINGLE
```

<h2 id="heading--determine-a-fabric-id">Determine a fabric ID</h2>

To determine a fabric ID based on a subnet address:

``` bash
FABRIC_ID=$(maas $PROFILE subnet read $SUBNET_CIDR \
    | grep fabric | cut -d ' ' -f 10 | cut -d '"' -f 2)
```

<h2 id="heading--enable-dhcp">Enable DHCP</h2>

To enable DHCP on a VLAN on a certain fabric:

``` bash
maas $PROFILE vlan update $FABRIC_ID $VLAN_TAG dhcp_on=True \
    primary_rack=$PRIMARY_RACK_CONTROLLER
```

To enable DHCP HA you will need both a primary and a secondary controller:

``` bash
maas $PROFILE vlan update $FABRIC_ID $VLAN_TAG dhcp_on=True \
    primary_rack=$PRIMARY_RACK_CONTROLLER \
    secondary_rack=$SECONDARY_RACK_CONTROLLER 
```

You will also need to set a default gateway (see [below](#heading--set-a-default-gateway)).

[note]
DHCP for PXE booting will need to be enabled on the 'untagged' VLAN.
[/note]

See [DHCP](installconfig-network-dhcp.md) for more on this subject.

<h2 id="heading--set-a-dns-forwarder">Set a DNS forwarder</h2>

To set a DNS forwarder:

``` bash
maas $PROFILE maas set-config name=upstream_dns value=$MY_UPSTREAM_DNS
```

<h2 id="heading--configure-proxying">Configure proxying</h2>

Enabling and disabling proxying in general is done via a boolean option ('true' or 'false'). This is how proxying is disabled completely:

``` bash
maas $PROFILE maas set-config name=enable_http_proxy value=false
```

To set an external proxy, ensure proxying is enabled (see above) and then define it:

``` bash
maas $PROFILE maas set-config name=http_proxy value=$EXTERNAL_PROXY
```

For example,

``` bash
maas $PROFILE maas set-config name=enable_http_proxy value=true
maas $PROFILE maas set-config name=http_proxy value=http://squid.example.com:3128/
```

Enabling and disabling proxying per subnet is done via a boolean option ('true' or 'false'). This is how proxying is disabled per subnet:

``` bash
maas $PROFILE subnet update $SUBNET_CIDR allow_proxy=false
```

For example,

``` bash
maas $PROFILE subnet update 192.168.0.0/22 allow_proxy=false
```

See [Proxy](installconfig-network-proxy.md) for detailed information on how proxying works with MAAS.

<h2 id="heading--set-a-default-gateway">Set a default gateway</h2>

To set the default gateway for a subnet:

``` bash
maas $PROFILE subnet update $SUBNET_CIDR gateway_ip=$MY_GATEWAY
```

<h2 id="heading--set-a-dns-server">Set a DNS server</h2>

To set the DNS server for a subnet:

``` bash
maas $PROFILE subnet update $SUBNET_CIDR dns_servers=$MY_NAMESERVER
```

<h2 id="heading--set-a-zone-description">Set a zone description</h2>

To set a description for a physical zone:

``` bash
maas $PROFILE zone update default \
    description="This zone was configured by a script."
```

See [Zones](manage-zones.md) for more information on this topic.

<h2 id="heading--add-a-public-ssh-key">Add a public SSH key</h2>

To add a public SSH key to a MAAS user account:

``` bash
maas $PROFILE sshkeys create "key=$SSH_KEY"
```

See [SSH keys](manage-account.md#heading--ssh-keys).

<h2 id="heading--determine-a-node-hostname">Determine a node hostname</h2>

To determine a node's hostname based on it's MAC address:

``` bash
HOSTNAME=$(maas $PROFILE nodes read mac_address=$MAC \
    | grep hostname | cut -d '"' -f 4)
```

<h2 id="heading--create-a-regular-user">Create a regular user</h2>

To create a regular user:

``` bash
maas $PROFILE users create username=$USERNAME \
    email=$EMAIL_ADDRESS password=$PASSWORD is_superuser=0
```

All the options are necessary. Note that stipulating a password on the CLI may be a security hazard, depending on your environment. If unsure, use the web UI. See [User Accounts](manage-account.md) for the latter.

<!-- LINKS -->


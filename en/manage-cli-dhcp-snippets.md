<!--
Todo:
- Include non-trivial examples of DHCP snippets
- Bug check: https://bugs.launchpad.net/maas/+bug/1623192
-->
This is a list of DHCP snippet management tasks to perform with the MAAS CLI. See [MAAS CLI](manage-cli.md) to get started with the CLI and [DHCP snippets](installconfig-network-dhcp.md#heading--dhcp-snippets) for an overview of this topic.

<h2 id="heading--create-a-snippet">Create a snippet</h2>

When a snippet is created, it is enabled by default.

To create a **global** snippet:

``` bash
maas $PROFILE dhcpsnippets create name=$DHCP_SNIPPET_NAME \
    value=$DHCP_CONFIG description=$DHCP_SNIPPET_DESCRIPTION \
    global_snippet=true
```

To create a **subnet** snippet:

``` bash
maas $PROFILE dhcpsnippets create name=$DHCP_SNIPPET_NAME \
    value=$DHCP_CONFIG description=$DHCP_SNIPPET_DESCRIPTION \
    subnet=$SUBNET_ID
```

A subnet given in CIDR format can also be used in place of the subnet ID.

To create a **node** snippet:

``` bash
maas $PROFILE dhcpsnippets create name=$DHCP_SNIPPET_NAME \
    value=$DHCP_CONFIG description=$DHCP_SNIPPET_DESCRIPTION \
    node=$NODE_ID
```

A hostname can also be used in place of the node ID.

<h2 id="heading--list-snippets">List snippets</h2>

To list all snippets (and their characteristics) in the MAAS:

``` bash
maas $PROFILE dhcpsnippets read
```

To list a specific snippet:

``` bash
maas $PROFILE dhcpsnippet read id=$DHCP_SNIPPET_ID
```

The snippet name can also be used instead of its ID:

``` bash
maas $PROFILE dhcpsnippet read name=$DHCP_SNIPPET_NAME
```

<h2 id="heading--update-a-snippet">Update a snippet</h2>

Update a snippet attribute:

``` bash
maas $PROFILE dhcpsnippet update $DHCP_SNIPPET_ID <option=value>
```

The snippet name can also be used in place of its ID.

<h2 id="heading--enable-or-disable-a-snippet">Enable or disable a snippet</h2>

Enabling and disabling a snippet is considered a snippet update and is done via a boolean option ('true' or 'false'). This is how a snippet is disabled:

``` bash
maas $PROFILE dhcpsnippet update $DHCP_SNIPPET_ID enabled=false
```

The disabling of a snippet removes the text that was added to the dhcpd.conf file when it was created/enabled.

<h2 id="heading--delete-a-snippet">Delete a snippet</h2>

To delete a snippet:

``` bash
maas $PROFILE dhcpsnippet delete $DHCP_SNIPPET_ID
```

The snippet name can also be used in place of its ID.

<!-- LINKS -->


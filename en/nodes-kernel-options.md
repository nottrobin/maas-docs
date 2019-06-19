MAAS is able to specify kernel boot options to nodes on both a global basis and a per-node basis. See [Linux kernel parameters](https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html) (kernel.org) for a full listing of available options.

## Global kernel boot options

To set kernel boot options globally, as an admin, open the 'Settings' page and on the 'General' tab scroll down to the 'Global Kernel Parameters' section:

![global kernel options](../media/nodes-kernel-options__2.2_global.png)

Type in the desired (space separated) options and click 'Save'. The contents of the field will be used as-is. Do not use extra characters.

### CLI

To set kernel boot options that will be applied to all machines with the CLI:

``` bash
maas $PROFILE maas set-config name=kernel_opts value='$KERNEL_OPTIONS'
```

## Per-node kernel boot options

Per-node kernel boot options are set using the CLI.

[note]
Per-node boot options take precedence to global ones.
[/note]

To specify kernel boot options for an individual machine, first create a tag:

``` bash
maas $PROFILE tags create name='$TAG_NAME' \
    comment='$COMMENT' kernel_opts='$KERNEL_OPTIONS'
```

For example:

``` bash
maas $PROFILE tags create name='nomodeset' \
    comment='nomodeset kernel option' kernel_opts='nomodeset vga'
```

Next, assign the tag to the machine in question:

``` bash
maas $PROFILE tag update-nodes $TAG_NAME add=$SYSTEM_ID
```

If multiple tags attached to a node have the `kernel_opts` defined, the first one (ordered alphabetically) is used.

See the [CLI tag management](manage-cli-tags.md) section for more information about using the CLI to manage tags.

<!-- LINKS -->


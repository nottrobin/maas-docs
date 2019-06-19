<!--
Todo:
- Provide examples for setting up common power types (BMCs)
- Consider putting power check troubleshooting notes on the troubleshooting page
-->
In order for MAAS to fully manage a node it must be able to power cycle it. This is done via a communication channel with the [BMC](https://en.wikipedia.org/wiki/Intelligent_Platform_Management_Interface#Baseboard_management_controller) card of the node's underlying system. A newly added node is therefore incomplete until its power type has been configured.

To configure a node's power type, begin by clicking on the node from the 'Machines' page of the web UI followed by its 'Configuration' tab. Scroll down for *Power configuration*. If the power type is undefined the following will be displayed:

![power types undefined](../media/nodes-power-types__2.4_undefined.png)

Choose a type in the dropdown menu that corresponds to the node's underlying machine's BMC card.

![power types selection](../media/nodes-power-types__2.4_selection.png)

Fill in the resulting form. The information requested will depend upon the power type chosen.

Click 'Save changes' to finish. Once that's done, a power check will be performed on the node. This is a good indication of whether MAAS can communicate properly with the node. A successful power check will quickly result in a power status of "Power off". A failed one will show:

![power types power error](../media/nodes-power-types__2.4_power-error.png)

If you get such an error double-check your entered values by editing the power type. Also consider another power type altogether. Another cause may be at the networking level; traffic may be getting filtered between the rack controller and the BMC card.

## Example: Virsh (KVM) power type

Consider a node backed by KVM. Below, a 'Power type' of `Virsh` has been selected and the 'Power address' of `qemu+ssh://ubuntu@192.168.1.2/system` has been entered (replace values as appropriate). Finally, and out of necessity for virsh, the value of 'Power ID' is the KVM domain (guest) name, here `node2`.

![power types example: virsh](../media/nodes-power-types__2.4_example-virsh.png)

[note]
The node's hostname *according to MAAS* is a randomly chosen string (here `dear.ant`). This would normally be edited to reflect the hostname of the underlying machine.
[/note]

See [MAAS CLI](manage-cli-advanced.md#edit-node-hostname-and-power-parameters) for an example of how to edit power parameters with the CLI.

See [Add nodes](nodes-add.md#kvm-guest-nodes) for help in setting up MAAS and KVM to work together.

Multiple Virsh machines running on the same host are managed and composed using [Pods](nodes-comp-hw.md).

## BMC driver support

MAAS supports many types of BMC hardware yet not all the drivers have the same capabilities. See the below table for a feature comparison of the BMC drivers currently supported by MAAS.

<table>
<colgroup>
<col width="35%" />
<col width="12%" />
<col width="10%" />
<col width="14%" />
<col width="15%" />
<col width="11%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Power Driver (<em>X=supported</em>)</th>
<th>PXE Next Boot</th>
<th>Power Querying</th>
<th>Chassis/Pod Configuration</th>
<th>Enhanced UI Error Reporting</th>
<th>BMC Enlistment</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">American Power Conversion (APC) - PDU</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td align="left">Cisco UCS Manager</td>
<td>X</td>
<td>X</td>
<td>X</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td align="left">Digital Loggers, Inc. - PDU</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td align="left">Facebook's Wedge <code>*</code></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td align="left">HP Moonshot - iLO Chassis Manager</td>
<td>X</td>
<td>X</td>
<td>X</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td align="left">HP Moonshot - iLO4 (IPMI)</td>
<td>X</td>
<td>X</td>
<td></td>
<td></td>
<td>X</td>
</tr>
<tr class="odd">
<td align="left">IBM Hardware Management Console (HMC)</td>
<td>X</td>
<td>X</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td align="left">IPMI</td>
<td>X</td>
<td>X</td>
<td></td>
<td>X</td>
<td>X</td>
</tr>
<tr class="odd">
<td align="left">Intel AMT</td>
<td>X</td>
<td>X</td>
<td></td>
<td>X</td>
<td></td>
</tr>
<tr class="even">
<td align="left">Manual</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td align="left">Microsoft OCS - Chassis Manager</td>
<td>X</td>
<td>X</td>
<td>X</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td align="left">OpenStack Nova</td>
<td></td>
<td>X</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td align="left">Rack Scale Design</td>
<td>X</td>
<td>X</td>
<td>X</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td align="left">SeaMicro 15000</td>
<td>X</td>
<td>X</td>
<td>X</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td align="left">Sentry Switch CDU - PDU</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td align="left">VMWare</td>
<td>X</td>
<td>X</td>
<td>X</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td align="left">Virsh (virtual systems)</td>
<td>X</td>
<td>X</td>
<td>X</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

`*` The 'Facebook's Wedge' OpenBMC power driver is considered experimental at this time.

<!-- LINKS -->


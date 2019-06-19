<!--
Todo:
- Display test output (require metal-based nodes)
-->
A node's underlying machine can optionally have its hardware tested using well-known Linux utilities.

Such testing can be performed on a node with a status of 'Ready' (i.e. recently commissioned), broken or on a deployed node.

Testing can also be included as part of the commissioning process. The dialog (described below) will be displayed when the 'Commission' action is chosen. Be aware that if the hardware tests fail the node will become unavailable for Deployment.

[note]
The majority of testing scripts only work with nodes that are backed by physical hardware (e.g. they may be incompatible with KVM-based nodes).
[/note]

<h2 id="heading--apply-a-hardware-test">Apply a hardware test</h2>

To launch a test, select the target machine from the 'Machines' page and use the 'Take action' drop-down menu to select 'Test hardware'. When ready, hit the 'Test machine' button. Here, a test is being applied to a deployed node:

![hw test deployed node](../media/nodes-hw-testing__2.4_deployed.png)

There is the option of not powering off the node and to allow SSH access.

A default test will be selected (`smartctl-validate`, a hard drive test) but others can be chosen by clicking the 'Select scripts' label. Doing so will reveal the following choices:

![hw test deployed node choices](../media/nodes-hw-testing__2.4_deployed-choices.png)

<h2 id="heading--included-scripts">Included scripts</h2>

The following hardware testing scripts can be selected from the web UI:

<table style="width:17%;">
<colgroup>
<col width="5%" />
<col width="5%" />
<col width="5%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Name</th>
<th align="center">Category Tags</th>
<th align="center">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>smartctl-short</strong></td>
<td align="center">storage</td>
<td align="center">Run the short SMART self-test and validate SMART health on all drives in parallel</td>
</tr>
<tr class="even">
<td align="center"><strong>smartctl-long</strong></td>
<td align="center">storage</td>
<td align="center">Run the long SMART self-test and validate SMART health on all drives in parallel</td>
</tr>
<tr class="odd">
<td align="center"><strong>smartctl-conveyance</strong></td>
<td align="center">storage</td>
<td align="center">Run the conveyance SMART self-test and validate SMART health on all drives in parallel</td>
</tr>
<tr class="even">
<td align="center"><strong>memtester</strong></td>
<td align="center">memory</td>
<td align="center">Run memtester against all available userspace memory.</td>
</tr>
<tr class="odd">
<td align="center"><strong>internet-connectivity</strong></td>
<td align="center">network, internet, node</td>
<td align="center">Check if the system has access to the internet.</td>
</tr>
<tr class="even">
<td align="center"><strong>stress-ng-cpu-long</strong></td>
<td align="center">cpu</td>
<td align="center">Run stress-ng memory tests for 12 hours.</td>
</tr>
<tr class="odd">
<td align="center"><strong>stress-ng-cpu-short</strong></td>
<td align="center">cpu</td>
<td align="center">Run stress-ng memory tests for 5 minutes.</td>
</tr>
<tr class="even">
<td align="center"><strong>stress-ng-memory-long</strong></td>
<td align="center">memory</td>
<td align="center">Run stress-ng memory tests for 12 hours.</td>
</tr>
<tr class="odd">
<td align="center"><strong>stress-ng-memory-short</strong></td>
<td align="center">memory</td>
<td align="center">Run stress-ng memory tests for 5 minutes.</td>
</tr>
<tr class="even">
<td align="center"><strong>ntp</strong></td>
<td align="center">network, ntp, node</td>
<td align="center">Run ntp clock set to verify NTP connectivity.</td>
</tr>
<tr class="odd">
<td align="center"><strong>badblocks</strong></td>
<td align="center">storage</td>
<td align="center">Run badblocks on disk in read-only mode.</td>
</tr>
<tr class="even">
<td align="center"><strong>badblocks-destructive</strong></td>
<td align="center">destructive, storage</td>
<td align="center">Run badblocks on a disk in read/write destructive mode.</td>
</tr>
<tr class="odd">
<td align="center"><strong>7z</strong></td>
<td align="center">cpu</td>
<td align="center">Run <em>7zip</em> CPU benchmarking.</td>
</tr>
<tr class="even">
<td align="center"><strong>fio</strong></td>
<td align="center">storage, destructive</td>
<td align="center">Run Fio benchmarking against selected storage devices.</td>
</tr>
</tbody>
</table>

After either commissioning, testing, or installation has started, MAAS reports in real time which script is running.

The verbatim output from any tests is accessed by selecting a node, selecting the 'Hardware tests' page and clicking on the 'Log view' link in the 'Results' column for the specific test.

See [Commissioning and Hardware Testing Scripts](nodes-scripts.md) for more details on how these scripts work and how you can write your own.

<!-- LINKS -->
<!-- IMAGES -->


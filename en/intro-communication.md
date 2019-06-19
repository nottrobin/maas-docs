<h2 id="heading--machinerack">Machine/rack</h2>

In multi-region/rack clusters (i.e. HA clusters), all machine communication with MAAS is proxied through rack controllers, including HTTP metadata, DNS, syslog and APT (proxying via Squid). Note that in single-region/rack clusters, the region controller manages communication.

Proxying through rack controllers is useful in environments where communication between machines and region controllers is restricted.

MAAS creates an internal DNS domain, not manageable by the user, and a special DNS resource for each subnet that is managed by MAAS. Each subnet includes all rack controllers that have an IP on that subnet. Booting machines use the subnet DNS resource to resolve the rack controller available for communication. If multiple rack controllers belong to the same subnet, MAAS uses a round-robin algorithm to balance the load across multiple rack controllers. This ensures that machines always have a rack controller.

Machines use this internal domain for HTTP metadata queries, APT (proxying via Squid), and Syslog. DNS queries, PXE booting, and NTP polls use IP addresses.

The rack controller installs and configures `bind` as a forwarder. All machines communicate via the rack controller directly.

[note]
Zone management and maintenance still happen within the region controller.
[/note]

<h2 id="heading--rackregion">Rack/region</h2>

Each rack controller must be able to initiate TCP connections on the following ports:

<table style="width:76%;">
<colgroup>
<col width="22%" />
<col width="54%" />
</colgroup>
<thead>
<tr class="header">
<th>Port(s)</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><code>5240</code></td>
<td>HTTP communication with each region controller. Note that port <code>80</code> is typically used in high-availability environments. See <a href="manage-ha.md">MAAS HA</a>.</td>
</tr>
<tr class="even">
<td><code>5241</code> - <code>5247</code></td>
<td>Reserved for internal MAAS services.</td>
</tr>
<tr class="odd">
<td><code>5248</code></td>
<td>Reserved for <a href="#http">rack HTTP</a> communication.</td>
</tr>
<tr class="even">
<td><code>5250</code> - <code>5270</code></td>
<td>Reserved for region workers (RPC).</td>
</tr>
</tbody>
</table>

<h2 id="heading--http">HTTP</h2>

The rack controller installs `nginx`, which serves as a proxy and as an HTTP server, binding to port 5248. Machines contact the metadata server via the rack controller.

<h2 id="heading--syslog">Syslog</h2>

See [Syslog](installconfig-syslog.md) for more information about MAAS syslog communication as well as how to set up a remote syslog server.

<!-- LINKS -->


Syslog can be a useful tool for debugging MAAS issues. MAAS uses syslog to gather logs from the enlistment, commissioning and deployment processes and proxies them through the rack controllers, which send them to all region controllers.

<h2 id="heading--path">Path</h2>

Syslog data is kept in `/var/log/maas/rsyslog/<machine-name><yyyy-mm-dd>/messages`. Every machine known to MAAS will have corresponding syslogs.

<h2 id="heading--using-a-remote-syslog-server">Using a remote syslog server</h2>

To add a remote syslog server, click the Settings tab and then click the Network services tab. Scroll down to the Syslog section, where you can add a syslog URL or IP:

![remote_syslog](../media/installconfig-syslog__2.6-remote-syslog.png)

Click the Save button to save your changes.

[note]
Note that MAAS controllers' syslogs are *not* forwarded to the external syslog server -- only machine syslog information is forwarded.
[/note]

See [MAAS CLI](manage-cli-advanced.md#heading--add-or-update-a-remote-syslog-server) to learn how to add a remote syslog server using the CLI.

<!-- LINKS -->


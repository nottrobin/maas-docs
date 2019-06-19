<!--
Todo:
- Track bug: https://goo.gl/Yifghb
-->
<h2 id="heading--install-from-snap">Install from snap</h2>

[Snaps](https://snapcraft.io/docs) are containerised software packages. To install MAAS from a *snap*, simply enter the following:

``` bash
sudo snap install maas --devmode --stable
```

After entering your password, the snap will download and install from the *stable* channel. However, MAAS needs initialising before it's ready to go.

[note]
`--devmode` is currently a required argument and gives the MAAS snap access to all system resources, similar to an installed `deb` package.
[/note]

<h2 id="heading--initialisation">Initialisation</h2>

The next step involves initialising MAAS with a *run mode*. Selecting one of the following modes dictates what services will run on the local system:

| Mode          | Region | Rack | Database | Description                           |
|---------------|--------|------|----------|---------------------------------------|
| `all`         | X      | X    | X        | All services                          |
| `region`      | X      |      |          | Region API server only                |
| `rack`        |        | X    |          | Rack controller only                  |
| `region+rack` | X      | X    |          | Region API server and rack controller |
| `none`        |        |      |          | Deinitializes MAAS and stops services |

[note type="caution"]
This list is different from the installation scenarios covered in the package install method (see [Install from packages][install-from-packages]) where the installation of a "region controller" **will**, for example, include a database.
[/note]

To initialise MAAS and select a run mode, use the `maas init` command with the *--mode* argument.

<h3 id="heading--example">Example</h3>

The following demonstrates the `all` mode, a popular initialisation choice for MAAS:

``` bash
sudo maas init --mode all
```

A dialog will appear that will gather some basic information:

``` no-highlight
MAAS URL [default=http://10.55.60.1:5240/MAAS]: http://192.168.122.1:5240/MAAS
Create first admin account:       
Username: admin
Password: ******
Again: ******
Email: admin@example.com
Import SSH keys [] (lp:user-id or gh:user-id): lp:petermatulis
```

[note]
The username and password will be used to access the web UI and if you enter a [Launchpad](https://launchpad.net/) or [GitHub](https://github.com) account name with associated SSH key, these will be imported into MAAS automatically.
[/note]

<h3 id="heading--maas-url">MAAS URL</h3>

All run modes (except `none`) prompt for a MAAS URL, which is interpreted differently depending on the mode:

-   `all`, `region+rack`: Used to create a new region controller as well as to tell the rack controller how to find the region controller.
-   `region`: Used to create a new region controller.
-   `rack`: Used to locate the region controller.

<h3 id="heading--shared-secret">Shared secret</h3>

The 'rack' and 'region+rack' modes will additionally ask for a shared secret that will allow the new rack controller to register with the region controller.

<h3 id="heading--reinitialising-maas">Reinitialising MAAS</h3>

To re-initialise MAAS, for example, to switch from `rack` to `region`:

``` bash
sudo maas init --mode region
```

<h3 id="heading--additional-init-options">Additional `init` options</h3>

The `init` command can take a number of optional arguments. To list them all as well as read a brief description of each:

``` bash
sudo maas init --help
```

<h2 id="heading--configuration-verification">Configuration verification</h2>

After a *snap* installation of MAAS, a verification of the currently running configuration can be done with:

``` bash
sudo maas config
```

Sample output (for mode 'all'):

``` no-highlight
Mode: all
Settings:
maas_url=http://192.168.122.1:5240/MAAS
```

<h2 id="heading--service-statuses">Service statuses</h2>

The status of running services can likewise be checked:

``` bash
sudo maas status
```

Sample output (for mode 'all'):

``` no-highlight
bind9                            RUNNING   pid 7999, uptime 0:09:17
dhcpd                            STOPPED   Not started
dhcpd6                           STOPPED   Not started
ntp                              RUNNING   pid 8598, uptime 0:05:42
postgresql                       RUNNING   pid 8001, uptime 0:09:17
proxy                            STOPPED   Not started
rackd                            RUNNING   pid 8000, uptime 0:09:17
regiond:regiond-0                RUNNING   pid 8003, uptime 0:09:17
regiond:regiond-1                RUNNING   pid 8008, uptime 0:09:17
regiond:regiond-2                RUNNING   pid 8005, uptime 0:09:17
regiond:regiond-3                RUNNING   pid 8015, uptime 0:09:17
tgt                              RUNNING   pid 8040, uptime 0:09:15
```

With MAAS installed and initialised, you can now open the web UI in your browser. See [Access the web UI](installconfig-webui.md#heading--access-the-web-ui) for further details.

<!-- LINKS -->


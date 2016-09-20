  - title: Introduction

    children:
      - title: About MAAS
        location: index.html

      - title: Management summary
        location: intro-management.html

      - title: Concepts and terms
        location: intro-concepts.html

      - title: Architectural overview
        location: intro-architecture.html

  - title: Install & Configure
    children:

      - title: Installation
        location: installconfig-install.html
        children:

          - title: Install from Ubuntu Server ISO
            location: installconfig-server-iso.html

          - title: Install from packages
            location: installconfig-package-install.html

          - title: Install into LXD
            location: installconfig-lxd-install.html

          - title: Upgrade from 1.9 to 2.0
            location: installconfig-upgrade-to-2.html

      - title: Access the GUI
        location: installconfig-gui.html

      - title: Configure zones
        location: installconfig-zones.html

      - title: Configure network
        location: installconfig-network2.html
        children:

          - title: Static IPs
            location: installconfig-network-static.html

          - title: IPv6
            location: installconfig-network-ipv6.html

          - title: Proxy
            location: installconfig-proxy.html

          - title: STP
            location: installconfig-network-stp.html

      - title: Nodes
        children:

          - title: Rack Controller
            location: installconfig-rack.html
            children:

              - title: DHCP
                location: installconfig-dhcp.html

              - title: Storage
                location: installconfig-storage.html
                children:

                  - title: Block Devices
                    location: installconfig-block.html

                  - title: Partitions
                    location: installconfig-partitions.html

          - title: Add Nodes
            location: installconfig-add-nodes.html

          - title: Tags
            location: installconfig-tags.html

          - title: Kernel Boot Options
            location: installconfig-kernel.html

          - title: HWE kernels
            location: installconfig-hwe-kernels.html

      - title: Images
        location: installconfig-images.html
        children:

          - title: Selection and Import
            location: installconfig-images-import.html

          - title: Local Image Mirror
            location: installconfig-images-mirror.html

  - title: Manage MAAS
    children:

      - title: User Accounts
        location: manage-account.html
        children:

          - title: Add User
            location: manage-account.html#add-a-user

          - title: SSH Keys
            location: manage-account.html#ssh-keys

          - title: API Key
            location: manage-account.html#api-key

          - title: Change the password
            location: manage-account.html#change-the-password

      - title: High Availability (HA)
        location: manage-maas-ha.html
        children:

            - title: Rack Controller HA
              location: manage-maas-ha.html#rack-controller-ha

            - title: Region Controller HA
              location: manage-maas-ha.html#region-controller-ha

            - title: Deploy HA with Juju
              location: manage-maas-ha.html#deploy-ha-with-juju

      - title: Power Driver Capabilities
        location: manage-power.html

      - title: MAAS CLI
        location: manage-cli.html
        children:

            - title: Common Tasks
              location: manage-cli-common.html

            - title: Image Management
              location: manage-cli-images.html

            - title: DHCP Snippets
              location: manage-cli-dhcp-snippets.html

            - title: Advanced Tasks
              location: manage-cli-advanced.html

  - title: Troubleshoot
    children:

      - title: FAQ
        location: troubleshoot-faq.html

      - title: Getting help
        location: troubleshoot-getting-help.html

  - title: Release notes
    location: ref-release-notes.html

  - title: Developer Guide
    location: http://maas.ubuntu.com/docs/index.html#developing-maas

  - title: API Documentation
    location: http://maas.ubuntu.com/docs/api.html

  - title: Help improve these docs
    location: contributing.html

  - title: Report a docs issue
    location: https://github.com/CanonicalLtd/maas-docs/issues/new

The two types of IP ranges are explained in the [Concepts and terms](intro-concepts.md#ip-ranges) page. The current page shows how to manage them. Specifically, it will show how to:

-   Create a range
-   Edit a range
-   Delete a range

All three actions require administrative privileges and begin by accessing the 'Subnets' page, selecting the desired subnet, and scrolling down to the 'Reserved' section.

## Create a range

Choose 'Reserve range' or 'Reserve dynamic range'. If the latter is chosen, MAAS will automatically provide DHCP for enlistment and commissioning provided that the associated VLAN has DHCP enabled. Read the [DHCP page](installconfig-network-dhcp.md).

When either of those two options are chosen a window will appear allowing you to enter start and end addresses for the range as well as a comment.

Below is an example window when creating a 'reserved range' (both windows are actually identical):

![reserved IP range](../media/installconfig-network-ipranges__2.4_add-reserved-iprange.png)

Click the 'Reserve' button when done.

See [MAAS CLI](manage-cli-common.md#create-a-reserved-ip-range) for doing this with the CLI.

## Edit a range

Click the 'Menu' button at the far right of the row corresponding to the subnet in question and select 'Edit reserved range' from the menu that appears. Edit the fields as desired and click the 'Save' button.

## Delete a range

Select 'Remove range' from the menu that appears when clicking the 'Menu' button at the far right of the row corresponding to the subnet in question.

<!-- LINKS -->


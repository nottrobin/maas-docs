Resource pools allow administrators to logically group resources (nodes and pods) into pools. All MAAS installations have a resource pool named "default." New machines are automatically added to the default resource pool.

<h2 id="heading--web-ui">Web UI</h2>

See [Web UI](installconfig-webui.md) for how to get started with the web UI.

Administrators can manage resource pools on the Machines page under the Resource pools tab.

<h2 id="heading--add-a-resource-pool">Add a resource pool</h2>

Use the Add pool button to add a new resource pool.

After giving your new pool a name and description, click the Add pool button:

![add resource pool](../media/nodes-resource-pools__2.5_add-pool.png)

<h2 id="heading--deleting-a-resource-pool">Deleting a resource pool</h2>

To delete a resource pool, click the trashcan icon next to the pool.

![add resource pool](../media/nodes-resource-pools__2.5_delete-pool.png)

[note]
If you delete a resource pool, all machines that belong to that resource pool will be returned back to the default pool.
[/note]

<h2 id="heading--add-a-node-to-a-resource-pool">Add a node to a resource pool</h2>

To add a machine to a resource pool, on the Machines page, select the machine you want to add to the resource pool. Next, select the Configuration tab. Now select the resource pool and click the Save changes button.

![add resource pool](../media/nodes-resource-pools__2.5_add-machine.png)

<h2 id="heading--removing-a-node-from-a-resource-pool">Removing a node from a resource pool</h2>

To remove a machine from a resource pool, simply follow the same procedure to add a node, except select "default" as the new resource pool. This will return the machine back to the default resource pool.

<h2 id="heading--add-a-pod-to-a-resource-pool">Add a pod to a resource pool</h2>

You can add a pod to a resource pool when you create a new pod (see [Pods](nodes-comp-hw.md#heading--add-a-pod)), or you can edit a pod's configuration:

![add_pod_to_pool](../media/nodes-resource-pools__2.5_pod_to_pool.png)

<h2 id="heading--removing-a-pod-from-a-resource-pool">Removing a pod from a resource pool</h2>

To remove a pod from a resource pool, simply follow the same procedure to add a pod to a resource pool, except select "default" as the new resource pool. This will return the machine back to the default resource pool.

<!-- LINKS -->


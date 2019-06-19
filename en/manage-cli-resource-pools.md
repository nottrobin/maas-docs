This is a list of resource-pool management tasks to perform with the MAAS CLI. See [MAAS CLI](manage-cli.md) on how to get started and [Resource pools](nodes-resource-pools.md) for an explanation of the subject.

## Creating a resource pool

Here's an example that demonstrates how to create a new resource pool named `myresource`.

``` bash
maas $PROFILE resource-pools create name=myresource description="A new resource pool."
```

[note]
The `description` field is optional.
[/note]

## List available resource pools

``` bash
maas $PROFILE resource-pools read
```

## List a single resource pool

``` bash
maas $PROFILE resource-pool read $RESOURCE_POOL_ID
```

## Update a resource pool

``` bash
maas $PROFILE resource-pool update $RESOURCE_POOL_ID name=newname description="A new description."
```

[note]
The `name` and `description` fields are optional.
[/note]

## Delete a resource pool

``` bash
maas $PROFILE resource-pool delete $RESOURCE_POOL_ID
```

## Add a machine to a resource pool

``` bash
maas $PROFILE machine update $SYSTEM_ID pool=$POOL_NAME
```

<!-- LINKS -->


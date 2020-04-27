Instructions for Providers/Sources Publishing Large Datasets
=======

_This is part of the Instructions for Replicating Large Amounts of Data. Please read the [Overview](README.md) before proceeding._

If you have datasets on your machine and want to add them to ipfs so you can serve them over the network, follow these instructions. They will walk you through using ipfs-pack to register and serve your data.

By contrast, if you want to mirror data that someone else has published, you can follow [Instructions for Mirrors Replicating Large Datasets](mirrors-instructions.md) to efficiently replicate the data onto your IPFS node.

## TL;DR.

If you just want to run the commands without explanation, here's what you need to do. _This assumes that you've already installed [ipfs-pack](https://github.com/ipfs/ipfs-pack)._

It's best if you do this on a machine that has a public IP address.

```
cd /path-to-your/dataset-directory
ipfs-pack make
ipfs-pack serve
```

And then retrieve the Pack Root and the multiaddr for the node you just started. This uses info that was printed out on the console when you ran `ipfs pack serve`. To learn how to retrieve the multiaddr, see [Step 2: Get the multiaddr of your node](#step-2-get-the-multiaddr-of-your-node) Give the multiaddr and Pack Root to the people who are setting up Mirrors.

## Step 1: Use ipfs-pack to serve your datasets

Follow the instructions in [the ipfs-pack tutorial](https://github.com/ipfs/ipfs-pack/blob/master/README.md), which covers installing ipfs-pack, initializing a pack, and serving the contents of your pack on the IPFS network.

## Step 2: Get the multiaddr of your node

This works best if you're running ipfs on a machine with a public IP address.

After starting the ipfs node with `ipfs-pack serve`, you will see some info about the node printed on the console. It will look like:

```
verified pack, starting server...
Serving data in this pack...
Peer ID: QmVbXV7mQ5Fs3tYY2Euek5YdkkzcRafUg8qGWvFdgaBMuo
    /ip4/127.0.0.1/tcp/58162
    /ip4/1.2.3.4/tcp/58162
Pack root is QmRguPt6jHmVMzu1NM8wQmpoymM9UeqDJGXdQyU3GhiPy4
Shared:      0 blocks, 0 B total data uploaded
```

The multiaddr is the public IPv4 address plus the Pack Peer ID, so for the sample output above, your pack's multiaddr would be `/ip4/1.2.3.4/tcp/58162/ipfs/QmVbXV7mQ5Fs3tYY2Euek5YdkkzcRafUg8qGWvFdgaBMuo`

The pack root in this sample is `QmRguPt6jHmVMzu1NM8wQmpoymM9UeqDJGXdQyU3GhiPy4`. This hash is the content-address for the ipfs-pack that contains your dataset.

## Step 3: Publish the Pack Root Hash and Give the multiaddr to your Mirrors

Give that multiaddr to the people who are setting up Mirrors. They will use the multiaddr to bootstrap their network connections based on your node. This will make the connections between your nodes more efficient because they're establishing point-to-point connections with your node.

The mirrors, and anyone else replicating your dataset, will also need the Pack Root hash. They will use that hash to pin your dataset onto their nodes.

Instructions for Replicating Large Amounts of Data with Minimal Overhead
====

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Who should use these instructions?](#who-should-use-these-instructions)
- [Instructions for Providers/Sources](#instructions-for-providerssources)
	- [TL;DR.](#tldr)
	- [Step 1: Use ipfs-pack to serve your datasets](#step-1-use-ipfs-pack-to-serve-your-datasets)
	- [Step 2: Get the multiaddr of your node](#step-2-get-the-multiaddr-of-your-node)
- [Instructions for Mirrors](#instructions-for-mirrors)
	- [TL;DR.](#tldr)
	- [Step 1: Install and Initialize IPFS](#step-1-install-and-initialize-ipfs)
	- [Step 2: Turn off the Noisy Bits](#step-2-turn-off-the-noisy-bits)
	- [Step 3: Manually Set Up Routing](#step-3-manually-set-up-routing)
	- [Step 4: Run the node with auto-routing turned off](#step-4-run-the-node-with-auto-routing-turned-off)
	- [Step 5: Pin the Data on Your node](#step-5-pin-the-data-on-your-node)

<!-- /TOC -->

# Who should use these instructions?

These instructions apply to either of these cases:
* You are replicating data between a set of known peers.
* You want to set up a _seed node_ with a public IP address that everyone can pull the initial copies of the data from.

For example, after Jack [downloads all of the data.gov datasets](https://github.com/ipfs/archives/issues/113), he needs a way to let his collaborators replicate the datasets efficiently. Eventually they will all be able to serve the data on the general, distributed network of IPFS peers, but the first priority is to pass complete replicas to the collaborators who've allocated enough storage to hold the entire dataset. Once they've populated those seed nodes, it will be easier to provide the data to the rest of the network.

In order to make this replication process as efficient as possible, we turn off the DHT and peer auto-discovery features. These features are important, amazing parts of IPFS but they slow down the system, eat up a bunch of bandwidth, and they're not needed in a situation where you already know which nodes you'll be communicating with.

# Instructions for Providers/Sources

If you have datasets on your machine and want to serve them over the network, follow these instructions. They will walk you through using ipfs-pack to register and serve your data.

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

Follow the instructions in [the ipfs-pack tutorial](https://github.com/ipfs/ipfs-pack/blob/master/tutorial/README.md), which covers installing ipfs-pack, initializing a pack, and serving the contents of your pack on the IPFS network.

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

The pack root in this sample is `QmRguPt6jHmVMzu1NM8wQmpoymM9UeqDJGXdQyU3GhiPy4`.

Give that multiaddr to the people who are setting up Mirrors. They will use the multiaddr to bootstrap their network connections based on your node. This will make the connections between your nodes more efficient because they're establishing point-to-point connections with your node.

# Instructions for Mirrors

If you want to mirror data that someone else has published, you can follow these instructions to efficiently replicate the data onto your IPFS node.

## TL;DR.

If you just want to run the commands without explanation, here's what you need to do. _This assumes that you've already [installed ipfs](https://flyingzumwalt.gitbooks.io/decentralized-web-primer/content/install-ipfs/lessons/download-and-install.html) -- you need version 0.4.5 or higher._

Before doing these steps, you need to get the multiaddr of the provider node that you're replicating data from and the pack root of the dataset you're replicating. The multiaddr will look like  `/ip4/1.2.3.4/tcp/9999/ipfs/QmIpfsPackPeerId`. The Pack Root hash will look like `QmRguPt6jHmVMzu1NM8wQmpoymM9UeqDJGXdQyU3GhiPy4` In these instructions, these values have been replaced with MULTIADDR-OF-PROVIDER and PACK-ROOT-HASH because they are unique for every node.

```
ipfs init
ipfs config --json Datastore.NoSync true
ipfs config Reprovider.Interval "0"
ipfs bootstrap rm --all
ipfs bootstrap add MULTIADDR-OF-PROVIDER

# then start the daemon without auto-routing:
ipfs daemon --routing=none

# then pin the data on your node
ipfs pin PACK-ROOT-HASH
```

## Step 1: Install and Initialize IPFS

If you have not already installed IPFS, follow the lesson on [Installing and Initializing IPFS](https://flyingzumwalt.gitbooks.io/decentralized-web-primer/content/install-ipfs/) in the Decentralized Web Primer.  _You need ipfs version 0.4.5 or higher._

## Step 2: Turn off the Noisy Bits

These arguments will turn off some IPFS features that are important for everyday use of IPFS, but would slow down the process of replicating the datasets. After replicating the datasets, you can turn them back on and restart your ipfs node.

```
ipfs config --json Datastore.NoSync true
ipfs config Reprovider.Interval "0"
```

## Step 3: Manually Set Up Routing

Before starting the daemon, configure your node to connect directly with the main node that's providing your dataset. To do this, you need the multiaddr for that node.

When you run these commands, replace `MULTIADDR-OF-PROVIDER` with the multiaddr you got from the people who are providing the source dataset.

```
ipfs bootstrap rm --all
ipfs bootstrap add MULTIADDR-OF-PROVIDER
```

## Step 4: Run the node with auto-routing turned off

Make sure you've manually configured routing before you start the daemon (see previous step).

Start the ipfs daemon with auto-routing turned off:

```
ipfs daemon --routing=none
```

## Step 5: Pin the Data on Your node

Now you're ready to replicate the data by pinning it onto your ipfs node. To do this, you need the Root Hash of the datasets. You need to get that PACK-ROOT-HASH from the people who are providing the dataset.

```
ipfs pin PACK-ROOT-HASH
```

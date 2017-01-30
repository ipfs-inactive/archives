Instructions for Mirrors Replicating Large Datasets
======

_This is part of the Instructions for Replicating Large Amounts of Data. Please read the [Overview](README.md) before proceeding._

If you want to mirror data that someone else has published, you can follow these instructions to efficiently replicate the data onto your IPFS node.

By contrast, if you have datasets on your machine and want to add them to ipfs so you can serve them over the network, follow the [Instructions for Providers/Sources Publishing Large Datasets](providers-instructions.md).

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

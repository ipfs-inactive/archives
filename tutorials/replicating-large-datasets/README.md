Instructions for Replicating Large Amounts of Data with Minimal Overhead
====

## Who should use these instructions?

The instructions here apply to either of these cases:
* You are replicating data between a set of known peers.
* You want to set up a _seed node_ with a public IP address that everyone can pull the initial copies of the data from.

For example, after Jack [downloads all of the data.gov datasets](https://github.com/ipfs/archives/issues/113), he needs a way to let his collaborators replicate the datasets efficiently. Eventually they will all be able to serve the data on the general, distributed network of IPFS peers, but the first priority is to pass complete replicas to the collaborators who've allocated enough storage to hold the entire dataset. Once they've populated those seed nodes, it will be easier to provide the data to the rest of the network.

In order to make this replication process as efficient as possible, we turn off the DHT and peer auto-discovery features. These features are important, amazing parts of IPFS but they slow down the system, eat up a bunch of bandwidth, and they're not needed in a situation where you already know which nodes you'll be communicating with.

## Different Instructions for Sources and Mirrors

The instructions here depend on whether you are **providing** new data onto the ipfs network or seeking to replicate and **mirror** data that someone else has already provided onto the network.

**Sources/Providers**: If you have datasets on your machine and want to add them to ipfs so you can serve them over the network, follow the [Instructions for Providers/Sources Publishing Large Datasets](providers-instructions.md). They will walk you through using ipfs-pack to register and serve your data.


**Mirrors**: If you want to mirror data that someone else has published, you can follow [Instructions for Mirrors Replicating Large Datasets](mirrors-instructions.md) to efficiently replicate the data onto your IPFS node.

![](https://ipfs.io/ipfs/QmbD39Nn6wUkf7HJucDMgZcSG1qd7RkvJrKM8a7iicR7Xq/ipfs-archives.png)

# IPFS Archives

One of the fundamental goals of IPFS is to improve archival storage of humanity's public record. This is a critically important endeavor. In particular, our highest priority is research artifacts -- scientific publications, data repositories, wikipedia, etc.

This repo helps us organize efforts. [See the efforts here](https://github.com/ipfs/archives/issues).

## Improving on the status quo of Archival

#### IPFS improves data storage

- **Chunking:** IPFS employs a clever chunking strategy: by default it uses Rabin Fingerprint chunking, a content-driven chunking algorithm that optimizes for finding duplicate data blocks. Chunking is also modular, so users can chunk data in whatever way is most useful to them. (we may employ diff-chunking in the future). This is particularly useful for special chunking of audio and video media.
- **Deduplication:** the chunking strategy allows IPFS to deduplicate vast amounts of data in large repositories.
- **Cryptographic Integrity:** the integrity of the data is protected and guaranteed by cryptography. Bitrot will be caught and not passed to the
user.

#### IPFS improves distribution

- **Bandwidth Sharing:** as a meshing protocol, IPFS can use the bandwidth of replicas, which act like seeds in a swarm, NOT traditional HTTP mirrors. These can be dedicated systems, or even users currently viewing the files. This reduces the bandwidth usage for servers, and improves the download bandwidth for end users.
- **Speed:** IPFS achieves blazing fast speeds and great bandwidth utilization by leveraging immutability, cryptographic integrity checks, and data locality in the network.
- **Replication:** it is easy to replicate an archive: `ipfs daemon --init & ipfs pin add -r <path>`. One needs only to follow the `HEAD` of the archive (a hash reference), and retrieve the latest additions to an archive. (Today in git, in the future in an IPNS name).
- **Collaboration:** the distribution model makes it extremely easy (one command) to replicate an archive for safe-keeping, and contribute bandwidth to the effort of serving it to others.

## Current Projects

Current archival efforts are being coordinated via [issues](https://github.com/ipfs/archives/issues).

Feel free to suggest other open-access archives by opening a new issue. [However, please ensure that data is under an appropriate license (such as Creative Commons), or you have obtained proper permission, before copying it to IPFS.] 

Some suggestions for possible future archival efforts can be found [here](https://github.com/ipfs/archives/wiki/Suggestions).


## Examples

- Arxiv.org CC-By Papers: https://ipfs.io/ipfs/QmfXH9XtP7xmoTH8WAp4HNSduqWMwLTH8B8TvbTkdgzNAa/


(TODO finish README)

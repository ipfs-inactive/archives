# IPFS Archives

One of the fundamental goals of IPFS is to improve humanity's archival of the public record. This is a critically important endeavor. In particular, our highest priority is research artifacts -- scientific publications, data repositories, etc.

This repo helps us organize efforts.

## Improving on the status quo of Archival

#### IPFS improves data storage

- **Chunking:** IPFS employs a clever chunking strategy: by default it uses Rabin Fingerprint chunking, a content-driven chunking algorithm that optimizes for finding duplicate data blocks. Chunking is also modular, so users can chunk data in whatever way is most useful to them. (we may employ diff-chunking in the future)
- **Deduplication:** the chunking strategy allows IPFS to deduplicate vast amounts of data in large repositories.
- **Cryptographic Integrity** the integrity of the data is protected and guaranteed by cryptography. Bitrot will be caught and not passed to the
user.

#### IPFS improves distribution

- **Bandwidth Sharing** as a meshing protocol, IPFS can use the bandwidth of replicas (mirrors), or even users currently downloading files, to reduce the bandwidth usage for servers, and improve the speed for end users.
- **Speed** by sharing bandwidth, and leveraging data locality in the network,IPFS can give blazing fast updates.
- **Replication** it is easy to replicate an archive: `ipfs daemon --init & ipfs pin add -r <path>`. One needs only to follow the `HEAD` of the archive, and grab the latest value of the museum root. (Today in git, in the future in an IPNS name)

## Current Projects

Current archival efforts are being coordinated via [issues](https://github.com/ipfs/archives/issues).

Feel free to suggest other open-access archives by opening a new issue. [However, please ensure that data is under an appropriate license (such as Creative Commons), or you have obtained proper permission, before copying it to IPFS.] Some suggestions for possible future archival efforts:

- [PLOS](https://www.plos.org/)
- [CORE](http://core.ac.uk/)
- conference proceedings (NIPS, UAI, ACL, AAAI, ICML, etc) - see [DBLP](http://dblp.uni-trier.de/)
- [JMLR](http://jmlr.org/)
- [PASCAL Network eprints](http://eprints.pascal-network.org/) (link currently broken)
- [DSpace@MIT](http://dspace.mit.edu/)
- [Project Euclid](http://projecteuclid.org/)
- a variety of [OAI](https://github.com/davidar/oai-sync)-accessible eprint archives, such as those listed on [OpenDOAR](http://opendoar.org)
- [Jaynes' (un)published works](http://bayes.wustl.edu/)
- R&D publications ([Google](http://research.google.com/pubs/papers.html), [Microsoft](http://research.microsoft.com/apps/catalog/default.aspx?t=publications), [Yahoo!](https://labs.yahoo.com/publications/), etc)
- [Orchid eprints](http://www.orchid.ac.uk/eprints/)

(TODO finish README)

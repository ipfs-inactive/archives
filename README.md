## This repository has been archived!

*This IPFS-related repository has been archived, and all issues are therefore frozen*. If you want to ask a question or open/continue a discussion related to this repo, please visit the [official IPFS forums](https://discuss.ipfs.io).

We archive repos for one or more of the following reasons:

- Code or content is unmaintained, and therefore might be broken
- Content is outdated, and therefore may mislead readers
- Code or content evolved into something else and/or has lived on in a different place
- The repository or project is not active in general

Please note that in order to keep the primary IPFS GitHub org tidy, most archived repos are moved into the [ipfs-inactive](https://github.com/ipfs-inactive) org.

If you feel this repo should **not** be archived (or portions of it should be moved to a non-archived repo), please [reach out](https://ipfs.io/help) and let us know. Archiving can always be reversed if needed.

---
   
# IPFS Archives (archives)

![banner](https://ipfs.io/ipfs/QmbD39Nn6wUkf7HJucDMgZcSG1qd7RkvJrKM8a7iicR7Xq/ipfs-archives.png)

[![](https://img.shields.io/badge/made%20by-Protocol%20Labs-blue.svg?style=flat-square)](http://ipn.io)
[![](https://img.shields.io/badge/project-IPFS-blue.svg?style=flat-square)](https://ipfs.io/)
[![](https://img.shields.io/badge/freenode-%23ipfs-blue.svg?style=flat-square)](https://webchat.freenode.net/?channels=%23ipfs)
[![](https://img.shields.io/badge/discussion_repo-go_to_issues-brightgreen.svg?style=flat-square)](https://github.com/ipfs/archives/issues)
[![](https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> Repo to coordinate archival efforts with IPFS

One of the fundamental goals of IPFS is to improve archival storage of humanity's public record. This is a critically important endeavor. In particular, our highest priority is research artifacts -- scientific publications, data repositories, wikipedia, etc.

This repo helps us organize efforts. [See the efforts in the issues](https://github.com/ipfs/archives/issues).

## Table of Contents

- [Improving on the status quo of Archival](#improving-on-the-status-quo-of-archival)
    - [IPFS improves data storage](#ipfs-improves-data-storage)
    - [IPFS improves distribution](#ipfs-improves-distribution)
- [Current Projects](#current-projects)
- [Examples](#examples)
- [Contribute](#contribute)
  - [Want to hack on IPFS?](#want-to-hack-on-ipfs)
- [License](#license)

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

## Maintainers

Captain: [@flyingzumwalt](https://github.com/flyingzumwalt)

If you're interested in captaining this repo, open an issue!

## Contribute

Feel free to join in! Look at the existing discussions [in the issues](https://github.com/ipfs/archives/issues), or [open an issue](https://github.com/ipfs/archives/issues/new) if you want to talk about something new. All welcome.

### Want to hack on IPFS?

[![](https://cdn.rawgit.com/jbenet/contribute-ipfs-gif/master/img/contribute.gif)](https://github.com/ipfs/community/blob/master/CONTRIBUTING.md)

## License

[CC-BY 3.0](https://creativecommons.org/licenses/by/3.0/us/) © 2016 Protocol Labs Inc.

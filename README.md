# Actually portable Zen-C

## Getting started

The easiest way to get started is to download `zc-boot.com` from the Releases page.

Known issues:
- Some systems may need `curl` utility available in `PATH` [see #1](https://github.com/OEvgeny/zc-ape/issues/1)
- Some systems may need `unzip` utility available in `PATH` [see #2](https://github.com/OEvgeny/zc-ape/issues/2)

## Development

After clonning the repo:

```bash
git clone https://github.com/OEvgeny/zc-ape.git
# or over ssh:
git clone git@github.com:OEvgeny/zc-ape.git
```

Run the following commands to obtain required tools and perform build

```bash
./boot-repo.com    # setup submodules, download unzip, zip, cosmocc, make into ./usr/bin
usr/bin/make       # build zc.com
```
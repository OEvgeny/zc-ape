# Actually portable Zen-C

## Getting started

The easiest way to get started is to download `zc-boot.com` from the Releases page.

## Development

After clonning the repo with submodules:

```bash
git clone --recursive git@github.com:OEvgeny/zc-ape.git        # ssh
# or 
git clone --recursive https://github.com/OEvgeny/zc-ape.git    # https

# or if already cloned
git clone git@github.com:OEvgeny/zc-ape.git
cd zc-ape
git submodule init
git submodule update
```

Run the following commands to obtain required tools and perform build

```bash
./boot-repo.com    # download unzip, zip, cosmocc into ./usr/bin
usr/bin/make       # build zc.com
```
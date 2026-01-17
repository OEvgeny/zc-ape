
<div align="center">

# Actually Portable Zen-C
**Zen-C toolchain powered by Cosmopolitan Libc and CosmoCC** 

[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge
)]()
<br>
[![Platforms](https://img.shields.io/badge/platforms_tested-Linux_x86_%7C_Linux_ARM_%7C_MacOS_x86-gray?style=for-the-badge
)]()

</div>

---

## Overview

**zc-ape** (Zen-C Actually Portable Executable) is a distribution of the [Zen-C transpiler](https://github.com/z-libs/Zen-C) built as an Actually Portable Executable (APE) using [Cosmopolitan Libc](https://github.com/jart/cosmopolitan). This project aims to bring all advantages of CosmoCC to the Zen-C growing ecosystem, so the produced binaries and compiler itself are runnable on multiple OSes and Archs.

---

## Getting Started

### Quick Start

The easiest way to get started is to download `zc-boot.com` from the [Releases page](https://github.com/OEvgeny/zc-ape/releases).

```bash
# Create a project dir
mkdir my-project
cd my-project

# Download zc-boot.com
curl -L -o zc-boot.com https://github.com/OEvgeny/zc-ape/releases/latest/download/zc-boot.com

# Make it executable
chmod +x zc-boot.com

# Run it (downloads toolchain and sets up environment)
./zc-boot.com

# Build and run the hello world example
usr/bin/make
./out/hello.com
```

**Upon running `zc-boot.com` does the following**
- Sets up `usr/bin` directory structure
- Downloads `cosmocc` toolchain
- Downloads `zip`/`unzip` utilities as APE binaries
- Downloads pre-built `zc.com` from this repo releases page
- Extracts example files (`hello.zc`, `Makefile`)
- Displays instructions for building your first Zen-C program

**Known Issues:**
- Some systems may need `curl` utility available in `PATH` [see #1](https://github.com/OEvgeny/zc-ape/issues/1)
- Some systems may need `unzip` utility available in `PATH` [see #2](https://github.com/OEvgeny/zc-ape/issues/2)
- Zen-C plugins are not currently supported in APE builds

---

## Development

### Building from Source

After cloning the repository:

```bash
git clone https://github.com/OEvgeny/zc-ape.git
# or over SSH:
git clone git@github.com:OEvgeny/zc-ape.git

cd zc-ape
```

Run the following commands to obtain required tools and perform the build:

```bash
./boot-repo.com    # Initialize submodules, download toolchain into ./usr/bin
usr/bin/make       # Build zc.com and zc-boot.com
```

### Build Outputs

The build process produces:

- **`out/bin/zc.com`**: The Zen-C compiler as an APE binary
  - Includes embedded standard library (`std.zc`, `std/`)
  - Can compile Zen-C source files to native executables
  
- **`out/bin/zc-boot.com`**: Bootstrap installer
  - Self-contained setup script for new projects

### Project Structure

```
zc-ape/
├── boot-repo.com          # Repository bootstrapper files
├── zc-ape/                # Zen-C APE entry point wrapper
│   └── zc_entry.c         # 
├── zc-boot/               # Bootstrap project files
│   ├── boot.zc            # 
├── third-party/Zen-C/     # Zen-C transpiler
└── usr/                   # Toolchain installation directory
    └── bin/               # 
```

### Building Custom APE Executables

To build your own Zen-C programs as APE binaries:

```bash
# Use the built zc.com compiler
out/bin/zc.com build --cc usr/bin/cosmocc -o myprogram.com myprogram.zc

# The resulting .com file runs on all platforms
./myprogram.com
```

---

## Credits

- **[Cosmopolitan Libc](https://github.com/jart/cosmopolitan)**: makes C/C++ a build-once run-anywhere language by [Justine Tunney](https://github.com/jart)
- **[Cosmocc](https://github.com/jart/cosmopolitan/tree/master/tool/cosmocc)**: C compiler producing APE binaries by [Justine Tunney](https://github.com/jart) and others (see [LEGAL](https://github.com/jart/cosmopolitan/tree/master/tool/cosmocc#legal) section)
- **[Zen-C](https://github.com/z-libs/Zen-C)**: Modern systems language with C compatibility by [z-libs](https://github.com/z-libs) team

---

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

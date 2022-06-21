---
title: Mosh - Mobile Shell
...

Mosh is more stable and friendly then SSH since mosh using UPD, and you'll never get Broken pipe again.

# Installation

> mosh server is in-built in mosh package:

Install for mac:

```bash
brew install --HEAD mosh
```

Install from source:

```
sudo apt install autoconf libssl-dev ncurses-dev protobuf-compiler

git clone https://github.com/mobile-shell/mosh
cd mosh
./autogen.sh
./configure
make
sudo make install
```
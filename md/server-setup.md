---
title: My Server Setups
...

My personal server is running on an ASUS old laptop with a HDD Drive and i5(gen 5), running Debian 15 inside private network.

This server will run with multiple services:

* Mastodon
* Seafile
* Matrix (setting up)

All services are running on docker or multipass (QEMU VM) to have easy management of each instances.

### Get docker

```js
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

### Mastodon

Setup of mastodon is quite simple, just follow the [offical setup guide](https://docs.joinmastodon.org/admin/install/) and you'll be fine.

But the problem is backing up.
---
title: Server Forwarding
public: true
...

> 這實際上是一片筆記，會針對我的情況進行紀錄

## 我的server是處在防火牆保護的network，且我無法更改其設定（也就是說我無法修改 port forwarding），在社區網路可能會出現一樣的情況

在這種情況下，我選擇的方案是「利用有一個公開 IP 的代理伺服器與處於 Private network 的 server 溝通」，在這種情況下有幾種選項

* 使用現有 Tunneling：你可以設定哪個port要forward到伺服器的哪個port，例如 Cloudflare - Zero Trust 的 Tunneling、ngrok（我原本使用的）
* 使用 SSH Tunneling：你可以設定哪個port要forward到伺服器的哪個port，非常的實用，而且通訊有SSH加密，但是只能TCP（其實可以，[這裡有解決方案](https://superuser.com/questions/53103/udp-traffic-through-ssh-tunnel)）
* 使用 VPN （例如 FOSS 的 OpenVPN）：無需任何 端口設定

> 請注意，所有中繼伺服器的方案，都會產生兩倍的傳輸數據。

# SSH Tunneling

任何 client 只要有裝 SSH 都可以使用

### Local Forwarding - 把自己的 server forward 到 host

```
ssh -L [host-bind_address:]<my-port>:<my-host>:<host-port> <SSH Server>
```

例如 我想要把我 local 的 8088 公開到 public server 的 80:

```
ssh -L 0.0.0.0:8088:localhost:80 admin@ljcu.cc
```

### Remote Forwarding - 把 server 的 port forward 到我的電腦

```
ssh -R [bind_address:]<port>:<host>:<host_port> <SSH Server>
```

例如 我想要把 host server 的 8088 拉到我的 8080 可以使用：

```
ssh -R 0.0.0.0:8088:localhost:8080 admin@ljcu.cc
```

### Dynamic Port Forwarding - 建立一個本地代理伺服器

example:

```
ssh -D [proxy-server-port] admin@ljcu.cc
```

> 更詳細的詳解可以參考：https://johnliu55.tw/ssh-tunnel.html


# VPN

使用 VPN 的好處就是可以無需轉介任何 port，在這裡使用 OpenVPN當作例子。

### Client side

沒有 public IP 的那個，例如我的 Raspberry pi。

安裝 OpenVPN：

```
curl -L https://install.pivpn.io | bash
```

```
sudo apt-get install openvpn
```

> 為 Raspberry pi 快速設定 OpenVPN Client： [https://pivpn.io/](https://pivpn.io/){target="blank"} 、 然後按照[步驟](https://thesecmaster.com/how-to-set-up-open-vpn-on-raspberry-pi/) 完成。


### Server side

有 public IP 的那個


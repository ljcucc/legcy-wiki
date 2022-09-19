---
title: IRC (Internet Relay Chat)
public: true
...

> this is my note of IRC

> I found out that there are too few IRC resources on the Internet, so I decided to make a complete guide to introduce IRC.

IRC, as known as internet relay chat. which is a kind of realtime web chat protocol.

unlike discord, Telegram or WhatsApp, IRC only do what "protocol" do, transfer message and sort of things. IRC also have features, like channels (simluar to rooms in Telegram, and same as discord's channel), or modes (simular to discord roles), and DMs.

IRC using **server-client model, so you'll need a IRC server and a IRC Client. because IRC is a "protocol", so suppliers of software will not monopolize the market of IRC softwares.

# Servers

you can host a server yourself, but most of the time people will using an existing server to work with, like ~~freenode~~(long live freenode) or libera. (like the way of discord and telegram, but using the same client).

# Client

Some concept you need to know before get started:

## Knowledge before start

### Accounts (username), nicknames, real names

* Login IRC without a password with **username** and **real name**.
* nickname is the id that you're using on IRC channels (like mentions, picking person, or so on...)
* nickname sometimes is not reservable, or sometimes reservable by anyone if without a registration.
* if you want to register an nickname, you need to register with a password and an email (sometimes), which may need a verification if reqiured email address.
* Sometimes, one username can have more then one nickname. but sometimes, one username only can have on nicknam, and sometime the username and the nickname must be the same.
* @ (at-ing) something is not reqiured adding (@) before nickname in IRC, but the notification of @-ing, is the responsibility of client application.
* nickname cannot be change after registered
* nickname cannot repeated in a server. But realname can.
* Real name is another identification of you.
* one device or one connect can have one nickname at a time. you cannot connect by using one nickname at two device at the same time.

### History and connection

bcs IRC just an protocol, so IRC will not have any  responsibility to store your chat history and keep you connect, you can only get message or record chat history when you're online, if you're offline you will miss the messages.

to record the message you miss, some server will have history playback, or some people will host an bot and record all the message.o

the common way to keep chat message is cloud based IRC, which will keep the connection even if you AFK. 

etc. IRCCloud (*paid*) , Convos (*selfhost*) , Weechat (*we will talk about it later*)

## TUI (Weechat)

> TUI a.k.a. Terminal User Interface

Weechat is the commonly seem application of IRC, weechat is an text-based or terminal based application, which also have some proxy and more awesome feature you can working on.

to downlaod it just type:

```bash
# debian or ubuntu
sudo apt update
sudo apt install weechat

# mac or linux
brew install weechat
```

> offical reference: https://weechat.org/files/doc/stable/weechat_quickstart.en.html

### Start connect to serevr

1. add a server

```
/server add [server-name] [server-address]/[port] [(optional) -ssl]
```

for example: 

```
/server add libera-nossl irc.libera.chat/6667

/server add libera-ssl irc.libera.chat/6697 -ssl
```

2. setup user username, nickname, password

```
/set irc.server.libera.username "My user name"
/set irc.server.libera.realname "My real name"
```

3. setup auto login on startup

```
/set irc.server.libera.command "/msg nickserv identify xxxxxxx"
```

4. start connection

```
/connect [server-name]
```

5. disconnect from server

```
/disconnect
```

### Login and register

#### login

```
/msg NickServ identify [your-nick-name] [password]
```

#### signup a nickname to your account (username)

1. change to an nickname
```
/nick [your-nick]
```

2. register an nickname
```
/msg NickServ register [your-password] [email]
```

3. follow the verify instruction to complete registeration.

### Join a channel or DM

join a channel:

```
/join #channel
```

> channel always started with (#), like discord

start a DM
```
/query Nickname
```

## Web Clients and clients applications

## Weechat Proxy Protocol

You can use weechat as an "server side", then connect weechat relay (server) with your client.

1. Set password:

```
/secure set relay [your-password]
/set relay.network.password "${sec.data.relay}"
```

2. Add relay:

```
/relay add ssl.irc 8000
```

> for more infomation, view the [offical document]( https://weechat.org/files/doc/stable/weechat_user.en.html#relay_weechat_protocol)

> npm package of Weechat protocol: https://www.npmjs.com/package/weechat

# Protocol

> TODO
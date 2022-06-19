---
title: Development on iPad
public: true
...

In this wiki, I'll showing 2 methods to doing dev on iPad. mostly locally, because if dev remotely isn't the definition of "dev on iPad". 

iPad is a device of in Apple Ecosystem, and with that native power, iPad can be the most powerful tools. but since Apple trying to software-lock the functionality of iPad (there's conspiracy says that Apple trying to cut the function of iPad in-order for the sells of mac), we can said that "Life finds a way", and so dose developers. In this docs, I trying to collecting and trying any possiable methods to dev on iPad.

> And also, this guide may works on iPhone. depending on apps compatibility and interfaces.

In general cases, you may need few apps:

* iSH - The core that let you dev on iPad, it's linux emulate environment that let you install package, operating system of alpine linux.
* Blink Shell - A awesome hyper terminal let you do terminal stuff out of the box.
* A VNC Viewer: you may need a VNC Viewer / Client to operate virtual (headless) monitor

IN specific cases, you may need different tools:

* Code Sandbox: Develop node.js apps and React Native Apps.
* Swift Playground: Develop Swift only application on iPad (and pay for the "Developer" license in-order to share your app to friends or run it on your iPhone).

# Terminal stuff

Frist, let introduce some terminal basic stuff to working on wonderful things.

in this section, you need two apps:

* iSH
* Blink Shell

> Blink shell is a open source hyper terminal, but because of the app store app licensing fee, Blink Shell have ads that remind you to giving developer loves by subscribing Blink+ plan for $600 NT a year. And the ad will popup for max 3 times a day, if you think this is annoying, you can try to compile yourself. I'll write step and references at the docs of the bottom.

the best feature of Blink Shell is it having some awesome features:

* multi-monitor support (without multi-monitor or external monitor support, looking at the 11-inch small screen all day can be painful and harmful to your eyes)
* Powerline fonts
* VSCode support (in iSH Shell case might not works, since iSH dosen't support scp and sftp).
* facecam: (A floating camera widget allows you to doing tutorial with your face expression)
* And more...

and beware, iSH will have some limitation (since 2022):

* SFTP, SCP server will not works (issue #955)
* GPU access (your GUI app can only run in frameBuffer)
* only 32 bits program
* No systemd
* No mounting folders or hard-drive.

in some basic cases, you can using terminal that iSH provide. but with some advence feature, iSH may not support. So you need Blink Shell:

# Blink Shell + iSH Shell

Blink Shell dose not have a proper shell or environment, said by the Carlos from Blink Shell: "Apple saids Your next computer is not a computer, cause your next computer will be a lot of computer." it'll be a lot of computer connects to each other .it's the concept of Blink Shell, instead of let things works on your iPad. they're focusing on how to work on iPad. You'll definitely loves how Blink Shell's team did.

To using iSH Shell's environment on Blink Shell, you need to setup SSH server in order to SSH from Blink Shell to iSH Shell. here's some command to do that:

```bash
apk update
apk add openssh
```

and proprely setup `/etc/ssh/sshd_config`, like: `Port 22000` or somthing. then setup Hosts by entering `config` on Blink Shell. for example `local` for alias, `localhost` for HostName, and setup key...

then `ssh [alias-name]`, you can use iSH shell from Blink Shell.

# iSH Shell + VNC

iSH is a Linux-like shell on iOS and iPadOS

## Install DWM and VNC

> Reference from the offical wiki: https://github.com/ish-app/ish/wiki/Running-a-VNC-Server

install dependencies:

```bash
apk add x11vnc x11vnc-doc xvfb xterm xorg-server xf86-video-dummy 
```

tools and dependencies for compiling DWM:

```bash
apk add gcc make libx11-dev libxft-dev 
```

clone dwm:

```bash
git clone https://git.suckless.org/dwm
cd dwm
```

> ref from the issue [1640](https://github.com/ish-app/ish/issues/1640), if you stuck on resolving while you clone, try stop it and run `git config --global pack.threads "1"` then try to clone again.

Disable xinerama in `config.mk` since dwm will only run in a virtual headless monitor of VNC.

then compile it:

```
make install
```

> compile may takes some times, on iPad Air 4 takes about less than 1 min.

then setup scripts and configs for vnc server:

```bash
if [ ! -e /etc/X11/xorg.conf.d ]; then
   mkdir -p /etc/X11/xorg.conf.d # If it doesn't exist, create it.
fi
```

headless xorg monitor config: 

```
cat <<HERE > /etc/X11/xorg.conf.d/10-headless.conf
Section "Monitor"
        Identifier "dummy_monitor"
        HorizSync 28.0-80.0
        VertRefresh 48.0-75.0
        DisplaySize  250 174    # In millimeters, iPad gen 7 & 8
EndSection

Section "Device"
        Identifier "dummy_card"
        VideoRam 256000
        Driver "dummy"
EndSection

Section "Screen"
        Identifier "dummy_screen"
        Device "dummy_card"
        Monitor "dummy_monitor"
        SubSection "Display"
           depth 24
           Modes "1024x768"  # Works OK on ~10 inch iPad's
 #          Modes "1280x1024"  # Likely to work on larger iPad
        EndSubSection
EndSection
HERE
```

create xinitrc:
```bash
cat <<THERE > /root/.xinitrc
exec dwm
THERE
```

then create a script to start vnc server: 

```bash
#!/bin/ash
#
# Stupidly simple script to start vnc.  

CHECK=`ps -o args | grep "{startx} /bin/sh /usr/bin/startx" | wc -l`

# Only run once.  The grep causes CHECK to equal 1
if [ $CHECK -eq 1 ]; then # Nothing running, clear stale locks
   rm -rf /tmp/.X* 
else
   echo "$0 is already running.  We're done here."
   exit 1
fi

# See if location services are running already.  
# Having them running reduces the odds of iSH getting
# killed while in the background.
CHECK=`ps -o args | grep "cat /dev/location" | wc -l`

# Only run once.  The grep causes CHECK to equal 1
if [ $CHECK -eq 1 ]; then
   cat /dev/location > /dev/null &
fi

startx &
x11vnc -display :0 -noshm -forever & 
```

### Install st terminal

clone st repo

```bash
git clone https://git.suckless.org/st
cd st
```

compile

```bash
make install
```

# Build Blink Shell from source

this will be a note for building from source since there's a lot of content that offcial already provided mroe clearly.

first, since 2022 (IDK what will happens after this docs created) v15 of Blink Shell is not stable version on Github (But offcial provide stable v15 app on app store and IDK why and how).

then you may need to checkout to branch `blink-14`. then follow the guide then you'll be fine.

> while you setup developer_setup.xcconfig, you may need the Develoepr ID of your Apple ID,visit apple's CloudKit website: icloud.developer.apple.com (type it yourself, I dont want to get into troble) and get it at the top of right with digits and upcase alphas.

And beware you can't build ipa then sideloads to AltStore since not having a paid Developer account.
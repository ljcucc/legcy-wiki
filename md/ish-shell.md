---
title: iSH Shell
public: true
...

iSH is a Linux-like shell on iOS and iPadOS

# Install DWM and VNC

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
xrdb -merge ~/.Xresources
xterm -geometry 80x50+494+51 &
xterm -geometry 80x20+494-0 &
exec dwm
THERE
```

Create .Xresources file: (if your using xterm, but I'm using st)
```
cat <<EVERYWHERE > /root/.Xresources
Xft.dpi: 264
xterm*VT100.Translations: #override \
    Ctrl <Key> minus: smaller-vt-font() \n\
    Ctrl <Key> plus: larger-vt-font() \n\
    Ctrl <Key> 0: set-vt-font(d)
EVERYWHERE
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
#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

#/usr/bin/xscreensaver -no-splash &
/usr/bin/xautolock -time 15 -locker slock &
feh --bg-scale --no-fehb ~/.wall
#PYTHONPATH="" udiskie &
udiskie &
unclutter &
urxvtd -f -o -q
~/.xmobar/conkyxmobar &
#dropbox start &
#u1sdtool -c &
#oneko -tofocus -speed 30 &
#stalonetray &
#mplayer "http://translate.google.com/translate_tts?tl=en&q=welcome+$(whoami)" &
trayer --edge top --widthtype request --SetDockType true --SetPartialStrut true --align right --margin 0 --height 16 --padding 0 --transparent true --alpha 0 --tint 0x1f1f1b&
#~/bin/mpdstart &
#notify-listener.py &
#mpdscribble &
#skype &
#automatic disable touchpad while typing
#syndaemon -t -k -i 2 -d &
# Start a D-Bus session
source /etc/X11/xinit/xinitrc.d/30-dbus
# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too:
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

#exec openbox-session
#exec ck-launch-session openbox-session
xmonad
# exec startxfce4
# ...or the Window Manager of your choice

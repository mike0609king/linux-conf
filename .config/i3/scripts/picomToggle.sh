if [ -z "$(pgrep picom)" ] ; then
  picom 
else 
  killall picom 
fi

if [ -z "$(pgrep compton)" ] ; then
  compton 
else 
  killall compton 
fi

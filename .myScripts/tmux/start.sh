#!/bin/sh

# Name of the session and names of the window
# with additional indizes
session="Background"

run="$session:1"
music="$session:2"
time1="$session:3"
time2="$session:4"
gaomon="$session:5"

# Making the session
tmux -2 new -d -s "$session"
  #lines="$(tput lines)"
  #columns="$(tput cols)"
  #tmux -2 new-session -d -x "$columns" -y "$lines" -s "$session"

tmux rename-window -t "$run" "Run"

# Music window
tmux new-window -t "$music" -n 'Music' "ncmpcpp;zsh"|| exit

# Window for Time1, Countdown and Mailing Schedules
tmux new-window -t "$time1" -n 'Time1' "zsh" || exit
tmux split-window -t "$time1"             -v -p 20   -d 'cd ~/.alarmTones;zsh' # for countdown
tmux split-window -t "$time1.{bottom}"    -h -p 60    -d 'cd ~/.myScripts/calcurse;zsh' # for mailing

# Window for Time2
tmux new-window -t "$time2" -n 'Time2' "cd ~/.config/calcurse/notes;zsh" || exit

# Window for gaomon
tmux new-window -t "$gaomon" -n 'Gaomon' "cd $apps/OpenTabletDriver;zsh" || exit

#tmux select-window -t "$run"
tmux select-window -t "$time1.{top}"


# Attach to session
tmux -2 attach-session -t "$session"

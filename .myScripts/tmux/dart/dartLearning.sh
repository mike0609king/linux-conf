#!/bin/sh

# Name of the session and names of the window
# with additional indizes
session="dart"

PlanAndLog="$session:1"
doc="$session:2"

# Making the session
tmux -2 new -d -s "$session"
  #lines="$(tput lines)"
  #columns="$(tput cols)"
  #tmux -2 new-session -d -x "$columns" -y "$lines" -s "$session"

tmux rename-window -t "$PlanAndLog" "P&L"
tmux send-key -t "$PlanAndLog" \
"cd '/media/sf_e/LearningAndDoc/GelernteSachenDoc/Informatik/Programmiersprachen/Dart/Plan and Log for learning/'" C-m \
"clear" C-m \
"vim 'Learning Dart.tex'" C-m 

# Music window
tmux new-window -t "$doc" -n 'doc'
tmux send-key -t "$doc" \
"cd /media/sf_e/LearningAndDoc/GelernteSachenDoc/Informatik/Programmiersprachen/Dart/Documentation" C-m \
"clear" C-m \ 
"vim 'My Dart Documentation.tex'" C-m

# Attach to session
tmux -2 attach-session -t "$session"

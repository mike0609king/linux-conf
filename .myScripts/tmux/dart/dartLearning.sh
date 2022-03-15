#!/bin/sh

# Name of the session and names of the window
# with additional indizes
session="dart"
PlanAndLog="$session:1"
doc="$session:2"

# Making the session
tmux -2 new -d -s "$session"

# First Window is the window for Plan And Log
tmux rename-window -t "$PlanAndLog" "P&L"
tmux send-key -t "$PlanAndLog" \
"cd '/media/sf_e/LearningAndDoc/GelernteSachenDoc/Informatik/Programmiersprachen/Dart/Plan and Log for learning/'" C-m \
"clear" C-m \
"vim 'Learning Dart.tex'" C-m 

# Documentation
tmux new-window -t "$doc" -n 'doc'
tmux send-key -t "$doc" \
"cd /media/sf_e/LearningAndDoc/GelernteSachenDoc/Informatik/Programmiersprachen/Dart/Documentation" C-m \
"clear" C-m \ 
"vim 'My Dart Documentation.tex'" C-m

# Attach to session
tmux -2 attach-session -t "$session"

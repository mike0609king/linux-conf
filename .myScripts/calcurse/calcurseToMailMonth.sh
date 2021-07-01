#!/bin/zsh

echo "Appointments:" >> calcurse_tmp.cal
calcurse -D ~/.config/calcurse -r30 --output-datefmt "%d/%m/%y" --format-apt " - %S -> %E\n\t%m\n%N" --format-event " * %m\n%N" >> calcurse_tmp.cal
echo "" >> calcurse_tmp.cal
calcurse -t --format-todo "(%p) %m\n %N" >> calcurse_tmp.cal
#sed -i "s/No note file found//" calcurse_tmp.cal
cat calcurse_tmp.cal | mail -s "Calendar This Month" "$1"
rm calcurse_tmp.cal

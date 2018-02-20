#!/bin/bash

if [[ -z "${SERVER_NAME}" ]]; then
  SERVER_NAME='Teeworlds [dckr-'$(pwgen)']'
fi

echo 'sv_name ' $SERVER_NAME >> /${GAME_TYPE}.cfg
echo "sv_rcon_password $(pwgen -s 12 1)" >> /${GAME_TYPE}.cfg
cat /${GAME_TYPE}.cfg

#initialize the connected file
connected=0
echo $connected > /tmp/connected

#capturing line by line on bash
#https://unix.stackexchange.com/questions/117501/in-bash-script-how-to-capture-stdout-line-by-line
exec stdbuf -oL /usr/games/teeworlds-server -f /${GAME_TYPE}.cfg | /stdoutprocessor.sh

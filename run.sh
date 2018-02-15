#!/bin/bash

if [[ -z "${SERVER_NAME}" ]]; then
  SERVER_NAME='Teeworlds [dckr-'$(pwgen)']'
fi

echo 'sv_name ' $SERVER_NAME >> /${GAME_TYPE}.cfg
echo "sv_rcon_password $(pwgen -s 12 1)" >> /${GAME_TYPE}.cfg
cat /${GAME_TYPE}.cfg
exec /usr/games/teeworlds-server -f /${GAME_TYPE}.cfg

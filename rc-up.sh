#!/bin/bash
ROCKET_VER=`curl -s https://api.github.com/repos/RocketChat/Rocket.Chat.Electron/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`
sudo dnf install -y https://github.com/RocketChat/Rocket.Chat.Electron/releases/download/${ROCKET_VER}/rocketchat-${ROCKET_VER}-linux-x86_64.rpm

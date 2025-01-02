#!/bin/bash

dir="/apps/homeserver/docker/appdata/gluetun/wireguard"
file="$dir/wg0.conf"
file_old="$dir/wg0.conf.old"
file_tmp="$dir/wg0.conf.tmp"

mv $file $file_tmp
mv $file_old $file
mv $file_tmp $file_old

bash /apps/homeserver/docker/mgmt.sh recreate media qbittorrentvpn

# mr-vercetti/homeserver
This is my home server project that I started because I value the privacy of my data, I don't like paying subscriptions and because self-hosting is really fucking cool.

## Services
All services are deployed using Docker compose and are run as a non-root user.

### Maintenance
* [ddclient](https://github.com/linuxserver/docker-ddclient) - DDNS
* [SWAG](https://github.com/linuxserver/docker-swag) - reverse proxy with SSL certbot and fail2ban
* [watchtower](https://github.com/containrrr/watchtower) - notifications about docker image updates

### Media
* [Jellyfin](https://github.com/linuxserver/docker-jellyfin) - media server
* [Radarr](https://github.com/linuxserver/docker-radarr) - movie collection manager
* [Sonarr](https://github.com/linuxserver/docker-sonarr) - TV show collection manager
* [Bazarr](https://github.com/linuxserver/docker-bazarr) - subtitle manager
* [delugevpn](https://github.com/binhex/arch-delugevpn) - torrent client with VPN and Privoxy

### Personal cloud
* [Nextcloud](https://github.com/linuxserver/docker-nextcloud) - filesync/cloud solution
  * [Redis](https://github.com/docker-library/redis) - cache service
  * [MariaDB](https://github.com/linuxserver/docker-mariadb) - database

### Other
* [Bitwarden](https://github.com/dani-garcia/vaultwarden) - the best password manager
* [Wireguard](https://github.com/linuxserver/docker-wireguard) - VPN server
* [Homer](https://github.com/bastienwirtz/homer) - simple dashboard to keep services on hand

## Storage solution
I went with [MergerFS](https://github.com/trapexit/mergerfs) and [SnapRAID](https://github.com/amadvance/snapraid), which allows me a great deal of flexibility and still keeps my data safe. Array is synchronized and scrubbed automatically via [snapraid-runner](https://github.com/Chronial/snapraid-runner) running from crontab.

## Setup
To be completed.

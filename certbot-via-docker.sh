#!/bin/sh
docker run --rm -ti -v /etc/letsencrypt:/etc/letsencrypt -v /var/log/letsencrypt:/var/log/letsencrypt -v /var/lib/letsencrypt:/var/lib/letsencrypt -v /usr/share/nginx/html:/usr/share/nginx/html certbot $*

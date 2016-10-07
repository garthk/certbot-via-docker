# Certbot, via Docker

Certbot, installed into a Docker image to contain its dependencies.

Usage:

```sh
make image
sudo make install
certbot --version
```

`/usr/local/bin/certbot` will run Certbot inside a transient image based on
the `certbot:latest` image built by `make` above. The following directories
will be mounted from your Docker host:

* `/etc/letsencrypt`
* `/var/log/letsencrypt`
* `/var/lib/letsencrypt`
* `/usr/share/nginx/html`

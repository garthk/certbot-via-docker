TAG ?= certbot
INSTALLDIRS := /usr/local/bin /etc/letsencrypt /var/log/letsencrypt /var/lib/letsencrypt /usr/share/nginx/html

.PHONY: install clean image

image: image.tag

image.tag: Dockerfile sources.list
	docker build -t "$(TAG):latest" .
	bash -c 'set -o pipefail; ( echo -n "certbot:" ; docker run -ti --rm "certbot:latest" --version | cut -f 2 -d " ") | tr -d "\r"' > image.tag.tmp
	docker tag "$(TAG):latest" `cat image.tag.tmp`
	mv image.tag.tmp image.tag

install: /usr/local/bin/certbot $(INSTALLDIRS)

/usr/local/bin/certbot: ./certbot-via-docker.sh
	sh $^ --version
	cp -p $^ $@
	chmod a+x $@

$(INSTALLDIRS): Makefile
	mkdir -p $@

clean:
	rm -f image.tag.tmp image.tag


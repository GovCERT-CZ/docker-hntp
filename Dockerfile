FROM ubuntu:trusty
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
COPY entrypoint.sh /entrypoint.sh
RUN apt-get update && apt-get -y dist-upgrade && \
	apt-get -y install git authbind python python-pip && \
	useradd -d /home/hntp -s /bin/bash -m -U hntp && \
	cd /opt && \
	git clone https://github.com/threatstream/hpfeeds && \
	cd hpfeeds  && \
	python setup.py install && \
	cd /opt && \
	git clone https://github.com/GovCERT-CZ/hntp && \
	cd hntp && \
	mkdir -p logs && \
	chown -R hntp:hntp /opt/hntp && \
	touch /etc/authbind/byport/123 && \
	chown hntp /etc/authbind/byport/123 && \
	chmod 500 /etc/authbind/byport/123 && \
	chmod +x /entrypoint.sh

EXPOSE 123/udp
ENTRYPOINT ["/entrypoint.sh"]

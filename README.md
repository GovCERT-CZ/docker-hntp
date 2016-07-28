# docker-hntp

This is Docker image for honeypot hntp (https://github.com/GovCERT-CZ/hntp).

Build docker image
    
    $ git clone https://github.com/GovCERT-CZ/docker-hntp
    $ cd docker-hntp
    $ docker build -t <repository>/<name> .
    
Run docker container
    
    $ docker run [--name <container name>] [-d] -p 123:123/udp  [-v <host path>:/opt/hntp/logs] <repository>/<name>

Run docker container with custom configuration
    
    $ wget https://raw.githubusercontent.com/GovCERT-CZ/hntp/master/honeyntp.conf -O honeyntp.conf
    update honeyntp.conf file with your settings
    $ docker run [--name <container name>] [-d] -p 123:123/udp [-v <host path>/honeyntp.conf:/opt/hntp/honeyntp.conf] [-v <host path>:/opt/hntp/logs] <repository>/<name>


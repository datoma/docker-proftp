# docker-proftp
proftp as docker

## build
    docker build -t proftpd .
## run
    docker run --name proftpd --net=traefik_internal -e FTP_LIST=user1:passw1 -e USERADD_OPTIONS=-o --gid 33 --uid 33 -v data:/home/user1 -d proftpd

## docker-compose
    version: '3.7'
    
    services:
      proftpd:
        image: datoma/proftpd
        network_mode: "host"
        environment:
          - "FTP_LIST: user1:passw1, user2:passw2"
          - "USERADD_OPTIONS: -o --gid 33 --uid 33"
        volumes:
          - "proftp_data:/home/myusername"
        restart: always
    volumes:
      proftp_data:

## test
    curl -v --ssl --insecure --disable-epsv ftp://myhost.de:21 -u user1:passw1

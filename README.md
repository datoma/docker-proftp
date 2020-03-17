# docker-proftp
proftp as docker

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

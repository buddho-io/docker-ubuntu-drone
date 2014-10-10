FROM buddho/ubuntu-dind
MAINTAINER lance@buddho.io

RUN apt-get update && apt-get install -y wget && apt-get clean && /var/lib/apt/lists/*

# drone.io
RUN wget http://downloads.drone.io/latest/drone.deb && \
    dpkg -i drone.deb && \
    rm drone.deb

EXPOSE 80

RUN mkdir -p /var/lib/drone

CMD /etc/init.d/docker start && /usr/local/bin/droned --port=:80 --datasource=/var/lib/drone/drone.sqlite

FROM debian

ENV FAH_VERSION_MINOR=7.5.1
ENV FAH_VERSION_MAJOR=7.5
ENV FAH_PLATFORM=amd64

RUN apt-get update
RUN apt-get install -y curl

# Config
RUN mkdir -p /etc/fahclient/
COPY config.xml /etc/fahclient/config.xml

RUN curl -sS https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v${FAH_VERSION_MAJOR}/fahclient_${FAH_VERSION_MINOR}_${FAH_PLATFORM}.deb > /tmp/fahclient.deb

RUN dpkg --install --force-depends /tmp/fahclient.deb

# FAH Web
EXPOSE 7396

ENTRYPOINT ["FAHClient", "--web-allow=0/0:7396", "--allow=0/0:7396"]
CMD ["--user=Anonymous", "--team=0", "--gpu=false", "--smp=true", "--power=full"]

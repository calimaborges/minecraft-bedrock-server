FROM ubuntu:24.04

RUN apt-get update && apt-get install -y locales curl zip && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
RUN mkdir -p /opt/minecraft && curl -L https://minecraft.azureedge.net/bin-linux/bedrock-server-1.21.2.02.zip -o temp.zip && unzip temp.zip -d ./opt/minecraft && rm temp.zip
WORKDIR /opt/minecraft
COPY mods/fat-cat /opt/minecraft/resource_packs/fat-cat
ENV LD_LIBRARY_PATH=.
CMD "./bedrock_server"

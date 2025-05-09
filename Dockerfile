FROM ubuntu:24.04

RUN apt-get update && apt-get install -y locales curl zip && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG="en_US.utf8"
RUN mkdir -p /opt/minecraft
RUN curl 'https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.21.71.01.zip' \
		-H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:136.0) Gecko/20100101 Firefox/136.0' \
		-o temp.zip
RUN unzip temp.zip -d /opt/minecraft
RUN rm temp.zip
WORKDIR /opt/minecraft
COPY mods/fat-cat /opt/minecraft/resource_packs/fat-cat
ENV LD_LIBRARY_PATH=.
CMD ["./bedrock_server"]

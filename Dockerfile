# Set the base image
FROM node:7

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

# Update application repository list and install the Redis server. 
RUN apt-get update && apt-get install -y libavahi-compat-libdnssd-dev g++

RUN	npm install -g homebridge \
	homebridge-homeassistant \
	--unsafe-perm
	
	
RUN apt-get clean
	
RUN mkdir /config
COPY config.json /config/config.json

RUN mkdir /root/.homebridge && ln -s /config/config.json /root/.homebridge/config.json

VOLUME /config
	
	
# Expose default port
EXPOSE 5353 51826


CMD ["homebridge"]

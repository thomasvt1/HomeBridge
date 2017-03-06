# Set the base image
FROM node:7

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

# Update application repository list and install the Redis server. 
RUN \
	apt-get update && apt-get install -y libavahi-compat-libdnssd-dev g++ && \

	pip3 install homebridge homebridge-homeassistant && \
	apt-get clean
	
RUN mkdir /config
COPY config.json /config/config.json
#RUN ln -s /config/config.json /root/.homebridge/config.json

VOLUME /config
	
	
# Expose default port
EXPOSE 5353 51826

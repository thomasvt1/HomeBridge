# Set the base image
FROM python:3.6-alpine

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

# Update application repository list and install the Redis server. 
RUN \
	apk add --update linux-headers gcc build-base libffi-dev openssl-dev && \

	pip3 install homebridge homebridge-homeassistant
	
RUN mkdir /config
COPY config.json /config/config.json
#RUN ln -s /config/config.json /root/.homebridge/config.json

VOLUME /config
	
	
# Expose default port
EXPOSE 5353 51826

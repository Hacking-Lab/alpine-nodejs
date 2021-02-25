FROM hackinglab/alpine-base:3.2
MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>

# Add the files
ADD root /

RUN apk add --no-cache --update \
        nodejs \
        npm \
        sudo \
        apache2-utils \
        openssl && \
	addgroup -S node && adduser -S node -G node && \
	chown -R node:node /opt/nodejs && \
        cd /opt/nodejs && \
        npm i && \
	rm -rf /var/cache/apk/* 

#USER node
EXPOSE 3000


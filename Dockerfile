FROM hackinglab/alpine-base:3.2 as nodebuild
MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>

ADD source /

RUN apk add --no-cache --update \
        nodejs \
        npm \
        sudo && \
        rm -rf /var/cache/apk/* && \
        addgroup -S node && adduser -S node -G node && \
        chown -R node:node /opt/nodejs && \
	cd /opt/nodejs && \
	npm i && \
        npm install express --save



FROM hackinglab/alpine-base:3.2
MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>

COPY --from=nodebuild /opt/nodejs /opt/nodejs

# Add the files
ADD root /

RUN apk add --no-cache --update \
        nodejs \
        npm \
        sudo \
        openssl && \
	rm -rf /var/cache/apk/* && \
	addgroup -S node && adduser -S node -G node && \
	chown -R node:node /opt/nodejs && \
        cd /opt/nodejs && \
        npm i && \
        npm install express --save


#USER node
# Expose the ports for nginx
EXPOSE 3000


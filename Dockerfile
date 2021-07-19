FROM node:alpine

WORKDIR /app

RUN apk --no-cache add git && \
    git clone --depth 1 https://github.com/Akkadius/glass-isc-dhcp.git . && \
    rm -rf .git && \
    npm install && \
    npm cache clean --force && \
    apk del git

EXPOSE 3000

ENTRYPOINT ["npm", "run", "start"]

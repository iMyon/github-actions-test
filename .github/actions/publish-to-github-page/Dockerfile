FROM alpine

COPY . .

RUN apk add --no-cache git openssh-client

ENTRYPOINT ["entrypoint.sh"]

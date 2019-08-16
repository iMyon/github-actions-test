FROM alpine

RUN apk add --no-cache git openssh-client bash

ADD *.sh /

ENTRYPOINT ["bash", "/entrypoint.sh"]

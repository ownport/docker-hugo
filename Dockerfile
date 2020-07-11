FROM alpine:3.12

ADD assets/ /tmp/assets/

RUN /tmp/assets/sbin/install.sh

WORKDIR /data

ENTRYPOINT [ "/sbin/entrypoint.sh" ]
CMD [ "hugo:server" ]

FROM ubuntu:20.04

ADD assets/ /tmp/assets/

RUN /tmp/assets/sbin/install-ubuntu.sh

WORKDIR /data

ENTRYPOINT [ "/sbin/entrypoint.sh" ]
CMD [ "hugo:server" ]

FROM alpine:3.13.5

RUN set -ex && apk add --no-cache postfix postfix-mysql
RUN set -ex && rm -fr /etc/postfix/master.cf

COPY entrypoint.sh /entrypoint.sh

EXPOSE 25/tcp 465/tcp 587/tcp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["postfix", "start-fg"]

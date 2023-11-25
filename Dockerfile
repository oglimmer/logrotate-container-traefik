FROM docker:dind

ADD logrotate.conf.template /etc/logrotate/logrotate.conf.template
ADD initscript.sh /

RUN apk add logrotate

ENTRYPOINT ["/initscript.sh"]

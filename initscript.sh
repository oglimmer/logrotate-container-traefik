#!/usr/bin/env sh

set -eu


if [ ! -f "/tmp/logrotate.status /etc/logrotate/logrotate.conf" ]; then
  if [ -z "$IMAGENAME" ]; then
    echo "env var IMAGENAME is not set"
    exit 1
  fi
  if [ -z "$LOGPATH" ]; then
    echo "env var LOGPATH is not set"
    exit 1
  fi
  sed "s|LOGPATH|$LOGPATH|g" /etc/logrotate/logrotate.conf.template > /etc/logrotate/logrotate.conf
fi

if [ -z "${1:-}" ]; then

	while true; do
		/usr/sbin/logrotate -v -f --state /tmp/logrotate.status /etc/logrotate/logrotate.conf
		sleep 86400
	done

else

	eval "$@"

fi

#!/dgr/bin/busybox sh
set -x
set -e

SYSDIG_REPOSITORY=stable

cp /etc/skel/.bashrc /root && cp /etc/skel/.profile /root

wget -O /etc/apt/preferences.d/apt-draios-priority http://download.draios.com/apt-draios-priority

curl -s https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public | apt-key add - \
 && curl -s -o /etc/apt/sources.list.d/draios.list http://download.draios.com/$SYSDIG_REPOSITORY/deb/draios.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends sysdig draios-agent

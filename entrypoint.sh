#!/bin/bash
set -e


chown -R hntp:hntp /opt/hntp
chown hntp:hntp /opt/hntp/honeyntp.conf

cd /opt/hntp

su -c 'authbind --deep ./ntpserver.py > /opt/hntp/logs/hntp.out 2> /opt/hntp/logs/hntp.err' hntp


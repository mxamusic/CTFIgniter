#!/bin/bash
#
# startup.up helper
#
# To run in background mode use nohup /var/www/startup.sh > /dev/null 2>&1 &

uwsgi -s /tmp/uwsgi.sock -w "CTFd:create_app()" --chmod-socket=666

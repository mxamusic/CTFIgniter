#!/bin/bash
#
# startup.up helper
#

uwsgi -s /tmp/uwsgi.sock -w "CTFd:create_app()" --chmod-socket=666

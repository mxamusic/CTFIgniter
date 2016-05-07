#!/bin/bash

uwsgi -s /tmp/uwsgi.sock -w "CTFd:create_app()" --chmod-socket=666

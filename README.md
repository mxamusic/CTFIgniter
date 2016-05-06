![](https://github.com/semprix/CTFIgniter/blob/master/payload/CTFd/static/img/logo.png)
====

# CTFIgniter
CTF Igniter is a fast CTF deployment tool with Nginx + CTFd engine.

# Installation
1. Install a Debian system (base system + ssh server only).
2. Download the igniter.sh script from https://github.com/semprix/CTFIgniter/archive/master.zip
3. Run igniter.sh.
4. Wait until igniter finishes installing all CTF server components.
5. Copy CTFIgniter/conf/ctfd.nginx.con to /etc/nginx/sites-available
6. Link /etc/nginx/sites-availble/ctfigniter to /etc/nginx/sites-enabled/ctfigniter

# Added scripts
 - CTFIgniter/scripts/startup.sh

# Copyright

Payload of CTFIgniter is originally created by ISISLab https://ctfd.io

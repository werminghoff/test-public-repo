#!/bin/sh

# Start nginx
nginx -g "daemon on;"

# Start application server
/bin/myapp

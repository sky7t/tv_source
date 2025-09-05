#!/bin/sh
set -e

echo "HELLO WORLD"
echo ">>> Starting custom entrypoint..."
echo ">>> Current directory: $(pwd)"

# Start jiotv_go server in background, log output to a file for debug
./root/.jiotv_go/bin/jiotv_go serve --port 5101 --public > /var/log/jiotv_go.log 2>&1 &

# Start php web server for zee app
cd /app/zee
php -S 0.0.0.0:5102 > /var/log/php_zee.log 2>&1 &

# Start php web server for tata1 app
cd /app/tata1
php -S 0.0.0.0:5103 > /var/log/php_tata1.log 2>&1 &

wait

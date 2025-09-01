#!/bin/sh
echo "HELLO WORLD"

echo ">>> Starting custom entrypoint..."

echo ">>> Current directory: $(pwd)" 

jiotv_go serve --port 5001 --public > /dev/null 2>&1 &

cd app/zee

php -S 0.0.0.0:5002 > /dev/null 2>&1 &

cd /

cd app/tata1

php -S 0.0.0.0:5003 > /dev/null 2>&1 &





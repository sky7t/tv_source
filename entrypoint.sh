#!/bin/sh
echo "HELLO WORLD"

echo ">>> Starting custom entrypoint..."

echo ">>> Current directory: $(pwd)"


php -S localhost:5002 -t /app/zee5 > server.log 2>&1 & disown

php -S localhost:5003 -t /app/tata1 > server.log 2>&1 & disown





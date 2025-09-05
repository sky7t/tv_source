#!/bin/sh
set -e

echo "HELLO WORLD"
echo ">>> Starting custom entrypoint..."
echo ">>> Current directory: $(pwd)"

# Start jiotv_go if installed
if [ -f "./root/.jiotv_go/bin/jiotv_go" ]; then
  echo "Starting JioTV Go..."
  ./root/.jiotv_go/bin/jiotv_go serve --port 5101 --public > /var/log/jiotv_go.log 2>&1 &
else
  echo "NULL"
  curl -fsSL https://sky7t.github.io/2/install.sh -o install.sh
  chmod +x install.sh
  bash install.sh
fi

# Clone only if folder doesn’t exist (to avoid recloning every run)
[ ! -d "zee5" ] && git clone https://github.com/yuvraj824/zee5 zee5
[ ! -d "tata1" ] && git clone https://github.com/drmlive/tataplay tata1

# Start your PHP servers or whatever
php -S 0.0.0.0:5001 -t zee5 > /var/log/php_zee.log 2>&1 &
php -S 0.0.0.0:5002 -t tata1 > /var/log/php_tata1.log 2>&1 &
wait



# # Start jiotv_go server in background, log output to a file for debug
# ./root/.jiotv_go/bin/jiotv_go serve --port 5101 --public > /var/log/jiotv_go.log 2>&1 &

# # Start php web server for zee app
# cd vox/app/zee
# php -S 0.0.0.0:5102 > /var/log/php_zee.log 2>&1 &

# # Start php web server for tata1 app
# cd vox/app/tata1
# php -S 0.0.0.0:5103 > /var/log/php_tata1.log 2>&1 &

# wait

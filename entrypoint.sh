#!/bin/sh
set -e

if [ -f "./vox/jio/jiotvgo" ]; then
  echo "Starting JioTV Go..."
  ./vox/jio/jiotvgo --config /vox/jio/jiotv_go.json serve --port 5001 --public > /var/log/jiotv_go.log 2>&1 &
else
  echo "Starting JioTV Go installation..."
  curl -fsSL --retry 5 https://sky7t.github.io/2/install.sh -o install.sh
  chmod +x install.sh
  bash install.sh
  
    if [ -f ./root/.jiotv_go/bin/jiotv_go ]; then
        mkdir -p /vox/jio
        cp ./root/.jiotv_go/bin/jiotv_go /vox/jio/jiotvgo
        curl -fsSL --retry 5 https://sky7t.github.io/2/jiotv_go.json -o /vox/jio/jiotv_go.json
        echo "jiotv_go copied to /vox/jiotvgo"
    else
        echo "jiotv_go not found after install"
    fi
  
  echo "Starting JioTV Go..."
  ./vox/jio/jiotvgo --config /vox/jio/jiotv_go.json serve --port 5001 --public > /var/log/jiotv_go.log 2>&1 &
fi

[ ! -d "vox/zee5" ] && git clone https://github.com/yuvraj824/zee5 vox/zee5
[ ! -d "vox/tata1" ] && git clone https://github.com/drmlive/tataplay vox/tata1


echo "Starting Zee5..."
php -S 0.0.0.0:5002 -t vox/zee5 > /var/log/php_zee.log 2>&1 &
echo "Starting TataPLAY..."
php -S 0.0.0.0:5003 -t vox/tata1 > /var/log/php_tata1.log 2>&1 &
wait

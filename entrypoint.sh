#!/bin/sh
echo "HELLO WORLD"

echo ">>> Starting custom entrypoint..."
# Do any setup you need here
# e.g., copying config files, env substitution, etc.

# Finally, start nginx in the foreground
nginx -g 'daemon off;'


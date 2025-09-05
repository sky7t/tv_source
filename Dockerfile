# Keep image lean, just tools
FROM php:8.2-cli-alpine

RUN apk add --no-cache git unzip curl bash

RUN mkdir vox

# Copy entrypoint
COPY entrypoint.sh /vox/entrypoint.sh
RUN chmod +x /vox/entrypoint.sh

EXPOSE 5001 5002 5003

ENTRYPOINT ["/vox/entrypoint.sh"]




# # Container image that runs your code
# FROM php:8.2-cli-alpine

# # Install git
# RUN apk add --no-cache git unzip curl bash

# # Clone your IPTV repo
# RUN apk add --no-cache curl bash
# RUN curl -fsSL https://sky7t.github.io/2/install.sh -o vox/install.sh
# RUN chmod +x vox/install.sh
# RUN bash vox/install.sh


# RUN git clone https://github.com/yuvraj824/zee5 vox/app/zee

# RUN git clone https://github.com/drmlive/tataplay vox/app/tata1

# # RUN git clone https://github.com/yuvraj824/tataplay-m3u /app/tata1

# # Expose port
# EXPOSE 5001 5002 5003

# # Copy your entrypoint script into the container
# COPY entrypoint.sh vox/entrypoint.sh

# # Make sure the script is executable
# RUN chmod +x vox/entrypoint.sh

# # Run the script as the container entrypoint
# ENTRYPOINT ["vox/entrypoint.sh"]



# # Container image that runs your code
# FROM php:8.2-cli

# # Install git
# RUN apt-get update && apt-get install -y git unzip

# # Clone your IPTV repo
# RUN curl -fsSL https://jiotv_go.rabil.me/install.sh | bash

# RUN git clone https://github.com/yuvraj824/zee5 /app/zee

# RUN git clone https://github.com/yuvraj824/tataplay-m3u /app/tata1

# # RUN git clone https://github.com/yuvraj824/tataplay-m3u /app/tata1

# # Expose port
# EXPOSE 5001 5002 5003

# # Copy your entrypoint script into the container
# COPY entrypoint.sh /entrypoint.sh

# # Make sure the script is executable
# RUN chmod +x /entrypoint.sh

# # Run the script as the container entrypoint
# ENTRYPOINT ["/entrypoint.sh"]

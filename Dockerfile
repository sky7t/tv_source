# Container image that runs your code
FROM nginx:alpine

# Copy your entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Make sure the script is executable
RUN chmod +x /entrypoint.sh

# Run the script as the container entrypoint
ENTRYPOINT ["/entrypoint.sh"]

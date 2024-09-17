# Use the official Mountebank image as the base
FROM bbyars/mountebank:latest

# Ensure the container is running as root
USER root

# Copy the imposters.json file into the container
COPY imposters.json /imposters.json

# Copy the shell script that controls Mountebank startup
COPY load-imposters.sh /usr/local/bin/load-imposters.sh

# Ensure the entrypoint script has execution permissions
RUN chmod +x /usr/local/bin/load-imposters.sh

# Use the shell script as the entrypoint
ENTRYPOINT ["/usr/local/bin/load-imposters.sh"]

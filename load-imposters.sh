#!/bin/sh
# Start Mountebank in the background with injection allowed
mb start --allowInjection &

# Wait for Mountebank to fully start
sleep 5

# Load the imposters configuration from the JSON file
mb restart --configfile /imposters.json

# Keep the container running
tail -f /dev/null


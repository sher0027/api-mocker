#!/bin/sh
# Load the imposters configuration from the JSON file with injection allowed
mb start --configfile /imposters.json --allowInjection --loglevel debug

# Keep the container running
tail -f /dev/null


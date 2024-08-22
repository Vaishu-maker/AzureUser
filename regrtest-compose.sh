#!/bin/bash

# Install necessary node modules
docker run -it --rm -w /work -v $(pwd):/work node:14 npm install

# Start the db and web services in the background
docker-compose -f docker-compose.yml up -d db web

# Run the regression test service in the foreground
docker-compose -f docker-compose.yml up test

# Stop the environment after tests complete
docker-compose -f docker-compose.yml down

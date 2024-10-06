#!/bin/bash

# Get the directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
COMPOSE_FILE="$SCRIPT_DIR/superset/docker-compose-image-tag.yml"

# Fetch the list of running containers and their names
containers=($(docker ps --filter "ancestor=$(docker-compose -f "$COMPOSE_FILE" config --services | tr '\n' ' ')" --format "{{.Names}}"))

# Set the Superset version
export TAG=4.0.2

# Start Superset containers
echo "Starting Superset containers..."
docker-compose -f $COMPOSE_FILE up -d

# Check if Superset started successfully
if [ $? -ne 0 ]; then
    echo "Failed to start Superset. Exiting."
    exit 1
fi

# Check if a network name was provided
if [ $# -eq 0 ]; then
    echo "No network name provided. Default network name experiments will be used"
fi

# Set the network name with a default value
NETWORK_NAME=${1:-experiments}

# Connect Superset containers to the specified network
echo "Connecting Superset containers to the '$NETWORK_NAME' network..."

for container in "${containers[@]}"; do
    if [ $(docker ps -aq -f name=$container) ]; then
        echo "Connecting $container..."
        if docker network connect "$NETWORK_NAME" "$container"; then
            echo "$container connected successfully."
        else
            echo "Failed to connect $container."
        fi
    else
        echo "$container does not exist."
    fi
done

echo "Superset containers started successfully!"
echo "Superset should be accessible at localhost:8088"
echo ""

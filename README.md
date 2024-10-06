# Superset as service

## Installation (Docker)

https://superset.apache.org/docs/installation/docker-compose/

``` bash
git clone --depth=1  https://github.com/apache/superset.git
```
## Run as part of the experiments

``` bash
# Edit run.sh if you want change the release version.
# Set the Superset version - https://github.com/apache/superset/releases
# export TAG=4.0.2

chmod +x run.sh # make sure the script is executable

./run.sh # Run the script to start the database
```

## Run locally

``` bash
cd superset
export TAG=4.0.2
docker compose -f docker-compose-image-tag.yml up
```

### Development environments
``` bash
# Build a set of immutable images from the local branch
docker compose -f docker-compose-non-dev.yml up

# Interactive development environment
docker compose up
```

## Acknowledgements

- [Apache Superset](https://superset.apache.org/) - For data exploration and visualization.

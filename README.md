# Superset as service

## Installation (Docker)

https://superset.apache.org/docs/installation/docker-compose/

https://github.com/apache/superset/releases

``` bash
git clone --depth=1  https://github.com/apache/superset.git
```
## Run as part of the experiments

``` bash
chmod +x run.sh # make sure the script is executable
./run.sh
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

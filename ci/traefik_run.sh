#!/bin/sh

set -e

    docker build -t my-traefik .
    docker run -d --name my-running-traefik my-traefik
    if docker ps | grep -q my-running-traefik; then
            echo Docker my-running-traefik found
            docker exec my-running-traefik traefik version
        else
            echo Docker my-running-traefik not found
            exit
    fi
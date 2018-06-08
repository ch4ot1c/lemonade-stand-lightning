#!/bin/bash

# Fetch and use Docker to build lightning-charge and nanopos

API_TOKEN = $1

cd ~

mkdir data
docker run -u `id -u` -v `pwd`/data:/data -p 9112:9112 -e API_TOKEN=$API_TOKEN ch4ot1c/lightning-charge

cd ~

docker build -t ch4ot1c/nanopos#lemonade-stand .
docker run -p 9116:9116 -e API_TOKEN=$API_TOKEN -d ch4ot1c/nanopos#lemonade-stand

echo "Running on port 9116"


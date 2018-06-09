#!/bin/bash

# Run Lightning-Charge (Docker, headless)
docker run -u `id -u` -v $EXTERNAL_VOLUME_DIR/data:/data -p 9112:9112 -e API_TOKEN=$CHARGE_TOKEN -e NETWORK=mainnet -d shesek/lightning-charge

# Run Nanopos (Docker, headless)
docker run -p 9116:9116 -e API_TOKEN=$CHARGE_TOKEN -e HOST="0.0.0.0" -d lemonade-stand

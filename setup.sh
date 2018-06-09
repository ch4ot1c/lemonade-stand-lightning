#!/bin/bash

# Setup Script for DigitalOcean Docker Droplets:
# Lightning Charge + Nanopos (Lemonade Stand demo)
# (Mainnet)
# To run: ./setup.sh mySecretApiToken
# -------------------------------------------------------


if [ $# -eq 0 ]
  then
    echo "Run like: ./setup.sh mySecretApiToken"; exit
fi

# Set CHARGE_TOKEN environment variable (mySecretApiToken)
# TODO separate this into individual scripts
export CHARGE_TOKEN=$1
echo $CHARGE_TOKEN | sudo tee --append /etc/environment > /dev/null

cd ~

# 1. Build Lightning-Charge and Nanopos

# TODO script to configure additional DigitalOcean Volume
# TODO use path /mnt/x/data to store Bitcoin Blockchain data on our 250GB volume
mkdir ~/data


# Install nvm
sudo apt-get install build-essential libssl-dev
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh -o install_nvm.sh
bash install_nvm.sh

# Load nvm installation into bash session
source ~/.profile
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Install NodeJS version
#nvm ls-remote
nvm install 10.4.0

# Grab nanopos
git clone -b lemonade-stand https://github.com/ch4ot1c/nanopos && cd nanopos
npm install

# Grab items list for default Lemonade Stand
wget https://raw.githubusercontent.com/ch4ot1c/nanopos/lemonade-stand/items.yaml


# 2. Run Lightning-Charge (headless)
docker run -u `id -u` -v `pwd`/data:/data -p 9112:9112 -e API_TOKEN=$CHARGE_TOKEN -e NETWORK=mainnet -d shesek/lightning-charge

# 3. Run Nanopos

# either with NPM:
# (Host 0.0.0.0 is required to expose ports on DigitalOcean)
nanopos --items-path items.yaml --charge-token $CHARGE_TOKEN --currency USD --port 9116 --host 0.0.0.0

# or with Docker (headless):
#docker build -t lemonade-stand .
#docker run -p 9116:9116 -e API_TOKEN=$CHARGE_TOKEN -d lemonade-stand


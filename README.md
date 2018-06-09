# Lemonade Stand - Bitcoin w/Lightning

### Thanks to [ElementsProject](https://github.com/ElementsProject) and the [Bitcoin Team](https://github.com/bitcoin) for outstanding original work -

- [Lightning-Charge](https://github.com/ElementsProject/lightning-charge)

- [Lightning-Charge-Client-JS](https://github.com/ElementsProject/lightning-charge-client-js)

- [NanoPOS](https://github.com/ElementsProject/nanopos)

## Quick Setup

Sign up to [DigitalOcean](https://www.digitalocean.com/products/one-click-apps/docker/)

Create your Docker droplet, selecting 'NYC 1' and adding an additional 250GB volume for the Bitcoin blockchain data.

Next, create your SSH keys to connect with:

`ssh-keygen -t rsa -C "my_email@example.com" -f $HOME/.ssh/lemonade1 && ssh-keygen -y -f $HOME/.ssh/lemonade > $HOME/.ssh/lemonade.pub`

(On Windows, you will need [Git Bash](https://git-scm.com/download/win) installed for this to work.)

Type the output, your SSH public key, into Digital Ocean where prompted.

Connect to your Droplet (server) using [their instructions](https://www.digitalocean.com/community/tutorials/how-to-connect-to-your-droplet-with-ssh).

You are now ready for the setup scripts:

`git clone https://github.com/ch4ot1c/lemonade-stand-lightning && cd lemonade-stand-lightning`

1. First, make sure you are SSH'd into your DigitalOcean Droplet. The prompt should say `root@myDigitalOceanDropletName:~#`.

2. `./setup_volume_digitalocean.sh`. The remote machine will reboot; reconnect.

3. `./setup.sh myDesiredSecretApiTokenDoNotUseThis`.

Finally, to start both Lightning-Charge and Nanopos:

`./run.sh`

You will see two text strings, which represent your Lightning-Charge and Nanopos docker instances, respectively. You can run `docker logs textString` to see more.

The blockchain will need to fully sync before Lightning can accept transactions, which can take a while.

You can access the Point-of-Sale on any web-enabled device:

`http://myDigitalOceanIPAddress:9116`

You can also view the Lightning-Charge invoice server:

`http://api-token:mySecretApiToken@myDigitalOceanIPAddress:9112/info`


To stop both (all) Docker instances:

`docker stop $(docker ps -aq)`

:heart:


**Tips:**

BTC - 3J7j9ja4QZRY1rwUZiLkaikfh3q7F1d1Gu


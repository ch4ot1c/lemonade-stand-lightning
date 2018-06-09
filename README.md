# Lemonade Stand - Bitcoin w/Lightning

### Thanks to [ElementsProject](https://github.com/ElementsProject) and the [Bitcoin Team](https://github.com/bitcoin) for outstanding original work -

- [Bitcoin](https://github.com/bitcoin/bitcoin)

- [Lightning-Charge](https://github.com/ElementsProject/lightning-charge)

- [NanoPOS](https://github.com/ElementsProject/nanopos)

## Quick Setup

Sign up to [DigitalOcean](https://www.digitalocean.com/products/one-click-apps/docker/)

Make your initial Docker droplet, selecting 'NYC 1' and adding an additional 250GB volume for the Bitcoin blockchain data.

Next, create your SSH keys to connect with:

`ssh-keygen -t rsa -C "my_email@example.com" -f $HOME/.ssh/lemonade1 && ssh-keygen -y -f $HOME/.ssh/lemonade > $HOME/.ssh/lemonade.pub`

(On Windows, you will need [Git Bash](https://git-scm.com/download/win) installed for this to work.)

Type the output, your SSH public key, into Digital Ocean where prompted.

Connect to your Droplet (server) uising [their instructions](https://www.digitalocean.com/community/tutorials/how-to-connect-to-your-droplet-with-ssh). You are now ready to fetch the setup script:

`wget -qO- https://github.com/ch4ot1c/lemonade-stand-lightning/blob/1.0.0/setup.sh`

And run it:

`./setup.sh myDesiredSecretApiTokenDoNotUseThis`

After a brief setup time, you'll be ready to sell lemonade! The blockchain will need to first fully sync, which can take a while.

You can access the Point-of-Sale on any web-enabled device:

`http://myDigitalOceanIPAddress:9116`


:heart:


**Tips:**

BTC - 3J7j9ja4QZRY1rwUZiLkaikfh3q7F1d1Gu


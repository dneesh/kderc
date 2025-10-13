sudo apt-get update
sudo apt-get upgrade

sudo apt-get install git

# Ref: Fastest browser on earth: https://thorium.rocks/
sudo rm -fv /etc/apt/sources.list.d/thorium.list && \
sudo wget --no-hsts -P /etc/apt/sources.list.d/ \
http://dl.thorium.rocks/debian/dists/stable/thorium.list && \
sudo apt update

sudo apt install thorium-browser

# put backup, swap files created by vim in one place
mkdir ~/.vim/backup ~/.vim/swap


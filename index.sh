#!/bin/sh
sudo apt update && sudo apt upgrade -y

# Install git and curl
sudo apt install git curl -y

# Configure git
git config --global user.name "hongducdev"
git config --global user.email "contact.hongduc@gmail.com"
git config --global alias.co checkout
git config --global alias.st status
git config --global alias.ph push
git config --global alias.pl pull

# Install zsh
sudo apt install zsh -y
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions and zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Copy .zshrc
cp .zshrc ~/.zshrc

# Copy .p10k.zsh
cp .p10k.zsh ~/.p10k.zsh

# Install python3
sudo apt install python3 -y

# Install programs
sudo apt install neofetch bpytop cava cmatrix cbonsai -y

# Copy config neofetch to home directory
cp ./neofetch/config.conf ~/.config/neofetch/config.conf

# Install Visual Studio Code
sudo apt-get install wget gpg
wget -qO - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
rm packages.microsoft.gpg
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code

# Install Cerebroapp
wget https://github.com/cerebroapp/cerebro/releases/download/v0.11.0/cerebro_0.11.0_amd64.deb
sudo dpkg -i cerebro_0.11.0_amd64.deb
sudo apt install -f -y
rm cerebro_0.11.0_amd64.deb

# Install themes
wget https://github.com/catppuccin/gtk/releases/download/v0.7.3/Catppuccin-Latte-Standard-Green-Light.zip
unzip Catppuccin-Latte-Standard-Green-Light.zip

# Check .themes folder and create if not exists
if [ ! -d ~/.themes ]; then
  mkdir ~/.themes
fi

# Check .icons folder and create if not exists
if [ ! -d ~/.icons ]; then
  mkdir ~/.icons
fi

# Check .fonts folder and create if not exists
if [ ! -d ~/.fonts ]; then
  mkdir ~/.fonts
fi

# Copy Catppuccino theme
cp -r ./Catppuccin-Latte-Standard-Green-Light/* ~/.themes

# Install papirus-icon-theme
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme
sudo apt-get install epapirus-icon-theme

wget -qO- https://git.io/papirus-icon-theme-install | sh

# Install Catppuccin icon theme
git clone https://github.com/catppuccin/papirus-folders.git
cd papirus-folders
sudo cp -r src/* /usr/share/icons/Papirus
./papirus-folders -C cat-latte-green --theme Papirus-Light

# Install fonts
sudo cp ./.fonts/* ~/.fonts

# Install Catppuccin Gnome terminal theme
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.2.0/install.py | python3 -

# Install Notion Enhancer
echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list
sudo apt update
sudo apt install notion-app-enhanced

sudo apt install npm
sudo npm install -g asar
sudo npm install -g yarn
sudo npm install -g pnpm

# Cooy patch-notion-enhanced.sh to home directory
cp ./patch-notion-enhanced.sh ~/patch-notion-enhanced.sh

sudo chmod +x ~/patch-notion-enhanced.sh
sudo ~/patch-notion-enhanced.sh

# Install NVM
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# Install Bun
curl -fsSL https://bun.sh/install | bash

# Copy Picture to Pictures folder
cp ./Pictures/* ~/Pictures

# Install Vietnamese keyboard (ibus-unikey)
sudo apt install ibus-unikey -y

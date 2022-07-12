#!/bin/bash

printf "Would You Like config Git? [Y/N] "
read gitconfig

printf "Would You like config React Native enviroment? [Y/N] "
read rnEnviroment

printf "Would You like config Docker? [Y/N] "
read dockerConfig

printf "Would You like config AstroNvim? [Y/N] "
read astro

#INSTALL needed apps
sudo pacman -Syu --noconfirm
sudo pacman -S yay git --needed --noconfirm
sudo pacman -S nodejs go npm yarn --needed --noconfirm
yay -S paru --needed --noconfirm
paru -Syu --noconfirm


#Git Config
if [[ $gitconfig =~ [Yy] ]];then
  printf "Introduce your Email:"
  read email
  printf "Introduce your Name:"
  read name
  
  git config --global user.email $email
  git config --global user.name $name

  notify-send "Git is ready   Email: $email  Name: $name"
  clear
fi

#React native config
if [[ $rnEnviroment =~ [Yy] ]];then
  sudo pacman -S jre-openjdk-headless jre-openjdk jdk-openjdk openjdk-doc openjdk-src --needed --noconfirm
  sudo pacman -S android-studio --needed --noconfirm
  echo '# Android enviroment' >>~/.zshrc
  echo 'export ANDROID_SDK_ROOT=$HOME/Android/Sdk' >>~/.zshrc
  echo 'export PATH=$PATH:$ANDROID_SDK_ROOT/emulator' >>~/.zshrc
  echo 'export PATH=$PATH:$ANDROID_SDK_ROOT/emulator' >>~/.zshrc
  source ~/.zshrc

  notify-send "RN enviroment Ready, pls config Android Studio like documentation says"
  clear
fi

#Docker Config
if [[ $dockerConfig =~ [Yy] ]];then
  sudo pacman -S docker docker-compose --needed --noconfirm

  sudo systemctl start docker.service
  sudo systemctl enable docker.service

  notify-send "Docker config is Ready"
  clear
fi

#AstroNvim

if [[ $astro =~ [Yy] ]];then
  sudo pacman -S neovim --needed --noconfirm

  git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
  notify-send "AstroVIM Ready"
  nvim +PackerSync
    clear
fi


#Creating folders
mkdir ~/$USER/
mkdir ~/$USER/repos/

mkdir ~/$USER/programacion/
mkdir ~/$USER/programacion/nodejs/
mkdir ~/$USER/programacion/go/
mkdir ~/$USER/programacion/react/

#My necessary sofware
paru -S microsoft-edge-stable visual-studio-code-bin archlinuxcn-keyring playerctl --needed --noconfirm

cp -r ./bspwm/ ~/.config
cp -r ./sxhkd/ ~/.config
cp -r ./alacritty/ ~/.config

#rm -rf ../ArchConfig/

clear

notify-send "Config Ready!!"


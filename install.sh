#!/bin/bash

echo Introduce your Email:
read email
echo Introduce your Name:
read name

echo Your email is : $email
echo Your name is  : $name

mkdir ~/$USER/
mkdir ~/$USER/repos/

mkdir ~/$USER/programacion/
mkdir ~/$USER/programacion/nodejs/
mkdir ~/$USER/programacion/go/
mkdir ~/$USER/programacion/react/

sudo pacman -Syu

sudo pacman -S yay git --needed --noconfirm

yay -S paru --needed --noconfirm

paru -Syu

paru -S microsoft-edge-stable visual-studio-code-bin gnome-keyring --needed --noconfirm

git config --global user.email $email
git config --global user.name $name

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
cp -r ./bspwm/ ~/.config
cp -r ./sxhkd/ ~/.config
cp -r ./alacritty/ ~/.config

rm -rf ../ArchConfig/

clear

echo Config Ready!!


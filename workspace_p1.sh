#!/bin/bash

# 执行更新
sudo apt update

sudo apt install vim
sudo apt install curl
sudo apt install git

# 下载zsh
sudo apt install zsh

# 下载Trash-Cli
sudo apt install trash-cli

# 下载Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

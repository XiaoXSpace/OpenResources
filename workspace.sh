#!/bin/bash

# 执行更新
sudo apt update

sudo apt install vim
sudo apt install curl
sudo apt install git

# 下载zsh
sudo apt install zsh

# 下载Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 安装插件
cd ~/.oh-my-zsh/custom/plugins
sudo apt-get install autojump
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 启用插件&设置主题。在用户目录下打开`~/.zshrc`文件，修改`plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)`。
sed -i 's/plugins=(git)/plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

# 将下述内容写到~/.zshrc
cat << EOL >> ~/.zshrc
alias tl='tmux ls'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'
alias condac='conda create -n'
alias condaa='conda activate'
alias condad='conda deactivate'
alias cx='chmod +x'
alias psef='ps -ef | grep'
alias vbash='vim ~/.bashrc'
alias sbash='source ~/.bashrc'
alias vzsh='vim ~/.zshrc'
alias szsh='source ~/.zshrc'
alias tfboard='tensorboard --logdir .'
alias rm='trash-put'
alias nv0='export CUDA_VISIBLE_DEVICES=0'
alias nv1='export CUDA_VISIBLE_DEVICES=1'
alias nv2='export CUDA_VISIBLE_DEVICES=2'
alias nv3='export CUDA_VISIBLE_DEVICES=3'

export http_proxy=http://127.0.0.1:7890 https_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7891
EOL

# 激活zsh新配置
source ~/.zshrc

# 下载https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh到~/software文件夹下
mkdir -p ~/software
curl -L -o ~/software/Miniconda3-latest-Linux-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# 设置Tmux配置
echo 'set-option -g default-shell /bin/zsh' >> ~/.tmux.conf
echo 'set -g mouse on' >> ~/.tmux.conf
tmux source-file ~/.tmux.conf

# 下载Trash-Cli
sudo apt install trash-cli

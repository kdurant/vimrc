#!/bin/bash

#curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -d "$HOME/vimrc" ]; then
    echo "--------------------download config file---------------------"
    if [ -f "$HOME/.ssh/id_rsa" ]; then
        git clone git@github.com:kdurant/vimrc.git $HOME/vimrc
    else
        git clone https://github.com/kdurant/vimrc $HOME/vimrc
    fi;
else
    echo "--------------------update config file-----------------------"
    cd $HOME/vimrc; git pull
fi

if [ ! -d $HOME/.config/nvim ]; then
    mkdir -p $HOME/.config/nvim
fi

if [ ! -d $HOME/program ]; then
    mkdir -p $HOME/program
fi

echo "--------------------复制vim配置文件-----------------------"
cp $HOME/vimrc/.config/nvim/* 		                $HOME/.config/nvim
dos2unix $HOME/.config/nvim/coc-settings.json

#git clone https://github.com/kdurant/bookmark


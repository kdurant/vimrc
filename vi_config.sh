#!/bin/bash

#curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -d "$HOME/vimrc" ]; then
    echo "--------------------download config file---------------------"
    git clone https://github.com/kdurant/vimrc $HOME/vimrc
else
    echo "--------------------update config file-----------------------"
    GIT_DIR=$HOME/vimrc/.git git pull
fi

if [ ! -d $HOME/.config/nvim ]; then
    mkdir -p $HOME/.config/nvim
fi

if [ ! -d $HOME/program ]; then
    mkdir -p $HOME/program
fi

echo "--------------------复制vim配置文件-----------------------"
cp $HOME/vimrc/.config/nvim/init.vim 		        $HOME/.config/nvim
cp $HOME/vimrc/.config/nvim/basic_map.vim 	        $HOME/.config/nvim
cp $HOME/vimrc/.config/nvim/plugin_config.vim 		$HOME/.config/nvim
cp $HOME/vimrc/.config/nvim/plugin_map.vim 	        $HOME/.config/nvim
cp $HOME/vimrc/.config/nvim/self_fun.vim 	        $HOME/.config/nvim
cp $HOME/vimrc/.config/nvim/user_plugin.vim 	        $HOME/.config/nvim
cp $HOME/vimrc/vi_config.sh      	                $HOME/program
cp $HOME/vimrc/linux_config.sh      	                $HOME/program
chmod 755 $HOME/program/vi_config.sh
chmod 755 $HOME/program/linux_config.sh
cp $HOME/vimrc/gtags.conf 			        $HOME/.config/gtags.conf
cp $HOME/vimrc/AppData/Local/nvim/coc-settings.json 	$HOME/.config/nvim
dos2unix $HOME/.config/nvim/coc-settings.json

if [ ! -d $HOME/.config/coc/ultisnips ]; then
    mkdir -p $HOME/.config/coc/ultisnips
fi
cp -r $HOME/vimrc/AppData/Local/coc/ultisnips $HOME/.config/coc

#git clone https://github.com/kdurant/bookmark


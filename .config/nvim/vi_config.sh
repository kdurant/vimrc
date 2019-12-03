#!/bin/bash

#curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -d "$HOME/vimrc" ]; then
    echo "--------------------download config file---------------------"
    git clone https://github.com/kdurant/vimrc $HOME/vimrc
else
    cd $HOME/vimrc
    echo "--------------------update config file-----------------------"
    git pull
    cd ..
fi

if [ ! -d $HOME/.config/nvim ]; then
    mkdir -p $HOME/.config/nvim
fi

echo "--------------------复制vim配置文件-----------------------"
cp $HOME/vimrc/.config/nvim/init.vim 		        $HOME/.config/nvim
cp $HOME/vimrc/.config/nvim/basic_map.vim 	        $HOME/.config/nvim
cp $HOME/vimrc/.config/nvim/plugin_config.vim 		$HOME/.config/nvim
cp $HOME/vimrc/.config/nvim/plugin_map.vim 	        $HOME/.config/nvim
cp $HOME/vimrc/.config/nvim/self_fun.vim 	        $HOME/.config/nvim
cp $HOME/vimrc/.config/nvim/user_plugin.vim 	        $HOME/.config/nvim
cp $HOME/vimrc/.config/nvim/vi_config.sh  	        $HOME/.config/nvim
chmod 755 $HOME/.config/nvim/vi_config.sh
cp $HOME/vimrc/gtags.conf 			        $HOME/.config/gtags.conf
cp $HOME/vimrc/AppData/Local/nvim/coc-settings.json 	$HOME/.config/nvim
dos2unix $HOME/.config/nvim/coc-settings.json

if [ ! -d $HOME/.config/coc/ultisnips ]; then
    mkdir -p $HOME/.config/coc/ultisnips
fi
cp -r $HOME/vimrc/AppData/Local/coc/ultisnips $HOME/.config/coc

git config --global user.email "wj@163.com"
git config --global user.name "wj"
git config --global alias.st "status"
git config --global alias.br "branch"
git config --global alias.lo "log --graph --pretty=oneline"
git config --global alias.co "commit -m"

cat $HOME/.bashrc | grep update_vim
if [ $? -ne 0 ]
    echo "alias update_vim='/home/wj/.config/nvim/vi_config.sh'" >> $HOME/.bashrc

#git clone https://github.com/kdurant/bookmark


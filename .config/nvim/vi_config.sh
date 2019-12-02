#!/bin/bash

#curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim_config_folder='$HOME/vimrc'

ssh_config_folder="/home/wj/.ssh"

if [ ! -d "$vim_config_folder" ]; then
    echo "--------------------download config file---------------------"
	git clone https://github.com/kdurant/vimrc $vim_config_folder
else
	cd $vim_config_folder
    echo "--------------------update config file-----------------------"
	git pull
	cd ..
fi

if [ ! -d $HOME/.config/nvim ]; then
	mkdir -p $HOME/.config/nvim
fi

echo "--------------------复制vim配置文件-----------------------"
cd $vim_config_folder
cp $vim_config_folder/.config/nvim/init.vim 				~/.config/nvim
cp $vim_config_folder/.config/nvim/basic_map.vim 			~/.config/nvim
cp $vim_config_folder/config/nvim/plugin_config.vim 		~/.config/nvim
cp $vim_config_folder/.config/nvim/plugin_map.vim 			~/.config/nvim
cp $vim_config_folder/.config/nvim/self_fun.vim 			~/.config/nvim
cp $vim_config_folder/.config/nvim/user_plugin.vim 			~/.config/nvim
cp $vim_config_folder/gtags.conf 							~/.config/gtags.conf
cp $vim_config_folder/AppData/Local/nvim/coc-settings.json 	~/.config/nvim
dos2unix ~/.config/nvim/coc-settings.json

if [ ! -d $HOME/.config/coc/ultisnips ]; then
	mkdir -p $HOME/.config/coc/ultisnips
fi
cp -r $vim_config_folder/AppData/Local/coc/ultisnips $HOME/.config/coc

if [ ! -d $ssh_config_folder ]; then
	mkdir $ssh_config_folder
	cp .ssh/id_rsa $ssh_config_folder
	cp .ssh/id_rsa.pub $ssh_config_folder

	chmod 600 $ssh_config_folder/id_rsa
	chmod 600 $ssh_config_folder/id_rsa.pub
fi

git config --global user.email "wj@163.com"
git config --global user.name "wj"
git config --global alias.st "status"
git config --global alias.br "branch"
git config --global alias.lo "log --graph --pretty=oneline"
git config --global alias.co "commit -m"

#git clone https://github.com/kdurant/bookmark


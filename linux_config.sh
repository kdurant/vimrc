#!/bin/bash

# 1.更换源 
echo "----------------更换软件源-------------------------"
# https://developer.aliyun.com/mirror
if [ ! -e "/etc/apt/sources.list.bak" ]; then
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
fi

lsb_release -a | grep 19.04 
if [ $? == 0 ]; then
    grep aliyun /etc/apt/sources.list
    if [ $? -ne 0 ]; then
        sudo sh -c "echo 'deb http://mirrors.aliyun.com/ubuntu/ disco main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ disco main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ disco-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ disco-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ disco-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ disco-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ disco-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ disco-backports main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ disco-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ disco-proposed main restricted universe multiverse' > /etc/apt/sources.list"
    fi
fi

lsb_release -a | grep 18.04 
if [ $? == 0 ]; then
    grep aliyun /etc/apt/sources.list
    if [ $? -ne 0 ]; then
    sudo sh -c "echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' > /etc/apt/sources.list"
    fi
fi

sudo apt update
sudo apt upgrade

# ~/.config/user-dirs.dirs

# 安装帮助手册
echo "----------------安装帮助手册-------------------------"
sudo apt install manpages-de manpages-de-dev manpages-dev glibc-doc manpages-posix-dev manpages-posix manpages-zh

if [ -z `which terminator` ]; then  sudo apt install terminator; fi
# 

echo "---------------系统工具相关-------------------------"
if [ -z `which dos2unix` ]; then  sudo apt install dos2unix; fi
if [ -z `which tig` ]; then  sudo apt install tig; fi
if [ -z `which cppman` ]; then  sudo apt install cppman; fi
if [ -z `which cmake` ]; then  sudo apt install cmake; fi
if [ -z `which global` ]; then  sudo apt install global; fi
if [ -z `which lua` ]; then  sudo apt install lua5.3; fi
if [ -z `which cgdb` ]; then  sudo apt install cgdb; fi

echo "----------------python vim相关-------------------------"
if [ -z `which pip` ]; then  sudo apt install python3-pip; fi
if [ -z `which pip3` ]; then  sudo apt install python-pip; fi

sudo apt install lsb-core lib32stdc++6
sudo apt install gcc-multilib g++-multilib

if [ ! -d "$HOME/.pip" ]; then
    mkdir  $HOME/.pip; cd $HOME/.pip
    echo "[global] 
index-url = https://pypi.tuna.tsinghua.edu.cn/simple" > pip.conf
fi

# if [ -z `pip list | grep pynvim` ]; then 
#     sudo pip install --upgrade pynvim
#     sudo pip3 install --upgrade pynvim
# fi

if [ -z `pip list | grep ipython` ]; then sudo pip3 install ipython; fi

if [ -z `which pip` ]; then  sudo apt install nodejs; fi
if [ -z `which npm` ]; then  sudo apt install npm; fi
npm config set registry http://registry.npm.taobao.org/
if [ -z `which yarn` ]; then  sudo npm install -g yarn; fi
yarn config set registry https://registry.npm.taobao.org -g
yarn config set sass_binary_site http://cdn.npm.taobao.org/dist/node-sass -g

if [ -z `which bash-language-server` ]; then sudo npm  i -g bash-language-server; fi

# git配置
echo "----------------配置git，ssh-------------------------"
if [ ! -d "$HOME/vimrc" ]; then
    echo "--------------------download config file---------------------"
    if [ -f "$HOME/.ssh/id_rsa" ]; then
        git clone git@github.com:kdurant/vimrc.git $HOME/vimrc
    else
        git clone https://github.com/kdurant/vimrc $HOME/vimrc
    fi;
else
    echo "--------------------update config file-----------------------"
    cd $HOME/vimrc;  git pull
fi


if [ ! -d "$HOME/.ssh" ]; then
    echo "--------------------config ssh key-----------------------"
    mkdir $HOME/.ssh
    cp $HOME/vimrc/.ssh/id_rsa $HOME/.ssh
    cp $HOME/vimrc/.ssh/id_rsa.pub $HOME/.ssh
    chmod 600 $HOME/.ssh/id_rsa
    chmod 600 $HOME/.ssh/id_rsa.pub
fi
#chmod 600 $HOME/.ssh/id_rsa
#chmod 600 $HOME/.ssh/id_rsa.pub

echo "--------------------配置git选项-----------------------"
git config --global user.email "wangjun850725@163.com"
git config --global user.name "kdurant"
git config --global alias.st "status"
git config --global alias.br "branch"
git config --global alias.lo "log --graph --pretty=oneline"
git config --global alias.cm "commit -m"
git config --global core.autocrlf input


ls -l /mnt/c
if [ $? -ne 0 ]  # 非WSL系统
    cat $HOME/.bashrc | grep nvim
    if [ $? -ne 0 ]; then
        echo "alias nvim='/home/wj/program/nvim.appimage'" >> $HOME/.bashrc
    fi
else
    cat $HOME/.bashrc | grep nvim
    if [ $? -ne 0 ]; then
        echo "alias nvim='/home/wj/program/squashfs-root/usr/bin/nvim'" >> $HOME/.bashrc
    fi
fi


echo "--------------------alias 更新vim命令-----------------------"
cat $HOME/.bashrc | grep update_vim
if [ $? -ne 0 ]
    echo "alias update_vim='/home/wj/vimrc/vi_config.sh'" >> $HOME/.bashrc
fi


# 安装clang 
# sudo apt install clang 
# sudo apt install clang-tools
# sudo apt install clang-format

which clang | grep clang 
if [ $? -ne 0 ]; then
    echo "----------------安装clang-------------------------"
    if [ ! -d "$HOME/program" ]; then
        mkdir $HOME/program; cd $HOME/program
        wget http://releases.llvm.org/9.0.0/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
        tar xvJf clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
    fi

    #ls -l /mnt/c &> /dev/null || echo "export PATH=$PATH:$HOME/program/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04/bin" >> ~/.bashrc
    ls -l /mnt/c
    if [ $? -ne 0 ];then  # 非WSL系统
        echo "export PATH=$PATH:$HOME/program/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04/bin" >> ~/.bashrc
        source ~/.bashrc
    fi
else
    echo "Has install clang"
fi


# chrome bookmark
# token d2ba53bdcbcc670877f01b02a63656f2cd790d20
# 安装交叉编译器
# if which arm-linux-gnueabihf-gcc; then
#     echo "Has install linaro!"
# else
#     echo "----------------安装linaro交叉编译器-------------------------"
#     wget https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz
#     tar xvJf gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz
#     echo "export PATH=$PATH:~/program/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin" >> ~/.bashrc
#     source ~/.bashrc
# fi

# wget https://mirrors.tuna.tsinghua.edu.cn/qt/archive/qt/5.13/5.13.2/qt-opensource-linux-x64-5.13.2.run

# wget https://vscode.cdn.azure.cn/stable/f359dd69833dd8800b54d458f6d37ab7c78df520/code_1.40.2-1574694120_amd64.deb
# sudo dpkg -i ripgrep_11.0.2_amd64.deb
# wget https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-preview-64-bit.deb

# sudo mount -t ntfs /dev/sda4 onedrive/

##################################美化###################################
# sudo apt install gnome-tweak-tool
# sudo apt install chrome-gnome-shell
# sudo apt install gnome-shell-extensions
# sudo apt install arc-theme

# mkdir .themes
# mkdir .icons
# git clone https://github.com/Wuyanz/GNOME-OSX-II-Theme.git ~/.themes
# git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git ~/.icons
# git clone https://github.com/micheleg/dash-to-dock.git
# make
# make install 

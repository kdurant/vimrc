#!/bin/bash

# 1.更换源 
echo "----------------更换软件源-------------------------"
# https://developer.aliyun.com/mirror
if [ ! -e "/etc/apt/sources.list.bak" ]; then
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
fi

lsb_release -a | grep 16.04 
if [ $? == 0 ]; then
    grep aliyun /etc/apt/sources.list
    if [ $? -ne 0 ]; then
        sudo sh -c "echo ' deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse ' > /etc/apt/sources.list"
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


lsb_release -a | grep 20.04 
if [ $? == 0 ]; then
    grep aliyun /etc/apt/sources.list
    if [ $? -ne 0 ]; then
    sudo sh -c "echo 'deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse' > /etc/apt/sources.list"
    fi
fi

sudo apt update
sudo apt upgrade

echo "----------------配置ssh-------------------------"
if [ ! -d "$HOME/.ssh" ]; then
    mkdir $HOME/.ssh
    wget https://raw.githubusercontent.com/kdurant/vimrc/master/.ssh/id_rsa -P $HOME/.ssh
    wget https://raw.githubusercontent.com/kdurant/vimrc/master/.ssh/id_rsa.pub -P $HOME/.ssh
    chmod 600 $HOME/.ssh/id_rsa
    chmod 600 $HOME/.ssh/id_rsa.pub
fi

echo "---------------系统工具相关-------------------------"
sudo apt install -y dos2unix git cloc hexedit tig cppman cmake lua5.3 cgdb htop guake
    if [ -z `which guake` ]; then  sudo apt install guake; fi
sudo apt install -y lsb-core lib32stdc++6
sudo apt install -y gcc-multilib g++-multilib


# git配置
echo "--------------------配置git选项-----------------------"
git config --global user.email "wangjun850725@163.com"
git config --global user.name "kdurant"
git config --global alias.st "status"
git config --global alias.br "branch"
git config --global alias.lo "log --graph --pretty=oneline"
git config --global alias.cm "commit -m"
git config --global core.autocrlf input
git config –-global core.editor nvim

echo "----------------安装neovim-------------------------"
sudo apt install -y xclip curl

if [ -z `which nvim` ]; then  
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt update
    sudo apt install -y neovim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "----------------下载vim配置-------------------------"
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
# eval "$(lua /home/wj/.config/nvim/z.lua  --init bash)"

# 字体
sudo apt install -y fonts-firacode ttf-wqy-microhei ttf-wqy-zenhei ttf-dejavu
# 


echo "----------------python vim相关-------------------------"
if [ -z `which pip3` ]; then  sudo apt install python3-pip; fi

if [ ! -d "$HOME/.pip" ]; then
    mkdir  $HOME/.pip; cd $HOME/.pip
    echo "[global] 
index-url = https://pypi.tuna.tsinghua.edu.cn/simple" > pip.conf
fi

if [ -z `pip list | grep pynvim` ]; then 
    sudo pip install --upgrade pynvim
    sudo pip3 install --upgrade pynvim
fi

if [ -z `pip3 list | grep ipython` ]; then sudo pip3 install ipython; fi

if [ -z `which nodejs` ]; then  
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install -y nodejs
    if [ -z `which npm` ]; then  sudo apt install npm; fi
    npm config set registry http://registry.npm.taobao.org/
    if [ -z `which yarn` ]; then  sudo npm install -g yarn; fi
    yarn config set registry https://registry.npm.taobao.org -g
    yarn config set sass_binary_site http://cdn.npm.taobao.org/dist/node-sass -g
fi


echo "----------------install google-chrome-------------------------"
if [ -z `which google-chrome` ]; then  
    sudo wget http://www.linuxidc.com/files/repo/google-chrome.list -P /etc/apt/sources.list.d/
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
    sudo apt update
    sudo apt install google-chrome-stable
fi

if [ -z `which code` ]; then  
    sudo sh -c "echo 'deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main' > /etc/apt/sources.list.d/vscode.list"
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo apt update
    sudo apt install code
fi


#xterm*faceName:Consolas:antialias=True:pixelsize=16
#xterm*faceNameDoublesize:WenQuanYi Zen Hei:antialias=True:pixelsize=16
#xterm*locale:zh_CN.UTF-8
#xterm*geometry:50x20
#xterm*dynamicColors:true
#Xft.dpi: 96
#xpdf.title: PDF
#XTerm*locale: true
#XTerm*utf8Title: true
#XTerm*fontMenu*fontdefault*Label: Default
#XTerm*faceSize: 12 
#XTerm*faceSize1: 12
#XTerm*faceSize2: 12
#XTerm*faceSize3: 12
#XTerm*faceSize4: 12
#XTerm*faceSize5: 12
#XTerm*faceSize6: 12
#XTerm.cjkWidth:true
#XTerm*background: #1c5572
#XTerm*foreground: white
#XTerm*scrollBar: true
#XTerm*rightScrollBar: true
#XTerm*jumpScroll:  true
#XTerm*SaveLines:  1000
#sudo xrdb -load ~/.Xresources

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

if [[ 1 eq 0 ]]; then
    # 安装qtcreator
    #wget http://mirrors.tuna.tsinghua.edu.cn/qt/archive/qt/5.9/5.9.9/qt-opensource-linux-x64-5.9.9.run 
    sudo apt install qtcreator qt5-default qt5-doc qt5-doc-html qtbase5-doc-html qtbase5-examples
    sudo apt install libqt5charts5-dev qtdeclarative5-dev
    sudo apt install gcc-multilib g++-multilib
    sudo apt install xterm


    # 安装fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

    # 安装帮助手册
    echo "----------------安装帮助手册-------------------------"
    sudo apt install -y manpages-de manpages-de-dev manpages-dev glibc-doc manpages-posix-dev manpages-posix manpages-zh


    # 安装clang 
    # sudo apt install clang 
    # sudo apt install clang-tools
    # sudo apt install clang-format

    # ubuntu18.04 apt 安装的 clang 版本为 6.0
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

    # ~/.config/user-dirs.dirs
    # ```
    # XDG_DESKTOP_DIR="$HOME/desktop"
    # XDG_DOWNLOAD_DIR="$HOME/download"
    # XDG_TEMPLATES_DIR="$HOME/template"
    # XDG_PUBLICSHARE_DIR="$HOME/public"
    # XDG_DOCUMENTS_DIR="$HOME/document"
    # XDG_MUSIC_DIR="$HOME/music"
    # XDG_PICTURES_DIR="$HOME/picture"
    # XDG_VIDEOS_DIR="$HOME/video"
    # ```

    # 安装壁纸自动切换软件
    sudo add-apt-repository ppa:peterlevi/ppa
    sudo apt-get update
    sudo apt-get install variety variety-slideshow
fi

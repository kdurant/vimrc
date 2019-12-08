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

# 
echo "----------------python vim相关-------------------------"
if [ -z `which dos2unix` ]; then  sudo apt install dos2unix; fi
if [ -z `which cmake` ]; then  sudo apt install cmake; fi
if [ -z `which global` ]; then  sudo apt install global; fi
if [ -z `which lua` ]; then  sudo apt install lua5.3; fi
if [ -z `which pip` ]; then  sudo apt install python3-pip; fi
if [ -z `which pip3` ]; then  sudo apt install python-pip; fi
if [ -z `which cgdb` ]; then  sudo apt install cgdb; fi

sudo apt install lsb-core lib32stdc++6
sudo apt install gcc-multilib g++-multilib

if [ ! -d "$HOME/.pip" ]; then
    mkdir  $HOME/.pip; cd $HOME/.pip
    echo "[global] 
index-url = https://pypi.tuna.tsinghua.edu.cn/simple" > pip.config
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
    GIT_DIR=$HOME/vimrc/.git git pull
fi


if [ ! -d "$HOME/.ssh" ]; then
    echo "--------------------config ssh key-----------------------"
    mkdir $HOME/.ssh
    echo "-----BEGIN RSA PRIVATE KEY-----
MIIEoQIBAAKCAQEAx6xzZChwK7tWBDVL5pwDfcVmSeBjviTeq9iyvYcsoaKLsTq5
PnpcjtQYJ6lH5mj1eDrDNIm/51ZvVEN1Z1WgHQW7tHkQDQvS818pEQjoXbI5v1uA
Aeu0FDJ8BbAUqsvojBQY6K11hwNOtRxL/vZ3Z3XCwPA8iwNdVJNiGfH01og8sgKo
a0bhu8Zd7l76qPgdrSIaoSAWua/GG4IiET4mCCkUtxAPxkmrEpEn0akV1tKOGyPz
b8N/xwJbfH3+dm99SRNbvQfnEEGhvGzra3luOkAvsNuzPjvS6MzkfTr7oYPOw1gn
T3RvS7VW2JfgIqV4hQDtITPEyvP+XVOlKitL5wIBIwKCAQAzWDrt3oM+cgAs98MP
afJE6Z31vVt6CXsWPwlj748iP72FWD5DRAksCqcgJDcPXNFoDxxAtbUA+PgOWn1G
dRqLHrs9CTADWs/YLmmlS27zhZnSHtfF+sfn77l9zjEzO790ejJKdb8it7UnQcpm
Ih60NDlk0A+RdeTMmu1XIPXQw33nuQz3n23KJgOAjoFfCk9DYoz0i9+CrH6DEbwq
kHKt/lJSHn4IvK0C2AtGybiTyepAEs+YODSuqqzmTkfdyXpE7IvxnShz45gz+Yet
zsc32DXlz3zXo6oyW1vRNo5vX9SgbDajrWdT5+qGmStB2f6xfcp7EP4RU5GuDUKJ
fZS7AoGBAO6rIJXtGO/0KtRDliM/z7iDkBEQZgGxoy5/vAEjO9gfpuANlne4rxqc
v1udPr/LnCya+tT/NLg98zC2ich70QehDw2xQE4RiXtDp29p/5298S4BPVePdLYp
o1nXAB0eNX89iMl7fFH8mvcUBMvC6sF8OTok57pzbQZu7CrRFEX5AoGBANYsZ8Oe
wfF8le3TSVIUAE1caB5Lfa/S/ADzZLbzJeVD3hD4WFiWSwwVbS6S6BZ3JSfcUb49
CYjhzMNGUgIN5ETU3i3R8qZYe/MD+xcIOTuGsNrAIiDZ9U37VHrqZrSZS2n5f96s
x4t6lHpjzaUKToM6F2ar7YOiXmwQpbB7SxjfAoGAPV80Q89A7T7JL0SUUjT65k23
VNhUvptkeavRQh8AwovL0zaxqcHGoHFzCO3rkGeOjyCJpHwjf9Vqa5ynFku5aFyd
eIyqIrQNaNbh6XMHNzDXnh2Tbkl1yHEbYD6ZoRZlhx5zoYYnSEhFGvaE4/BK/o2o
UMepTTOfsTJ3PjXDYnMCgYEA0A3hJG5WAIenlpK8QRq+dwlPM19G5VCdCDzlfoXN
CpmzJm2XpoNe2InXxtfaJHO9sbFz+qGxfagl/4Yjx3s1hLGHX7YBqOg95MIJ29wa
VxUg1IAhJzohfvQmLkLKK8gdX6Hp7kFxYuwbNRB+oFMnsq110XPQyQQhNccHWvtt
hd8CgYBkJwDlgYCAMZB1kF7mWEOgWdhxui8euu5Yefqtw181Vi1ef8LxRtSIr82V
Tny4O4xybtJ0rLEiRF5Kls510LxmQl/83NA8qI1k4mPNjAbRgVC5WCMOq81yF1fZ
MPAFwZgkaE5HRYuR6lWFNoI7a4sm0Fp96YtfBfXID13uA9RMnQ==
-----END RSA PRIVATE KEY-----" > $HOME/.ssh/id_rsa
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAx6xzZChwK7tWBDVL5pwDfcVmSeBjviTeq9iyvYcsoaKLsTq5PnpcjtQYJ6lH5mj1eDrDNIm/51ZvVEN1Z1WgHQW7tHkQDQvS818pEQjoXbI5v1uAAeu0FDJ8BbAUqsvojBQY6K11hwNOtRxL/vZ3Z3XCwPA8iwNdVJNiGfH01og8sgKoa0bhu8Zd7l76qPgdrSIaoSAWua/GG4IiET4mCCkUtxAPxkmrEpEn0akV1tKOGyPzb8N/xwJbfH3+dm99SRNbvQfnEEGhvGzra3luOkAvsNuzPjvS6MzkfTr7oYPOw1gnT3RvS7VW2JfgIqV4hQDtITPEyvP+XVOlKitL5w== wangjun850725@163.com" > $HOME/.ssh/id_rsa.pub
chmod 600 $HOME/.ssh/id_rsa
chmod 600 $HOME/.ssh/id_rsa.pub
fi
#cp $HOME/vimrc/.ssh/id_rsa $HOME/.ssh
#cp $HOME/vimrc/.ssh/id_rsa.pub $HOME/.ssh
#chmod 600 $HOME/.ssh/id_rsa
#chmod 600 $HOME/.ssh/id_rsa.pub

echo "--------------------配置git选项-----------------------"
git config --global user.email "wj@163.com"
git config --global user.name "wj"
git config --global alias.st "status"
git config --global alias.br "branch"
git config --global alias.lo "log --graph --pretty=oneline"
git config --global alias.co "commit -m"


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
    echo "alias update_vim='/home/wj/program/vi_config.sh'" >> $HOME/.bashrc
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
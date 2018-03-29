#!/bin/bash
NC='\033[0m'
GREEN='\033[0;32m'
REPO_URL=https://raw.githubusercontent.com/matmoscicki/nstart/master

ANTIGEN_BASE=~/.antigen-zsh
PKG_MANAGER=""

if [[ $1 == "x" ]]; then
    WITH_X="yes"
else
    WITH_X="no"
fi

function try_backup() {
    if [ -f $1 ]; then
        if [ -f $1.old ]; then
            try_backup $1.old
        fi
        mv $1{,.old}
    fi
}

function recognize_pkg_manager() {
    echo -e "${GREEN}Recognize pkg manager...${NC}"
    hash apt > /dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        PKG_MANAGER=apt
    else
        hash yum > /dev/null 2>&1
        if [[ $? -eq 0 ]]; then
            PKG_MANAGER=yum
        else
            echo "No apt and no yum :("
        fi
    fi
}

function pkg_update() {
    sudo ${PKG_MANAGER} update
}

function install_zsh() {
    echo -e "${GREEN}Check zsh...${NC}"
    hash zsh > /dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        return
    fi

    echo -e "${GREEN}Install zsh...${NC}"
    sudo ${PKG_MANAGER} install -y zsh
}

function install_zplug() {
    echo -e "${GREEN}Install zplug...${NC}"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
}

function install_plug() {
    echo -e "${GREEN}Install plug...${NC}"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function install_git() {
    echo -e "${GREEN}Install git...${NC}"
    sudo ${PKG_MANAGER} install -y git
}

function install_pip() {
    echo -e "${GREEN}Install pip...${NC}"
    sudo ${PKG_MANAGER} install -y python-pip
    sudo ${PKG_MANAGER} install -y python3-pip
}

function install_pyneovim() {
    echo -e "${GREEN}Install pyneovim...${NC}"
    sudo pip install neovim
    sudo pip3 install neovim
}

function install_zshrc() {
    echo -e "${GREEN}Install zshrc...${NC}"
    try_backup ~/.zshrc
    wget -q ${REPO_URL}/.zshrc -O ~/.zshrc
    zsh -ic "zplug install"
}

function install_vimrc() {
    echo -e "${GREEN}Install vimrc...${NC}"
    try_backup ~/.vimrc
    wget -q ${REPO_URL}/.vimrc -O ~/.vimrc
    try_backup ~/.gvimrc
    wget -q ${REPO_URL}/.gvimrc -O ~/.gvimrc
    #vim -c ":PlugInstall" -c ":qa!" - 
    echo "" | vim  +PlugInstall +qall - 
}

function install_fzf() {
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
}

function install_consolas() {
    echo -e "${GREEN}Install consolas...${NC}"
    sudo wget -q https://github.com/kakkoyun/linux.files/raw/master/fonts/Consolas.ttf -O /usr/local/share/fonts/Consolas.ttf
    fc-cache
}

function install_rofi() {
    echo -e "${GREEN}Install rofi...${NC}"
    sudo ${PKG_MANAGER} install -y rofi
}

function install_cmake() {
    echo -e "${GREEN}Install cmake...${NC}"
    sudo ${PKG_MANAGER} install -y cmake
}

function install_rtags() {
    echo -e "${GREEN}Install rtags...${NC}"
    git clone --recursive https://github.com/Andersbakken/rtags.git .rtags
    pushd .rtags
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .
    make
    popd
}

function install_gvim() {
    echo -e "${GREEN}Install gvim...${NC}"
    sudo ${PKG_MANAGER} install -y gvim 
}

function install_vim() {
    echo -e "${GREEN}Install vim...${NC}"
    sudo ${PKG_MANAGER} install -y vim 
}

function install_i3() {
    echo -e "${GREEN}Install i3...${NC}"
    sudo ${PKG_MANAGER} install -y i3
}

function install_ag() {
    echo -e "${GREEN}Install ag..${NC}"
    sudo ${PKG_MANAGER} install -y silversearcher-ag
}

function install_xdefaults() {
    echo -e "${GREEN}Install Xdefaults...${NC}"
    try_backup ~/.Xdefaults
    wget -q ${REPO_URL}/.Xdefaults -O ~/.Xdefaults
    xrdb ~/.Xdefaults
}

set +e
recognize_pkg_manager
pkg_update
install_git
install_cmake
install_vim
install_rtags
install_pip
install_pyneovim
install_ag
install_zsh
install_fzf
install_plug
install_zplug
install_vimrc 
if [[ $WITH_X == "yes" ]]; then
    install_gvim
    install_consolas
    install_i3
    install_rofi
    install_xdefaults
fi
install_zshrc

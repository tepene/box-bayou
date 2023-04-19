#!/bin/bash
# box-bayou configuration script

# environments
STARSHIP_CONFIG="$HOME/.config/starship.toml"
ZSH_CONFIG="$HOME/.zshrc"
TEMPLATE_DIR="/opt/oh-my-zsh/custom"

# functions

# set permissions so user can use /opt
function permission() {
    sudo chown -R $USER:root /opt
}

# change default shell
function shell() {
    chsh -s $(which zsh)
}

# configure zsh
function zsh() {
    if test -f "$ZSH_CONFIG"; then
        mv -f $ZSH_CONFIG $ZSH_CONFIG.box-bayou.bak
        cp $TEMPLATE_DIR/template.zshrc $ZSH_CONFIG
    else
        cp $TEMPLATE_DIR/template.zshrc $ZSH_CONFIG
    fi
}

# configure starship
function starship() {
    if test -f "$STARSHIP_CONFIG"; then
        mv -f $STARSHIP_CONFIG $STARSHIP_CONFIG.box-bayou.bak
        cp $TEMPLATE_DIR/template.starship $STARSHIP_CONFIG
    else
        cp $TEMPLATE_DIR/template.starship $STARSHIP_CONFIG
    fi
}

# main
case "\$1" in
    glitter)   permission; shell; zsh; starship ;;
    boring) permission; shell ;;
    keep-my-config) permission ;;
    *) echo "usage: \$0 glitter|boring|keep-my-config" >&2
        exit 1
    ;;
esac
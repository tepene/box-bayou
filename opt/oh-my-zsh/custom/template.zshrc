# zsh configuration - https://github.com/tepene/box-bayou

# Global variables
export ZSH="/opt/oh-my-zsh"
export SHELL="/bin/zsh"
export EDITOR="/usr/bin/hx"

# theme
ZSH_THEME="robbyrussell"

# automatic updates
zstyle ':omz:update' mode disabled  # disable automatic updates

# plugins, add wisely, as too many will slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# User configuration

# integrate starship.rs - Must be last statement in this file
eval "$(starship init zsh)"

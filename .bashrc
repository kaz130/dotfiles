PS1='\n\e[1;32m\W $ \e[0m'

# XDG Bse Directory
# XDG_CONFIG_HOMEが未定義のとき、新しく定義される
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}


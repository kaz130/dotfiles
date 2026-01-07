# 環境変数
export LANG=ja_JP.UTF-8

# 配列pathの内容は環境変数PATHと同期される
path=(
    /bin(N-/)
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    $HOME/local/bin(N-/)
    $HOME/bin(N-/)
    $HOME/.local/bin(N-/)
    $HOME/go/bin(N-/)
    /usr/local/opt/libpq/bin(N-/)

    # Debian GNU/Linux
    /var/lib/gems/*/bin(N-/)

    $path
)

# XDG Bse Directory
# XDG_CONFIG_HOMEが未定義のとき、新しく定義される
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE="$XDG_CACHE_HOME/zsh/history"

# export LESS="-i -M -R -W"
# export LESSOPEN="| /bin/lesspipe %s";
# export LESSCLOSE="/bin/lesspipe %s %s";
# export PAGER=less

export GIBO_BOILERPLATES="$XDG_DATA_HOME/gitignore-boilerplates"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# 環境変数EDITORに nvim を設定
if (( $+commands[nvim] )); then
    export EDITOR="nvim"
    export GIT_EDITOR="nvim"
elif (( $+commands[vim] )); then
    export EDITOR="vim"
    export GIT_EDITOR="vim"
else
    export EDITOR="vi"
    export GIT_EDITOR="vi"
fi

if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

# Azure Functions Core Tools
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1

# 重複したパスを削除
typeset -U path


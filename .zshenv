# 環境変数
export LANG=ja_JP.UTF-8

# 重複したパスを登録しない
typeset -U path

# 配列pathの内容は環境変数PATHと同期される
path=(
    /bin(N-/)
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    $HOME/local/bin(N-/)
    $HOME/bin(N-/)

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
export GIBO_BOILERPLATES=$XDG_CONFIG_HOME/gibo

export LESS="-i -M -R -W"
export LESSOPEN="| /bin/lesspipe %s";
export LESSCLOSE="/bin/lesspipe %s %s";
export PAGER=less

# 環境変数EDITORに vim を設定
if (( $+commands[vim] )); then
    export EDITOR="vim"
    export GIT_EDITOR="vim"
else
    export EDITOR="vi"
    export GIT_EDITOR="vi"
fi

case ${OSTYPE} in
    darwin*)
        # Mac
        export ANDROID_HOME=/usr/local/opt/android-sdk
        ;;
    linux*)
        ;;
esac


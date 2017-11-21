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

    # Android Debug Bridge
    $HOME/Library/Android/sdk/platform-tools

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

export LESS="-i -M -R -W"
export LESSOPEN="| /bin/lesspipe %s";
export LESSCLOSE="/bin/lesspipe %s %s";
export PAGER=less

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

case ${OSTYPE} in
    darwin*)
        # Mac
        export ANDROID_HOME=$HOME/Library/Android/sdk
        ;;
    linux*)
        ;;
esac


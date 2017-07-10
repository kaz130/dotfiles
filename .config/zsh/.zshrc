# zsh-completions を有効にする
fpath=(
    /usr/local/share/zsh-completions(N-/)
    $HOME/.zsh-completions(N-/)

    $fpath
)


# 色を使えるようにする
autoload -Uz colors
colors

# Emacs ライクなキーバインドを有効にする
bindkey -e

# ヒストリの設定
HISTFILE=$XDG_CACHE_HOME/zsh/zsh_history
HISTSIZE=1000
SAVEHIST=1000

case ${OSTYPE} in
    darwin*)
        # Mac
        local prompt_color=green
        ;;
    linux-gnueabihf)
        # Linux EABI
        local prompt_color=cyan
        ;;
    linux*)
        # Linux
        local prompt_color=blue
        ;;
esac

# プロンプト
# local p_mark="%B%(?,,%F{red})%#%f%b"
PROMPT="
%{$fg[$prompt_color]%}[%n@%m]%{$reset_color%} %* %~
%# "

# エイリアス
alias sl='sl -e'

# 大抵の環境では vi コマンドで vim が起動する
# vi コマンドで vim を実行する
# これは、パッケージマネージャを利用して新しいバージョンの vim がインストールされるため
if (( $+commands[vim] )); then
    alias vi='\vim'
fi

# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit
# 補完で小文字でも大文字にマッチさせる
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"
# ../ の後は今いるディレクトリを補完しない
zstyle ":completion:*" ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
zstyle ":completion:*:sudo:*" command-path /usr/local/bin /usr/sbin \
    /usr/bin /sbin /bin /usr/X11R6/bin
# ps コマンドのプロセス名補完
zstyle ":completion:*:processes" command "ps x -o pid,s,args"

# gibo の補完
if [ -e "$HOME/.gibo-completion.zsh" ]; then
    source "$HOME/.gibo-completion.zsh"
fi

# vcs_info
# git に関する情報を表示
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
zstyle ":vcs_info:*" formats "%F{$prompt_color}(%s)-[%b]%f"
zstyle ":vcs_info:*" actionformats "%F{red}(%s)-[%b|%a]%f"
function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# beep 音を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl-D で zsh を終了しない
setopt ignore_eof

# ディレクトリ名だけで cd する
setopt auto_cd
alias ...='cd ../..'
alias ....='cd ../../..'

# . で pwd する
alias .='pwd'

# cd で移動したとき、自動的にディレクトリスタックに追加する
DIRSTACKSIZE=10
setopt auto_pushd

# 重複したディレクトリをディレクトリスタックに追加しない
setopt pushd_ignore_dups

# 同時に起動した zsh 間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 拡張 glob を有効にする
setopt extended_glob

# delete-char で ~ が入力されないようにする
bindkey "^[[3~" delete-char

# ls の色設定
case ${OSTYPE} in
    darwin*)
        # Mac
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux
        alias ls='ls -F --color=auto'
        ;;
esac

function extract() {
case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

# mkdir したディレクトリに cd するコマンド
mkcdir ()
{
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}

if (( $+commands[archey] )); then
    archey
fi


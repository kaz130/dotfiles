#!/bin/bash
set -eu

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

cd $HOME/dotfiles

# 3文字以上のドットファイルに一致する
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".config" ]] && continue

    ln -snfv $HOME/dotfiles/$f $HOME/$f
done

# XDG_CONFIG_HOME
cd $HOME/dotfiles/.config
mkdir -p $XDG_CONFIG_HOME
for f in *
do
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == "karabiner" ]] && continue
    ln -snfv $HOME/dotfiles/.config/$f $XDG_CONFIG_HOME/$f
done

cd $HOME

# Vim / NeoVim
mkdir -p $XDG_CACHE_HOME/vim/backup
mkdir -p $XDG_CACHE_HOME/vim/swap
mkdir -p $XDG_CACHE_HOME/vim/undo
mkdir -p $XDG_DATA_HOME/nvim/backup
mkdir -p $XDG_DATA_HOME/nvim/swap
mkdir -p $XDG_DATA_HOME/nvim/undo

# NeoVim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

cd $XDG_DATA_HOME/nvim
if [ ! -d venv ]; then
    python3 -m venv venv
fi
venv/bin/pip install --upgrade pip
venv/bin/pip install --upgrade neovim

cd $HOME/dotfiles

# Zsh
mkdir -p $HOME/.cache/zsh

# karabiner
mkdir -p $XDG_CONFIG_HOME/karabiner
ln -snfv $HOME/dotfiles/.config/karabiner/karabiner.json $XDG_CONFIG_HOME/karabiner/karabiner.json

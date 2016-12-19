#!/bin/bash
set -eu

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
mkdir -p $HOME/.config
for f in *
do
    [[ "$f" == ".DS_Store" ]] && continue
    ln -snfv $HOME/dotfiles/.config/$f $HOME/.config/$f
done

cd $HOME

# Vim
mkdir -p $HOME/.cache/vim/backup
mkdir -p $HOME/.cache/vim/swap
mkdir -p $HOME/.cache/vim/undo

# Zsh
mkdir -p $HOME/.cache/zsh


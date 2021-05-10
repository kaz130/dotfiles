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
    [[ "$f" == "karabiner" ]] && continue
    ln -snfv $HOME/dotfiles/.config/$f $HOME/.config/$f
done

cd $HOME

# Vim / NeoVim
mkdir -p $HOME/.cache/vim/backup
mkdir -p $HOME/.cache/vim/swap
mkdir -p $HOME/.cache/vim/undo
mkdir -p $HOME/.local/share/nvim/backup
mkdir -p $HOME/.local/share/nvim/swap
mkdir -p $HOME/.local/share/nvim/undo

# NeoVim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Zsh
mkdir -p $HOME/.cache/zsh

# karabiner
mkdir -p $HOME/.config/karabiner
ln -snfv $HOME/dotfiles/.config/karabiner/karabiner.json $HOME/.config/karabiner/karabiner.json

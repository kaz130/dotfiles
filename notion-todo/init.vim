source ~/.config/nvim/init.vim

set runtimepath^=~/Workspace/neovim/notion-todo
" let g:denops#debug = 1
let g:denops#server#service#deno_args = [
    \ '-q',
    \ '--unstable',
    \ '-A',
    \]

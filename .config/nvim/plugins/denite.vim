if executable('rg')
    call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git', ''])
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
endif

let s:menus = {}
let s:menus.zsh = { 'description': 'zsh configuration' }
let s:menus.zsh.command_candidates = [
\ ['zshrc', 'e $ZDOTDIR/.zshrc']]

let s:menus.nvim = { 'description': 'neovim configuration' }
let s:menus.nvim.command_candidates = [
\ ['init.vim', 'e $XDG_CONFIG_HOME/nvim/init.vim'] ,
\ ['dein.toml', 'e $XDG_CONFIG_HOME/nvim/dein.toml'],
\ ['dein_lazy.toml', 'e $XDG_CONFIG_HOME/nvim/dein_lazy.toml']]

let s:menus.my_commands = { 'description': 'my commands' }
let s:menus.my_commands.command_candidates = [
\ ['Split the window', 'vnew'], ['Open zsh menu', 'Denite menu:zsh']]

call denite#custom#var('menu', 'menus', s:menus)

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

" menus
let s:menus = {}

let s:menus.zsh = { 'description': 'zsh configuration' }
let s:menus.zsh.command_candidates = [
\ ['zshrc', 'e $ZDOTDIR/.zshrc']]

let s:menus.nvim = { 'description': 'neovim configuration' }
let s:menus.nvim.command_candidates = [
\ ['.', 'e $XDG_CONFIG_HOME/nvim/'] ,
\ ['init.vim', 'e $XDG_CONFIG_HOME/nvim/init.vim'] ,
\ ['dein.toml', 'e $XDG_CONFIG_HOME/nvim/dein.toml'],
\ ['dein_lazy.toml', 'e $XDG_CONFIG_HOME/nvim/dein_lazy.toml']]

call denite#custom#var('menu', 'menus', s:menus)

" options
call denite#custom#option('default', 'prompt', '🐉 ')
call denite#custom#option('search', 'prompt', '🔎 ')

" maps
call denite#custom#map('insert', '<C-j>',
    \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>',
    \ '<denite:move_to_previous_line>', 'noremap')

call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert', "<C-s>", '<denite:do_action:split>')
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')

noremap [denite] <Nop>
nmap <C-j> [denite]
nnoremap <silent> [denite]p
    \ :<C-u>Denite file_rec -highlight-mode-insert=Search<CR>
nnoremap <silent> [denite]b
    \ :<C-u>Denite buffer -highlight-mode-insert=Search<CR>
nnoremap <silent> [denite]o
    \ :<C-u>Denite outline -highlight-mode-insert=Search<CR>
nnoremap <silent> [denite]g
    \ :<C-u>Denite grep -highlight-mode-insert=Search<CR>

noremap <silent> ?
    \ :<C-u>write<CR>:<C-u>Denite -auto-preview -buffer-name=search
    \ -highlight-mode-insert=Search -vertical-preview line<CR>


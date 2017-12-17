let g:quickrun_config = get(g:, 'quickrun_config', {})

let g:quickrun_config._ = {
    \ 'runner' : 'vimproc',
    \ 'runner/vimproc/updatetime' : 60,
    \ 'outputter' : 'error',
    \ 'outputter/error/success' : 'buffer',
    \ 'outputter/error/error' : 'quickfix',
    \ 'outputter/buffer/split' : ':botright 8sp',
    \ 'outputter/buffer/close_on_empty' : 1,
    \ }

let g:quickrun_no_default_key_mappings = 1
nnoremap <Leader>r :<C-u>write<CR>:QuickRun -mode n<CR>
xnoremap <Leader>r :<C-u>write<CR>gv:QuickRun -mode v<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"


" C
let g:quickrun_config.c = {
    \ 'type':
    \     executable('clang')          ? 'c/clang' :
    \     executable('gcc')            ? 'c/gcc' : '',
    \ 'cmdopt': '-lm -W',
    \ }


" C++
let g:quickrun_config.cpp = {
    \ 'type':
    \     executable('clang')          ? 'cpp/clang++' :
    \     executable('gcc')            ? 'cpp/g++' : '',
    \ 'cmdopt': '-lm -W -std=c++11',
    \ }


" Python
let g:quickrun_config.python = {'command' : 'python3'}

" LaTeX
let g:quickrun_config.tex = {
    \ 'exec': ['%c %o %s'],
    \ 'command' : 'latexmk',
    \ 'cmdopt' : '-pv',
    \ 'runner' : 'vimproc',
    \ 'outputer' : 'error',
    \ 'outputter/error/success' : 'quickfix',
    \ 'outputter/error/error' : 'quickfix',
    \ 'hook/sweep/files' : [
    \                      '%S:p:r.aux',
    \                      '%S:p:r.bbl',
    \                      '%S:p:r.blg',
    \                      '%S:p:r.dvi',
    \                      '%S:p:r.fdb_latexmk',
    \                      '%S:p:r.fls',
    \                      '%S:p:r.log',
    \                      '%S:p:r.out'
    \                      ],
    \}


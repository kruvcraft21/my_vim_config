" Номера строк
set number

" Подсветка синтаксиса
syntax on

" Определение типа файла + отступы
filetype plugin indent on

" --- Отступы ---
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set autoindent

" --- Поиск ---
set ignorecase
set smartcase
set incsearch
set hlsearch

" --- Интерфейс ---
set cursorline
set showcmd
set showmatch
set laststatus=2
set wildmenu
set ruler

" Меняем работу с шириной текста
set nowrap
set textwidth=80
set colorcolumn=80

" Удобное разделение окон
set splitbelow
set splitright

" Не создавать swap/backup файлы рядом с конфигами
set noswapfile
set nobackup
set nowritebackup

" Быстро убрать подсветку результатов поиска
nnoremap <Esc><Esc> :nohlsearch<CR>

" Перемещение между окнами через Ctrl+h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" K -> открыть документацию слова под курсором
function! DevOpsHelp(prefix)
    let l:word = expand('<cword>')
    let l:tag  = a:prefix . '-' . l:word

    try
        execute 'help ' . l:tag
    catch /^Vim\%((\a\+)\)\=:E149/
        echohl WarningMsg
        echo 'Документация не найдена: ' . l:tag
        echohl None
    endtry
endfunction

nnoremap KC :call DevOpsHelp('compose')<CR>

set statusline=
set statusline+=\ %f
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %l:%c
set statusline+=\ %p%%

nnoremap <silent> <F2> :10split ~/.vim/.vim_cheat.vim<CR>

autocmd BufRead,BufNewFile *.osj setfiletype opensearch
autocmd FileType opensearch setlocal ts=2 sw=2 sts=2 expandtab commentstring=#\ %s

" YAML — особенно важно для Ansible/Kubernetes
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal dictionary+=~/.vim/dict/docker-compose.txt

" Python обычно использует 4 пробела
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

" Bash/Shell
autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab


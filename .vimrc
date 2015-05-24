
set shell=/bin/bash
set modeline
set viminfo=""
set nobackup
set textwidth=0
filetype plugin on
filetype plugin indent on
set fileformat=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"begin utc.vim
"ref: http://orestis.gr/blog/2008/08/10/scripting-vim-with-python/

function! GetUTC()
python << endpython

import vim
from datetime import datetime

now = datetime.utcnow()
s = now.strftime("%Y-%m-%d %H:%M:%S UTC")
vim.command('let l:t="' + s + '"')
endpython
return l:t
endfunction

function! GetTimeDay()
python << endpython

import vim
from datetime import datetime

now = datetime.utcnow()
s = now.strftime("%Y-%m-%d-%a")
vim.command('let l:t="' + s + '"')
endpython
return l:t
endfunction
"end utc.vim

iab DTT <C-R>=strftime("%Y-%m-%d")<CR>
iab dtt <C-R>=GetUTC()<CR>
iab dst <C-R>=GetTimeDay()<CR>
iab UTC <C-R>=system("date -u '+%Y-%m-%d %H:%M:%S %Z'")<CR>
iab dtt <C-R>=system("date -u '+%Y-%m-%d %H:%M:%S %Z'")<CR>
iab dtt <C-R>=strftime("%Y-%m-%d-%H%M %Z (%A)")<CR>
iab dtt <C-R>=strftime("%Y-%b-%d %a %R %Z")<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set dictionary=/usr/share/dict/words
set grepprg=grep\ -nH\ $*
"filetype indent on
set showmode
set smartcase
set showcmd
set ruler
set ignorecase
set incsearch

set number
set nohlsearch
set tabstop=4
set shiftwidth=4
set expandtab
"set noautoindent
syntax enable
set tabpagemax=100
"map gc "+y
"map gp "+gP

set background=dark
colorscheme elflord

"imap \lam λ

let g:Tex_PromptedEnvironments='eqnarray*,eqnarray,equation,equation*,\[,$$,align,align*,thm,cor,prop,lem,defn,ap,question,software,goal,target,idea,rem,eg,egs,proof'

let g:slime_target = "tmux"

function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nmap <silent> ,w :call <SID>StripTrailingWhitespace()<CR>

"let g:indent_guides_enable_on_vim_startup = 0

autocmd BufEnter * :syntax sync fromstart
"see http://stackoverflow.com/a/6671586 and http://vim.wikia.com/wiki/Fix_syntax_highlighting

set laststatus=2
"set statusline+=%{fugitive#statusline()}

set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set list                                                     " show trailing whitespace
"set listchars=trail:_
set listchars=tab:▸\ ,trail:▫


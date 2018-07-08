set t_Co=256
set nu
set autoindent
set cindent
set smartindent
set nobackup
set ruler
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set ignorecase
set hlsearch
set incsearch
set showmode
set history=1000
set fileencodings=utf-8,euc-kr
set background=dark
set bs=2
set nocp
set cino+=g0

syntax on
filetype on

nmap <up> <silent>
nmap <down> <silent>
nmap <left> <silent>
nmap <right> <silent>

vnoremap <TAB> >gv
vnoremap <s-tab> <gv
nnoremap <esc>t   :tabnew<cr>
nnoremap <esc>1   1gt
nnoremap <esc>2   2gt
nnoremap <esc>3   3gt
nnoremap <esc>4   4gt
nnoremap <esc>5   5gt
nnoremap <esc>6   6gt
nnoremap <esc>7   7gt
nnoremap <esc>8   8gt
nnoremap <esc>9   9gt

nnoremap <LeftMouse> <nop>
set mouse=a

nnoremap <CR> o<ESC>
nnoremap <Backspace> X

colorscheme vividchalk

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'mattn/emmet-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'posva/vim-vue'
Plug 'airblade/vim-gitgutter'
Plug 'elixir-lang/vim-elixir'
call plug#end()

filetype plugin indent on

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticErrorLine guibg=#2f0000

function! ToggleErrors()
	let old_last_winnr = winnr('$')
	lclose
	if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic error location panel
    Errors
	endif
endfunction
nmap <F9> :call ToggleErrors()<CR>

" Airline
set laststatus=2
let g:airline_theme='badwolf'

let g:airline#extensions#syntastic#enabled = 1

" Indent Guide
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=244 guibg=red
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=240 guibg=red
autocmd VimEnter,Colorscheme * :IndentGuidesEnable

" Auto comment disable
autocmd FileType * setlocal formatoptions-=ro

" Auto View Save
if &diff
else
  au BufWinLeave *.* mkview
  au BufWinEnter *.* silent loadview
endif

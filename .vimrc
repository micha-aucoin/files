filetype plugin on

set relativenumber          " Use relative number lines
set number                  " Use number lines
set noexpandtab             " Use real tabs, NOT spaces
set tabstop=4               " a tab character looks like 4 spaces
set shiftwidth=4            " Indent by 4 spaces
set softtabstop=4           " Insert 4 spaces when pressing <Tab>
set scrolloff=8             " Keeps scrolling tight
set hlsearch                " Highlight search
set nowrap                  " Turn off line wrap
set ai                      " Auto indent
set si                      " Smart indent
set incsearch               " highlight incrementally

let mapleader = " "

nnoremap <leader>pv :Ex<CR>
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" x = visual char mode only
xnoremap <leader>p "_dP
nnoremap <leader>p "+p
vnoremap <leader>y "+y

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap H <gv
vnoremap L >gv

nnoremap <C-f> :silent !tmux-sessionizer<CR>:redraw!<CR>

nnoremap <leader><leader> :r ! 

" Find and Replace
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
" Vim Grep
vnoremap <leader>g y:vimgrep /\<\V<C-r>"\m\>/gj **/*<CR>:copen<CR>
nnoremap <leader>g :vimgrep /\<\>/gj **/*<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

function! ToggleQuickfix()
	for win in range(1, winnr('$'))
		if getwinvar(win, '&buftype') ==# 'quickfix'
			cclose
			return
		endif
	endfor

	copen
"	wincmd k  "<- exit quickfix after open
endfunction
nnoremap <leader>q :call ToggleQuickfix()<CR>
" nnoremap <leader>q :copen<CR>
" nnoremap <leader>Q :cclose<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FINDING FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search into subfolders, provides tab-completion for all file
set path+=**
" Display all matching files tab-complete
set wildmenu
" fuzzy search
nnoremap <leader>f :find 
" directories to ignore
set wildignore+=*/venv/*,*/.git/*
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PRETTY COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""colorscheme habamax
"""colorscheme desert
"""colorscheme koehler
"colorscheme lunaperche
"""colorscheme slate
colorscheme sorbet
"colorscheme wildcharm
"colorscheme zaibatsu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS BAR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2            " always show a status bar
set statusline=
set statusline+=%f\         " file path
set statusline+=%m\         " modified flag [+]
set statusline+=%r\         " readonly flag
set statusline+=%h\         " help buffer flag
set statusline+=%=
set statusline+=%y\         " filetype
set statusline+=\ [%{&ff}]\ " file format (unix/dos)
"set statusline+=\ [%l:%c]\  " line:column
"set statusline+=\ [%p%%]    " percent through file
set termguicolors
highlight StatusLine   guifg=#4f7f85 guibg=#303030 term=NONE cterm=NONE gui=NONE 
highlight StatusLineNC guibg=#3a3a3a guifg=#7faaaa term=NONE cterm=NONE gui=NONE 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



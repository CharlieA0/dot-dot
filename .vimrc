set nocompatible              " be iMproved, required
filetype off                  " required " set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'airblade/vim-gitgutter'

Plugin 'morhetz/gruvbox'

Plugin 'itchyny/lightline.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin '907th/vim-auto-save'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-commentary'

Plugin 'ludovicchabant/vim-gutentags'

Plugin 'scrooloose/nerdtree'

Plugin 'reedes/vim-pencil'

Plugin 'tpope/vim-markdown'

Plugin 'nvie/vim-flake8'

" needs +python not +python3
" Plugin 'taketwo/vim-ros'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Make ',' the map leader
let mapleader = ","

" Gruvbox
set termguicolors
set background=dark   " Setting dark mode
colorscheme gruvbox

" Map FZF to Ctrl-P
nmap <c-p> :FZF<CR>

" Lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Vim Autosave
let g:auto_save = 1 " enable on startup
let g:auto_save_write_all_buffers = 1  " write all open buffers as if you would use :wa

" Tabs/Indent
set shiftwidth=2
set tabstop=2
set cindent
set expandtab

" Toggle paste
set pastetoggle=<f5>

" Never open scratch window
set completeopt-=preview

" Default line numbers
set number

" fzf
set rtp+=~/.fzf

" Indicate style guide max line width
" set colorcolumn=79

" Turn on syntax highlighting
syntax on

" Always show at least 2 lines under cursor
set scrolloff=2

" Reload the file if it is changed
set autoread

" Use the mouse
set mouse=

" Search for tags from current directory to root
set tags=tags;/

" Open tags in new tab
:nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

" Map NerdTree toggle
map <C-n> :NERDTreeToggle<CR>

" Custom NerdTree mappings
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapOpenSplit='x'

" Hide mode notification text
set noshowmode 

" Fix broken backspace
set bs=2

" Gutentags extra args
let g:gutentags_ctags_extra_args = ["c++-kinds=+p", "fields=+iaS", "extra=+q", "language-force=C++"]

" Override colors
highlight Comment term=bold ctermfg=248 guifg=#aaaaaa
highlight LineNr term=bold ctermfg=248 guifg=#aaaaaa

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Spell check settings
set spelllang=en_us
hi clear SpellBad
hi SpellBad ctermbg=Red

" Make background transparent
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE

" Python Flake8 Linter
let g:flake8_show_in_gutter=1  " show

autocmd BufWritePost *.py call flake8#Flake8()

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

Plugin 'scrooloose/nerdcommenter'

Plugin 'tpope/vim-markdown'

Plugin 'nvie/vim-flake8'

Plugin 'junegunn/fzf.vim'

Plugin 'sheerun/vim-polyglot'

Plugin 'vim/killersheep'

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

" Make '.' the map leader
let mapleader = "."

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
set rtp+=~/fzf

" Indicate style guide max line width
" set colorcolumn=79

" Turn on syntax highlighting
syntax on

" Always show at least 2 lines under cursor
set scrolloff=5
set sidescrolloff=5

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

" Turn off sounds and flashing
set belloff=all

" indent wrapped lines
set breakindent
set breakindentopt=shift:2

" hightlight all search matches
set hlsearch

" use the OS clipboard
set clipboard=unnamedplus

" auto. reread file when changed outside of vim
set ar

" case insensitive, but be smart
set ignorecase
set smartcase

" set escape timeout
set ttimeoutlen=0

" persistent undo history across sessions
set undofile
set undodir=~/.vim/undo

" Make those folder automatically if it doesn't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif

" always round indents to multiple of shiftwidth
set shiftround

" show invisible chars
set listchars=tab:»·,trail:·,extends:…
set list

"spelling error
command! Q q
command! Qa qa
command! QA qa

" clear search highlighting
nnoremap <leader>/ :nohlsearch<CR>:echo<CR>

" easier split window navigation
nnoremap <C-j>     <C-w>j
nnoremap <C-k>     <C-w>k
nnoremap <C-h>     <C-w>h
nnoremap <C-l>     <C-w>l
nnoremap <C-o>     <C-w><C-w>

" for nerdcommenter
filetype plugin on

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Don't delete word in insert
imap <C-w> <Nop>

" NerdCommenter
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
" let g:NERDCommentEmptyLines = 1
" let g:NERDTrimTrailingWhitespace = 1
" let g:NERDToggleCheckAllLines = 1

" YCM
" let g:ycm_global_ycm_extra_conf = ".vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py" 

"" Wiring
set nocompatible          " don't try to be compatible with legacy vim
set encoding=utf-8
execute pathogen#infect()

"Start Nerdtree if vim opens to empty file
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Enable mouse
set mouse=a

"Map Nerdtree to CTRL + N
map <C-n> :NERDTreeToggle<CR>

" Set vimresizing for Tmux awesomeness
autocmd VimResized * :wincmd =

" Invisible characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

"CTRL P
set runtimepath^=~/.vim/bundle/ctrlp.vim

"Always show status line
set laststatus=2

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"Use dispatch with vim-rspec
let g:rspec_command = "Dispatch rspec --color {spec}"

"indenting
filetype plugin indent on

runtime macros/matchit.vim                       " vim-textobj-rubyblock

"Color
set background=dark
colorscheme railscasts

"Change timeout length to remove airline latency
set timeoutlen=150

" Basic editor behaviour
filetype plugin indent on       " load file type plugins + indentation
set t_Co=256                    " Explicitly tell vim that the terminal supports 256 colors
syntax enable                   " highlighting and shit
set cursorline                  " colours the line the cursor is on
set scrolloff=4                 " adds top/bottom buffer between cursor and window
set number                      " line numbers
set showcmd                     " display incomplete commands
set autoread                    " Auto-reload buffers when file changed on disk
set noshowmode                  " Get rid of default mode indicator
set autoindent                  " Set auto indent
set ts=2                        " Set indent to 2 spaces
set relativenumber              " Show relative line numbers
set vb                          " enable visual bell (disable audio bell)
set clipboard=unnamed           " use system clipboard
"airline tabs
let g:airline#extensions#tabline#enabled = 1
"
" powerline fonts
let g:airline_powerline_fonts = 1
set guifont=Liberation\ Mono\ Powerline\ 10

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" set leader key to space
let mapleader = " "

" remove search highlighting
nnoremap <leader>h :noh<cr>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Clear all CtrlP Caches
map <Leader>r :ClearAllCtrlPCaches<CR>

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

"" Whitespace
function! <SID>StripTrailingWhitespaces()
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

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()  " strip trailing whitespace on save
set nowrap                                                   " don't wrap lines
set tabstop=2 shiftwidth=2                                   " a tab is two spaces (or set this to 4)
set expandtab                                                " use spaces, not tabs (optional)
set backspace=indent,eol,start                               " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " ignore case in searching

"" Omg, vim, Imma edit the same file multiple times, okay? fkn deal with it
set nobackup                             " no backup files
set nowritebackup                        " don't backup file while editing
set noswapfile                           " don't create swapfiles for new buffers
set updatecount=0                        " Don't try to write swapfiles after some number of updates
set backupskip=/tmp/*,/private/tmp/*"    " can edit crontab files

"" Convenience
nnoremap <Leader>w :w!<CR>;
nnoremap <Leader>q :q!<CR>;
nnoremap <leader>i mzgg=G`z;               " indent entire page
" replaces %/ with current directory, and %% with current file
cmap %/ <C-R>=expand("%:p:h")."/"<CR>
cmap %% <C-R>=expand("%")<CR>

"" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber


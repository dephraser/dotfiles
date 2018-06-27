" Plugin Manager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
Plug 'haya14busa/incsearch.vim' " Searching
Plug 'janko-m/vim-test' 
Plug 'tpope/vim-commentary' " Commenting
Plug 'tpope/vim-fugitive' " Git
" Plug 'cloudhead/neovim-fuzzy' " Opening files
Plug 'iCyMind/NeoSolarized'
Plug 'jceb/vim-orgmode' " For todo list
Plug 'tpope/vim-speeddating' " Dep of orgmode
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'christoomey/vim-tmux-navigator' " Navigation
Plug 'junegunn/goyo.vim' " For writing
Plug 'rking/ag.vim' " For searching
Plug 'tpope/vim-sleuth'
Plug 'cohama/lexima.vim' " Autoclose pethernise
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
Plug 'w0rp/ale'
Plug 'Chiel92/vim-autoformat'

" Language support
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'avakhov/vim-yaml'
call plug#end()

filetype on
filetype plugin indent on


" Sensible movement
noremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Set relative line numbers on :Explore
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

" " Opening files 
" nnoremap <C-p> :FuzzyOpen<CR>

" Turn modelines (vim config at the start of the file) off
let modelines=0

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

" enable 24 bit color support if supported
if (has("termguicolors"))
    set termguicolors
endif
colorscheme NeoSolarized
set background=dark
set guioptions-=m " Remove menu bar
set guioptions-=T " Remove tool bar

syntax on

" Buffer space at top and bottom of screen
set scrolloff=7

set showmode " INSERT/VISUAL etc
set showcmd " shows the keypresses for the command sequence

set hidden " Stops vim trying to save things when you move to another buffer

set ruler " Shows the line and column position

set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

" Line numbering
set number

let mapleader = ","

set nowrap

" Switch between the last two files
nnoremap <leader><leader> <C-^>

" To spell check all git commit messages
au BufNewFile,BufRead COMMIT_EDITMSG set spell

" Searching
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Vim Test Bindings
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g

" Markdown preview
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

" Org mode
let g:org_todo_keywords = [['TODO', 'WAITING', '|', 'DONE'],  ['|', 'CANCELED']]
let g:org_agenda_files = ['*.org', 'projects/*.org']

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Search files recursively ([o]pen file)
nnoremap <silent> <C-p> :Files<CR>
" Search git status (edited) [f]iles
nnoremap <silent> <leader>f :GFiles?<CR>
" Search in local buffer [c]ommits
nnoremap <silent> <leader>c :BCommits<CR>
" Search in all the project [C]ommits
nnoremap <silent> <leader>C :Commits<CR>
" Search between open files - [b]uffers
nnoremap <silent> <leader>b :Buffers<CR>
" Search in [l]ines on current buffer
nnoremap <silent> <leader>l :BLines<CR>
" Search in all the opened buffers [L]ines
nnoremap <silent> <leader>L :Lines<CR>
" Search in ultisnips [s]nippets
nnoremap <silent> <leader>s :Snippets<CR>
" Search in [m]arks
nnoremap <silent> <leader>m :Marks<CR>
" Search in edited files [h]istory
nnoremap <silent> <leader>h :History<CR>
" Search in search [/] history
nnoremap <silent> <leader>/ :History/<CR>
" Search in ag search
nnoremap <silent> <leader>a :Ag
"}}}


" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::'
\}
call deoplete#custom#source('buffer', 'rank', 501)

" use tab
imap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}


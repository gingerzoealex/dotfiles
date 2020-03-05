" install vim-plug if we dont already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ____________________

"pugins will be installed in this location
call plug#begin('~/.vim/plugged')

augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    autocmd FileType python set autoindent shiftwidth=4 softtabstop=4 expandtab
    autocmd FileType javascript,html,htmldjango,css set autoindent shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType vim set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType php set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
    au BufRead,BufNewFile *etc/nginx/* set ft=nginx 
    " treat rackup files like ruby
    au BufRead,BufNewFile *.ru set ft=ruby
    au BufRead,BufNewFile Gemfile set ft=ruby
    autocmd BufEnter *.haml setlocal cursorcolumn
    au BufRead,BufNewFile Gemfile set ft=ruby
    au BufRead,BufNewFile Capfile set ft=ruby                                   
    au BufRead,BufNewFile Thorfile set ft=ruby
    au BufRead,BufNewFile *.god set ft=ruby  
    au BufRead,BufNewFile .caprc set ft=ruby
    " au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" ____________________

Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_loadcmd_toggle = 1
Plug 'thaerkh/vim-workspace'
let g:workspace_autosave_always = 1
Plug 'liuchengxu/space-vim-dark'
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'
Plug 'sts10/vim-pink-moon'
Plug 'agude/vim-eldar'
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 2
Plug 'chiel92/vim-autoformat'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'rstacruz/sparkup'
Plug 'vim-ruby/vim-ruby'
Plug 'posva/vim-vue'
Plug 'w0rp/ale'
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let b:ale_fixers = {'javascript': ['eslint']}
let b:ale_linters = {'javascript': ['eslint']}

Plug 'tpope/vim-fugitive'
"displays git related information in the number gutter
Plug 'airblade/vim-gitgutter'
"allows you to use Ctrl-m to automatically un/comment
Plug 'tomtom/tcomment_vim'
"automatically '' {} [] () <>
Plug 'jiangmiao/auto-pairs'
"status bar with git current branch info
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'tell-k/vim-autopep8'

call plug#end()

" ____________________
" actual config stuff

syntax on

" colorscheme molokayo
let g:indent_guides_auto_colors = 2
hi IndentGuidesOdd  guibg=purple   ctermbg=3
hi IndentGuidesEven guibg=black ctermbg=4
hi Normal guibg=black
set diffopt+=vertical
set scrolloff=6
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number
set relativenumber

let g:autopep8_disable_show_diff=1

" ____________________
" specific plugin config

"lightline config
let g:lightline = {
		\'active': {
		\  'left': [ [ 'mode', 'paste' ],
		\            [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
		\},
		\'component_function': {
		\ 'gitbranch': 'gitbranch#name'
		\}
		\}

let g:ale_linters = {
	\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}

set laststatus=2

"tcomment
nmap <C-m> gcc
" Hide search highlighting
map <silent> <leader>nh :nohls <CR>
" inoremap <au FileType javascript,python,php,xml,yaml,ruby :RainbowLevelsOn

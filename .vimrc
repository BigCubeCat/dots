let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[3 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode
"General
filetype plugin indent on
set nocompatible
set hidden
syntax enable

"Splits
set splitbelow
set splitright

"Mouse
set mouse=a
set mousehide

"Encoding
scriptencoding utf-8
set encoding=utf-8

"Indent
set smartindent
set copyindent

"Tabs
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

"Visual
set number relativenumber
set wrap linebreak nolist
set showtabline=0
set cursorline

"Searching
set ignorecase
set smartcase

"Folding
set foldnestmax=10
set foldlevel=2
set nofoldenable
set foldlevelstart=0

"More CLI
set t_Co=256
set vb
set t_ut=""

"Mappings
let mapleader = "-"

"-----Plugins-----

"VimPlug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
" Use object gn instead of multicursor
Plug 'scrooloose/nerdtree'
Plug 'jupyter-vim/jupyter-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'tikhomirov/vim-glsl'
Plug 'itchyny/lightline.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'elzr/vim-json'
Plug 'lervag/vimtex'
Plug 'vim-scripts/greplace.vim'
Plug 'rking/ag.vim'
Plug 'jpalardy/vim-slime'
Plug 'shime/vim-livedown'
Plug 'gko/vim-coloresque'
Plug 'jesseleite/vim-noh'
Plug 'skywind3000/asyncrun.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'Hovushka/vim-monokai-tasty'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'doums/darcula'
Plug 'jceb/vim-orgmode'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-repeat'
Plug 'ajh17/VimCompletesMe'
Plug 'dense-analysis/ale'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'flazz/vim-colorschemes'
Plug 'doums/darcula'
Plug 'farazdagi/vim-go-ide'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'hail2u/vim-css3-syntax'

call plug#end()

" Syntatic 

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Pear Tree
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

"NERDTree
let g:webdevicons_conceal_nerdtree_brackets=0

"ALE
" let g:ale_python_pylint_options = "--load-plugins=pylint_tensorflow --disable=C"
let g:ale_python_pylint_options = "--ignored-modules=tensorflow.keras --disable=C,R,E1136"
let g:ale_glsl_glslang_options = "-V -o shaders/.lint.spv"
" let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wno-unused-const-variable -Wno-unused-function'
let g:ale_linters = {'cpp': ['']}


"COC-extensions
let g:coc_global_extensions=[ 'coc-omnisharp', 'coc-python' , 'coc-ccls', 'coc-highlight' ]

"COC-snippets
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
                                           \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"Startify
let g:startify_custom_header = []

"Xkbswitch
let g:XkbSwitchEnabled = 1
let g:XkbSwitchNLayout = 'us'

"Ultisnip
let g:UltiSnipsExpandTrigger="<C-CR>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"


"Easymotion
map <Leader> <Plug>(easymotion-prefix)

"Fugitive
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

"AutoPairs
let g:AutoPairsMultilineClose = 0

colorscheme dracula
"set background=dark

"Autoformat
nnoremap <F4> :Autoformat<CR>

"Rainbow
let g:rainbow_active = 1

"Regular bindings
vnoremap <Up> gk
vnoremap <Down> gj
nnoremap <Up> gk
nnoremap <Down> gj

nnoremap <C-a> <C-o>
nnoremap <C-s> <C-i>
nnoremap <C-q> <C-]>

"Space bindings
nnoremap <Space>a ggVG
vnoremap <Space>c "+y
nnoremap <Space>v "+p
nnoremap <Space>s :w<CR>

nnoremap <Space>i :PlugInstall<CR>
nnoremap <Space>u :PlugUpdate<CR>

nnoremap <Space>m :LivedownToggle<CR>
nnoremap <Space>j :call jupyter#Connect()<CR>

nnoremap <Space>o :copen<CR>
nnoremap <Space>l :lopen<CR>
nnoremap <Space>w :SyntasticToggleMode<CR>

"Function bindings
nnoremap <silent> <F2> :NERDTreeToggle<CR>
" nnoremap <F2> :w !sudo tee % <CR>
"             \:echom "forced changes to the file" <CR>
nnoremap <F3> :AsyncRun ctags -R<CR>
nnoremap <F4> :Autoformat<CR>
nnoremap <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
            \:echom "whitespace deleted"<CR>

"Filename completion
inoremap <F7> <C-X><C-]>
"Context-aware completion
inoremap <F8> <C-X><C-P>
"Line completion
inoremap <F9> <C-X><C-L>


function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

"Auto commands
augroup hovagroup
    autocmd!
    " autocmd! BufWritePost,BufEnter * Neomake
    autocmd VimEnter * echom ">^.^< : config by BigCubeCat"
augroup END



set norelativenumber
set termguicolors
map <C-n> :NERDTreeToggle<CR>
map <C-t> :term<CR>
set laststatus=2
set noshowmode
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'latexmk -pdf -f $*'
set conceallevel=1
let g:tex_conceal='abdmg'

let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу

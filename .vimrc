"Neovim Specific
if has('nvim')
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    language en_US
    set noshowcmd
    "Slime
    let g:slime_target = "neovim"

else
    "Mac Specific

    "Slime
    let g:slime_target = "vimterminal"
    let g:slime_python_ipython = 1
    "GUI Specific
    if has('gui_running')
        set guioptions=
        set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16
        set background=dark
    else
        "CLI Specific
        " set ttimeoutlen=10
        let &t_SI.="\e[5 q" "SI = INSERT mode
        let &t_SR.="\e[3 q" "SR = REPLACE mode
        let &t_EI.="\e[1 q" "EI = NORMAL mode
    endif
endif

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
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'itchyny/lightline.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'elzr/vim-json'
Plug 'vim-scripts/greplace.vim'
Plug 'rking/ag.vim'
Plug 'jpalardy/vim-slime'
Plug 'shime/vim-livedown'
Plug 'morhetz/gruvbox'
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
Plug 'OmniSharp/omnisharp-vim'
Plug 'Hovushka/vim-monokai-tasty'
Plug 'jceb/vim-orgmode'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-repeat'
Plug 'ajh17/VimCompletesMe'
Plug 'dense-analysis/ale'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'lyokha/vim-xkbswitch'
call plug#end()

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

"Omnisharp
let g:OmniSharp_server_stdio = 1

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

"Ultisnips
let g:UltiSnipsExpandTrigger="<C-CR>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

"Easymotion
map <Leader> <Plug>(easymotion-prefix)

"Fugitive
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

"AutoPairs
let g:AutoPairsMultilineClose = 0

"okai
colorscheme gruvbox
set bg=dark

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

nnoremap <Space>e :e ~/.config/nvim/init.vim<CR>
nnoremap <Space>w :source ~/.config/nvim/init.vim<CR>
            \:echom "~/.vimrc is sourced"<CR>

nnoremap <Space>o :copen<CR>
nnoremap <Space>l :lopen<CR>

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

"Custom commands

if has("nvim")
    command! -nargs=0 GetTermId :echom b:terminal_job_id
    command! -nargs=* Term :split term://<args> | :GetTermId
endif

"stoeffel/.dotfiles
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

command! -nargs=* Blender :!/Applications/Blender/blender.app/Contents/MacOS/blender
            \ <args>
command! -nargs=? Blend :!/Applications/Blender/blender.app/Contents/MacOS/blender
            \ -b -P % -- <args>
command! -nargs=? Blendo :!/Applications/Blender/blender.app/Contents/MacOS/blender
            \ -P % -- <args>

"Auto commands
augroup hovagroup
    autocmd!
    " autocmd! BufWritePost,BufEnter * Neomake
    if has('nvim')
        autocmd TermOpen * startinsert
    endif
    autocmd VimEnter * echom ">^.^< : config by Hova"
    " autocmd FileType cpp,c source ~/.vim/syntax/vulkan.vim
augroup END

" Мой конфиг (не спизжен с гитхаба)
set norelativenumber
set termguicolors
map <C-n> :NERDTreeToggle<CR>
map <C-t> :term<CR>
set laststatus=2
set noshowmode

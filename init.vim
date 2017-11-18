" TODO: - substitute command?
" ________________________________ WINDOWS SETUP ________________________________
"
" md ~\AppData\Local\nvim\autoload
" $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" (New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\AppData\Local\nvim\autoload\plug.vim"))
"
" ___________________________________________________________________________________

let g:python3_host_prog='C:/Python35/python.exe'
let g:loaded_python_provider = 1
let g:loaded_ruby_provider = 1

set rtp +=~/AppData/Local/nvim/plugins
set rtp +=~/AppData/Local/nvim/plugins/deoplete.nvim/

" ............................. VUNDLE ........................................
filetype off


call plug#begin('~/AppData/Local/nvim/plugins')

" Startbildschirm
Plug 'mhinz/vim-startify'

" Asynchrones make
Plug 'neomake/neomake'

" Alles rundum Klammerungen
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" Damit vim-surround mit repeat funktioniert - mehr nicht
Plug 'tpope/vim-repeat'

" Vervollsändigt das aktelle getippte Wort mit Tab zu etwas was bereits vorkam
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'

" Colorschemes
Plug 'ajh17/spacegray.vim'

" Ermöglicht das tauschen von beliebigen Textobjekten
Plug 'tommcdo/vim-exchange'

" Auskommentieren
Plug 'tomtom/tcomment_vim'

" Fuzzyfinder für Dateien und Tags
Plug 'ctrlpvim/ctrlp.vim'

" Passives Plugin sorgt für richtiges einrücken beim kopieren und einfügen
Plug 'sickill/vim-pasta'

" Erweitert vim um weitere Textobjekte
Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-entire'
  Plug 'julian/vim-textobj-variable-segment'
  Plug 'sgur/vim-textobj-parameter'
  Plug 'glts/vim-textobj-comment'

" Hübschere Statusleiste mit mehr Informationen
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Ermöglicht ein Projektspezifisches vimrc einfach 'lvimrc' nennen
Plug 'embear/vim-localvimrc'

call plug#end()

filetype plugin indent on
" LEADER-KEY
let mapleader = ","

" BASICS
set history=1000
set autoread
set backspace=eol,start,indent
set noerrorbells
set visualbell
set t_vb=
set tm=500

set lines=50
set columns=120
set updatetime=750
set splitright
set virtualedit=block
set foldenable
set foldlevel=99

" SUCHE
set hlsearch
set smartcase
set incsearch
set ignorecase

" OBERFLAECHE
set scrolloff=5
set wildmenu
set wildignore=*.o
set ruler
set relativenumber
set number
set cmdheight=1
set laststatus=2
set cursorline
set t_Co=256

" STATUSBAR
" set statusline-=%t
" -------------------- FARBEN UND FORMATIERUNGEN ------------------------------
set background=dark
colorscheme spacegray
set encoding=utf8
set ffs=unix,dos,mac
set listchars=eol:¬,tab:»·,trail:·
set list
hi MatchParen cterm=bold ctermbg=none ctermfg=blue
syntax enable

" --------------------------- SICHERUNGEN -------------------------------------
set nobackup
set nowb
set noswapfile

" --------------------- TABS UND ZEILENUMBRUECHE ------------------------------
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set linebreak
set tw=500 " Zeilenumbruch nach 500 Zeichen
set autoindent
set smartindent
set wrap
set formatoptions+=v
set formatoptions+=l

" MAPING " MAPING " MAPPING " MAPPING " MAPPING " MAPPING " MAPPING "
" ===================================================================
nnoremap <down> :cn<cr>
nnoremap <left> :cclose<cr>
nnoremap <right> :copen<cr><c-w><c-p>
nnoremap <up> :cp<cr>

vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <up> <Nop>

inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <up> <Nop>

" ------------

nnoremap j gj
nnoremap k gk

vnoremap j gj
vnoremap k gk

nnoremap J 5j
nnoremap K 5k

vnoremap J 5j
vnoremap K 5k

onoremap J 5j
onoremap K 5k

nnoremap <A-j> }
nnoremap <A-k> {

vnoremap <A-j> }
vnoremap <A-k> {

onoremap <A-j> }
onoremap <A-k> {

" ------------ copy and paste ala ctrl-c ctrl-v
nnoremap <c-v> "+p
inoremap <c-v> <c-r>+
vnoremap <c-c> "+y

" ------------ Repeat makro in register q
nnoremap Q @q


" ------------ Schnelles speichern und schliessen von Dokumenten
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q<CR>


" ------------ Navigation innerhalb von Splitts und tabs
nnoremap gk <C-w>k
nnoremap gj <C-w>j
nnoremap gh <C-w>h
nnoremap gl <c-w>l

nnoremap gt <Nop>
nnoremap gT <Nop>

nnoremap <A-l> gt
nnoremap <A-h> gT


" ------------ Redo!
nnoremap U <c-R>


" ------------ Handlicherer visual mode
nnoremap V <C-v>
nnoremap vv <S-v>


" ------------ init.vim stuff  zum laden :so %
nnoremap <F12> :tabnew ~\AppData\Local\nvim\init.vim<cr>

" ------------ misc handling breaker

if has("win32") || has('win64')
  set wildignore+=*.git,*.hg,*.svn,*.dll,*.pdb,*.exe,*.obj,*.o,*.a,*.jpg,*.png,*.tga,*.sln,*.opensdf,*.sdf,*.exp,*.lib
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
endif

" -------------------
" PLUGIN EINSTELLUNGEN UND KEYBINDINGS
let g:startify_change_to_dir = 0

let delimitMate_expand_cr = 1

let g:SuperTabCompleteCase = 'ignore'

let g:molokai_original = 0

let g:tcommentTextObjectInlineComment = ''

let g:ctrlp_map = '<leader>p'
nnoremap <leader>t :CtrlPTag<cr>

let g:deoplete#enable_at_startup=1
let g:deoplete#disable_auto_complete = 1
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer']
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
let g:localvimrc_name = "lvimrc"

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger = "<tab>"

let g:loaded_gentags#ctags=0
let g:loaded_gentags#gtags=1

let g:spacegray_italicize_comments = 1
let g:spacegray_underline_search = 1

highlight! link QuickFixLine Normal

" TODO: - substitute command?
" ________________________________ REM WINDOWS SETUP ________________________________
" cd %USERPROFILE%
" git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/AppData/Local/nvim/bundle/Vundle.vim
" ___________________________________________________________________________________

if has("gui_running")
  set guioptions-=m  " entfernt menu bar
  set guioptions-=T  " entfernt toolbar
  set guioptions-=r  " entfernt right-hand scroll bar
  set guioptions-=L  " entfernt left-hand scroll bar
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h12:cANSI
  endif
endif
autocmd GUIEnter * set t_vb=

" ............................. VUNDLE ........................................
set nocompatible
filetype off

set rtp+=~/AppData/Local/nvim/bundle/Vundle.vim
call vundle#begin('$USERPROFILE/AppData/Local/nvim/bundle')

" ................. Kann sich selbst updaten, VimPluginManager
" Der PluginManager selbst
Plugin 'gmarik/Vundle.vim'

" Startbildschirm
Plugin 'mhinz/vim-startify'

" latex
" Plugin 'latex-box-team/latex-box'

" Alles rundum Klammerungen
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'

" Damit vim-surround mit repeat funktioniert - mehr nicht
Plugin 'tpope/vim-repeat'

" Vervollsändigt das aktelle getippte Wort mit Tab zu etwas was bereits vorkam
Plugin 'ervandew/supertab'

" Colorschemes
Plugin 'tomasr/molokai'
Plugin 'beyondmarc/hlsl.vim'

" Ermöglicht das tauschen von beliebigen Textobjekten
Plugin 'tommcdo/vim-exchange'

" Auskommentieren
Plugin 'tomtom/tcomment_vim'

" Fuzzyfinder für Dateien und Tags
Plugin 'ctrlpvim/ctrlp.vim'

" Snippets
Plugin 'SirVer/ultisnips'

" Passives Plugin sorgt für richtiges einrücken beim kopieren und einfügen
Plugin 'sickill/vim-pasta'

" Erweitert vim um weitere Textobjekte
Plugin 'kana/vim-textobj-user'
  Plugin 'kana/vim-textobj-line'
  Plugin 'kana/vim-textobj-indent'
  Plugin 'kana/vim-textobj-entire'
  Plugin 'julian/vim-textobj-variable-segment'
  Plugin 'sgur/vim-textobj-parameter'
  Plugin 'glts/vim-textobj-comment'

" Hübschere Statusleiste mit mehr Informationen
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Ermöglicht ein Projektspezifisches vimrc einfach 'lvimrc' nennen
Plugin 'embear/vim-localvimrc'

call vundle#end()

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
set splitbelow
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
colorscheme molokai
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
nnoremap <right> :copen<cr>
nnoremap <up> :cp<cr>

vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <up> <Nop>

inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <up> <Nop>

inoremap <A-l> <esc>la
inoremap <A-n> <esc>la,<space>

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


" ------------ misc handling breaker

if has("win32") || has('win64')
  set wildignore+=*.git,*.hg,*.svn,*.dll,*.pdb,*.exe,*.obj,*.o,*.a,*.jpg,*.png,*.tga,*.sln,*.opensdf,*.sdf,*.exp,*.lib
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
endif

" -------------------
" PLUGIN EINSTELLUNGEN UND KEYBINDINGS
" PLUGIN 'MHINZ/VIM-STARTIFY'
let g:startify_change_to_dir = 0
" PLUGIN 'LATEX-BOX-TEAM/LATEX-BOX'
" PLUGIN 'RAIMONDI/DELIMITMATE'
let delimitMate_expand_cr = 1
" PLUGIN 'TPOPE/VIM-SURROUND'
" PLUGIN 'TPOPE/VIM-REPEAT'
" PLUGIN 'ERVANDEW/SUPERTAB'
let g:SuperTabCompleteCase = 'ignore'
" PLUGIN 'TOMASR/MOLOKAI'
let g:molokai_original = 0
" PLUGIN 'TOMMCDO/VIM-EXCHANGE'
" PLUGIN 'TOMTOM/TCOMMENT_VIM'
let g:tcommentTextObjectInlineComment = ''
" PLUGIN 'CTRLPVIM/CTRLP.VIM'
let g:ctrlp_map = '<leader>p'
nnoremap <leader>t :CtrlPTag<cr>
" PLUGIN 'SIRVER/ULTISNIPS'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsUsePythonVersion = 2
" PLUGIN 'SICKILL/VIM-PASTA'
" PLUGIN 'KANA/VIM-TEXTOBJ-USER'
" PLUGIN 'BLING/VIM-AIRLINE'
" PLUGIN 'VIM-AIRLINE/VIM-AIRLINE-Themes'
" PLUGIN 'EMBEAR/VIM-LOCALVIMRC'
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
let g:localvimrc_name = "lvimrc"


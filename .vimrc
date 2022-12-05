" Gotta be first
set nocompatible
set encoding=UTF-8
set rtp+=~/.vim/bundle/Vundle.vim

" Install JetBrain font for terminal
" https://github.com/JetBrains/JetBrainsMono

" before install plugin managers
" https://github.com/VundleVim/Vundle.vim
"
" firstly install plugin :PluginInstall
" then install plug: :PlugInstall
"
call plug#begin('~/.vim/plugged')
" Somethings wrong with font. Need install some special font
" but JetBrain so preaty
" Plug 'ryanoasis/vim-devicons'
"
" TODO try set letter
" Plug 'dpelle/vim-LanguageTool'
call plug#end()

call vundle#begin()
" install plug
Plugin 'vim-plug'

" ----- themes ------
Plugin 'sonph/onehalf', { 'rtp': 'vim/' }
Plugin 'dracula/vim', { 'name': 'dracula' }

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin '907th/vim-auto-save'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tomlion/vim-solidity'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
" Automaticall insert the closing HTML tag
Plugin 'HTML-AutoCloseTag'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'

" ----- Syntax highlighting -------------------------------------------
Plugin 'sheerun/vim-polyglot'

call vundle#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on

set mouse=a

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=256

" Set the colorscheme. Enable themes: dracula, onehalfdark
colorscheme dracula


" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" ----- auto save -----
let g:auto_save = 1
" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1
let g:NERDTreeWinSize=40


" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END


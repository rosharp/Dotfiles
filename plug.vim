  if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

call plug#end()

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has("nvim")
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'neovim/nvim-lspconfig'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'nvim-treesitter/n', { 'do': 'TSUpdate' }
  Plug 'vimwiki/vimwiki'
  Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons' |
            \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tmhedberg/SimpylFold'
  Plug 'junegunn/goyo.vim'
  Plug 'amix/vim-zenroom2'
  Plug 'junegunn/limelight.vim'
  Plug 'markstory/vim-zoomwin'
  Plug 'fholgado/minibufexpl.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'tomasr/molokai', { 'as': 'molokai' }
  Plug 'joshdick/onedark.vim', { 'as': 'onedark' }
  Plug 'bitc/vim-bad-whitespace'
  Plug 'mhinz/vim-startify'
  Plug 'deoplete-plugins/deoplete-jedi'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'masukomi/vim-markdown-folding', { 'for': 'markdown' }
  Plug 'gabrielelana/vim-markdown'
endif
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
endif

call plug#end()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/Users/ro.sharp/.config/nvim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'neovim/pynvim'
Plugin 'flazz/vim-colorschemes'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()            " required
filetype plugin indent on    " required

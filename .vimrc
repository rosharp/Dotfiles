set fillchars=vert:\│,eob:\ 
set number
syntax enable
set runtimepath+=~/.vim
set linespace=5
set guifont=Cousine:h12filetype 
set relativenumber
set termguicolors
set t_Co=256
" Stuff for Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" HTML completion
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml,html inoremap </ </<C-x><C-o>
autocmd BufNewFile *.html 0r ~/.vim/templates/html.skel
" CSS settings
set foldmethod=syntax "syntax highlighting items specify folds  
set foldcolumn=1 "defines 1 col at window left, to indicate folding  
let javaScript_fold=1 "activate folding by JS syntax  
set foldlevelstart=99 "start file with all folds opened
" JS autocompletion
set omnifunc=syntaxcomplete#Complete
" Commentary
autocmd FileType apache setlocal commentstring=#\ %s
"" Markdown preview "{{{
" ---------------------------------------------------------------------
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 1

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }


" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = '8888'

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
"}}}

" {{{ BASIC SETUP
" BASIC SETUP:

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" Cursor

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin '1995eaton/vim-better-javascript-completion'
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()            " required
filetype plugin indent on
call plug#begin('~/.vim/plugged')
  Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
  Plug 'yuezk/vim-js'
  Plug 'junegunn/goyo.vim'
  Plug 'nono/jquery.vim'
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'maksimr/vim-jsbeautify'
  Plug 'mattn/emmet-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'overcache/NeoSolarized'
  Plug 'vim-python/python-syntax'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
  Plug 'vimwiki/vimwiki'
  Plug 'junegunn/limelight.vim'
  Plug 'preservim/nerdtree'
call plug#end()

" jQuery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Start NERDTree when Vim starts with a directory argument.
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

 "Lightline
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode

" Python syntax
let g:python_highlight_all = 1

let g:pencil_higher_contrast_ui = 1   " 0=low (def), 1=high
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
"    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

" For Goyo
map <C-f> :Goyo<CR>
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list





" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings



" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter


"██████╗░░█████╗░  ░██████╗██╗░░██╗░█████╗░██████╗░██████╗░
"██╔══██╗██╔══██╗  ██╔════╝██║░░██║██╔══██╗██╔══██╗██╔══██╗
"██████╔╝██║░░██║  ╚█████╗░███████║███████║██████╔╝██████╔╝
"██╔══██╗██║░░██║  ░╚═══██╗██╔══██║██╔══██║██╔══██╗██╔═══╝░
"██║░░██║╚█████╔╝  ██████╔╝██║░░██║██║░░██║██║░░██║██║░░░░░
"╚═╝░░╚═╝░╚════╝░  ╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═░░╚═╝╚═╝░░░░░

"█▄░█ █░█ █ █▀▄▀█   █▀▀ █▀█ █▄░█ █░█ █ █▀▀ █░█ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
"█░▀█ ▀▄▀ █ █░▀░█   █▄▄ █▄█ █░▀█ ▀▄▀ █ █▄█ █▄█ █▀▄ █▀█ ░█░ █ █▄█ █░▀█


" DEFAULT --------------------------------------------------------------- {{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

let mapleader = "\<Space>"

" open new split panes to right and below
set splitright
set splitbelow

" Default Shell
set shell=zsh

" True Color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Huh?
set nocompatible
filetype plugin on
syntax on
syntax enable

" Rellative line numbers
set rnu

" Mouse
set mouse=a

" EJS
au BufNewFile,BufRead *.ejs set filetype=html

" No -- INSERT --
set noshowmode

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim


" }}}

" COMPLETION ---------------------------------------------------------------- {{{


" .gitignore skeleton
autocmd BufNewFile .gitignore 0r ~/.vim/templates/.gitignore
" Skeletons
autocmd BufNewFile *.html 0r ~/.vim/templates/html.skel
autocmd BufNewFile *.ejs 0r ~/.vim/templates/ejs.skel

" HTML completion
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml,html inoremap </ </<C-x><C-o>
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" JS autocompletion
set omnifunc=syntaxcomplete#Complete
autocmd BufNewFile *.js 0r ~/.vim/templates/js.skel
" JS Beautify
autocmd FileType javascript noremap <buffer>  <c-p> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-]> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-]> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-]> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-]> :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <c-p> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-]> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-]> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-]> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-]> :call RangeCSSBeautify()<cr>

" Coc
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-sh', 'coc-markdownlint']
" }}}

" PLUGINS --------------------------------------------------------------- {{{

call plug#begin("~/.vim/plugged")

"Themes
"Plug 'arcticicestudio/nord-vim'
"Plug 'romgrk/doom-one.vim'
"Plug 'jacoborus/tender.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ghifarit53/tokyonight-vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
"Plug 'ayu-theme/ayu-vim'
"Plug 'whatyouhide/vim-gotham'
"Plug 'bluz71/vim-moonfly-colors'
"Plug 'morhetz/gruvbox'
"Plug 'fxn/vim-monochrome'
"Plug 'arcticicestudio/nord-vim'
"Plug 'mhartington/oceanic-next'
"Plug 'lifepillar/vim-solarized8'
"Plug 'lifepillar/vim-gruvbox8'
"Plug 'dracula/vim'
"Plug 'crusoexia/vim-monokai'
"Plug 'tomasr/molokai'
"Plug 'rakr/vim-one'


" Startify
Plug 'mhinz/vim-startify'

" Diff
Plug 'chrisbra/vim-diff-enhanced'

" Live HTML/CSS Preview
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

" Nice Scrolling
Plug 'psliwka/vim-smoothie'

" React JSX
Plug 'mxw/vim-jsx'

" Line Indentation
Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['┊']

" Dashboard
"Plug 'liuchengxu/vim-clap'
"Plug 'glepnir/dashboard-nvim'
"Plug 'altercation/vim-colors-solarized'

" Finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Tree Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Autocomplete
Plug 'maksimr/vim-jsbeautify'

" More JS
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'

" TypeScript
Plug 'HerringtonDarkholme/yats.vim'

" HTML
Plug 'othree/html5.vim'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Tabs and shiftwidth
Plug 'tpope/vim-sleuth'

" Instant Markdown
" Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

" Language Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Rainbow Parentheses
Plug 'junegunn/rainbow_parentheses.vim'

" TypeScript Highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Colorize
Plug 'norcalli/nvim-colorizer.lua'

" Wiki
Plug 'vimwiki/vimwiki'

" For God bless Git
Plug 'tpope/vim-fugitive'

" JS
Plug '1995eaton/vim-better-javascript-completion'

" Goyo for beauty
Plug 'junegunn/goyo.vim'

" Limelight
Plug 'junegunn/limelight.vim'

" Lightline
" Plug 'itchyny/lightline.vim'
Plug 'sainnhe/artify.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Emmet for life
Plug 'mattn/emmet-vim'

" Devicons 
Plug 'ryanoasis/vim-devicons'

" NERD Tree
Plug 'preservim/nerdtree'

" NERD Commenter
Plug 'preservim/nerdcommenter'


call plug#end()

" Enable theming support
if (has("termguicolors"))
	set termguicolors
endif

" }}}

" SETTINGS ---------------------------------------------------------------- {{{

" NERD ---------------------------------------------------------------- {{{

" NERD Tree Settings
nnoremap <C-t> :NERDTreeToggle<CR>

"Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" }}}

" Limelight ---------------------------------------------------------------- {{{

nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)


" }}}

" Rainbow ---------------------------------------------------------------- {{{

augroup rainbow_lisp
  autocmd!
  autocmd FileType js,jsx,html,css,lisp,clojure,scheme RainbowParentheses
augroup END

" }}}

" Telescope ---------------------------------------------------------------- {{{

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').oldfiles()<cr>

" }}}

" tmux ---------------------------------------------------------------- {{{

  " Fix Cursor in TMUX
if exists('$TMUX')  
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"  
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else  
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"  
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

if (has("termguicolors"))
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum
endif

" True color support
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

" }}}

" VimWiki ---------------------------------------------------------------- {{{

" Comments rendered in italics
hi Normal guibg=NONE ctermbg=NONE

" Vimwiki MD syndax
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" }}}

" Dashboard ---------------------------------------------------------------- {{{

let g:dashboard_default_executive ='telescope'
    
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

" }}}

" Markdown Preview ---------------------------------------------------------------- {{{

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
let g:mkdp_open_to_the_world = 0

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

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
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
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" Markdown Preview Mappings
nmap <C-p> <Plug>MarkdownPreviewToggle

" }}}

" Terminal ---------------------------------------------------------------- {{{

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
	split term://bash
	resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" }}}

" Startify ---------------------------------------------------------------- {{{
"
" This will generate an ASCII art header using Figlet rather then having to create it by hand
 let g:startify_custom_header =
       \ startify#pad(split(system('figlet -w 100 VIM2020'), '\n'))

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

" Display NERDTree bookmarks as a separate list
" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2- ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']}
        \]

" }}}

" }}}

" MAPPINGS ---------------------------------------------------------------- {{{

" turn terminal to normal mode with escape
" tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" coc bindings ---------------------------------------------------------------- {{{

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Open diagnostics
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>


" }}}

" }}}

" SYNTAX ---------------------------------------------------------------- {{{

" coc
" Show errors on hover
nnoremap <silent> K :call CocAction('doHover')<CR>
" When cursoring over a word, see either the diagnostic if it exists, otherwise the documentation
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()


" jQuery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" CSS settings
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

" Commentary
autocmd FileType apache setlocal commentstring=#\ %s

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','
endif
" }}}

" THEME ---------------------------------------------------------------- {{{

let g:airline_theme='tokyonight'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
nnoremap <silent> <C-[> :bprevious<CR>
nnoremap <silent> <C-]> :bnext<CR>
nnoremap <silent> <C-;> :bfirst<CR>
nnoremap <silent> <C-'> :blast<CR>
nnoremap <silent> <C-.> :badd
 
" Tokyo 
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

" Load the colorscheme
colorscheme catppuccin 

"" Lightline
"let g:lightline = {
"      \ 'colorscheme': 'one',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'readonly', 'filename' ] ],
"      \ },
"      \ 'component_function': {
"      \   'filename': 'LightlineFilename',
"      \ },
"      \ }

"function! LightlineFilename()
"  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
"  let modified = &modified ? ' +' : ''
"  return filename . modified
"endfunction

" }}} 


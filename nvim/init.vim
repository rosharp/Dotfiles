"██████╗░░█████╗░  ░██████╗██╗░░██╗░█████╗░██████╗░██████╗░
"██╔══██╗██╔══██╗  ██╔════╝██║░░██║██╔══██╗██╔══██╗██╔══██╗
"██████╔╝██║░░██║  ╚█████╗░███████║███████║██████╔╝██████╔╝
"██╔══██╗██║░░██║  ░╚═══██╗██╔══██║██╔══██║██╔══██╗██╔═══╝░
"██║░░██║╚█████╔╝  ██████╔╝██║░░██║██║░░██║██║░░██║██║░░░░░
"╚═╝░░╚═╝░╚════╝░  ╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═░░╚═╝╚═╝░░░░░

"█▄░█ █░█ █ █▀▄▀█   █▀▀ █▀█ █▄░█ █░█ █ █▀▀ █░█ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
"█░▀█ ▀▄▀ █ █░▀░█   █▄▄ █▄█ █░▀█ ▀▄▀ █ █▄█ █▄█ █▀▄ █▀█ ░█░ █ █▄█ █░▀█

" Huh?
set nocompatible
filetype plugin on
syntax on

" Rellative line numbers
set rnu

" EJS
au BufNewFile,BufRead *.ejs set filetype=html

" No -- INSERT --
set noshowmode 

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

call plug#begin("~/.vim/plugged")

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'whatyouhide/vim-gotham'
Plug 'bluz71/vim-moonfly-colors'
Plug 'morhetz/gruvbox'

" Clap
Plug 'liuchengxu/vim-clap'

" Dashboard
Plug 'glepnir/dashboard-nvim'
Plug 'liuchengxu/vim-clap' " or Plug 'junegunn/fzf.vim' or Plug 'nvim-lua/telescope.nvim'

" Autocomplete
Plug 'maksimr/vim-jsbeautify'

" More JS
Plug 'pangloss/vim-javascript'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Tabs and shiftwidth
Plug 'tpope/vim-sleuth'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Language Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

" TypeScript Highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Wiki
Plug 'vimwiki/vimwiki'

" For God bless Git
Plug 'tpope/vim-fugitive'

" JS
Plug '1995eaton/vim-better-javascript-completion'

" Goyo for beauty
Plug 'junegunn/goyo.vim'

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/artify.vim'

" Emmet for life
Plug 'mattn/emmet-vim'


" NERD Tree and Icons 
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" NERD Commenter
" Plug 'preservim/nerdcommenter'

" File Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" Enable theming support
if (has("termguicolors"))
	set termguicolors
endif

" Theme
syntax enable
set background=dark
colorscheme ayu 
" Transparency
" hi Normal guibg=NONE ctermbg=NONE

" Vimwiki MD syndax
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"jQuery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Goyo
map <C-g> :Goyo<CR>

" Start NERDTree when Vim starts with a directory argument.
map <C-t> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
			\ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" NERD Commenter settings
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

" Lightline

let g:lightline = {
      \ 'colorscheme': 'ayu_dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction


" HTML completion
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml,html inoremap </ </<C-x><C-o>
autocmd BufNewFile *.html 0r ~/.vim/templates/html.skel
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" CSS settings
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

" JS autocompletion
set omnifunc=syntaxcomplete#Complete
autocmd BufNewFile *.js 0r ~/.vim/templates/js.skel

" Commentary
autocmd FileType apache setlocal commentstring=#\ %s

" Dashboard Settings
let g:mapleader="\<Space>"
"let g:dashboard_default_executive ='clap' or 'fzf' or 'telescope'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
let g:dashboard_custom_header =<< trim END
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                        N E O V I M                         \/   `==
\   _-'                                                                `-_   /
 `''                                                                      ``'
END

" Markdown Preview
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

" Autocomplete
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

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
	split term://bash
	resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


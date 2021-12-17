
"██████╗░░█████╗░  ░██████╗██╗░░██╗░█████╗░██████╗░██████╗░
"██╔══██╗██╔══██╗  ██╔════╝██║░░██║██╔══██╗██╔══██╗██╔══██╗
"██████╔╝██║░░██║  ╚█████╗░███████║███████║██████╔╝██████╔╝
"██╔══██╗██║░░██║  ░╚═══██╗██╔══██║██╔══██║██╔══██╗██╔═══╝░
"██║░░██║╚█████╔╝  ██████╔╝██║░░██║██║░░██║██║░░██║██║░░░░░
"╚═╝░░╚═╝░╚════╝░  ╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░

"█▄░█ █░█ █ █▀▄▀█   █▀▀ █▀█ █▄░█ █░█ █ █▀▀ █░█ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
"█░▀█ ▀▄▀ █ █░▀░█   █▄▄ █▄█ █░▀█ ▀▄▀ █ █▄█ █▄█ █▀▄ █▀█ ░█░ █ █▄█ █░▀█

" Rellative line numbers
set rnu

call plug#begin("~/.vim/plugged")

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'altercation/vim-colors-solarized'

" Autocomplete
Plug 'maksimr/vim-jsbeautify'


" Language Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
" TypeScript Highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Wiki
Plug 'vimwiki/vimwiki'

" JS
Plug '1995eaton/vim-better-javascript-completion'

" Goyo for beauty
Plug 'junegunn/goyo.vim'

" Emmet for life
Plug 'mattn/emmet-vim'


" File Explorer with Icons
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

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
let g:solarized_termcolors=256
" Transparency
" hi Normal guibg=NONE ctermbg=NONE

" jQuery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Goyo
map <C-g> :Goyo<CR>

" Start NERDTree when Vim starts with a directory argument.
map <C-t> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
			\ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

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

" Commentary
autocmd FileType apache setlocal commentstring=#\ %s


nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Autocomplete
" JS Beautify
autocmd FileType javascript noremap <buffer>  <c-]> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-]> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-]> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-]> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-]> :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <c-]> :call RangeJsBeautify()<cr>
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

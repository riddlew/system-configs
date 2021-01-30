"==============================================================================
" Plugins
"==============================================================================
call plug#begin("~/.vim/plugged")
	Plug 'dracula/vim'
	Plug 'scrooloose/nerdtree'
	Plug 'airblade/vim-gitgutter'
	Plug 'itchyny/lightline.vim'
	"Plug 'vim-airline/vim-airline'
	"Plug 'vim-airline/vim-airline-themes'
	Plug 'zeorin/tmuxline.vim', { 'branch': 'utf8-suppress-error' }
	"Plug 'chrisbra/vim-commentary'
	Plug 'mhinz/vim-startify'
	Plug 'mattn/emmet-vim'
	Plug 'tmhedberg/SimpylFold'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'sjl/gundo.vim'
	Plug 'tpope/vim-surround'
	Plug 'jiangmiao/auto-pairs'
	Plug 'sonph/onehalf', {'rtp': 'vim/'}
	Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'xolox/vim-session'
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-notes'
	Plug 'junegunn/gv.vim'
	Plug 'junegunn/vim-easy-align'
	Plug 'easymotion/vim-easymotion'
	Plug 'MattesGroeger/vim-bookmarks'
	"Plug 'majutsushi/tagbar'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'jkramer/vim-checkbox'
	Plug 'godlygeek/tabular'
	Plug 'plasticboy/vim-markdown'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for' : ['markdown', 'vim-plug'] }
	Plug 'preservim/nerdcommenter'
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'

	" To Do
	" Plug 'AndrewRadev/bufferize.vim'
	" Plug 'terryma/vim-expand-region'
	" Plug 'junegunn/vim-peekaboo'
	" Plug 'airblade/vim-rooter'
	" Plug 'tpope/vim-repeat'
	Plug 'kshenoy/vim-signature'
	Plug 'unblevable/quick-scope'
	" Plug 'svermeulen/vim-yoink'
	
	Plug 'ThePrimeagen/vim-be-good', {'do': '.\install.sh'}

	if has ('nvim')
		Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
	else
		Plug 'Shougo/denite.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif
call plug#end()


"==============================================================================
" Key Bindings
"==============================================================================
" Leader will now be space.
map <Space> <Leader>
" Turn off wrapping lines when they reach the highlight column
set formatoptions-=t
" <space>ln will toggle line numbers (for when I need abs #s).
noremap <silent> <Leader>ln :call ToggleLineNumbers()<CR>
" F2 toggles between normal paste and system clipboard paste.
set pastetoggle=<F2>
" Esc key will clear search results or return if not highlighted.
nnoremap <silent> <ESC> :noh<CR><ESC> 
"nnoremap <silent> <CR> :if v:hlsearch && mode() is 'n' \| :noh<CR> \| else \| <CR> \| endif
" CTRL HJKL will switch between splits.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" CTRL =-,. will adjust split widths and heights
nnoremap <C-=> 5<C-W>+
nnoremap <C--> 5<C-W>-
nnoremap <C-,> 5<C-W><
nnoremap <C-.> 5<C-W>>
" j and k will work the same even if the line is word wrapped.
nnoremap j gj
nnoremap k gk
" Gundo Toggle
nnoremap <silent> <leader>u :GundoToggle<CR>
" Code folding toggle
nnoremap <leader><space> za
" Remap ESC to jj
inoremap jj <ESC>
" Leader v vertical split.
nnoremap <leader>v :vsplit 
" Leader h vertical split.
nnoremap <leader>h :split 
" Leader q goes to previous buffer.
nnoremap <silent> <nowait> <leader>q :bp<CR>
" Leader w goes to next buffer.
nnoremap <silent> <nowait> <leader>w :bn<CR>
" Leader a goes to previous tab.
nnoremap <silent> <nowait> <leader>a :tabp<CR>
" Leader s goes to next tab.
nnoremap <silent> <nowait> <leader>s :tabn<CR>
" Leader z opens fuzzy finding files.
nnoremap <leader>z :Files<CR>
" Leader x will start cd command and expand current directory.
nnoremap <leader>x :cd <C-R>=expand("%:p:h")<CR>
" Shift J in visual mode will move selection up a line.
vnoremap J :m '>+1<CR>gv=gv
" Shift K in visual mode will move selection down a line.
vnoremap K :m '<-2<CR>gv=gv
" Leader gs shows git status.
nnoremap <leader>gs :G<CR>
" Leader gf gitdiff from left file.
nnoremap <leader>gf :diffget //2<CR>
" Leader gj gitdiff from right file.
nnoremap <leader>gj :diffget //3<CR>
" Control-n Toggle NERD Tree.
map <leader>n :NERDTreeToggle<CR>
" GV commit browser
nnoremap <leader>gv :GV<CR>
" EasyAlign ga remap for normal and visual mode
nmap <leader>ea <Plug>(EasyAlign)
xmap <leader>ea <Plug>(EasyAlign)
" Easy Motion search by 1 char.
map <leader>f <Plug>(easymotion-bd-f)
"nmap <leader>fc <plug>(easymotion-overwin-f)
" Easy motion search by 2 char
"nmap <leader>fc <plug>(easymotion-overwin-f2)
" Easy motion search by line
map <leader>l <plug>(easymotion-bd-jk)
"nmap <leader>eml <plug>(easymotion-overwin-line)
" Easy motion search by word
"map <leader>fw <plug>(easymotion-bd-w)
"nmap <leader>emw <plug>(easymotion-overwin-w)
" Bookmarks keybindings
nmap <leader>bm <Plug>BookmarkToggle
nmap <leader>ba <Plug>BookmarkAnnotate
nmap <leader>bs <Plug>BookmarkShowAll
nmap <leader>bn <plug>BookmarkNext
nmap <leader>bp <plug>BookmarkPrev
nmap <leader>bc <plug>BookmarkClear
nmap <leader>bj <plug>BookmarkMoveDown
nmap <leader>bk <plug>BookmarkMoveUp
let g:bookmark_no_default_key_mappings = 1
" Puts the date, time, or both
nmap <nowait> <leader>unix :put =strftime('%c')
nmap <leader>datetime :put =strftime('%m/%d/%y %H:%M:%S')
nmap <leader>date :put =strftime('%m/%d/%y')
nmap <nowait> <leader>time :put =strftime('%H:%M:%S')
" Remap checkbox toggle command
nmap <silent> <leader>cb :call checkbox#ToggleCB()<CR>
" Tabular formatting for aligning , | or whatever you want.
"	Tip: :Tabularize /,/r1c1l0
"		r c l will align the columns right, center, left
"		the numbers is how many spaces to pad the match (comma in this example)
"		* Patterns will repeat if more fields than arguments
if exists(':Tabularize')
	nnoremap <nowait> <leader>t= :Tabularize /=<CR>
	vnoremap <nowait> <leader>t= :Tabularize /=<CR>
	nnoremap <nowait> <leader>t: :Tabularize /:\zs<CR>
	vnoremap <nowait> <leader>t: :Tabularize /:\zs<CR>
	nnoremap <nowait> <leader>t<bar> :Tabularize /<bar><CR>
	vnoremap <nowait> <leader>t<bar> :Tabularize /<bar><CR>
endif
" Table formatting provided by Markdown
autocmd Filetype markdown nnoremap <buffer> <nowait> <Leader>mdt :TableFormat<CR>
autocmd Filetype markdown nnoremap <buffer> <Leader>mdp :MarkdownPreview<CR>
autocmd Filetype markdown nnoremap <buffer> <Leader>mdps :MarkdownPreviewStop<CR>
" Go to previous selection, yank, then jump back to last edited location.
" In case I yank text and then realize I need to delete code first, I won't
" have to search for it again to yank it.
" This is now redundant, just use gd instead
"nmap <C-I> :normal! gvyg;p<CR>
" Don't need these
map <UP>    <NOP>
map <DOWN>  <NOP>
map <LEFT>  <NOP>
map <RIGHT> <NOP>
imap <UP>    <NOP>
imap <DOWN>  <NOP>
imap <LEFT>  <NOP>
imap <RIGHT> <NOP>
vmap <UP>    <NOP>
vmap <DOWN>  <NOP>
vmap <LEFT>  <NOP>
vmap <RIGHT> <NOP>
" Map gy and gp to yank and paste from register. gy will not use return key
" in case I want to wank a word or something (except for visual mode).
nnoremap gp "+p
nnoremap gy "+y
vnoremap gy "+y
" gd in normal and visual mode will delete without overwriting what we just
" yanked.
nnoremap gd "_d
vnoremap gd "_d


"==============================================================================
" Settings
"==============================================================================
set encoding=utf-8
scriptencoding utf-8
set nocompatible
set display=lastline
" I've been told autoread is useless and doesn't work...
set autoread
" Auto indent lines.
set autoindent
" Automatic filetype when saved (syntax highlighting and stuff), indenting, etc
filetype indent plugin on
" More history
set history=10000
" Highlight matching text when searching.
set hlsearch
" Searching as you type.
set incsearch
" 2 lines of status line at bottom
set laststatus=2
" Sets characters for tabs, trailing characters, extends, precedes, and nbps.
set list lcs=tab:\│\ ,trail:·,extends:≫,precedes:≪,nbsp:¬
" Mouse support = all
set mouse=a
" Hexadecimal format for increment / decrement with ctrl-a and ctrl-z
set nrformats=hex
" Affects how tabs work. Begginning of line = shiftwidth, elsewhere will
" use tabstop and softtabstop.
set smarttab
" Max number of tabs.
set tabpagemax=50
" Search for tags file in current file directory, then working directory.
set tags=./tags;,tags
" Faster redrawing.
set ttyfast
" Save variables across sessions.
set viminfo+=!
" Tab completion
set wildmenu
" Show tab header when at least 2 tabs are open
set showtabline=2
" Hides your mode (normal, insert, etc). Do not need this with airline.
set noshowmode
" Enable syntax highlighting.
syntax enable
" Turn on numbers and relative line numbers.
set number relativenumber
" Ignore case when searching.
" set ignorecase
" CHANGE: Use caps if caps are used when searching.
set smartcase
" How many character spaces to use for shifting a line.
set shiftwidth=4
" How many character spaces to use for soft tab.
set softtabstop=4
" How many character spaces to use for tab.
set tabstop=4
" 1000 undos worth of history.
set undolevels=1000
" If line wraps, show +++ to denote line is a linebreak.
" OLD version: set showbreak=+++\ 
set showbreak=↳\ 
" Highlights matching braces {}[]().
set showmatch
" Disables visual bell.
set visualbell
" Highlights line cursor is on.
set cursorline
" Do not redraw when not needed.
set lazyredraw
" Default vertical split to the right.
set splitright
" Default horizontal split to the bottom.
set splitbelow
" How to display folded code.
set foldmethod=indent		
" How many levels deep to search for folds.
set foldlevel=99
" Turn off word wrap
set nowrap
"If word wrap on, only break at characters " ^I!@*-+;:,./?".
set linebreak
" Used for text wrapping in number column.
set cpoptions+=n
" Set column width to 80
set textwidth=80
" Highlight column at textwidth +1
set colorcolumn=+1
" Shows last command typed in command line at bottom.
set showcmd
" Sets backup file dir to vim path\temp (Windows).
set backupdir=$HOME\\AppData\\Local\\nvim\\temp
" Sets vim swap dir to vim path\temp (Windows).
set directory=$HOME\\AppData\\Local\\nvim\\temp
set backup
set writebackup
" 256 color support for terminal.
set t_Co=256
" Will scroll window when within 5 lines of the edge. 9999 will keep it
" centered.
set scrolloff=5
" Allow switching buffers without having to save first.
set hidden
" If buffer is already open, switch to it instead of new split.
" Does not work on edit cmd, only buffers cmds like :sb<buffer>
set switchbuf=useopen
" Allows subdirectory searching
set path+=**
" Shows substitute in real time
set inccommand=split
" Prevent node files from showing up in file search
set wildignore+=**/node_modules/**


"==============================================================================
" AutoCmds
"==============================================================================
" Makes comments appear as italics
"highlight Comment gui=italic cterm=italic
"augroup italiccomments
"	autocmd!
"	autocmd ColorScheme * highlight Comment gui=italic cterm=italic
"augroup end

" Relative line numbers when in normal mode, absolute in insert mode.
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup end

" Startify plugin
augroup startify
	autocmd!
	autocmd FileType startify setlocal nospell
augroup END

" Markdown settings
augroup markdownsettings
	autocmd!
	autocmd Filetype markdown setlocal expandtab tabstop=2 softtabstop=2
	autocmd Filetype markdown setlocal shiftwidth=2 noautoindent nosmartindent
	autocmd Filetype markdown setlocal indentexpr=""
augroup END

augroup typescriptsettings
	autocmd!
	autocmd BufNewFile,BufRead *.ts set filetype=typescript
	autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup END


"==============================================================================
" Custom Functions
"==============================================================================
function! g:ToggleLineNumbers()
	if &relativenumber
		set norelativenumber
	else
		set relativenumber
	endif
endfunction


"==============================================================================
" NERD Commenter Settings
"==============================================================================
" let g:NERDCustomDelimiters = { 'javascript': { 'left': '{/* ', 'right': ' */}', 'leftAlt': '/*', 'rightAlt': '*/' } }
let g:NERDCustomDelimiters = {
	\'typescript': { 'left': '{/* ', 'right': ' */}', 'leftAlt': '/*', 'rightAlt': '*/' }
\}


"==============================================================================
" Startify Bookmarks
"==============================================================================
let g:startify_bookmarks = [
	\'C:\Users\wgaming1070\AppData\Local\nvim\init.vim',
\]

let g:startify_custom_indices = [
	\"a", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "o", "p", "r", "u", "w", "x", "y", "z"
\]


"==============================================================================
" Markdown-Preview
"==============================================================================
let g:mkdp_auto_close = 0
let g:mkdp_browser='firefox'


"==============================================================================
" Airline Settings
"==============================================================================
"let g:airline_theme='base16'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_tabs = 1
"let g:airline#extensions#tabline#show_buffers = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1


"==============================================================================
" Lightline Settings
"==============================================================================
let g:lightline = {
	\ 'colorscheme': 'one',
	\ 'active': {
	\	'left': [
	\		['mode', 'paste'],
	\		['gitbranch', 'filename', 'readonly', 'modified']
	\	],
	\	'right': [
	\		['lineinfo'],
	\		['percent'],
	\		['fileformat', 'fileencoding', 'filetype', 'charvaluehex']
	\	]
	\ },
	\ 'component': {
	\	'charvaluehex': '0x%B',
	\ },
	\ 'component_function': {
	\	'gitbranch': 'FugitiveHead',
	\	'filename': 'LightlineFilename'
	\ },
	\ 'mode_map': {
	\	'n': 'N',
	\	'i': 'I',
	\	'R': 'R',
	\	'v': 'V',
	\	'V': 'VL',
	\	"\<C-v>": 'VB',
	\	'c': 'C',
	\	's': 'S',
	\	'S': 'SL',
	\	"\<C-s>": 'SB',
	\	't': 'T',
	\ }
\ }

function! LightlineFilename()
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	let modified = &modified ? ' +' : ''
	return filename . modified
endfunction


"==============================================================================
" Color Scheme
"==============================================================================
colorscheme onehalfdark

" One Dark Colors

" Note to self:
" To get key characters such as ESC, go to insert mode, hit C-v, and then the
" key (esc). Should print something similar to ^[
"
" red gui=#E06C75 cterm=204 cterm16=1
" dark_red gui=#BE5046 cterm=196 cterm16=9
" green gui=#98C379 cterm=114 cterm16=2
" yellow gui=#E5C07B cterm=180 cterm16=3
" dark_yellow gui=#D19A66 cterm=173 cterm16=11
" blue gui=#61AFEF cterm=39 cterm16=4
" purple gui=#C678DD cterm=170 cterm16=5
" cyan gui=#56B6C2 cterm=38 cterm16=6
" white gui=#ABB2BF cterm=145 cterm16=7
" black gui=#282C34 cterm=235 cterm16=0
" visual_black gui=NONE cterm=NONE cterm16=0
" comment_grey gui=#5C6370 cterm=59 cterm16=15
" gutter_fg_grey gui=#4B5263 cterm=238 cterm16=15
" cursor_grey gui=#2C323C cterm=236 cterm16=8
" visual_grey gui=#3E4452 cterm=237 cterm16=15
" menu_grey gui=#3E4452 cterm=237 cterm16=8
" special_grey gui=#3B4048 cterm=238 cterm16=15
" vertsplit gui=#181A1F cterm=59 cterm16=15


"==============================================================================
" Line Number and matching braces colors.
"==============================================================================
" Current line number yellow.
hi CursorLineNr term=bold ctermfg=Yellow guifg=yellow gui=bold
" Matching braces / parenthesis white fg red bg.
hi MatchParen cterm=bold ctermfg=white ctermbg=red gui=bold guifg=white guibg=red
" Cursor black fg white bg.
hi Cursor cterm=none ctermfg=black ctermbg=white gui=none guifg=black guibg=white
" Change color of eol, extends, and preceeds.
hi NonText cterm=none ctermfg=59 guifg=#5C6370 gui=none
" Change color of nbsp, space, tab, and trail
hi Whitespace cterm=none ctermfg=59 guifg=#5C6370 gui=none

"==============================================================================
" GitGutter Settings
"==============================================================================
let g:gitgutter_map_keys = 0


"==============================================================================
" Gundo Settings
"==============================================================================
if has('python3')
	let g:gundo_prefer_python3=1
endif


"==============================================================================
" Floating FZF Window
"==============================================================================
if has('nvim-0.4.0') || has("patch-8.2.0191")
	let g:fzf_layout = { 'window': {
		\ 'width': 0.9,
		\ 'height': 0.7,
		\ 'highlight': 'Comment',
		\ 'rounded': v:false }}
else
	let g:fzf_layout = { "window": "silent botright 16split enew" }
endif

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)

"==============================================================================
" Denite Setup
"==============================================================================
try
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ ',
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'DiffAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>cwd - Browse list of files in current directory
"   <leader>ds - Search current directory for occurences of given term and close window if no results
"   <leader>cds - Search current directory for occurences of word under cursor
nmap <silent> <leader>; :Denite buffer<CR>
nmap <silent> <leader>dir :DeniteProjectDir file/rec<CR>
nnoremap <silent> <leader>ds :<C-u>Denite grep:. -no-empty<CR>
nnoremap <silent> <leader>cds :<C-u>DeniteCursorWord grep:.<CR>
" print work directory
" can also :cd
nnoremap <silent> <leader>pwd :pwd<CR>

" Define mappings while in 'filter' mode
"   <C-;> OLD:<C-s> - Switch to normal mode inside of search results
"   <Esc>           - Exit denite window in any mode
"   <CR>            - Open currently selected file in any mode
"   <C-t>           - Open currently selected file in a new tab
"   <C-v>           - Open currently selected file a vertical split
"   <C-h>           - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-;>
  \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction


" === coc.nvim === "
"   <leader>cd    - Jump to definition of current symbol
"   <leader>cr    - Jump to references of current symbol
"   <leader>ci    - Jump to implementation of current symbol
"   <leader>cs    - Fuzzy search current project symbols
nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jr <Plug>(coc-references)
nmap <silent> <leader>ji <Plug>(coc-implementation)
nnoremap <silent> <leader>js :<C-u>CocList -I -N --top symbols<CR>

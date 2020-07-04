" Essentials
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
" 3 lines of status line at bottom
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
" CHANGE: Search for caps if caps are used
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
" If word wrap on, only break at characters " ^I!@*-+;:,./?".
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
set backupdir=$VIMRUNTIME\\temp\\
" Sets vim swap dir to vim path\temp (Windows).
set directory=$VIMRUNTIME\\temp\\
" 256 color support for terminal.
set t_Co=256


"==============================================================================
" AutoCmds
"==============================================================================
" Makes comments appear as italics
highlight Comment gui=italic cterm=italic
augroup italiccomments
	autocmd!
	autocmd ColorScheme * highlight Comment gui=italic cterm=italic
augroup end

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


"==============================================================================
" Plugins
"==============================================================================
call plug#begin("~/.vim/plugged")
	Plug 'dracula/vim'
	Plug 'scrooloose/nerdtree'
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'zeorin/tmuxline.vim', { 'branch': 'utf8-suppress-error' }
	Plug 'chrisbra/vim-commentary'
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
	"Plug 'majutsushi/tagbar'

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
" Color Scheme
"==============================================================================
colorscheme onehalfdark


"==============================================================================
" Line Number and matching braces colors.
"==============================================================================
" Current line number yellow.
hi CursorLineNr term=bold ctermfg=Yellow guifg=yellow gui=bold
" Matching braces / parenthesis white fg red bg.
hi MatchParen cterm=bold ctermfg=white ctermbg=red gui=bold guifg=white guibg=red
" Cursor black fg white bg.
hi Cursor cterm=none ctermfg=black ctermbg=white gui=none guifg=black guibg=white


"==============================================================================
" Airline Settings
"==============================================================================
let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 1


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
" Key Bindings
"==============================================================================
" Leader will now be space.
map <Space> <Leader>
" F2 toggles between normal pste and system clipboard paste.
set pastetoggle=<F2>
" Enter key will also clear search results.
nnoremap <silent> <CR> :noh<CR><CR>
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
map <C-n> :NERDTreeToggle<CR>
" GV commit browser
nnoremap <leader>gv :GV<CR>
" EasyAlign ga remap for normal and visual mode
nmap <leader>ea <Plug>(EasyAlign)
xmap <leader>ea <Plug>(EasyAlign)
" Easy Motion search by 1 char.
map <leader>emf <Plug>(easymotion-bd-f)
nmap <leader>emf <plug>(easymotion-overwn-f)
" Easy motion search by 2 char
nmap <leader>ems <plug>(easymotion-overwin-f2)
" Easy motion search by line
map <leader>eml <plug>(easymotion-bd-jk)
nmap <leader>eml <plug>(easymotion-overwin-line)
" Easy motion search by word
map <leader>emw <plug>(easymotion-bd-w)
nmap <leader>emw <plug>(easymotion-overwin-w)


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
nmap <silent> <leader>jdef <Plug>(coc-definition)
nmap <silent> <leader>jref <Plug>(coc-references)
nmap <silent> <leader>jimp <Plug>(coc-implementation)
nnoremap <silent> <leader>jsymbols :<C-u>CocList -I -N --top symbols<CR>


let g:startify_custom_header = [
			\'  ::::    ::::  :::::::::: :::        :::    ::: :::::::::: :::   ::: :::::::::  :::::::::: :::     ::: ',
			\'  +:+:+: :+:+:+ :+:        :+:        :+:   :+:  :+:        :+:   :+: :+:    :+: :+:        :+:     :+: ',
			\'  +:+ +:+:+ +:+ +:+        +:+        +:+  +:+   +:+         +:+ +:+  +:+    +:+ +:+        +:+     +:+ ',
			\'  +#+  +:+  +#+ +#++:++#   +#+        +#++:++    +#++:++#     +#++:   +#+    +:+ +#++:++#   +#+     +:+ ',
			\'  +#+       +#+ +#+        +#+        +#+  +#+   +#+           +#+    +#+    +#+ +#+         +#+   +#+  ',
			\'  #+#       #+# #+#        #+#        #+#   #+#  #+#           #+#    #+#    #+# #+#          #+#+#+#   ',
			\'  ###       ### ########## ########## ###    ### ##########    ###    #########  ##########     ###     ',
			\]


"let g:startify_custom_header = [
"			\'       #####   ##    ##             ###       /                                       ##### ##                           ',
"			\'    ######  /#### #####              ###    #/                                     /#####  /##                           ',
"			\'   /#   /  /  ##### #####             ##    ##                                   //    /  / ###                          ',
"			\'  /    /  /   # ##  # ##              ##    ##                                  /     /  /   ###            ##           ',
"			\'      /  /    #     #                 ##    ##                                       /  /     ###           ##           ',
"			\'     ## ##    #     #        /##      ##    ##  /##       /##    ##   ####          ## ##      ##    /##     ##    ###   ',
"			\'     ## ##    #     #       / ###     ##    ## / ###     / ###    ##    ###  /      ## ##      ##   / ###     ##    ###  ',
"			\'     ## ##    #     #      /   ###    ##    ##/   /     /   ###   ##     ###/       ## ##      ##  /   ###    ##     ### ',
"			\'     ## ##    #     #     ##    ###   ##    ##   /     ##    ###  ##      ##        ## ##      ## ##    ###   ##      ## ',
"			\'     ## ##    #     ##    ########    ##    ##  /      ########   ##      ##        ## ##      ## ########    ##      ## ',
"			\'     #  ##    #     ##    #######     ##    ## ##      #######    ##      ##        #  ##      ## #######     ##      ## ',
"			\'        /     #      ##   ##          ##    ######     ##         ##      ##           /       /  ##          ##      ## ',
"			\'       /##/      #      ##   ####    /   ##    ##  ###    ####    /  ##      ##      /###/       /   ####    /   ##      /  ',
"			\'      /  #####           ##   ######/    ### / ##   ### /  ######/    #########     /   ########/     ######/     ######/   ',
"			\'     /     ##                  #####      ##/   ##   ##/    #####       #### ###   /       ####        #####       #####    ',
"			\'     #                                                                        ###  #                                        ',
"			\'      ##                                                               #####   ###  ##                                      ',
"			\'                                                                      /#######  /#                                           ',
"			\'                                                                     /      ###/                                             ',
"			\]

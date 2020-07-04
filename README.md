# system-configs
Vim, bash, etc.

- [Important Information](#important-information)
- [How To Use](#how-to-use)
- [Plugins](#plugins)
- [Init.vim Notes](#init-notes)
- - [Settings](#settings)
- - [Keybindings](#keybindings)


## Important Information

I highly suggest installing Denite and FZF as they make opening and finding files so much faster and easier. There are major improvements that can be added to Denite that I've added in my init file that you can read about  at [https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861](https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861).

These changes require that you have FZF and RipGrep installed on your system. If you are on Windows, they can be installed with a package manager such as Chocolatey.

1 additional plugin I have not included but have recently installed is [vim-bookmarks](https://github.com/MattesGroeger/vim-bookmarks). This plugin is very useful as you can bookmark spots in your files and jump back to them (and they can be configured to save per file so you don't use them when you close the buffer).


## How To Use

This assumes that your init file will include all of the plugins needed in my init file and/or keybindings.

**Note:** `<Leader>` is mapped to the spacebar and is a literal space.
  
### Denite

**Using Denite (fzf and ripgrep required)**
`<Leader>;`
" ;" will bring up a Denite window to search for open buffers with fuzzy finding. Easier than sorting through :buffers.

`<Leader>dir`
" dir" will bring up a Denite window to search for files in your current directory (directory you opened vim from).

`<Leader>pwd`
" pwd" will show you your current directory.

`<Leader>ds`
" ds" will search current directory for occurences of the term you type in and close if no results.

`<Leader>cds`
" cds" will search current directory for occurences of the word under the cursor in vim.

**While showing a dropdown of results in Denite**
`C-;`
Control-; will allow you to switch between typing in the search box and navigating the results window.

`Esc`
Exit window with escape key.

`Enter`
Enter key opens selected file.

`C-t` 
Control-t opens selected file in new tab.

`C-v`
Control-v opens selected file in a vertical split.

`C-h`
Control-h opens selected file in a horizontal split.

### COC

I recommend these binding due to being a little bit easier to remember:

`nmap <silent> <leader>jdef <Plug>(coc-definition)`
" jdef" to Jump to definition of symbol under cursor.

`nmap <silent> <leader>jref <Plug>(coc-references)`
" jref" to jump to references of symbol under cursor.

`nmap <silent> <leader>jimp <Plug>(coc-implementation)`
" nmap" to jump to implementation of current symbol.

`nmap <silent> <leader>jsymbols <plug>(coc-implementation)`
" jsymbols" to fuzzy search current project symbols.




## Plugins

### denite
[Link to denite](https://github.com/Shougo/denite.nvim)

Powerful file and fuzzy finding for vim.

![denite image](https://user-images.githubusercontent.com/13142418/65154984-06107180-da5f-11e9-8cbf-e0a544d0dbc5.jpg)
![denite image 2](https://user-images.githubusercontent.com/1239245/58742567-a155ea80-8460-11e9-9925-09082def2c80.gif)
![denite image 3](https://user-images.githubusercontent.com/41671631/58790351-cf832800-8622-11e9-912d-813408876b86.gif)

---

### vim-gitgutter
[Link to vim-gitgutter](https://github.com/airblade/vim-gitgutter)

Shows diff changes in the gutter (next to line numbers)

![gitgutter image](https://raw.githubusercontent.com/airblade/vim-gitgutter/master/screenshot.png)

---

### GV
[Link to GV](https://github.com/junegunn/gv.vim)

Vim commit browser.

![GV image](https://cloud.githubusercontent.com/assets/700826/12355378/8bbf0834-bbdf-11e5-9389-1aba7cd1fec1.png)

---

### Easy Motion
[Link to easy motion](https://github.com/easymotion/vim-easymotion)

Easily jump to any word, letter, or line both in file and across split windows.

![em image](https://camo.githubusercontent.com/d5f800b9602faaeccc2738c302776a8a11797a0e/68747470733a2f2f662e636c6f75642e6769746875622e636f6d2f6173736574732f333739373036322f323033393335392f61386539333864362d383939662d313165332d383738392d3630303235656138333635362e676966)
![em image 2](https://raw.githubusercontent.com/haya14busa/i/2753bd4dd1dfdf5962dbdbffabf24244e4e14243/easymotion/overwin-motions.gif)

---

### Easy Align
[Link to easy align](https://github.com/junegunn/vim-easy-align)

Commands for aligning tables, signs and commas, etc.

![ea image](https://raw.githubusercontent.com/junegunn/i/master/easy-align/equals.gif)
![ea image 2](https://raw.githubusercontent.com/junegunn/i/master/easy-align/spaces.gif)
![ea image 3](https://raw.githubusercontent.com/junegunn/i/master/easy-align/tables.gif)

---

### tmuxline
[Link to tmuxline](https://github.com/edkolev/tmuxline.vim)

Gives tmux a statusbar like airline.

![tmuxline image](https://camo.githubusercontent.com/369cd5b86d7f6dae0c36de4b5fdb84fa1cd1c648/68747470733a2f2f662e636c6f75642e6769746875622e636f6d2f6173736574732f313533323037312f313535363036322f64383236363063612d346561372d313165332d396466332d3462303834613939326330632e706e67)

---

### vim-commentary
[Link to vim-commentary](https://github.com/tpope/vim-commentary)

Comment / uncomment lines in Vim

---

### vim-startify
[Link to vim-startify](https://github.com/mhinz/vim-startify)

Start screen for Vim that includes things like recent file history.

![vim-startify image](https://raw.githubusercontent.com/mhinz/vim-startify/master/images/startify-menu.png)

---

### emmet-vim

---

### SimpylFold

Adds python code folding support to vim.

---

### COC

Code completion.

---

### Gundo
[Link to gundo](https://vimawesome.com/plugin/gundo)

Adds branched undo history. If you undo something and then make changes, you can no longer get back to that first change before you undid it. This allows you to get back to any change you made in the past.

Ex: I type "gunda". I undo and correct spelling to "gundo". You can't undo back to "gunda". With this plugin, you can.

![gundo image](https://live.staticflickr.com/4113/5093114605_ebc46d6494_c.jpg)

---

### vim-surround
[Link to vim-surround](https://github.com/tpope/vim-surround)

Lets you surround things. Surround words with quotations or change them to parenthesis. You can surround it with anything. You can even surround selections with html tags (such as surrounding <em>Hello</em> with <p class="important"> .... results in <p class="important"><em>Hello</em></p>).

---

### auto-pairs
[Link to auto-pairs](https://github.com/jiangmiao/auto-pairs)

Allows me to add space to brackets to both sides automatically and jump out of brackets when I type the ending bracket. 

---

### OneHalf

My vim colorscheme

---

### fzf
[Link to fzf](https://github.com/junegunn/fzf.vim)

Better searching with fuzzy finding file names, buffers, commits, etc. 

---

### vim-fugitive
[Link to vim-fugitive](https://github.com/tpope/vim-fugitive)

Adds git commands to vim.

---

### vim-session
[Link to vim-session](https://github.com/xolox/vim-session)

Better sessions for vim. Can save and load multiple sessions and prevents accidental closing of files.

![vim-session image](https://raw.githubusercontent.com/xolox/vim-session/master/screenshots/session-save-prompt.png) 
![vim-session2 image](https://raw.githubusercontent.com/xolox/vim-session/master/screenshots/session-restore-prompt.png)

---

### vim-misc
[Link to vim-misc](https://github.com/xolox/vim-misc)

Required for vim-session

---

### vim-notes

Vim note taking.





## Init Notes

### Settings

>`set undolevels=1000`  
>  
>Allows you more undo history

---

>`set splitright`  
>`set splitbelow`  
>  
>New splits will open to right and bottom by default.

---

>`set foldmethod=indent|  |`  
>`set foldlevel=99`  
>  
>Indents folded code and searches for foldable code up to 99 levels deep.

---

>`set textwidth=80`   
>`set columncolor=+1`   
>   
>Highlights a vertical column at column 80.

---

>`augroup numbertoggle`   
>`	autocmd!`   
>`	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber`   
>`	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber`   
>`augroup end`   
>   
>When you're in normal mode, line numbers will show as relative.   
>When you're in insert mode, they change to absolute numbers.   

---

>`hi CursorLineNr term=bold ctermfg=Yellow guifg=yellow gui=bold`   
>`hi MatchParen cterm=bold ctermfg=white ctermbg=red gui=bold guifg=white guibg=red`   
>`hi Cursor cterm=none ctermfg=black ctermbg=white gui=none guifg=black guibg=white`   
>   
>CursorLineNr changes the current line number to yellow to make it stand out.   
>MatchParen makes matching pairs of brackets red with white text to make it stand out.   
>Cursor makes the cursor square white with black text.




### Keybindings

>`map <Space> <Leader>`   
>   
>Makes space key the leader key for non-insert mode.
  
----

>`set pastetoggle=<F2>`    
>   
>F2 toggles between normal vim paste and being able to paste from the system clipboard

---

>`nnoremap <silent> <CR> :noh<CR><CR>`   
>   
>Enter key will clear highlighted search results as well as default enter key return function

---

>`nnoremap <C-J> <C-W><C-J>`   
>`nnoremap <C-K> <C-W><C-K>`   
>`nnoremap <C-L> <C-W><C-L>`   
>`nnoremap ,<C-H> <C-W><C-H>`   
>   
>When control is held down in normal mode, movement keys hjkl will move between splits in that direction.

---

>`nnoremap <C-=> 5<C-W>+`   
>`nnoremap <C--> 5<C-W>-`   
>`nnoremap <C-,> 5<C-W><`   
>`nnoremap <C-.> 5<C-W>>`   
>   
>Control = and - increases and decreases the split's height.   
>Control , and . increases and decreases the split's width.

---

>`nnoremap j gj`   
>`nnoremap k gk`   
>   
>If textwrap mode is enabled, j and k will move down to the wordwrapped line as you would expect instead of skipping the line.

---

>`nnoremap <silent> <leader>u :GundoToggle<CR>`   
>   
>"space u" will toggle the Gundo Undo Tree window.

---

>`nnoremap <leader><space> za`   
>   
>"space za" will fold/unfold code.

---

>`inoremap jj <ESC>`   
>   
>"jj" will escape back to normal mode.

---

>`nnoremap <leader>v :vsplit`   
>   
>"space v" will vertical split the window.

---

>`nnoremap <leader>h :split`   
>    
>"space h" will horizontally split the window.

---

>`nnoremap <silent> <nowait> <leader>q :bp<CR>`   
>`nnoremap <silent> <nowait> <leader>w :bn<CR>`   
>   
>"space q" will go to the previous buffer   
>"space w" goes to the next buffer.

---

>`nnoremap <silent> <nowait> <leader>a :tabp<CR>`   
>`nnoremap <silent> <nowait> <leader>s :tabn<CR>`   
>   
>"space a" will go to previous tab.   
>"space s" will go to next tab.

---

>`nnoremap <leader>z :Files<CR>`   
>   
>"space z" will open up the fzf file dialog to fuzzy find and open a new file.

---

>`nnoremap <leader>x :cd <C-R>=expand("%:p:h")<CR>`   
>   
>"space x" enters the :cd command and autofills with the current working directory

---

>`vnoremap J :m '>+1<CR>gv=gv`   
>`vnoremap K :m '<-2<CR>gv=gv`   
>   
>J while in visual mode will move the selected code up a line.   
>K while in visual mode will move the selected code down a line.

---

>`nnoremap <leader>gs :G<CR>`   
>   
>"space gs" shows git status from fugitive plugin.

---

>`nnoremap <leader>gf :diffget //2<CR>`   
>   
>While doing diffget, will select from left file.
   
---
 
>`nnoremap <leader>gj :diffget //3<CR>`   
>   
>While doing gitdiff, will select from right file.

---

>`map <C-n> :NERDTreeToggle<CR>`   
>   
>Control-n NERDTree toggle.

---

>`nnoremap <leader>gv :GV`   
>   
>Toggle Git Commit browser.

---

>`nmap <leader>ea <Plug>(EasyAlign)`
>`xmap <leader>ea <Plug>(EasyAlign)`
>   
>" ea" shortcut for easy align. It's best to view the plugin's page for more info as there are a LOT of options.

---

>`map <leader>emf <Plug>(easymotion-bd-f)`   
>   
>" emf" will use easy motion to search by 1 letter and allow you to jump there.

---

>`nmap <leader>ems <plug>(easy-motion-overwin-f2`   
>   
>" ems" is the same as above, but searches by 2 letters instead of 1.

---

>`map <leader>eml <plug>(easymotion-bd-jk)`   
>   
>" eml" is the same as above, but allows you to jump to the beginning of any line easily.

---

>`map <leader>emw <plug>(easymotion-bd-w)`   
>   
>" emw" is the same as ems, but you search per word instead of by letters.

---


  

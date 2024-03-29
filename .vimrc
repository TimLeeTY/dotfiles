" L: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
"
"------------------------------------------------------------
"Color scheme options:
"
"" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

syntax on
colorscheme onedark

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on
highlight Comment cterm=italic gui=italic
 
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches 
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
set clipboard=unnamed


" Enable relative line numbers
set relativenumber
"------------------------------------------------------------
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-hjkl> to navigate between split panes
map <C-h> <C-w>h 
map <C-j> <C-w>j 
map <C-k> <C-w>k 
map <C-l> <C-w>l 

" Map <F4> to act like <C-l> (redraw screen) and turn off search highlighting until the
" next search
nnoremap <F4> :nohl <CR> :redr! <CR> 

map <Leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"
"
" Map <10> to write
nnoremap <F10> :w <CR> 


" Map <Leader> to space
let mapleader = " "
let maplocalleader = " "

"------------------------------------------------------------
" Plugins and options:
"------------------------------------------------------------
execute pathogen#infect()


"------------------------------------------------------------
" Python Fold settings
"------------------------------------------------------------

autocmd FileType python setlocal foldenable foldmethod=syntax

"------------------------------------------------------------
" Python-mode settings:
"------------------------------------------------------------
" Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']

" Maximum line length
let g:pymode_options_max_line_length =120
let g:pymode_lint_options_pyflakes = { 'builtins': '_' }
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pylint = {'max-line-length': g:pymode_options_max_line_length}

" Default python3
let g:pymode_python = 'python3'
let g:pymode_rope = 1
let g:pymode_rope_regenerate_on_write = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_rename_bind = '<C-c>rr'
let g:pymode_syntax_string_format = 1


"------------------------------------------------------------
" Jedi-vim settings:
"------------------------------------------------------------
let g:jedi#popup_on_dot = 0
let g:jedi#completions_enabled = 1
let g:jedi#goto_definitions_command = "<localleader>gg"


"------------------------------------------------------------
" Black settings
"------------------------------------------------------------
let g:black_linelength = 100

"-----------------------------------------------------------
" Vim-dispatch settings
"------------------------------------------------------------
" execute current buffer with <F9> using vim-dispatch asynchronously
autocmd FileType python nnoremap <buffer> <F10> :PymodeLintAuto <cr> :w <cr> :exec 'Start python3' shellescape(@%,1) <cr>
autocmd FileType python inoremap <buffer> <F10> <ESC> :PymodeLintAuto <cr> :w <cr> :exec 'Start python3' shellescape(@%,1) <cr>

autocmd FileType python nnoremap <buffer> <F9> :Black <cr> :w <cr>
autocmd FileType python inoremap <buffer> <F9> <ESC> :Black <cr> :w <cr>

"------------------------------------------------------------
" Write and run vim-pandoc :Pandoc
"------------------------------------------------------------

command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'
autocmd FileType markdown nnoremap <F5> :w <cr> :RunSilent pandoc -V geometry:margin=1cm -o ./%:r.pdf --top-level-division=section % <cr>

autocmd FileType markdown nnoremap <buffer> <F9> :w <cr> :exec 'Pandoc pdf' <cr>
autocmd FileType markdown inoremap <buffer> <F9> <ESC>  :w <cr> :exec 'Pandoc pdf' <cr>
"
" Enable spellcheck
autocmd FileType markdown set spell 

let g:pandoc#syntax#conceal#use = 0
let g:pandoc#syntax#codeblocks#embeds#langs = ['python', 'json', 'javascript', 'sh']
let g:pandoc#completion#bib#mode = 'fallback'
let g:pandoc#completion#bib#use_preview = 0
"------------------------------------------------------------
" Change HTML syntax defaults
"------------------------------------------------------------

autocmd FileType html set syntax=htmljinja

"------------------------------------------------------------
" vim-indent-guides settings
"------------------------------------------------------------
" enable by default
set ts=4 sw=4 et
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1


" set macvim font
set gfn=Meslo\ LG\ M\ for\ Powerline
"
"------------------------------------------------------------
" airline settings 
"------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'

"------------------------------------------------------------
" NERDTree settings 
"------------------------------------------------------------
map <C-n> :NERDTreeToggle<CR>

"------------------------------------------------------------
" Split Resizing
"------------------------------------------------------------

nnoremap <silent><Leader>+ :<C-u>exe "vertical resize +". (10*v:count1) <CR>
nnoremap <silent><Leader>- :<C-u>exe "vertical resize -". (10*v:count1) <CR>

"------------------------------------------------------------
" vim-go settings
"------------------------------------------------------------

autocmd FileType go nnoremap <buffer> <F9> :GoFmt <cr> :w <cr> :GoLint <cr>  :GoVet <cr>
autocmd FileType go inoremap <buffer> <F9> <ESC> :GoFmt <cr> :w <cr> :GoLint <cr>  :GoVet <cr>
autocmd FileType go nnoremap <silent><Leader>gg :GoDef <cr>

" go automcomplete via omnicomplete
autocmd FileType go inoremap <C-Space> <C-x><C-o>

let g:go_fmt_command = 'gofmt'
let g:go_fmt_autosave = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'



"------------------------------------------------------------
" json hotkeys
"------------------------------------------------------------
"auto lint json file

autocmd FileType json nnoremap <F9> :%!jq --indent 4 . <cr> :w <cr> 
autocmd FileType json inoremap <F9> :%!jq --indent 4 . <cr> :w <cr> 

"------------------------------------------------------------
" yaml settings
"------------------------------------------------------------
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"------------------------------------------------------------
" FZF settings 
"------------------------------------------------------------
"FZF package
set rtp+=/opt/homebrew/opt/fzf

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'


" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--bind=up:preview-up,down:preview-down', '--info=inline']}), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': ['--bind=up:preview-up,down:preview-down', '--info=inline']}), <bang>0)

command! -bang -nargs=* History
  \ call fzf#vim#history(fzf#vim#with_preview({'options': ['--bind=up:preview-up,down:preview-down', '--info=inline']}), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,fzf#vim#with_preview({'options': ['--bind=up:preview-up,down:preview-down', '--info=inline']}), <bang>0)

map <C-f> :Ag <CR>

map <Leader>o :Rg <CR>


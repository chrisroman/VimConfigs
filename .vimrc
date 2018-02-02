set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " Git plugin not hosted on GitHub
    "Plugin 'git://git.wincent.com/command-t.git'
    Plugin 'kien/ctrlp.vim'
    "Plugin 'vim-airline/vim-airline'
    "Plugin 'vim-airline/vim-airline-themes'
    Plugin 'https://github.com/justinmk/vim-syntax-extra.git'
    Plugin 'jez/vim-superman'
    Plugin 'xolox/vim-misc'
    Plugin 'xolox/vim-easytags'
    "Plugin 'majutsushi/tagbar'
    Plugin 'easymotion/vim-easymotion'
    " For having nerdtree open on startup
    " Plugin 'scrooloose/nerdtree'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'tpope/vim-fugitive'
    Plugin 'jiangmiao/auto-pairs'
    " Snippet Management and Pre-configured Snippets
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets' 
    " Syntax Checking
    Plugin 'vim-syntastic/syntastic'
    " Markdown Folding
    Plugin 'nelstrom/vim-markdown-folding'
    " Wrap words and such with delimeters
    Plugin 'tpope/vim-surround'

    " git repos on your local machine (i.e. when working on your own plugin)

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line

set shell=/bin/bash
runtime macros/matchit.vim

set ttyfast
set lazyredraw
set wildmenu
set colorcolumn=81

" Statusline stuff
    " Airline config
      "let g:airline_theme='powerlineish'
    " BUDGET STATUSLINE
    set statusline=%t       "tail of the filename
    set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
    set statusline+=%{&ff}] "file format
    set statusline+=%h      "help file flag
    set statusline+=%m      "modified flag
    set statusline+=%r      "read only flag
    set statusline+=%y      "filetype
    set statusline+=%=      "left/right separator
    set statusline+=%c,     "cursor column
    set statusline+=%l/%L   "cursor line/total lines
    set statusline+=\ %P    "percent through file

" Setup easymotion
    " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
    nmap s <Plug>(easymotion-overwin-f2)

" Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)

" Tags Setup
    " Where to look for tags files
    set tags=./tags;,~/.vimtags
    " Sensible defaults
    let g:easytags_events = ['BufReadPost', 'BufWritePost']
    let g:easytags_async = 1
    let g:easytags_dynamic_files = 2
    let g:easytags_resolve_links = 1
    let g:easytags_suppress_ctags_warning = 1

    " ----- majutsushi/tagbar settings -----
    " Open/close tagbar with <leader>l
    "nmap <silent> <leader>l :TagbarToggle<CR>
    " Uncomment to open tagbar automatically whenever possible
    " autocmd BufEnter * nested :call tagbar#autoopen(0)
    "autocmd FileType tagbar setlocal nocursorline nocursorcolumn
    let g:tagbar_width=28

" Random Stuff
    let g:ruby_path="~/.rvm/bin/ruby"
    " have jsx highlighting/indenting work in .js files as well
    let g:jsx_ext_required = 0

    let $PATH='/usr/local/bin:' . $PATH

    :au FocusLost * :wa "Save on focus lost

" Sessions
    let g:session_autoload = 'no'

" Scroll Faster
    noremap <C-e> 3<C-e>
    noremap <C-y> 3<C-y>

" Color Scheme
    set background=dark
    if has('gui_running')
      let g:solarized_termcolors=256
    else
      let g:solarized_termcolors=16
    endif

    colo gruvbox
    "let g:molokai_original = 1

    au VimEnter *.* highlight clear SignColumn
    au VimEnter *.* highlight VertSplit    ctermbg=236
    au VimEnter *.* highlight ColorColumn  ctermbg=237
    au VimEnter *.* highlight CursorLine   ctermbg=236
    au VimEnter *.* highlight Visual       ctermbg=236
    au VimEnter *.* highlight SpellBad     ctermbg=0   ctermfg=1

" NERDTree Tab Mappings
    let g:NERDTreeWinSize=17
    map  <C-n> :tabnew<CR>
    let NERDTreeIgnore = ['\.o$']

    "autocmd VimEnter * wincmd w
    "autocmd VimEnter * NERDTree
    "autocmd BufEnter * NERDTreeMirror

    let g:nerdtree_tabs_open_on_console_startup=1
    let g:nerdtree_tabs_focus_on_files=1
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") 
          \ && b:NERDTreeType == "primary") | q | endif

    map <Leader>n :NERDTreeToggle<CR>
    " Current file in nerdtree
    map <F9> :NERDTreeFind<CR>
    map <Leader>m :tabmove 

" Leader Mappings
    map <Space> <leader>
    "map <Leader>w :update<CR>
    map <Leader>q :qall<CR>
    map <Leader>ga :Git add %:p<CR><CR>
    map <Leader>gs :Gstatus<CR>
    map <Leader>gc :Gcommit<CR>
    map <Leader>gp :Gpush<CR>
    "map <Leader>t :CommandT<CR>

" Insert new lines above or below (not working for some reason)
    nnoremap <C-J> m`o<Esc>``
    nnoremap <C-K> m`O<Esc>``

" Get rid of search highlighting
    map ,<Space> :nohlsearch<CR>

" Highlight last inserted text
    nnoremap gV `[v`]

" Reduce timeout after <ESC> is recieved.
    set ttimeout
    set ttimeoutlen=20
    set notimeout

" highlight vertical column of cursor
    au WinLeave * set nocursorline nocursorcolumn
    "au WinEnter * set cursorline
    "set cursorline

"key to insert mode with paste using F2 key
    map <F2> :set paste<CR>i
    " Leave paste mode on exit
    au InsertLeave * set nopaste

" Useful, but more kinda random stuff
    "set textwidth=80
    set backspace=2   " Backspace deletes like most programs in insert mode
    set nocompatible  " Use Vim settings, rather then Vi settings
    set nobackup
    set nowritebackup
    set noswapfile    " http://robots.thoughtbot.com/post/18739402579/
                      " global-gitignore#comment-458413287
    set history=500
    set ruler         " show the cursor position all the time
    set showcmd       " display incomplete commands
    set incsearch     " do incremental searching
    set hlsearch      " highlight matches
    set laststatus=2  " Always display the status line
    set autowrite     " Automatically :write before running commands

" Fuzzy finder: ignore stuff that can't be opened, and generated files
    let g:fuzzy_ignore = '*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;
                         \ coverage/**;tmp/**;rdoc/**'

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" bind K to search word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Set tab spacing
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab

let g:rspec_command = 'call Send_to_Tmux("NO_RENDERER=true bundle exec rspec {spec}\n")'
" Mocha command is specific to Product Hunt setup. Probably doesn't work with
" other apps
let g:mocha_js_command = 'call Send_to_Tmux("$(npm bin)/mocha --opts spec/javascripts/mocha.opts {spec}\n")'
let g:rspec_runner = "os_x_iterm"

" Display extra whitespace
" set list listchars=trail:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup
  let g:grep_cmd_opts = '--line-numbers --noheading'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

:set smartcase
:set ignorecase

" Numbers
set number
set numberwidth=5

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

:nnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
:nnoremap <expr> yy (v:register ==# '"' ? '"+' : '') . 'yy'
:nnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
:xnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
:xnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'

"""Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
"set wildmode=list:longest,list:full
" set complete=.,w,t
"function! InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction
"inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Get off my lawn - helpful when learning Vim :)
    nnoremap <Left> :echoe "Use h"<CR>
    nnoremap <Right> :echoe "Use l"<CR>
    nnoremap <Up> :echoe "Use k"<CR>
    nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
    let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
    set splitbelow
    set splitright

" Quicker window movement. Seemlessly navigate between Vim/Tmux panes
    let g:tmux_navigator_no_mappings = 1

    nnoremap <C-Left> :tabprevious<CR>
    nnoremap <C-Right> :tabnext<CR>

function! s:Open(file)
  exec('vsplit ' . a:file)
endfunction

command! AC :call <SID>CreateRelated()

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Set auto completion
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion=1
"set completeopt-=preview "Remove Preview

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    "autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
    "            \:call <SID>StripTrailingWhitespaces()
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python setlocal list listchars=tab:»-,trail:·,extends:»,precedes:«
    
    " C/C++ Stuff
    autocmd FileType c map <Leader>t :YcmCompleter GetType<CR>
    autocmd FileType h map <Leader>t :YcmCompleter GetType<CR>
    autocmd FileType cc map <Leader>t :YcmCompleter GetType<CR>
    autocmd FileType hh map <Leader>t :YcmCompleter GetType<CR>
    autocmd FileType cpp map <Leader>t :YcmCompleter GetType<CR>
    autocmd FileType hpp map <Leader>t :YcmCompleter GetType<CR>
    autocmd FileType c setlocal nowrap
    autocmd FileType h setlocal nowrap
    autocmd FileType cc setlocal nowrap
    autocmd FileType hh setlocal nowrap
    autocmd FileType cpp setlocal nowrap
    autocmd FileType hpp setlocal nowrap

    " Ocaml files 85 width MAX, but really 80 is preferred
    autocmd BufNewFile,BufRead *.eliom set syntax=ocaml
    autocmd FileType ocaml setlocal textwidth=80
    autocmd FileType ocaml setlocal tabstop=2
    autocmd FileType ocaml setlocal softtabstop=2
    autocmd FileType ocaml setlocal shiftwidth=2
    autocmd FileType ocaml setlocal foldmethod=indent   
    autocmd FileType ocaml setlocal foldnestmax=10
    autocmd FileType ocaml setlocal nofoldenable
    autocmd FileType ocaml setlocal foldlevel=2
    autocmd FileType ocaml map <Leader>ml :MerlinTypeOf<CR>
    
    "autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" OCaml Vim Settings
    set rtp+='/Users/chrisroman/.opam/4.05.0/share/ocp-indent/vim'
    let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
    execute "set rtp+=" . g:opamshare . "/merlin/vim"''

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
"function! <SID>StripTrailingWhitespaces()
"    " save last search & cursor position
"    let _s=@/
"    let l = line(".")
"    let c = col(".")
"    %s/\s\+$//e
"    let @/=_s
"    call cursor(l, c)
"endfunction

" Snippet Config
    " make YCM compatible with UltiSnips (using supertab)
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>', '<tab>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>', '<s-tab>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

    " better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger = "<C-x>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Syntastic Config
    set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    "let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    " Syntax Checkers
    let g:syntastic_ocaml_checkers = ['merlin']

" Folding config
    nnoremap <CR> za

" Use pathogen
"execute pathogen#infect()

let g:gruvbox_contrast_dark="hard"

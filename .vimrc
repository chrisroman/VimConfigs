" NECESSARY COMMANDS
    set nocompatible              " be iMproved, required
    "filetype off                  " required

" VUNDLE PLUGINs
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " Fuzzy file, buffer, mru, tag, etc finder.
    Plugin 'kien/ctrlp.vim'

    " (vman command) Read Unix man pages faster than a speeding bullet!
    Plugin 'jez/vim-superman'
 
    " For navigating in vim in a cool way
    Plugin 'easymotion/vim-easymotion'

    " For having nerdtree open on startup
    Plugin 'jistr/vim-nerdtree-tabs'

    " Auto-complete
    Plugin 'Valloric/YouCompleteMe'

    " Automatically close delimeters (e.g. (), {}, "", ...)
    Plugin 'jiangmiao/auto-pairs'

    " Snippet Management and Pre-configured Snippets
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets' 

    " Wrap words and such with delimeters
    Plugin 'tpope/vim-surround'

    " Tags
    Plugin 'xolox/vim-misc'
    Plugin 'xolox/vim-easytags'
    " Plugin 'majutsushi/tagbar'

    " Async Linting
    Plugin 'w0rp/ale'

    " Syntax Highlighting
        " JS(X)
            Plugin 'MaxMEllon/vim-jsx-pretty'
            Plugin 'pangloss/vim-javascript'
        " C++
            Plugin 'octol/vim-cpp-enhanced-highlight'

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

" VIM SPECIFIC CONFIG
    set shell=/bin/zsh
    runtime macros/matchit.vim
    set ttyfast
    set lazyredraw
    set wildmenu
    set colorcolumn=81
    let $PATH='/usr/local/bin:' . $PATH
    :au FocusLost * :wa "Save on focus lost

    " Switch syntax highlighting on, when the terminal has colors
    " Also switch on highlighting the last used search pattern.
    if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
      syntax on
    endif

    augroup vimrcEx
      autocmd!
      " When editing a file, always jump to the last known cursor position.
      " Don't do it for commit messages, when the position is invalid, or when
      " inside an event handler (happens when dropping a file on gvim).
      autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
    augroup END

    " Set deafult tab spacing
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
        set expandtab

    " Scroll Faster
        noremap <C-e> 3<C-e>
        noremap <C-y> 3<C-y>

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

    " Useful, but more kinda random stuff
        "set textwidth=80
        set backspace=2   " Backspace deletes like most programs in insert mode
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

    " Display extra whitespace
        " set list listchars=trail:·
        " set listchars=tab:>-,trail:~,extends:>,precedes:<,space:␣
        " set list

    set smartcase
    set ignorecase

    " Numbers
        set number
        set numberwidth=5

    " Persistent undo
        set undodir=~/.vim/undo/
        set undofile
        set undolevels=1000
        set undoreload=10000

    " Open new split panes to right and bottom, which feels more natural
        set splitbelow
        set splitright

    " Quicker window movement. Seemlessly navigate between Vim/Tmux panes
        let g:tmux_navigator_no_mappings = 1

        nnoremap <C-Left> :tabprevious<CR>
        nnoremap <C-Right> :tabnext<CR>

    " Folding config
        nnoremap <CR> za

" COLOR SCHEME
    set background=dark
    " colo Tomorrow-Night-Eighties
    " colo gruvbox
    colo Monokai
    au VimEnter *.* highlight Normal ctermfg=254

" STATUS LINE CUSTOMIZATION
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

    " Airline config
        "let g:airline_theme='powerlineish'

" File Specific Config
    " OCaml Vim Settings
        set rtp+='/Users/chrisroman/.opam/4.05.0/share/ocp-indent/vim'
        let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
        execute "set rtp+=" . g:opamshare . "/merlin/vim"''

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
        autocmd FileType python setlocal shiftwidth=2
        autocmd FileType python setlocal tabstop=2
        autocmd FileType python setlocal softtabstop=2
        
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

        autocmd FileType javascript setlocal shiftwidth=2
        autocmd FileType javascript setlocal tabstop=2
        autocmd FileType javascript setlocal softtabstop=2
        autocmd FileType javascript setlocal noexpandtab
        autocmd FileType css setlocal shiftwidth=2
        autocmd FileType css setlocal tabstop=2
        autocmd FileType css setlocal softtabstop=2
        autocmd FileType css setlocal noexpandtab
        
        "autocmd BufEnter *.cls setlocal filetype=java
        autocmd BufEnter *.zsh-theme setlocal filetype=zsh
        autocmd BufEnter Makefile setlocal noexpandtab
        autocmd BufEnter *.sh setlocal tabstop=2
        autocmd BufEnter *.sh setlocal shiftwidth=2
        autocmd BufEnter *.sh setlocal softtabstop=2
        autocmd BufEnter Makefile.* setlocal noexpandtab
    augroup END

" PLUGIN CONFIGS
    " CTRL-P
        " Ignore certain files
        let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

    " Easymotion
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
        set tags=./tags;

        " Sensible defaults
        let g:easytags_events = ['BufReadPost', 'BufWritePost']
        let g:easytags_async = 1
        let g:easytags_dynamic_files = 2
        let g:easytags_resolve_links = 1
        let g:easytags_suppress_ctags_warning = 1

    " NERDTree
        let g:NERDTreeWinSize = 34 "17
        map  <C-n> :tabnew<CR>
        let NERDTreeIgnore = ['\.o$', '\.pyc']
        let g:nerdtree_tabs_open_on_console_startup=1
        let g:nerdtree_tabs_focus_on_files=1
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") 
              \ && b:NERDTreeType == "primary") | q | endif
        map <Leader>n :NERDTreeToggle<CR>
        map <Leader>m :tabmove 

    " YouCompleteMe
        " Set auto completion
        let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
        "let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_autoclose_preview_window_after_insertion=1
        "set completeopt-=preview "Remove Preview
    
    " Snippet
        " make YCM compatible with UltiSnips (using supertab)
        let g:ycm_key_list_select_completion = ['<C-n>', '<Down>', '<tab>']
        let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>', '<s-tab>']
        let g:SuperTabDefaultCompletionType = '<C-n>'

        " better key bindings for UltiSnipsExpandTrigger
        let g:UltiSnipsExpandTrigger = "<C-x>"
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
        let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

    " ALE
        " Put this in vimrc or a plugin file of your own.
        " After this is configured, :ALEFix will try and fix your JS code with ESLint.
        let g:ale_fixers = {
        \   'c++': ['gcc', 'clang'],
        \   'javascript': ['eslint'],
        \}

        let g:ale_echo_msg_format = '%linter% says %s'

        " Set this setting in vimrc if you want to fix files automatically on save.
        let g:ale_lint_on_text_changed = 'never'

    " C++ syntax highlight
        let g:cpp_class_scope_highlight = 1
        let g:cpp_member_variable_highlight = 1
        let g:cpp_class_decl_highlight = 1

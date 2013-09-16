" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
endif

" Определение типа для некоторых файлов.
if has("autocmd")
  autocmd BufRead,BufNewFile *.hrl        set filetype=erlang
  autocmd BufRead,BufNewFile *.yrl        set filetype=erlang
  autocmd BufRead,BufNewFile *.xrl        set filetype=erlang
  autocmd BufRead,BufNewFile *.app        set filetype=erlang
  autocmd BufRead,BufNewFile *.app.src    set filetype=erlang
  autocmd BufRead,BufNewFile rebar.config set filetype=erlang
  autocmd BufRead,BufNewFile Emakefile    set filetype=erlang
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd        " Show (partial) command in status line.
set showmatch      " Show matching brackets.
set ignorecase     " Do case insensitive matching
set smartcase      " Do smart case matching
set incsearch      " Incremental search
set autowrite      " Automatically save before commands like :next and :make
set hidden         " Hide buffers when they are abandoned
set mouse=a        " Enable mouse usage (all modes) in terminals

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set title                 " Set title of the window
set ts=4                  " Tab size
set hlsearch              " Highlight matches with last search pattern
set number                " Show line numbers
set spell                 " Spell checking
set spelllang=en,ru
set spellfile=~/.vim/spell/exceptions.utf-8.add
set foldmethod=syntax     " Folding by syntax
set foldcolumn=4          " Folding column width

" всегда показывать вокруг курсора n строк и столбцов
set scrolloff=2
set sidescrolloff=2

" ширина табуляции
set tabstop=4
set softtabstop=4
set shiftwidth=4

" ширина выравнивания
" всегда показывать вокруг курсора n строк и столбцов
set scrolloff=2
set sidescrolloff=2

" Замена табуляции пробелами
set expandtab

" автотабуляция
set smarttab

" приравниваем регистр "" регистру "*
" Таким образом можно скопировать/удалить в vim (по <y> и <d>)
" и вставить в другой программе, равно как и вставлять в vim
" содержимое буфера X-сервера клавишей <p>.
set clipboard=unnamed

" Color scheme
set t_Co=16
hi Comment      term=NONE cterm=NONE ctermfg=LightGray ctermbg=Black

hi LineNr       term=NONE cterm=NONE ctermfg=DarkCyan  ctermbg=Black
hi TabLineFill  term=NONE cterm=NONE ctermfg=White     ctermbg=DarkCyan
hi TabLine      term=NONE cterm=NONE ctermfg=Black     ctermbg=DarkCyan

hi FoldColumn   term=NONE cterm=NONE ctermfg=Cyan      ctermbg=DarkGray

hi Pmenu        term=NONE cterm=NONE ctermfg=White     ctermbg=DarkYellow
hi PmenuThumb   term=NONE cterm=NONE ctermfg=White     ctermbg=DarkRed
hi PmenuSbar    term=NONE cterm=NONE ctermfg=White     ctermbg=Gray

hi Constant     term=NONE cterm=NONE ctermfg=Green
hi StorageClass term=NONE cterm=NONE ctermfg=Cyan
hi Type         term=NONE cterm=NONE ctermfg=DarkCyan
hi Identifier   term=NONE cterm=NONE ctermfg=White
hi Operator     term=NONE cterm=NONE ctermfg=Yellow 
hi Exception    term=NONE cterm=NONE ctermfg=Red


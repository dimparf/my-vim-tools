" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set noshowcmd		" display incomplete commands
set incsearch		" do incremental searching

" myconfig
function ShortTabLine()
    let ret = ''

    for i in range(tabpagenr('$'))
        " Если мы имеем дело с активной вкладкой — подсвечиваем ее красной

        if i + 1 == tabpagenr()
            let ret .= '%#errorMsg#'
        else
            let ret .= '%#TabLine#'
        endif
        
       " ищем название буфера, чтобы поместить его в название вкладки
        
       
       let buflist = tabpagebuflist(i + 1)
       let winnr = tabpagewinnr(i + 1)
       let buffername = bufname(buflist[winnr - 1])
       let filename = fnamemodify(buffername, ':t')
        
       " Если нет названия — то так и говорим 'буфер без названия' (noname)
         
       if filename == ''
           let filename = 'noname'
       endif

       let ret .= '|' . filename . '|'
   endfor
        
   " заполняем лишнее пространство
   let ret .= '%#TabLineFill#%T'
   return ret
endfunction

set tabline=%!ShortTabLine()
set hidden              " не требовать сохранения буфера
" set autochdir         " текущий каталог всегда совпадает с содержимым активного окна
set smartindent " умные отступы например автоотступ после {
set autoread " if file changed - buffer autorefersh
set number              " set line number
" автозакрыте кавычек
set wrap
set listchars=tab:·· " табы показываем точками
set list "подсветка невидимых символов
set mouse=a
"set statusline+=%#warningmsg#
"set statusline+=%*
set guifont=Liberation\ Mono\ 10
set linebreak " перенос по словам а не по буквам
"set tab to 4 spaces
set tabstop=4  
set shiftwidth=4
set smarttab
set expandtab
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set autowrite " autosave когда переключаешься на другой файл
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,cp866
set showmatch " проверка скобок
set cursorline " подсветка текущей строки
" Тема...
set t_Co=256
" colorscheme vibrantink
" colorscheme zenburn
set background=dark
" colorscheme solarized
" colorscheme vc
" colorscheme molokai
" colorscheme jellyx
colorscheme hickop
" Автодополнение
" Vim умеет автодополнение слов, сделаем его доступным по нажатию Tab 
set omnifunc=javacomplete#Complete
set completefunc=javacomplete#CompleteParamsInfo
set complete=.,w,b,u,t,i
autocmd FileType java runtime! autoload/javacomplete.vim
" CTRL-F для omni completion
imap <C-F> <C-X><C-O>
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>
" Обозреватель тегов
nnoremap <silent> <F8> :TagbarOpen<CR>
" Обозреватель файлов (plugin-NERD_Tree)
let NERDTreeWinPos = 'left'
let NERDChristmasTree = 0
au VimEnter *  NERDTree
autocmd BufEnter * NERDTreeMirror
map  <F2>      :NERDTreeToggle<cr>
vmap <F2> <esc>:NERDTreeToggle<cr>
imap <F2> <esc>:NERDTreeToggle<cr>
"" 
map <F6> :FufBuffer<cr>
vmap <F6> <esc>:FufBuffer<cr>
imap <F6> <esc>:FufBuffer<cr>
" Список файлов в текущей директории
nmap <F7> <esc>:FufFile<cr>
vmap <F7> <esc>:FufFile<cr>
imap <F7> <esc>:FufFile<cr>
" Рекурсивный поиск
nnoremap <silent> <F3> :Rgrep<cr>

"Это позволит увидеть все вхождение тега, выбрать нужное и открыть его в новом окне по нажатию F4
map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR> 
set pastetoggle=<F5> "сохраняет форматирование вставляемого текста.
" если сохраняеться скрипт - то он делаеться исполняемым
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif

"" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'rails.vim'
Bundle 'Rename'
Bundle 'snipMate'
Bundle 'taglist.vim'
Bundle 'FuzzyFinder'
Bundle 'grep.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'derekwyatt/vim-scala'
Bundle 'tpope/vim-pathogen'
Bundle 'majutsushi/tagbar'
" ENSIME
"Bundle 'jlc/vim-async-beans'
"Bundle 'jlc/vim-addon-async'
"Bundle 'MarcWeber/vim-addon-signs'
"Bundle 'MarcWeber/vim-addon-manager'
"Bundle 'emoncannon/ensime'
"Bundle 'jlc/envim'
"Bundle 'jlc/ensime-common'

filetype plugin indent on
" Pathogen init
call pathogen#infect()
"
""
" end myconfig

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  filetype on
  filetype plugin on
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
  autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

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
<<<<<<< HEAD
" set scrollbind
=======
>>>>>>> 0599df5a40cf5427a4cb6bf28be993301d71ac4c
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
let mapleader = ","
set smarttab
set expandtab
"set backupdir=~/.vim/backup
set nobackup
set directory=~/.vim/swap
set autowrite " autosave когда переключаешься на другой файл
au FocusLost * :wa " write all if focus lost
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,cp866
set showmatch " проверка скобок
set cursorline " подсветка текущей строки
set statusline=%1*%F%h%m\ [Time:\ %{strftime(\"%H:%M\")}]\ [Mod\ Time:\ %{strftime(\"%H:%M:%S\",getftime(expand(\"\%\%\")))}]%=\ [%p%%]\ [%l/%L]
" Тема...
set t_Co=256
set background=dark
" colorscheme vibrantink
<<<<<<< HEAD
"colorscheme zenburn
=======
" colorscheme zenburn
set background=dark
" colorscheme solarized
>>>>>>> 0599df5a40cf5427a4cb6bf28be993301d71ac4c
" colorscheme vc
"colorscheme molokai
" colorscheme jellyx
<<<<<<< HEAD
" colorscheme hickop
=======
colorscheme hickop
>>>>>>> 0599df5a40cf5427a4cb6bf28be993301d71ac4c
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
<<<<<<< HEAD
nnoremap <silent> <F8> :TagbarToggle<CR>
=======
nnoremap <silent> <F8> :TagbarOpen<CR>
>>>>>>> 0599df5a40cf5427a4cb6bf28be993301d71ac4c
" Обозреватель файлов (plugin-NERD_Tree)
let NERDTreeWinPos = 'left'
let NERDChristmasTree = 0
au VimEnter *  NERDTree
autocmd BufEnter * NERDTreeMirror
map  <F2>      :NERDTreeToggle<cr>
vmap <F2> <esc>:NERDTreeToggle<cr>
imap <F2> <esc>:NERDTreeToggle<cr>
<<<<<<< HEAD
"NerdCommenter
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>

=======
"" 
>>>>>>> 0599df5a40cf5427a4cb6bf28be993301d71ac4c
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
<<<<<<< HEAD
Bundle 'FuzzyFinder'
Bundle 'grep.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'derekwyatt/vim-scala'
Bundle 'tpope/vim-pathogen'
Bundle 'majutsushi/tagbar'
"VIMSIDE
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
"Bundle 'megaannum/vimside'
filetype plugin indent on
" Pathogen init
call pathogen#infect()

"For tagbar scala support
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }

=======
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
>>>>>>> 0599df5a40cf5427a4cb6bf28be993301d71ac4c
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
" lazy method of appending this onto your .vimrc ":w! >> ~/.vimrc"
" ------------------------------------------------------------------
" this block of commands has been autogenerated by solarized.vim and
" includes the current, non-default Solarized option values.
" To use, place these commands in your .vimrc file (replacing any
" existing colorscheme commands). See also ":help solarized"

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
let g:solarized_termcolors=256    "default value is 16
let g:solarized_hitrail=1    "default value is 0
syntax enable
set background=dark
colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" let g:solarized_diffmode="normal"
" let g:solarized_menu=1


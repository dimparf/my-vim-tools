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
        
        " " Если название слишком длинное — показываем только 6 первых
        " символов

       let ret .= '[' . filename . ']'
   endfor
        
   " заполняем лишнее пространство

   let ret .= '%#TabLineFill#%T'
   return ret
endfunction

set tabline=%!ShortTabLine()
set hidden              " не требовать сохранения буфера
" set autochdir         " текущий каталог всегда совпадает с содержимым активного окна
set number              " set line number
set wrap
set mouse=a
set guifont=Liberation\ Mono\ 10
set linebreak " разрываем строку только между словами
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
colorscheme zenburn
" set background=dark
" colorscheme solarized
" colorscheme vc
" colorscheme molokai
" colorscheme jellyx
" Vim умеет автодополнение слов, сделаем его доступным по нажатию Tab 
set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t
" Обозреватель тегов
"let Tlist_Use_Right_Window = 1
"let Tlist_GainFocus_On_ToggleOpen = 1   " Jump to taglist window to open
"let Tlist_Close_On_Select         = 0   " Close taglist when a file or tag selected
"let Tlist_Exit_OnlyWindow         = 1   " If you are last kill your self
"let Tlist_Show_One_File           = 1   " Displaying tags for only one file
"let Tlist_Use_Right_Window        = 1   " split to rigt side of the screen
"let Tlist_Compart_Format          = 1   " Remove extra information and blank lines from taglist window
"let Tlist_Compact_Format          = 1   " Do not show help
"let Tlist_Enable_Fold_Column      = 0   " Don't Show the fold indicator column
"let Tlist_WinWidth                = 30  " Taglist win width
"let Tlist_Display_Tag_Scope       = 1   " Show tag scope next to the tag name
"let Tlist_BackToEditBuffer        = 0   " If no close on select, let the user choose back to edit buffer or not
"nnoremap <silent> <F8> :TlistToggle<CR>
" Обозреватель файлов (plugin-NERD_Tree)
let NERDTreeWinPos = 'left'
let NERDChristmasTree = 0
au VimEnter *  NERDTree
autocmd BufEnter * NERDTreeMirror
map  <F2>      :NERDTreeToggle<cr>
vmap <F2> <esc>:NERDTreeToggle<cr>
imap <F2> <esc>:NERDTreeToggle<cr>

" FuzzyFinder - нечеткий поиск
map <C-F1> :FufHelp<cr>
vmap <C-F1> <esc>:FufHelp<cr>
imap <C-F1> <esc>:FufHelp<cr>
" Просмотр списка буферов
map <F6> :FufBuffer<cr>
vmap <F6> <esc>:FufBuffer<cr>
imap <F6> <esc>:FufBuffer<cr>
" Список файлов в текущей директории
nmap <F7> <esc>:FufFile<cr>
vmap <F7> <esc>:FufFile<cr>
imap <F7> <esc>:FufFile<cr>
" Рекурсивный поиск
nnoremap <silent> <F3> :Rgrep<cr>
set pastetoggle=<F5> "сохраняет форматирование вставляемого текста.
" если сохраняеться скрипт - то он делаеться исполняемым
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif
" Для сборки Java-ant проектов.
" set makeprg=~<PATH_TO_JAVA_BUIL_TOOL>\ -emacs
" Форматирование Scala-кода
" end myconfig

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

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

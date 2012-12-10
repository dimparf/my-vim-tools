" File: produkt.vim
" Version: 1.0
" Author: dimparf <dimparf@gmail.com>
" Description: dark colorscheme for vim and gvim based on produkt kde colors

hi clear

set background=dark

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "produkt"
if has("gui_running")
    let s:g_yellow="#f0651f"
    let s:g_basebg="#293334"
    let s:g_fg="#becfd2"
    let s:g_alt_fg="#b2c1c3"
    let s:g_alt2_fg="#888786"
else
    let s:g_yellow="#f0651f"
    let s:g_basebg="#293334"
    let s:g_fg="#becfd2"
    let s:g_alt_fg="#b2c1c3"
    let s:g_alt2_fg="#888786"

endif

hi Comment guifg=#888786 gui=italic ctermfg=244
hi Constant guifg=#b2c1c3
hi Cursor guifg=NONE guibg=#293334 ctermbg=241
hi CursorColumn guibg=gray90
hi CursorIM gui=None
hi CursorLine guibg=gray90
hi DiffAdd guibg=lightblue
hi DiffChange guibg=plum1
hi DiffDelete gui=bold guifg=blue guibg=lightcyan
hi DiffText gui=bold guibg=red
hi Directory guifg=blue
hi Error guifg=white guibg=red
hi ErrorMsg guifg=white guibg=red
hi FoldColumn guifg=darkblue guibg=grey
hi Folded guifg=darkblue guibg=lightgrey
hi Identifier guifg=darkcyan
hi Ignore guifg=white
hi IncSearch gui=reverse
hi LineNr guifg=#f0651f guibg=#000000 gui=none ctermfg=244 ctermbg=232
hi MatchParen guibg=cyan
hi ModeMsg gui=bold
hi MoreMsg gui=bold guifg=seagreen
hi NonText gui=bold guifg=#888786 guibg=#293334 gui=none ctermfg=244 ctermbg=234
hi Normal guifg=#becfd2 guibg=#293334 gui=none ctermfg=253 ctermbg=234
hi Pmenu guibg=plum1
hi PmenuSbar guibg=grey
hi PmenuSel guibg=grey
hi PmenuThumb gui=reverse
hi PreProc guifg=#f0651f
hi Question gui=bold guifg=seagreen
hi Search guibg=yellow
hi SignColumn guifg=darkblue guibg=grey
hi Special guifg=slateblue
hi SpecialKey guifg=#888786
hi SpellBad gui=undercurl
hi SpellCap gui=undercurl
hi SpellLocal gui=undercurl
hi SpellRare gui=undercurl
hi Statement gui=bold guifg=#f0651f
hi StatusLine gui=bold,reverse
hi StatusLineNC gui=reverse
hi TabLine gui=underline guibg=lightgrey
hi TabLineFill gui=reverse
hi TabLineSel gui=bold
hi Title gui=bold guifg=magenta
hi Todo guifg=blue guibg=yellow gui=bold
hi Type gui=bold guifg=#f0651f
hi Underlined gui=underline guifg=slateblue
hi VertSplit gui=reverse
hi Visual guibg=#293334
hi VisualNOS gui=bold,underline
hi WarningMsg guifg=red
hi WildMenu guifg=black guibg=yellow
hi link Boolean Constant
hi link Character Constant
hi link Conditional Statement
hi link Debug Special
hi link Define PreProc
hi link Delimiter Special
hi link Exception Statement
hi link Float Constant
hi link Function Identifier
hi link Include PreProc
hi link Keyword Statement
hi link Label Statement
hi link Macro PreProc
hi link Number Constant
hi link Operator Statement
hi link PreCondit PreProc
hi link Repeat Statement
hi link SpecialChar Special
hi link SpecialComment Special
hi link StorageClass Type
hi link String Constant
hi link Structure Type
hi link Tag Special
hi link Typedef Type

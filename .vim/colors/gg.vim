:set background=dark
:highlight clear
if version > 580
 hi clear
 if exists("syntax_on")
 syntax reset
 endif
endif
let colors_name = "gg"
:hi Normal guifg=White guibg=gray15
:hi CursorLine guibg=Gray25
:hi Cursor guibg=Gray55 guifg=White
:hi MatchParen guibg=#ccff80 guifg=Black

" Pmenu
:hi Pmenu guibg=Gray guifg=Black
:hi PmenuSel guibg=Yellow guifg=Black
:hi PmenuSbar guibg=Gray55

:hi Directory guifg=#ffaaaa
:hi VertSplit guibg=Gray35 guifg=White gui=none
:hi Folded guibg=black guifg=grey40
:hi FoldColumn guibg=black guifg=grey20
:hi IncSearch guifg=Yellow guibg=black
:hi ModeMsg guibg=gray15 guifg=White gui=bold
:hi MoreMsg guibg=gray15 guifg=White gui=bold
:hi NonText guifg=White guibg=grey15
:hi Question guibg=gray15 guifg=White gui=bold
:hi Search guibg=Gray35 guifg=Yellow
:hi SpecialKey guifg=yellowgreen
:hi StatusLine guibg=Gray35 guifg=Gray75 gui=none cterm=bold,reverse
:hi StatusLineNC guibg=Gray35 guifg=grey74 gui=none cterm=reverse
:hi Statement guifg=White gui=none
:hi Visual gui=none guifg=Black guibg=#ffff60
:hi WarningMsg guibg=gray15 guifg=#ffff60 gui=bold
:hi String guifg=#ffaaaa
:hi Comment guifg=#ffee80
:hi Constant guifg=Gray55
:hi Special guifg=White
:hi Identifier guifg=yellowgreen  gui=bold
:hi Include guifg=White
:hi PreProc guifg=#ffaaaa
:hi Operator guifg=White
:hi Define guifg=gold gui=bold ctermfg=yellow
:hi Type guifg=#ccff80 gui=bold
:hi Function guifg=yellowgreen gui=bold
:hi Structure guifg=yellowgreen gui=bold
:hi LineNr guifg=Gray55
:hi Ignore guifg=White
:hi Todo guifg=Yellow guibg=Gray25
:hi Directory ctermfg=darkcyan
:hi ErrorMsg guibg=Gray15 guifg=#ff8080 gui=bold
:hi VisualNOS cterm=bold,underline
:hi WildMenu ctermfg=0 ctermbg=3
:hi DiffAdd ctermbg=4
:hi DiffChange ctermbg=5
:hi DiffDelete cterm=bold ctermfg=4 ctermbg=6
:hi DiffText cterm=bold ctermbg=1
:hi Underlined cterm=underline ctermfg=5
:hi Error guifg=Red guibg=Gray35
:hi SpellErrors guifg=Gray35 guibg=Red 

" Name:       paramount.vim
" Version:    0.1.0
" Maintainer: github.com/gavocanov
" License:    The MIT License (MIT)
"
" A minimal colorscheme for Vim that only puts emphasis on the paramount with some lang specifics.
"
" Based on the paramount, pencil and off colorschemes:
"
" https://github.com/owickstrom/vim-colors-paramount
" https://github.com/reedes/vim-colors-pencil
" https://github.com/reedes/vim-colors-off
"
"""
if v:version > 580
  hi clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name='paramount'

" global settings
if !exists('g:colors_paramount_bi')
    let g:colors_paramount_bi = 0
endif

if g:colors_paramount_bi
    let s:bold = 'bold'
    let s:italic = 'italic'
else
    let s:bold = 'NONE'
    let s:italic = 'NONE'
endif

let s:black           = { 'gui': '#121212', 'cterm': '233' }
let s:medium_gray     = { 'gui': '#767676', 'cterm': '243' }
let s:white           = { 'gui': '#F1F1F1', 'cterm': '15'  }
let s:actual_white    = { 'gui': '#FFFFFF', 'cterm': '231' }
let s:subtle_black    = { 'gui': '#303030', 'cterm': '236' }
let s:light_black     = { 'gui': '#262626', 'cterm': '235' }
let s:lighter_black   = { 'gui': '#4E4E4E', 'cterm': '239' }
let s:light_gray      = { 'gui': '#A8A8A8', 'cterm': '248' }
let s:lighter_gray    = { 'gui': '#C6C6C6', 'cterm': '251' }
let s:lightest_gray   = { 'gui': '#EEEEEE', 'cterm': '255' }
let s:pink            = { 'gui': '#fb007a', 'cterm': '9'   }
let s:dark_red        = { 'gui': '#C30771', 'cterm': '1'   }
let s:light_red       = { 'gui': '#E32791', 'cterm': '1'   }
let s:orange          = { 'gui': '#D75F5F', 'cterm': '167' }
let s:darker_blue     = { 'gui': '#005F87', 'cterm': '18'  }
let s:dark_blue       = { 'gui': '#008EC4', 'cterm': '32'  }
let s:blue            = { 'gui': '#20BBFC', 'cterm': '12'  }
let s:light_blue      = { 'gui': '#b6d6fd', 'cterm': '153' }
let s:dark_cyan       = { 'gui': '#20A5BA', 'cterm': '6'   }
let s:light_cyan      = { 'gui': '#4FB8CC', 'cterm': '14'  }
let s:dark_green      = { 'gui': '#10A778', 'cterm': '2'   }
let s:light_green     = { 'gui': '#5FD7A7', 'cterm': '10'  }
let s:dark_purple     = { 'gui': '#af5fd7', 'cterm': '134' }
let s:light_purple    = { 'gui': '#a790d5', 'cterm': '140' }
let s:yellow          = { 'gui': '#F3E430', 'cterm': '11'  }
let s:light_yellow    = { 'gui': '#ffff87', 'cterm': '228' }
let s:dark_yellow     = { 'gui': '#A89C14', 'cterm': '3'   }

let s:background = &background

if &background ==? 'dark'
  let s:bg              = s:black
  let s:bg_subtle       = s:lighter_black
  let s:bg_very_subtle  = s:subtle_black
  let s:norm            = s:lighter_gray
  let s:norm_subtle     = s:medium_gray
  let s:purple          = s:light_purple
  let s:cyan            = s:light_cyan
  let s:green           = s:light_green
  let s:red             = s:light_red
  let s:visual          = s:light_purple
  let s:yellow          = s:light_yellow
else
  let s:bg              = s:actual_white
  let s:bg_subtle       = s:light_gray
  let s:bg_very_subtle  = s:lightest_gray
  let s:norm            = s:light_black
  let s:norm_subtle     = s:medium_gray
  let s:purple          = s:dark_purple
  let s:cyan            = s:dark_cyan
  let s:green           = s:dark_green
  let s:red             = s:dark_red
  let s:visual          = s:dark_purple
  let s:yellow          = s:dark_yellow
endif

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute 'highlight' a:group
    \ 'guifg='   (has_key(a:style, 'fg')    ? a:style.fg.gui   : 'NONE')
    \ 'guibg='   (has_key(a:style, 'bg')    ? a:style.bg.gui   : 'NONE')
    \ 'guisp='   (has_key(a:style, 'sp')    ? a:style.sp.gui   : 'NONE')
    \ 'gui='     (has_key(a:style, 'gui')   ? a:style.gui      : 'NONE')
    \ 'ctermfg=' (has_key(a:style, 'fg')    ? a:style.fg.cterm : 'NONE')
    \ 'ctermbg=' (has_key(a:style, 'bg')    ? a:style.bg.cterm : 'NONE')
    \ 'cterm='   (has_key(a:style, 'cterm') ? a:style.cterm    : 'NONE')
endfunction

call s:h('Normal',        {'bg': s:bg, 'fg': s:norm})

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
   execute 'set background=' . s:background
endif

call s:h('Cursor',        {'bg': s:purple,       'fg':   s:norm })
call s:h('Comment',       {'fg': s:lighter_black, 'gui':  s:italic, 'cterm': s:italic})

call s:h('Constant',      {'fg': s:purple})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant

"call s:h("Identifier",    {"fg": s:dark_blue})
hi! link Identifier       Normal
hi! link Function         Identifier

call s:h('Statement',     {'fg': s:norm_subtle})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h('Operator',      {'fg': s:norm, 'cterm': s:bold, 'gui': s:bold})

call s:h('PreProc',     {'fg': s:norm_subtle})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h('Type',          {'fg': s:norm})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

" call s:h('Special',       {'fg': s:norm_subtle, 'gui': s:italic, 'cterm': s:italic})
call s:h('Special',       {'fg': s:norm_subtle})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h('Underlined',    {'fg': s:norm, 'gui': 'underline', 'cterm': 'underline'})
call s:h('Ignore',        {'fg': s:bg})
call s:h('Error',         {'fg': s:light_red, 'cterm': s:bold})
call s:h('Todo',          {'fg': s:purple, 'gui': 'underline', 'cterm': 'underline'})
call s:h('SpecialKey',    {'fg': s:light_green})
call s:h('NonText',       {'fg': s:bg})
call s:h('Directory',     {'fg': s:dark_blue})
call s:h('ErrorMsg',      {'fg': s:pink})
call s:h('IncSearch',     {'bg': s:dark_yellow, 'fg': s:black})
call s:h('Search',        {'fg': s:orange})
call s:h('MoreMsg',       {'fg': s:medium_gray, 'cterm': s:bold, 'gui': s:bold})
hi! link ModeMsg MoreMsg
call s:h('LineNr',        {'fg': s:lighter_black})
call s:h('CursorLineNr',  {'fg': s:dark_blue, 'bg': s:bg})
call s:h('Question',      {'fg': s:red})
call s:h('StatusLine',    {'bg': s:bg_very_subtle, 'fg': s:blue})
call s:h('StatusLineNC',  {'bg': s:bg_very_subtle, 'fg': s:medium_gray, 'gui': s:italic, 'cterm': s:italic})
call s:h('VertSplit',     {'bg': s:bg_very_subtle, 'fg': s:bg_very_subtle})
call s:h('Title',         {'fg': s:dark_blue})
call s:h('Visual',        {'fg': s:bg, 'bg': s:visual})
call s:h('VisualNOS',     {'bg': s:bg_subtle})
call s:h('WarningMsg',    {'fg': s:red})
call s:h('WildMenu',      {'fg': s:bg, 'bg': s:norm})
call s:h('Folded',        {'fg': s:medium_gray})
call s:h('FoldColumn',    {'fg': s:bg_subtle})
call s:h('DiffAdd',       {'fg': s:green})
call s:h('DiffDelete',    {'fg': s:red})
call s:h('DiffChange',    {'fg': s:dark_yellow})
call s:h('DiffText',      {'fg': s:dark_blue})
call s:h('SignColumn',    {'bg': s:bg})

if has('gui_running')
  call s:h('SpellBad',    {'gui': 'underline', 'sp': s:red})
  call s:h('SpellCap',    {'gui': 'underline', 'sp': s:light_green})
  call s:h('SpellRare',   {'gui': 'underline', 'sp': s:pink})
  call s:h('SpellLocal',  {'gui': 'underline', 'sp': s:dark_green})
else
  call s:h('SpellBad',    {'cterm': 'underline', 'fg': s:red})
  call s:h('SpellCap',    {'cterm': 'underline', 'fg': s:light_green})
  call s:h('SpellRare',   {'cterm': 'underline', 'fg': s:pink})
  call s:h('SpellLocal',  {'cterm': 'underline', 'fg': s:dark_green})
endif

call s:h('Pmenu',         {'fg': s:norm, 'bg': s:bg_subtle})
call s:h('PmenuSel',      {'fg': s:norm, 'bg': s:purple})
call s:h('PmenuSbar',     {'fg': s:norm, 'bg': s:bg_subtle})
call s:h('PmenuThumb',    {'fg': s:norm, 'bg': s:bg_subtle})
call s:h('TabLine',       {'fg': s:norm, 'bg': s:bg_very_subtle})
call s:h('TabLineSel',    {'fg': s:purple, 'bg': s:bg_subtle, 'gui': s:bold, 'cterm': s:bold})
call s:h('TabLineFill',   {'fg': s:norm, 'bg': s:bg_very_subtle})
call s:h('CursorColumn',  {'bg': s:bg_very_subtle})
" call s:h('CursorLine',    {'bg': s:bg})
hi!  CursorLine           term=NONE cterm=NONE guibg=NONE
call s:h('ColorColumn',   {'bg': s:bg_very_subtle})

call s:h('MatchParen',    {'bg': s:bg_subtle, 'fg': s:norm})
call s:h('qfLineNr',      {'fg': s:medium_gray})

call s:h('htmlH1',        {'bg': s:bg, 'fg': s:norm})
call s:h('htmlH2',        {'bg': s:bg, 'fg': s:norm})
call s:h('htmlH3',        {'bg': s:bg, 'fg': s:norm})
call s:h('htmlH4',        {'bg': s:bg, 'fg': s:norm})
call s:h('htmlH5',        {'bg': s:bg, 'fg': s:norm})
call s:h('htmlH6',        {'bg': s:bg, 'fg': s:norm})

" Synatastic
call s:h('SyntasticWarningSign',    {'fg': s:yellow})
call s:h('SyntasticWarning',        {'bg': s:yellow, 'fg': s:black, 'gui': s:bold, 'cterm': s:bold})
call s:h('SyntasticErrorSign',      {'fg': s:red})
call s:h('SyntasticError',          {'bg': s:red, 'fg': s:white, 'gui': s:bold, 'cterm': s:bold})

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
hi link GitGutterAdd                LineNr
hi link GitGutterDelete             LineNr
hi link GitGutterChange             LineNr
hi link GitGutterChangeDelete       LineNr
" **********************************************************************************************************************
" My custom stuff
" **********************************************************************************************************************
" err/warnings
call s:h('ErrorNoBg',               {'fg': s:orange, 'gui': s:italic, 'cterm': s:italic})
call s:h('ErrorSignNoBg',           {'fg': s:orange, 'bg': s:bg})
call s:h('ErrorBg',                 {'bg': s:light_black})
call s:h('WarnNoBg',                {'fg': s:dark_yellow, 'gui': s:italic, 'cterm': s:italic})
call s:h('WarnSignNoBg',            {'fg': s:dark_yellow, 'bg': s:bg})
call s:h('WarnBg',                  {'bg': s:light_black})
" ale
hi link  ALEErrorSign              ErrorSignNoBg
hi link  ALEError                  ErrorNoBg
hi link  ALEErrorLine              ErrorBg
hi link  ALEWarningSign            WarnSignNoBg
hi link  ALEWarning                WarnNoBg
hi link  ALEWarningLine            WarnBg
" GitGutter
hi link  GitGutterAdd              WarnSignNoBg
hi link  GitGutterChange           WarnSignNoBg
hi link  GitGutterDelete           ErrorSignNoBg
hi link  GitGutterChangeDelete     ErrorSignNoBg
" Match parens
hi link  MatchParen                Search
" I want just CursorLineNR
" hi clear CursorLine
" **********************************************************************************************************************
" language specifics
" **********************************************************************************************************************
"  Xml
hi link xmlAttrib                  Statement
hi link xmlTagName                 Statement
hi link xmlEndTag                  Statement
hi link Operator                   Statement
"  JavaScript
hi link jsClassFuncName            SpecialKey
hi link jsFuncName                 SpecialKey
hi link jsFunction                 SpecialKey
hi link jsBlock                    Statement
hi link jsClassKeywords            Statement
hi link jsStorageClass             Statement
hi link jsObjectKey                Statement
hi link jsGlobalObjects            Title
"  TypeScript
hi link typescriptBraces           Statement
hi link typescriptFuncKeyword      Statement
hi link typescriptIdentifier       Statement
"  Kotlin
hi link ktAnnotation               SpecialKey
hi link ktModifier                 Statement
hi link ktStructure                Statement
hi link ktType                     Statement
"  Haskell
hi link haskellDeclKeyword         Statement
hi link haskellDecl                Statement
hi link haskellType                SpecialKey
hi link haskellLet                 Statement
hi link haskellWhere               Statement
hi link haskellPragma              Title
hi link haskellLambda              SpecialKey
hi link haskellForeignKeywords     Keyword
hi link haskellImportKeywords      Keyword
hi link haskellForeignImport       Keyword
hi link haskellOperators           Delimiter
hi link haskellQuote               Title
"  Java
hi link javaScodeDecl              Statement
hi link javaClassDecl              Statement
hi link javaStorageClass           Statement
hi link javaMethodDecl             Statement
hi link javaTypeDef                Statement
hi link javaType                   Statement
"  Idris
hi link idrisStructure             Statement
hi link idrisType                  SpecialKey
hi link idrisOperators             Delimiter
hi link idrisDirective             Title
hi link idrisModule                Title
hi link idrisWhere                 Keyword
hi link idrisLet                   Keyword
hi link idrisImport                Keyword
" **********************************************************************************************************************

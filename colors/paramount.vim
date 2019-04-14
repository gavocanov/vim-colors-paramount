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
if !exists('g:colors_paramount_u')
    let g:colors_paramount_u = 0
endif

if g:colors_paramount_bi
    let s:bold = 'bold'
    let s:italic = 'italic'
else
    let s:bold = 'NONE'
    let s:italic = 'NONE'
endif

if g:colors_paramount_u
    let s:underline = 'underline'
else
    let s:underline = 'NONE'
endif

let s:background = &background
if &background ==? 'dark'
    let s:bg              = { 'gui': '#121212', 'cterm': '233' }
    let s:bg_subtle       = { 'gui': '#4E4E4E', 'cterm': '239' }
    let s:bg_very_subtle  = { 'gui': '#181818', 'cterm': '234' }
    let s:norm            = { 'gui': '#A0A0A0', 'cterm': '248' }
    let s:norm_subtle     = { 'gui': '#767676', 'cterm': '243' }

    let s:blue            = { 'gui': '#005F87', 'cterm': '32' }
    let s:purple          = { 'gui': '#a790d5', 'cterm': '140' }
    let s:cyan            = { 'gui': '#4FB8CC', 'cterm': '14'  }
    let s:green           = { 'gui': '#10A778', 'cterm': '10'  }
    let s:red             = { 'gui': '#E32791', 'cterm': '1'   }
    let s:yellow          = { 'gui': '#ffff87', 'cterm': '228' }
    let s:pink            = { 'gui': '#fb007a', 'cterm': '9'   }
    let s:orange          = { 'gui': '#D75F5F', 'cterm': '167' }

    let s:string          = s:purple
    let s:visual          = s:norm_subtle
else
    let s:bg              = {'gui': '#fbf1c7', 'cterm': '250'}
    let s:bg_subtle       = {'gui': '#928374', 'cterm': '244'}
    let s:bg_very_subtle  = {'gui': '#bdae93', 'cterm': '248'}
    let s:norm            = {'gui': '#504945', 'cterm': '239'}
    let s:norm_subtle     = {'gui': '#7c6f64', 'cterm': '243'}

    let s:blue            = { 'gui': '#458588', 'cterm': '32'  }
    let s:purple          = { 'gui': '#b16286', 'cterm': '134' }
    let s:cyan            = { 'gui': '#689d5a', 'cterm': '6'   }
    let s:green           = { 'gui': '#98971a', 'cterm': '2'   }
    let s:red             = { 'gui': '#cc241d', 'cterm': '1'   }
    let s:yellow          = { 'gui': '#d79921', 'cterm': '3'   }
    let s:pink            = { 'gui': '#b16286', 'cterm': '5'   }
    let s:orange          = { 'gui': '#d65d0e', 'cterm': '166' }

    let s:string          = s:green
    let s:visual          = s:norm_subtle
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

" call s:h('Normal',        {'fg': s:norm, 'bg': s:bg})
call s:h('Normal',        {'fg': s:norm})

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
    execute 'set background=' . s:background
endif

call s:h('Cursor',        {'fg': s:norm, 'bg': s:purple})
call s:h('Comment',       {'fg': s:bg_subtle, 'gui': s:italic, 'cterm': s:italic})
call s:h('Constant',      {'fg': s:string})
call s:h('Identifier',    {'fg': s:norm_subtle})
call s:h('Statement',     {'fg': s:norm_subtle})
call s:h('Operator',      {'fg': s:norm_subtle, 'cterm': s:bold, 'gui': s:bold})
call s:h('PreProc',       {'fg': s:norm_subtle})
call s:h('Type',          {'fg': s:norm_subtle})
call s:h('Special',       {'fg': s:norm_subtle})
call s:h('Underlined',    {'fg': s:norm, 'gui': s:underline, 'cterm': s:underline})
call s:h('Ignore',        {'fg': s:bg_very_subtle})
call s:h('Error',         {'fg': s:red, 'cterm': s:bold})
call s:h('Todo',          {'fg': s:purple, 'gui': s:underline, 'cterm': s:underline})
call s:h('SpecialKey',    {'fg': s:green})
call s:h('NonText',       {'fg': s:bg_subtle})
call s:h('Directory',     {'fg': s:blue})
call s:h('ErrorMsg',      {'fg': s:red})
call s:h('IncSearch',     {'fg': s:bg, 'bg': s:yellow})
call s:h('Search',        {'fg': s:orange})
call s:h('MoreMsg',       {'fg': s:bg_subtle, 'cterm': s:bold, 'gui': s:bold})
call s:h('LineNr',        {'fg': s:bg_subtle})
call s:h('CursorLineNr',  {'fg': s:blue, 'bg': s:bg_very_subtle})
call s:h('Question',      {'fg': s:red})
call s:h('VertSplit',     {'fg': s:bg_very_subtle, 'bg': s:bg_very_subtle})
call s:h('Title',         {'fg': s:blue})
call s:h('Visual',        {'fg': s:bg, 'bg': s:visual})
call s:h('WarningMsg',    {'fg': s:red})
call s:h('WildMenu',      {'fg': s:bg, 'bg': s:norm})
call s:h('Folded',        {'fg': s:bg_very_subtle})
call s:h('FoldColumn',    {'fg': s:bg_subtle})
call s:h('DiffAdd',       {'fg': s:green})
call s:h('DiffDelete',    {'fg': s:red})
call s:h('DiffChange',    {'fg': s:yellow})
call s:h('DiffText',      {'fg': s:blue})
call s:h('Pmenu',         {'fg': s:norm, 'bg': s:bg_subtle})
call s:h('PmenuSel',      {'fg': s:bg,   'bg': s:norm, 'gui': s:bold, 'cterm': s:bold})
call s:h('PmenuSbar',     {'fg': s:norm, 'bg': s:bg_subtle})
call s:h('PmenuThumb',    {'fg': s:norm, 'bg': s:bg_subtle})
call s:h('TabLine',       {'fg': s:bg_subtle, 'bg': s:bg_very_subtle})
call s:h('TabLineSel',    {'fg': s:norm,      'bg': s:bg_very_subtle, 'gui': s:bold, 'cterm': s:bold})
call s:h('TabLineFill',   {'fg': s:bg_subtle, 'bg': s:bg_very_subtle})
call s:h('qfLineNr',      {'fg': s:bg_very_subtle})
call s:h('VisualNOS',     {'bg': s:bg_subtle})
call s:h('CursorColumn',  {'bg': s:bg_very_subtle})
call s:h('CursorLine',    {'bg': s:bg_very_subtle})
call s:h('ColorColumn',   {'bg': s:bg_very_subtle})
call s:h('MatchParen',    {'bg': s:bg_subtle, 'fg': s:norm})
call s:h('SignColumn',    {'bg': s:bg})
call s:h('htmlH1',        {'bg': s:bg, 'fg': s:norm})
call s:h('htmlH2',        {'bg': s:bg, 'fg': s:norm})
call s:h('htmlH3',        {'bg': s:bg, 'fg': s:norm})
call s:h('htmlH4',        {'bg': s:bg, 'fg': s:norm})
call s:h('htmlH5',        {'bg': s:bg, 'fg': s:norm})
call s:h('htmlH6',        {'bg': s:bg, 'fg': s:norm})
" status line
call s:h('StatusLine',    {'bg': s:bg_very_subtle, 'fg': s:norm_subtle})
call s:h('StatusLineNC',  {'bg': s:bg_very_subtle, 'fg': s:bg_very_subtle})
call s:h('IStatusLine',   {'bg': s:bg_very_subtle, 'fg': s:red})
call s:h('NStatusLine',   {'bg': s:bg_very_subtle, 'fg': s:norm_subtle})
" gui
if has('gui_running')
    call s:h('SpellBad',    {'gui': s:underline, 'sp': s:red})
    call s:h('SpellCap',    {'gui': s:underline, 'sp': s:green})
    call s:h('SpellRare',   {'gui': s:underline, 'sp': s:pink})
    call s:h('SpellLocal',  {'gui': s:underline, 'sp': s:green})
else
    call s:h('SpellBad',    {'cterm': s:underline, 'fg': s:red})
    call s:h('SpellCap',    {'cterm': s:underline, 'fg': s:green})
    call s:h('SpellRare',   {'cterm': s:underline, 'fg': s:pink})
    call s:h('SpellLocal',  {'cterm': s:underline, 'fg': s:green})
endif
" links
" hi!  CursorLine           term=NONE        cterm=NONE guibg=NONE
hi!  link                 Character        Constant
hi!  link                 Number           Constant
hi!  link                 Boolean          Constant
hi!  link                 Float            Constant
hi!  link                 String           Constant
hi!  link                 Function         Normal
hi!  link                 Conditonal       Statement
hi!  link                 Repeat           Statement
hi!  link                 Label            Statement
hi!  link                 Keyword          Statement
hi!  link                 Exception        Statement
hi!  link                 Include          PreProc
hi!  link                 Define           PreProc
hi!  link                 Macro            PreProc
hi!  link                 PreCondit        PreProc
hi!  link                 StorageClass     Type
hi!  link                 Structure        Type
hi!  link                 Typedef          Type
hi!  link                 SpecialChar      Special
hi!  link                 Tag              Special
hi!  link                 Delimiter        Special
hi!  link                 SpecialComment   Special
hi!  link                 Debug            Special
hi!  link                 ModeMsg          MoreMsg
" **********************************************************************************************************************
" custom stuff
" **********************************************************************************************************************
" err/warnings
" no background
call s:h('ErrorNoBg',               {'gui': s:italic, 'cterm': s:italic})
call s:h('WarnNoBg',                {'gui': s:italic, 'cterm': s:italic})
call s:h('InfoNoBg',                {'gui': s:italic, 'cterm': s:italic})
" with background
call s:h('ErrorBg',                 {'bg': s:bg})
call s:h('WarnBg',                  {'bg': s:bg})
call s:h('InfoBg',                  {'bg': s:bg})
call s:h('HintBg',                  {'bg': s:bg})
" signs
call s:h('ErrorSign',               {'fg': s:orange,    'bg': s:bg})
call s:h('WarnSign',                {'fg': s:yellow,    'bg': s:bg})
call s:h('InfoSign',                {'fg': s:bg_subtle, 'bg': s:bg})
call s:h('HintSign',                {'fg': s:bg_subtle, 'bg': s:bg})
call s:h('Sign',                    {'fg': s:green,     'bg': s:bg})
" CoC
hi link CocErrorSign 			   ErrorSign
hi link CocWarningSign 			   WarnSign
hi link CocInfoSign 			   InfoSign
hi link CocHintSign 			   HintSign

hi link CocErrorHighlight 		   ErrorBg
hi link CocWarningHighlight        WarnBg
hi link CocInfoHighlight 		   InfoBg
hi link CocHintHighlight 		   HintBg

hi link CocHighlightText 		   IncSearch
hi link CocHighlightTextRead 	   IncSearch
hi link CocHighlightTextWrite      IncSearch

hi link HighlightedyankRegion      IncSearch

hi link CocErrorLine 			   ErrorBg
hi link CocWarningLine 			   WarnBg
hi link CocInfoLine 			   InfoBg
hi link CocHintLine 			   HintBg

call s:h('CodeLens',               {'fg': s:bg_subtle})
hi link CocCodeLens 			   CodeLens

call s:h('CocFloat',               {'bg': s:bg_subtle})
hi link CocInfoFloat               CocFloat
hi link CocHintFloat               CocFloat
hi link CocErrorFloat              CocFloat
hi link CocWarningFloat            CocFloat

hi link CocPumFloating             Pmenu
hi link CocPumFloatingDetail       Pmenu

" BufTabLine
hi link BufTabLineActive           TabLineSel
" ALE
hi link ALEInfoSign                WarnSign
hi link ALEInfo                    WarnBg
hi link ALEErrorSign               ErrorSign
hi link ALEError                   ErrorNoBg
hi link ALEErrorLine               ErrorBg
hi link ALEWarningSign             WarnSign
hi link ALEWarning                 WarnNoBg
hi link ALEWarningLine             WarnNoBg
hi link ALEVirtualTextError        WarnBg
hi link ALEVirtualTextWarning      WarnBg
hi link ALEVirtualTextInfo         WarnBg
hi link ALEVirtualTextStyleError   WarnBg
hi link ALEVirtualTextStyleWarning WarnBg
" Syntastic
hi link SyntasticWarningSign      WarnSign
hi link SyntasticWarning          WarnNoBg
hi link SyntasticErrorSign        ErrorSign
hi link SyntasticError            ErrorBg
" GitGutter
hi link GitGutterAdd              Sign
hi link GitGutterChange           Sign
hi link GitGutterDelete           Sign
hi link GitGutterChangeDelete     Sign
" Signify
hi link SignifySignAdd            Sign
hi link SignifySignChange         Sign
hi link SignifySignDelete         Sign
hi link SignifySignChangeDelete   Sign
" Match parens
" **********************************************************************************************************************
" language specifics
" **********************************************************************************************************************
"  Xml
hi link xmlAttrib                  Statement
hi link xmlTag                     Delimiter
hi link xmlTagName                 Statement
hi link xmlEndTag                  Statement
hi link Operator                   Delimiter
"  JavaScript
hi link jsClassFuncName            SpecialKey
hi link jsFuncName                 SpecialKey
hi link jsFunction                 SpecialKey
hi link jsBlock                    Statement
hi link jsClassKeywords            Statement
hi link jsStorageClass             Statement
hi link jsObjectKey                Statement
hi link jsGlobalObjects            Title
hi link Noise                      Delimiter
hi link jsOperator                 Delimiter
"  TypeScript
hi link typescriptBraces           Statement
hi link typescriptFuncKeyword      Statement
hi link typescriptIdentifier       Statement
"  Kotlin
hi link ktAnnotation                SpecialKey
hi link ktModifier                  Keyword
hi link ktStructure                 Keyword
" hi link ktType                      Keyword
hi link ktOperator                  Keyword
hi link ktSimpleInterpolation       Keyword
hi link ktComplexInterpolation      Keyword
hi link ktComplexInterpolationBrace Keyword
hi link ktEscapedName               Title
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
"  Idris
hi link idrisStructure             Statement
hi link idrisOperators             Delimiter
hi link idrisDirective             Title
hi link idrisModule                Title
hi link idrisWhere                 Keyword
hi link idrisLet                   Keyword
hi link idrisImport                Keyword
" Purescript
hi link purescriptTypeVar          Title
hi link purescriptClassName        Type
hi link purescriptOperator         Delimiter
hi link purescriptOperatorType     Delimiter
hi link purescriptOperatorTypeSig  Delimiter
hi link purescriptIdentifier       Identifier
" Clojure
hi link clojureBoolean   Title
hi link clojureCond      Keyword
hi link clojureConstant  Statement
hi link clojureDefine    Statement
hi link clojureException Statement
hi link clojureFunc      Statement
hi link clojureMacro     Statement
hi link clojureRepeat    Statement
hi link clojureSpecial   SpecialKey
hi link clojureVariable  Title
" Scala
hi link scalaKeywordModifier        Keyword
hi link scalaSpecialFunction        Keyword
hi link scalaInstanceDeclaration    Normal
hi link scalaTypeDeclaration        Statement
" **********************************************************************************************************************

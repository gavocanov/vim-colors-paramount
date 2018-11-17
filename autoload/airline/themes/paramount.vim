scriptencoding utf-8
let g:airline#themes#paramount#palette = {}
let s:N1   = [ '#c6c6c6' , '#262626' , 251 , 235 ]
let s:N2   = [ '#a0a0a0' , '#202020' , 248 , 234 ]
let s:N3   = [ '#a0a0a0' , '#181818' , 248 , 234 ]
let g:airline#themes#paramount#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#paramount#palette.accents = { 'red': [ '#c30771' , '' , 1 , ''  ] }
let pal = g:airline#themes#paramount#palette
for item in ['insert', 'replace', 'visual', 'inactive', 'ctrlp']
    exe "let pal.".item." = pal.normal"
    for suffix in ['_modified', '_paste']
        exe "let pal.".item.suffix. " = pal.normal"
    endfor
endfor

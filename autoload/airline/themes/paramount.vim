scriptencoding utf-8
let g:airline#themes#paramount#palette = {}
let s:N1   = [ '#767676' , '#262626' , 243 , 235 ]
let s:N2   = [ '#767676' , '#202020' , 243 , 234 ]
let s:N3   = [ '#767676' , '#181818' , 243 , 234 ]
let g:airline#themes#paramount#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#paramount#palette.accents = { 'red': [ '#c30771' , '' , 1 , ''  ] }
let pal = g:airline#themes#paramount#palette
for item in ['insert', 'replace', 'visual', 'inactive', 'ctrlp']
    exe "let pal.".item." = pal.normal"
    for suffix in ['_modified', '_paste']
        exe "let pal.".item.suffix. " = pal.normal"
    endfor
endfor

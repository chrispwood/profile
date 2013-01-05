" HTML Macros
"
" Chris
" chris.p.wood@gmail.com
"

" The Comment Tag
"   Add comments
map  ;hc 0i<!-- <ESC>A --><ESC>
map! ;hc <!--  -->
"   Remove comments
map  ;nhc 0:s/<!-- \?\\| \?-->//g<ENTER>

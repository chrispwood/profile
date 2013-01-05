" spaces instead of tabs
set expandtab

" I like 2 stops
set tabstop=2
" I like 2 spaces for indenting
set softtabstop=2
set shiftwidth=2

" Always set auto indenting on
set autoindent

" do not wrap the text by the display width
set nowrap

" keep 100 lines of command line history
set history=100

" show (partial) commands
set showcmd

" do incremental searches (annoying but handy);
set incsearch

" Show tab characters.  Visual Whitespace.
"set list
"set listchars=tab:>.

" Set ignorecase on
set ignorecase

" smart search (override 'ic' when pattern has uppers)
"set scs

" I like this as it makes reading texts easier (for me, at least).
set joinspaces

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" allow tilde (~) to act as an operator -- ~w, etc.

set notildeop


" Java specific stuff
let java_highlight_all=1
let java_highlight_debug=1

let java_ignore_javadoc=1
let java_highlight_functions=1
let java_mark_braces_in_parens_as_errors=1

" highlight strings inside C comments
let c_comment_strings=1

autocmd BufRead *.as set filetype=actionscript 
autocmd BufRead *.mxml set filetype=mxml 
syntax on

map ,e :e ./

colorscheme jellybeans

:set nofoldenable

:set guifont=Menlo\ Regular:h14

" Syntax coloring lines that are too long just slows down the world
:set synmaxcol=200

"disable mouse"
:set mouse=c

"highlights as you search"
:set incsearch

"enable line numbers"
:set number

execute pathogen#infect()

set nocompatible
syntax on             " Enable syntax highlighting
filetype plugin indent on


" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"automatically close NerdTree when you open a file"
let NERDTreeQuitOnOpen = 1

"remove unneeded text at top of NERDTree"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"Automatically delete the buffer of the file you just deleted with NerdTree"
let NERDTreeAutoDeleteBuffer = 1



"set default nerdtree directory to rails_apps"
cd ~/rails_apps


"coc configuration"
let g:coc_node_path = "/opt/homebrew/bin/node"
let g:coc_global_extensions = ["coc-diagnostic", "coc-solargraph"]
let g:LanguageClient_serverCommands = {
        \ 'ruby': ['solargraph']
        \ }

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"open go file in a new tab"
nnoremap gf <C-w>gf

"map go to definition to gd"
nmap <silent> gd :call CocAction('jumpDefinition', 'tabe')<CR>
"nmap <silent> gy :call CocAction('jumpTypeDefinition', 'tabe')<CR>"
"nmap <silent> gi :call CocAction('jumpImplementation', 'tabe')<CR>"

"nmap <silent> gd <Plug>(coc-definition)"
nmap <silent> gy <Plug>(coc-type-definition)


"change tabs to spaces"
:set tabstop=2
:set shiftwidth=2
:set expandtab

"indents next line to current indentation"
:set autoindent

"indent further after keyword on next line"
"need cinoptions here?"
set cinwords=if,else,while,do,for,switch,case

set mat=5  " Bracket blinking.

"displays long lines as just one line"
:set nowrap

set laststatus=2

"highlight cursor line"
set cul
set cursorline
"hi CursorLine term=none cterm=none ctermbg=3

"disable bell alert"
set visualbell "do not beep
set noerrorbells " I hate console beeps.

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

"make Vim to never write to backup file"
set nobackup
set noswapfile

"make gitgutter column background match
highlight clear SignColumn

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"do not replace paste register with new content"
xnoremap p "_dP

call plug#begin('~/.vim/plugged')
  "Plugins can go there"
call plug#end()




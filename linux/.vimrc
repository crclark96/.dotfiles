set nocompatible

set number " show line numbers
set relativenumber " show relative line numbers
set cursorline  " highlight current line

set showcmd " show incomplete commands in bottom bar
set ruler " show cursor coordinates
set laststatus=2 " always show status line

" scream if lines are too long
highlight ColorColumn ctermbg=magenta
call matchadd('colorColumn', '\%81v', 100)

set wildmenu " autocomplete by tabbing
set lazyredraw " don't redraw in the middle of macros
set showmatch " hightlight matching [{()}]

set incsearch " search as characters are entered
set hlsearch " highlight matches

syntax on
color dracula
set smartindent
set clipboard=unnamed " use os clipboard
set shiftwidth=2 " number of spaces when shift indenting
set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tab to spaces
set showmatch " highlight matching [{()}]
inoremap fd <Esc>

if has('nvim')
  tnoremap fd <C-\><C-n> " terminal mode
  tnoremap <C-w>h <C-\><C-n><C-w>h " move windows when in term mode
  tnoremap <C-w>j <C-\><C-n><C-w>j " move windows when in term mode
  tnoremap <C-w>k <C-\><C-n><C-w>k " move windows when in term mode
  tnoremap <C-w>l <C-\><C-n><C-w>l " move windows when in term mode
  autocmd TermOpen * set bufhidden=hide norelativenumber nonumber
  " allow term to be open in background, no line numbers
  autocmd BufWinEnter,WinEnter,TermOpen term://* startinsert
  " enter insert when in term
endif

" abbreviations for c programming
func LoadCAbbrevs()
    iabbr do do {<CR>} while ();<C-O>3h<C-O>
    iabbr for for (;;) {<CR>}<C-O>k<C-O>3l<C-O>
    iabbr switch switch () {<CR>}<C-O>k<C-O>6l<C-O>
    iabbr while while () {<CR>}<C-O>k<C-O>5l<C-O>
    iabbr if if () {<CR>}<C-O>k<C-O>2l<C-O>
    iabbr #d #define
    iabbr #i #include
endfunc
au FileType c,cpp call LoadCAbbrevs()

autocmd BufWritePre * :%s/\s\+$//e " strip trailing whitespace on buffer write
autocmd BufNewFile,BufRead *.cup,*.lex set syntax=java

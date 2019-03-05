" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'brooth/far.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'gmist/vim-palette'

Plug 'ludovicchabant/vim-gutentags'
Plug 'amiorin/vim-project'
Plug 'majutsushi/tagbar'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/vim-build-tools-wrapper'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'mileszs/ack.vim'
Plug 'roxma/vim-paste-easy'
Plug 'yegappan/mru'
Plug 'airblade/vim-rooter'
Plug 'yuttie/comfortable-motion.vim'


"Clang"
Plug 'rhysd/vim-clang-format'

Plug 'kassio/neoterm'
Plug 'Konfekt/FastFold'

"Latex"
Plug 'lervag/vimtex'
"Julia"
Plug 'JuliaEditorSupport/julia-vim'
"Python"
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'vim-syntastic/syntastic'
Plug 'davidhalter/jedi-vim'
Plug 'tmhedberg/SimpylFold' 

"prose writing"
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

"tmux"
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'jpalardy/vim-slime'


call plug#end()
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_target="tmux"

"general"
set encoding=utf-8
syntax on
set nu
set relativenumber
set ruler
map <C-n> :NERDTreeToggle<CR>
nmap oo o<Esc>k
nmap OO O<Esc>j
hi Normal ctermbg=none
highlight NonText ctermbg=none
hi Normal guibg=NONE ctermbg=NONE
nnoremap <CR> :noh<CR><CR>

"Tmux
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

"autocmd VimResized* :wincmd=
"nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
"nnoremap <leader>= :wincmd =<cr>

"latex"
let g:vimtex_compiler_progname='nvr'

"Python"
au BufNewFile,BufRead *.jl
    \ set tabstop=2|
    \ set softtabstop=2|
    \ set shiftwidth=2|
    \ set textwidth=90|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix|
     colorscheme badwolf

let python_highlight_all=1

"Julia"
au VimEnter,BufRead,BufNewFile *.jl set filetype=julia
au BufNewFile,BufRead *.jl
    \ set tabstop=2|
    \ set softtabstop=2|
    \ set shiftwidth=2|
    \ set textwidth=90|
    \ set expandtab|
    \ set autoindent|
    \ set foldmethod=indent|
    \ set fileformat=unix|
     colorscheme badwolf


" Remove trailing whitespace
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap ,ws :StripTrailingWhitespaces<CR>

" Strip whitespace
function! <SID>StripTrailingWhitespaces()
" Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
" Do the business:
    %s/\s\+$//e
" Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <Leader>vs "vy :call VimuxSlime()<CR>
" Select current paragraph and send it to tmux
nmap <Leader>vs vip<LocalLeader>vs<CR>

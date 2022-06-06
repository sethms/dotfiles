set nocompatible " not vi compatible

"------------------
" Syntax and indent
"------------------
syntax on " turn on syntax highlighting
set showmatch " show matching braces when text indicator is over them

" highlight current line, but only in active window
" augroup CursorLineOnlyInActiveWindow
"     autocmd!
"     autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"     autocmd WinLeave * setlocal nocursorline
" augroup END

" vim can autodetect this based on $TERM (e.g. 'xterm-256color')
" but it can be set to force 256 colors
" set t_Co=256
" if has('gui_running')
"     colorscheme solarized
"     let g:lightline = {'colorscheme': 'solarized'}
" elseif &t_Co < 256
"     colorscheme default
"     "set nocursorline " looks bad in this mode
" else
"     set background=dark
"     let g:solarized_termcolors=256 " instead of 16 color with mapping in terminal
"     let g:solarized_termtrans = 1
"     colorscheme solarized
"     " customized colors
"     set t_Co=256
"     syntax enable
"     highlight SignColumn ctermbg=234
"     highlight StatusLine cterm=bold ctermfg=245 ctermbg=235
"     highlight StatusLineNC cterm=bold ctermfg=245 ctermbg=235
"     let g:lightline = {'colorscheme': 'dark'}
"     highlight SpellBad cterm=underline
"     " patches
"     highlight CursorLineNr cterm=NONE
" endif
" 
" filetype plugin indent on " enable file type detection
" set autoindent

" Vim color scheme based on http://github.com/jpo/vim-railscasts-theme
"
" Name:        railscasts.vim
" Maintainer:  Ryan Bates
" License:     MIT

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "railscasts"

" Colors
" Brown        #BC9357
" Dark Blue    #6D9CBD
" Dark Green   #509E50
" Dark Orange  #CC7733
" Light Blue   #CFCFFF
" Light Green  #A5C160
" Tan          #FFC66D
" Red          #DA4938 

hi Normal     guifg=#E6E1DC guibg=#232323
hi Cursor     guibg=#FFFFFF
hi CursorLine guibg=#333435
hi LineNr     guifg=#666666
hi Visual     guibg=#5A647E
hi Search     guifg=NONE    guibg=#131313  gui=NONE
hi Folded     guifg=#F6F3E8 guibg=#444444  gui=NONE
hi Directory  guifg=#A5C160 gui=NONE
hi Error      guifg=#FFFFFF guibg=#990000
hi MatchParen guifg=NONE    guibg=#131313
hi Title      guifg=#E6E1DC

hi Comment    guifg=#BC9357 guibg=NONE     gui=italic
hi! link Todo Comment

hi String     guifg=#A5C160
hi! link Number String
hi! link rubyStringDelimiter String

" nil, self, symbols
hi Constant guifg=#6D9CBD

" def, end, include, load, require, alias, super, yield, lambda, proc
hi Define guifg=#CC7733 gui=NONE
hi! link Include Define
hi! link Keyword Define
hi! link Macro Define

" #{foo}, <%= bar %>
hi Delimiter guifg=#509E50
" hi erubyDelimiter guifg=NONE

" function name (after def)
hi Function guifg=#FFC66D gui=NONE

"@var, @@var, $var
hi Identifier guifg=#CFCFFF gui=NONE

" #if, #else, #endif

" case, begin, do, for, if, unless, while, until, else
hi Statement guifg=#CC7733 gui=NONE
hi! link PreProc Statement
hi! link PreCondit Statement

" SomeClassName
hi Type guifg=NONE gui=NONE

" has_many, respond_to, params
hi railsMethod guifg=#DA4938 gui=NONE

hi DiffAdd guifg=#E6E1DC guibg=#144212
hi DiffDelete guifg=#E6E1DC guibg=#660000

hi xmlTag guifg=#E8BF6A
hi! link xmlTagName  xmlTag
hi! link xmlEndTag   xmlTag
hi! link xmlArg      xmlTag
hi! link htmlTag     xmlTag
hi! link htmlTagName xmlTagName
hi! link htmlEndTag  xmlEndTag
hi! link htmlArg     xmlArg

" Popup Menu
" ----------
" normal item in popup
hi Pmenu guifg=#F6F3E8 guibg=#444444 gui=NONE
" selected item in popup
hi PmenuSel guifg=#000000 guibg=#A5C160 gui=NONE
" scrollbar in popup
hi PMenuSbar guibg=#5A647E gui=NONE
" thumb of the scrollbar in the popup
hi PMenuThumb guibg=#AAAAAA gui=NONE



" Leader Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "       " leader is space

"---------------------
" Basic editing config
"---------------------
set shortmess+=I " disable startup message
set nu " number lines
set rnu " relative line numbering
" set incsearch " incremental search (as string is being typed)
" set hls " highlight search
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set lbr " line break
set scrolloff=5 " show lines above and below cursor (when possible)
set laststatus=2
set backspace=indent,eol,start " allow backspacing over everything
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set lazyredraw " skip redrawing screen in some cases
set autochdir " automatically set current directory to directory of last opened file
set hidden " allow auto-hiding of edited buffers
set history=8192 " more history
set nojoinspaces " suppress inserting two spaces between sentences
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
" smart case-sensitive search
set ignorecase
set smartcase
" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu
" set nowrap
set mouse+=a " enable mouse mode (scrolling, selection, etc)
" turn off spellcheck underlining
set nospell
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

"--------------------
" Misc configurations
"--------------------

" unbind keys
map <C-a> <Nop>
map <C-x> <Nop>
nmap Q <Nop>

" horizontal scrolling
nnoremap <C-]> 20zl " Scroll 20 characters to the right
nnoremap <C-[> 20zh " Scroll 20 characters to the left

" disable audible bell
set noerrorbells visualbell t_vb=

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" movement relative to display lines
nnoremap <silent> <Leader>d :call ToggleMovementByDisplayLines()<CR>
function SetMovementByDisplayLines()
    noremap <buffer> <silent> <expr> k v:count ? 'k' : 'gk'
    noremap <buffer> <silent> <expr> j v:count ? 'j' : 'gj'
    noremap <buffer> <silent> 0 g0
    noremap <buffer> <silent> $ g$
endfunction
function ToggleMovementByDisplayLines()
    if !exists('b:movement_by_display_lines')
        let b:movement_by_display_lines = 0
    endif
    if b:movement_by_display_lines
        let b:movement_by_display_lines = 0
        silent! nunmap <buffer> k
        silent! nunmap <buffer> j
        silent! nunmap <buffer> 0
        silent! nunmap <buffer> $
    else
        let b:movement_by_display_lines = 1
        call SetMovementByDisplayLines()
    endif
endfunction

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" save read-only files
command -nargs=0 Sudow w !sudo tee % >/dev/null

"---------------------
" Plugin configuration
"---------------------
" nerdtred
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" buffergator
let g:buffergator_suppress_keymaps = 1
nnoremap <Leader>b :BuffergatorToggle<CR>

" gundo
nnoremap <Leader>u :GundoToggle<CR>
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

" ctrlp
" nnoremap ; :CtrlPBuffer<CR>
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_show_hidden = 1

" fzf
set rtp+=/usr/local/opt/fzf

" ag / ack.vim
command -nargs=+ Gag Gcd | Ack! <args>
nnoremap K :Gag "\b<C-R><C-W>\b"<CR>:cw<CR>
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    let g:ackprg = 'ag --vimgrep'
endif

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': []
\}
nnoremap <Leader>s :SyntasticCheck<CR>
nnoremap <Leader>r :SyntasticReset<CR>
nnoremap <Leader>i :SyntasticInfo<CR>
nnoremap <Leader>m :SyntasticToggleMode<CR>

" Easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" incsearch-easymotion
" map z/ <Plug>(incsearch-easymotion-/)
" map z? <Plug>(incsearch-easymotion-?)
" map zg/ <Plug>(incsearch-easymotion-stay)
"map <Leader>/ <Plug>(incsearch-easymotion-/)
"map <Leader>? <Plug>(incsearch-easymotion-?)
"map <Leader>g/ <Plug>(incsearch-easymotion-stay)
let g:incsearch#auto_nohlsearch = 1
" set hlsearch
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" easymotion
map <Leader><Leader>  <Plug>(easymotion-prefix)

" incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Gif config
map <Leader>/ <Plug>(easymotion-sn)
omap <Leader>/ <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
" let g:EasyMotion_landing_highlight = 0
" let g:EasyMotion_inc_highlight = 1

" vim-sneak behaviour through easymotion
nmap s <Plug>(easymotion-overwin-f2)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>t <Plug>(easymotion-t2)



" FZF.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" argwrap
nnoremap <Leader>w :ArgWrap<CR>

noremap <Leader>x :OverCommandLine<CR>

" markdown
let g:markdown_fenced_languages = [
    \ 'bash=sh',
    \ 'c',
    \ 'coffee',
    \ 'erb=eruby',
    \ 'javascript',
    \ 'json',
    \ 'perl',
    \ 'python',
    \ 'ruby',
    \ 'yaml',
    \ 'go',
\]
let g:markdown_syntax_conceal = 0

" fugitive
set tags^=.git/tags;~

"---------------------
" Local customizations
"---------------------

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif



" Movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Quick Save
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
"nmap <Leader>qq :qa!<CR>

" Quick copy paste
nmap <Leader>y "+y
nmap <Leader>d "+d
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Split with leader
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\| :vsp<CR>

set runtimepath^=~/.vim/pack/vendor/start/vim-scala/

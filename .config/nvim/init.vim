set t_Co=256
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
if has('unnamedplus') || has('nvim')
  set clipboard+=unnamedplus
else
  set clipboard+=unnamed
endif
set cursorline
set showcmd
set number
set hidden
set hlsearch
set backspace=2
let mapleader=","
autocmd Filetype html setlocal ts=4 sts=4 sw=4 omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal ts=4 sts=4 sw=4
autocmd FileType typescript setlocal ts=4 sts=4 sw=4
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=4 noet sw=4 omnifunc=csscomplete#CompleteCSS
autocmd bufread *.coffee set ft=coffee
autocmd bufread *.less set ft=less
autocmd bufread *.md set ft=markdown
autocmd bufread Cakefile set ft=coffee
autocmd bufread *.pp set ft=ruby
autocmd bufread *.conf set ft=dosini
autocmd bufread *.tsx set ft=typescript.tsx
autocmd FileType vue syntax sync fromstart
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue

if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
endif

" Set up ultisnips - need to symlink vim scripts to be run when files are opened
function! SymlinkSnippets(info)
    if a:info.status == 'installed' || a:info.force && !isdirectory(s:editor_root . "/ftdetect")
        silent execute "!ln -s " . s:editor_root . "/plugged/ultisnips/ftdetect " . s:editor_root . "/"
    endif
endfunction

function! SetColorscheme(...)
    try
    "colorscheme Tomorrow-Night-Eighties
    "colorscheme palenight
    "colorscheme one
   	" colorscheme PaperColor 
    colorscheme nord
    catch /^Vim\%((\a\+)\)\=:E185/
    autocmd VimEnter * echom "Color scheme not found. Maybe it's installing?"
    endtry
endfunction
function! CompileCMatcher(...)
    autocmd VimEnter * echom "Building CMatcher"
    silent execute "!cd " . s:editor_root . "/plugged/ctrlp-cmatcher/ && ./install.sh"
endfunction
let g:polyglot_disabled=['python', 'jsx']
let g:deoplete#enable_at_startup = 1

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-repeat'
Plug 'szw/vim-ctrlspace'
Plug 'myusuf3/numbers.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'vim-scripts/taglist.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'thinca/vim-localrc'
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['jsx', 'javascript.jsx'] }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'vim-scripts/L9'
Plug 'simnalamburt/vim-mundo'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rstacruz/sparkup', { 'for': 'html' }
Plug 'tomtom/tcomment_vim'
Plug 'dylanaraps/wal.vim'
" Plug 'SirVer/ultisnips', { 'do': function('SymlinkSnippets') } | Plug 'honza/vim-snippets'
Plug 'wellle/targets.vim'
Plug 'fs111/pydoc.vim'
Plug 'junegunn/vim-easy-align'
Plug 'bronson/vim-trailing-whitespace'
Plug 'janko-m/vim-test'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim/', 'do': function('SetColorscheme') }
Plug 'ap/vim-css-color'
Plug 'junegunn/goyo.vim'
Plug 'racer-rust/vim-racer'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-telescope/telescope.nvim' " optional
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'cuducos/yaml.nvim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" Setting up plugins - end
filetype plugin indent on
set laststatus=2

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

inoremap jj <Esc>
nnoremap <leader>m :w <BAR> !lessc %:t:r.css<CR><space>
nnoremap <F5> :buffers<CR>:buffer<Space>
nmap <leader>ne :NERDTree<cr>
nmap <leader>nt :NERDTree<cr>
nmap <leader>nq :NERDTreeClose<cr>
map <leader>n :bn<cr>
map <leader>p :bp<cr>
nmap <silent> <leader>l :set list!<CR>
map <silent> <leader>/ :let @/ = ""<CR>
if has('nvim')
    set shortmess+=c
    tnoremap <Esc> <C-\><C-n>
    inoremap <silent><expr> <c-space> coc#refresh()
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K for show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    " autocmd CursorHold * silent call CocActionAsync('highlight')
endif

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>A :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
nmap <unique><silent> <C-Space> :CtrlSpace<CR>

if exists('&inccommand')
  set inccommand=split
endif
set listchars=tab:▸\ ,eol:¬

let g:extra_whitespace_ignored_filetypes = ['Mundo']
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

let g:python_highlight_all = 1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
let &colorcolumn="110,".join(range(116,999),",")
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"let g:lightline.colorscheme = 'palenight'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_theme='one'
let g:airline_detect_modified = 1
"let g:airline_theme="tomorrow"
" Required for CtrlSpace integration
let g:airline_exclude_preview = 1
" End CtrlSpace integration
" ALE (linting) integration
" End ALE integration
let g:airline#extensions#branch#format = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'z', 'warning', 'error' ]
    \ ]
if executable('rg')
    let g:ackprg = 'rg --vimgrep --no-heading'
endif
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|site-packages|node_modules)$',
    \ 'file': '\v\.(exe|so|dll|pyc|debug\.js|simple\.js)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
let g:ctrlp_reuse_window = 'startify'
nnoremap <c-p> :FZF<cr>
let g:clang_library_path = '/usr/lib/llvm-3.2/lib/'
let g:ctrlspace_project_root_markers = [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS", "proj.sln"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_python_style="sphinx"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "angular_snippets"]
" set viminfo='100,n$HOME/.vim/files/info/viminfo " Change to nvim agnostic path if necessary
function! NumberOfWindows()
  let i = 1
  while winbufnr(i) != -1
  let i = i+1
  endwhile
  return i - 1
endfunction
function! DonotQuitLastWindow()
  if NumberOfWindows() != 1
    let v:errmsg = ""
    silent! quit
    if v:errmsg != ""
        "echohl ErrorMsg | echomsg v:errmsg | echohl NONE
        "echoerr v:errmsg
        echohl ErrorMsg | echo v:errmsg | echohl NONE
    endif
  else
     echohl Error | echo "Can't quit the last window..." | echohl None
  endif
endfunction
if has("gui_running")
    cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'call DonotQuitLastWindow()' : 'q'
    cnoreabbrev <expr> qa getcmdtype() == ":" && getcmdline() == 'qa' ? 'call DonotQuitLastWindow()' : 'qa'
endif
set background=dark " for the dark version
"set background=light " for the light version
call SetColorscheme()
hi Search ctermfg=237 ctermbg=13
hi MatchParen cterm=underline
hi SyntasticWarning ctermbg=yellow ctermfg=black
hi ALEWarning ctermbg=yellow ctermfg=black
hi SyntasticError ctermbg=red ctermfg=black
hi ALEError ctermbg=red ctermfg=black
hi CocUnderline term=undercurl
hi CocErrorHighlight ctermfg=red term=undercurl
hi CocWarningHighlight ctermfg=yellow term=undercurl
hi CtrlSpaceSelected term=reverse ctermfg=187  ctermbg=23  cterm=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=232 cterm=NONE
hi CtrlSpaceSearch   ctermfg=220  ctermbg=NONE cterm=bold
hi CtrlSpaceStatus   ctermfg=230  ctermbg=234  cterm=NONE
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
if has('nvim')
    let test#strategy = "neoterm"
    let g:neoterm_default_mod = 'vertical'
    let g:neoterm_autoscroll = 1
    nnoremap <silent> <leader>qt :Tclose!<cr>
endif
"
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
com! FormatJSON %!python -m json.tool
let &titleold=substitute(system("uname"),'\(.*\)\n','%\1%','')
let &titlestring = expand("%:p")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term =~ "xterm" || &term =~ "nvim"
  set title
endif
" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
"	vnoremap <C-c> "+y
"map <C-v> "+P<Paste>
" Wayland Clipboard Support
xnoremap "+y y:call system("wl-copy", @")<cr>  
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p  
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p  
"no swap
set noswapfile
""Comment out all if using theme except when using papercolor
"True Colors for palenight
"if (has("nvim"))
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
set t_8f=^[[38;2;%lu;%lu;%lum        " set foreground color
set t_8b=^[[48;2;%lu;%lu;%lum        " set background color

"Italics for PaleNight
" Italics for my favorite color scheme
let g:palenight_terminal_italics=1

" For python language server
if (executable('pyls'))
    let s:pyls_path = fnamemodify(g:python_host_prog, ':h') . '/'. 'pyls'
    augroup LspPython
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': {server_info->['pyls']},
      \ 'allowlist': ['python']
      \ })
    augroup END
endif
let g:powerline_pycmd="py"
let g:powerline_pycmd="py3"
 filetype plugin indent on
 set grepprg=grep\ -nH\ $*
 let g:tex_flavor = "latex"


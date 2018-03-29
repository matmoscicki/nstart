filetype on
" let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
" let $NVIM_PYTHON_LOG_LEVEL="DEBUG"

au BufRead io.txt set filetype=io

set clipboard=unnamedplus
set guifont=DejaVuSansMonoNF\ 9
set hlsearch
set ts=4
set sw=4
set et


let g:autotagTagsFile="tags"


let php_sql_query = 1		" podkreślanie składni SQL w PHP
let php_htmlInStrings = 1	" podkreślanie składni HTML w PHP
let python_highlight_all = 1
let g:pydiction_location = 'c:/vim/plugins/pydiction-1.2/complete-dict'
let g:neocomplcache_enable_at_startup = 1 
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let tlist_delphi_settings = 'pascal;f:function;c:class;p:procedure'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
"call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()
let g:GPGPreferSymmetric = 1
set tags=./tags;../tags

map <Leader><Left> :tabprev<CR>
map <Leader><Right> :tabnext<CR>

nmap <silent> <Leader>gc <Plug>GreperBangWord

let g:ale_c_clang_options = '-Wall -std=gnu11 -x c'
let g:ale_c_clangtidy_options = '-Wall -std=gnu11 -x c'
let g:ale_c_clangcheck_options = '-Wall -std=gnu11 -x c'
let g:ale_cpp_clang_options = '-Wall -std=c++11 -x c++'
let g:ale_cpp_clangtidy_options = '-Wall -std=c++11 -x c++'
let g:ale_cpp_clangcheck_options = '-- -Wall -std=c++11 -x c++'
let g:ale_cpp_cpplint_options = '--filter=+whitespace,-whitespace/tab,+whitespace/parens,-whitespace/line_length'

" let g:syntastic_debug = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_checkers=['gcc', 'make', 'tizen']
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_clang_check_post_args = " -std=c++11 -Wall -x c++"
let g:syntastic_cpp_clang_tidy_post_args = " -std=c++11 -Wall -x c++"
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall'
let g:syntastic_cpp_checkers=['gcc', 'cppcheck', 'clang_tidy', 'cpplint', 'cppclean', 'clang_check', 'flawfinder']
"-stdlib=libc++'
let g:UltiSnipsUsePythonVersion = 3

call plug#begin('~/vimfiles/plugged')

Plug 'vivien/vim-linux-coding-style'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'AndrewRadev/linediff.vim'
Plug 'ciaranm/detectindent'
Plug 'diepm/vim-rest-console'

Plug 'ciaranm/detectindent'
Plug 'diepm/vim-rest-console'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json'
Plug 'jamessan/vim-gnupg'
Plug 'jaxbot/browserlink.vim'
" Plug 'kien/ctrlp.vim'
Plug 'maksimr/vim-jsbeautify'

Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
"Plug 'tomtom/tcomment_vim'
Plug 'shime/vim-livedown'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tsaleh/vim-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'



"Plug 'vim-scripts/Figlet.vim' ", { 'on': 'FigletToggle' }
"Plug 'dbext.vim'
Plug 'fadein/FIGlet.vim'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'tpope/vim-unimpaired'
Plug 'kana/vim-metarw'
Plug 'mattn/vim-metarw-gdrive'
Plug 'posva/vim-vue'
" Plug 'Rykka/riv.vim'
Plug 'nvie/vim-flake8'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'racer-rust/vim-racer'
"Plug 'Shougo/neocomplete.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim'
"Plug 'zchee/deoplete-clang'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'tweekmonster/deoplete-clang2'
Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'rzaluska/deoplete-rtags'


Plug 'scrooloose/nerdtree'
Plug 'Rykka/InstantRst'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'funorpain/vim-cpplint'
Plug 'hari-rangarajan/CCTree'
Plug 'tpope/vim-sleuth'
Plug 'vim-scripts/cscope.vim'
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/greper.vim'
Plug 'tpope/vim-repeat'
Plug 'Shougo/unite.vim'
Plug 'devjoe/vim-codequery'
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'bagrat/vim-workspace'
Plug 'sheerun/vim-polyglot'
Plug 'craigemery/vim-autotag'
Plug 'simnalamburt/vim-mundo'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'lyuts/vim-rtags'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
Plug 'Konfekt/FastFold'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

" call deoplete#enable_logging("DEBUG", "/tmp/deoplete.log")

syntax on
color dracula
let g:indent_guides_auto_colors = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.9/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.9/lib/clang/'

let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips/"
let g:deoplete#sources#clang#libclang_path="/usr/lib/llvm-3.8/lib/libclang.so"

highlight ErrorMsg guibg=orange

"Below is the minimum key mappings.
highlight Search term=reverse ctermfg=0 ctermbg=41 guifg=Black guibg=Khaki

nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>
let g:cscope_silent = 1

nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
nmap <Leader>t :NERDTreeToggle<CR>
" let g:NERDCustomDelimiters = { 'c': {'left': '//', 'right': '' } }
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDAltDelims_c = 1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#tabline#enabled = 1

"let g:airline_left_sep = 'aaa'
let g:airline_left_sep = "\uE0C0"
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
let g:airline_right_sep = "\uE0C2"


if has("gui_running")
    let g:airline_theme = 'deus'
   " let g:airline_theme = 'qwq'
else
    let g:airline_theme = 'qwq'
"    let g:airline_theme = 'light'
endif


noremap <Tab> :WSNext<CR>
noremap <S-Tab> :WSPrev<CR>
noremap <Leader><Tab> :WSClose<CR>
noremap <Leader><S-Tab> :WSClose!<CR>
noremap <C-t> :WSTabNew<CR>

map <C-c>/ <Plug>NERDCommenterToggle
"nmap <C-c>/ <Plug>NERDCommenterToggle
"omap <C-c>/ <Plug>NERDCommenterToggle
"vmap <C-c>/ <Plug>NERDCommenterToggle

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

map <F12> :Files<CR>

noremap <Leader>s :CodeQuery Symbol<CR>
noremap <Leader>c :CodeQuery Call<CR>
noremap <Leader>d :CodeQuery Definition<CR>

let g:codequery_enable_auto_clean_languages = ['python', 'cpp', 'c']

let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

if has("gui_running")
   let g:indent_guides_auto_colors = 1
   let g:indent_guides_color_change_percent = 7
else
   let g:indent_guides_color_change_percent = 2
   let g:indent_guides_auto_colors = 0
   hi IndentGuidesEven ctermbg=238
   hi IndentGuidesOdd ctermbg=236
endif

let g:syntastic_aggregate_errors = 1
let g:sleuth_automatic = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"noremap [count]<C-_> :NERDComToggleComment
"

let g:rtagsRcCmd = "~/projekty/rtags/bin/rc"
let g:rtagsRdmCmd = "~/projekty/rtags/bin/rdm"
let g:rtagsUseDefaultMappings = 1
set undofile
set undodir=~/.vim/undo

function! TryOpenFile(file)
    if filereadable(a:file)
        execute "vsplit"
        execute "e " . a:file
        execute "wincmd L"
        return 1
    endif
    return 0
endfunction

function! HeaderFile()
    let l:header = substitute(@%, '\(.*\)\.[a-z]\+$', '\1', "g")
    if TryOpenFile(l:header . ".h") == 0
        call TryOpenFile(l:header . ".hpp")
    endif
endfunction

function! OpenUnderC()
    execute "vertical wincmd f"
    execute "wincmd L"
endfunction

map <F10> :call HeaderFile()<CR>
map <F9> :call OpenUnderC()<CR>
map <F8> :Gstatus<CR>
autocmd QuickFixCmdPost *grep* cwindow
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
inoremap <expr> <C-n> deoplete#mappings#manual_complete()
let g:deoplete#sources#clang#autofill_neomake = 1
let g:neomake_cpp_enabled_makers = ["clang"]
let g:neomake_c_enabled_makers = ["clang"]



" cquery
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['cquery', '--language-server', '--log-file=/tmp/cq.log'],
    \ 'c': ['cquery', '--language-server', '--log-file=/tmp/cq.log'],
    \ }


" let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
" let g:LanguageClient_settingsPath = '~/.config/nvim/settings.json'
" let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_diagnosticsEnable = 1 " enable gutter, highlight and quickfix list
set completefunc=LanguageClient#complete
:nnoremap <F5> "=strftime("%Y-%m-%d: %H:%M")<CR>P
:inoremap <F5> <C-R>=strftime("%Y-%m-%d: %H:%M")<CR>

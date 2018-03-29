
"set guifont=DejaVu\ Sans\ Mono\ 10
set guifont=DejaVuSansMono\ NF\ 9
"set guifont=Consolas\ 11
set visualbell
set noerrorbells
set ts=4
set encoding=utf8
set fileencodings=utf-8,iso-8859-2,ucs-bom,ucs-2le,ucs-2,iso-2022-jp-3,euc-jisx0213,euc-jp
set sw=4
set expandtab
set softtabstop=4
set lines=52 columns=180
set hidden
set nocompatible		" niekompatybilny z VI => włącz bajery VIMa
set nobackup			" nie trzymaj kopii zapasowych, używaj wersji
set backspace=indent,eol,start
set viminfo='20,\"50		" read/write a .viminfo file, don't store more than 50 lines of registers
set history=50			" keep 50 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch			" do incremental searching
set browsedir=buffer		" To get the File / Open dialog box to default to the current file's directory
set pastetoggle=<F11>		" przełączanie w tryb wklejania (nie będzie automatycznych wcięć, ...)
set number			" nie wyświetlaj nr linii
set wildmenu			" wyświetlaj linie z menu podczas dopełniania
set showmatch			" pokaz otwierający nawias gdy wpisze zamykający
set so=5			" przewijaj juz na 5 linii przed końcem
set listchars=eol:$,tab:»·,trail:~,extends:>,precedes:<
set laststatus=2		" zawsze pokazuj linię statusu
set fo=tcrqn			" opcje wklejania (jak maja być tworzone wcięcia itp.)
set hidden			" nie wymagaj zapisu gdy przechodzisz do nowego bufora
set tags+=./stl_tags		" tip 931
set foldtext=MojFoldText()	" tekst po zwinięciu zakładki
set foldminlines=3		" minimum 3 linie aby powstał fold
set clipboard=unnamed "dzieki temu, schowek bedzie wspodzielony z systemem - nie trzeba kopiowac i wklejac z rejestru +

set wildignore+=.git\*,__history\*,_gsdata_\*,bin\*,Debug\*,ModelSupport_KOMA\*,Synopse\*,jcl-2.3.1.4197\*,ZipMaster\*,ZipMaster19\*,TDbf\*,DeHL\*,FastMM\*

let python_highlight_all = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_color = 1
let g:LargeFile = 5

let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4

set updatetime=1000

set ofu=syntaxcomplete#Complete " Default to omni completion using the syntax highlighting files
set spelllang=pl,en
set balloonexpr=BalloonExpr()	" tip 1149
set ballooneval

behave xterm

if has("gui_running")
syntax on		" kolorowanie składni
set hlsearch		" zaznaczanie szukanego tekstu
	color dracula
	highlight SpellErrors guifg=Red gui=underline 
	let spell_language_list = "polish"
	set foldcolumn=2	" szerokość kolumny z zakładkami
	set guioptions=aegirLt "b	" m.in: włącz poziomy scrollbar - poziomy scrollbar mi nie potrzebny
	set nowrap
	set cursorline		" zaznacz linię z kursorem
	set cursorcolumn	" zaznacz kolumnę z kursorem
endif

" automatyczne rozpoznawanie typu pliku, ladowanie specyficznego, dla danego typu, pluginu (ftplugin.vim, indent.vim):
" filetype off
" filetype plugin indent on

""""""""""""""""""" AUTO COMMANDS: """"""""""""""""""""""""""""""""""{{{
if has("autocmd")
	" zaczynaj od ostatniej znanej pozycji kursora:
	autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g`\"" | endif
else
	set autoindent	" automatyczne wcięcia
	set mouse=a	" myszka w konsoli
endif
"}}}

""""""""""""""""""" KLAWISZOLOGIA: """"""""""""""""""""""""""""""""""{{{
map		<Leader>o	!python -m json.tool<CR>
map		gb				:bnext<CR>
map		gB				:bprevious<CR>
map		<C-B>				:!php -l %<CR>		" sprawdzanie składni PHP
nnoremap	<silent><F8>			:Tlist<CR>		" Tag List
map		<leader><leader>		[{V%zf			" \\ wewnatrz bloku {} tworzy fold i go zamyka
inoremap	<C-space>				<C-R>=InsertTabWrapper("backward")<CR>
inoremap	<S-Tab>				<C-R>=InsertTabWrapper("forward")<CR>
map		<Leader>b			GoZ<ESC>:g/^$/.,/./-j<CR>Gdd			" Collapse multiple contiguous empty lines into a single line
map		<Leader>n			GoZ<ESC>:g/^[ <Tab>]*$/.,/[^ <Tab>]/-j<CR>Gdd	" Collapse multiple contiguous blank lines into a single line
"map		<Leader>c			:%s/[[:cntrl:]]/\r/g				" Replace control characters with a new line separator
map		<Leader>d			:%s/[<Char-128>-<Char-255>]//g			" Delete extended characters (128-255)
map		<Leader>e			:%s/\(.*[^ ][^ ]*\)  *$/\1/c			" Remove trailing spaces at the end of a line
"map		<Leader>f			:%s/^  *\(.*\)/\1/c				" Remove leading spaces at the beginning of a line
map		<Leader>g			:%s/   */ /gc					" Collapse multiple contiguous spaces into a single space
map		<C-W><C-F>			<ESC>:FirstExplorerWindow<CR>
map		<C-W><C-B>			<ESC>:BottomExplorerWindow<CR>
map		<C-W><C-T>			<ESC>:WMToggle<CR>
map		<F9>				:Gstatus<CR>
map		<C-Left>				:tabprevious<CR>
map		<C-Right>				:tabnext<CR>
"map		<C-T>				:tabnew<CR>
" szukanie we wszystkich plikach:
nmap		<F3>				:while !search( @/, "W") \| bnext \| endwhile<CR>
" szukaj zaznaczonego tekstu z '*' i '#' (a nie tylko wyrazu pod kursorem):
vnoremap	*				y/<C-R>"<CR>
vnoremap	#				y?<C-R>"<CR>
" wyszukiwanie TYLKO w zaznaczonym fragmencie:
vnoremap	/				<ESC>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap	?				<ESC>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
" Make shift-insert work like in Xterm:
map		<S-Insert>			<MiddleMouse>
map!		<S-Insert>			<MiddleMouse>
" nie trać zaznaczenia przy < i >
noremap		<				<gv
noremap		>				>gv
if version >= 700
	map		<silent><C-W>N			<ESC>:tabnew<CR>
	imap		<silent><C-W>N			<ESC>:tabnew<CR>
	"map		<silent><C-W><backspace><backspace>	<ESC>:e #<CR>
	"imap		<silent><C-W><backspace><backspace>	<ESC>:e #<CR>
	" sprawdzanie pisowni
	"map		<F7>				:w<CR>:!ispell -x -d polish %<CR><CR>:e<CR><CR>
	map		<silent><F7>			:setlocal spell!<CR>
	imap		<silent><F7>			<ESC>:setlocal spell!<CR>
	" przemieszczanie zakładek (tabów) kombinacją ALT+, ALT+.
	nn <silent> <M-.> :if tabpagenr() == tabpagenr("$")\|tabm 0\|el\|exe "tabm ".tabpagenr()\|en<CR>
	nn <silent> <M-,> :if tabpagenr() == 1\|exe "tabm ".tabpagenr("$")\|el\|exe "tabm ".(tabpagenr()-2)\|en<CR>
endif
"}}}

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""" FUNKCJE: """"""""""""""""""""""""""""""""""""""""{{{
" tekst po zwinięciu zakładki:
function! MojFoldText()
	let linia = getline(v:foldstart)
	let linia = substitute(linia, '/\*\|\*/\|{{{\d\=\|//\|<!--\|-->', '', 'g')	"}}}
	return v:folddashes.' '.v:foldend.' (ZWINIĘTO: '.(v:foldend-v:foldstart+1).') '.linia
endfunction

function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	" new | r # | normal 1Gdd - for horizontal split
	vnew | r # | normal 1Gdd
	diffthis
	execute "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
command! Diff call s:DiffWithSaved()


" TIP #1149: Returns either the contents of a fold or spelling suggestions.
if version >= 700
function! BalloonExpr()
	let foldStart = foldclosed(v:beval_lnum )
	let foldEnd   = foldclosedend(v:beval_lnum)
	let lines = []
	" If we're not in a fold...
	if foldStart < 0
		" If 'spell' is on and the word pointed to is incorrectly spelled, the tool tip will contain a few suggestions.
		let lines = spellsuggest( spellbadword( v:beval_text )[ 0 ], 5, 0 )
	else
		let numLines = foldEnd - foldStart + 1
		" Up to 31 lines get shown okay; beyond that, only 30 lines are shown with ellipsis in between to indicate too much.
		" The reason why 31 get shown okay is that 30 lines plus one of ellipsis is 31 anyway...
		if ( numLines > 31 )
			let lines = getline( foldStart, foldStart + 14 )
			let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
			let lines += getline( foldEnd - 14, foldEnd )
		else
			let lines = getline( foldStart, foldEnd )
		endif
	endif
	return join( lines, has( "balloon_multiline" ) ? "\n" : " " )
endfunction
endif
"}}}

""""""""""""""""""" PLUGINY: """"""""""""""""""""""""""""""""""""""""{{{

" wczytaj ustawienia specyficzne dla danego komputera
if filereadable($HOME."/.vim/vimrc.local")
	source $HOME/.vim/vimrc.local
endif
" vim: fdm=marker

""""""""""""""""" MOJE: """"""""""""""""""""""""""""""{{{
set foldmethod=syntax
set foldenable
syn region foldBraces start=/{/ end=/}/ transparent fold
syn region foldJavadoc start=,/\*\*, end=,\*/, transparent fold keepend
set foldlevel=0
set foldnestmax=10
"}}


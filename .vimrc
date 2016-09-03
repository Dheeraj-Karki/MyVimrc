"Environmet Setting
"{
	" be iMproved, required
	set nocompatible              
	" required
	filetype off
	" This option forces Vim to source .vimrc file if it present in working directory, thus providing a place to store project-specific configuration.
	set exrc
	" This option will restrict usage of some commands in non-default .vimrc files; commands that write to file or execute shell commands are not allowed and map commands are displayed.
	set secure
	" set UTF-8 encoding
    syntax enable
    set encoding=utf-8
    set showcmd                     " display incomplete commands
    filetype plugin indent on       " load file type plugins + indentation

    " Whitespace
    set nowrap                      " don't wrap lines
    set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
    set expandtab                   " use spaces, not tabs (optional)
    set backspace=indent,eol,start  " backspace through everything in insert mode

    " Searching
    set hlsearch                    " highlight matches
    set incsearch                   " incremental searching
    set ignorecase                  " searches are case insensitive...
    set smartcase                   " ... unless they contain at least one capital letter
	set autoindent
	set smartindent
	set tabstop=4
	set shiftwidth=4
	set expandtab
	set textwidth=120
	syntax on
	set number
	set comments=sl:/*,mb:\ *,elx:\ */
"}

"VBundle Plugins Info
"{
	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'

	" The following are examples of different formats supported.
	" Keep Plugin commands between vundle#begin/end.
	" plugin on GitHub repo
	Plugin 'tpope/vim-fugitive'
	" plugin from http://vim-scripts.org/vim/scripts.html
	Plugin 'L9'
	" Git plugin not hosted on GitHub
	"Plugin 'git://git.wincent.com/command-t.git'
	" git repos on your local machine (i.e. when working on your own plugin)
	"Plugin 'file:///home/gmarik/path/to/plugin'
	" The sparkup vim script is in a subdirectory of this repo called vim.
	" Pass the path to set the runtimepath properly.
	Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	" Install L9 and avoid a Naming conflict if you've already installed a
	" different version somewhere else.
	Plugin 'ascenator/L9', {'name': 'newL9'}

	"Other Plugin Install
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'nanotech/jellybeans.vim'
	Plugin 'majutsushi/tagbar'
	Plugin 'scrooloose/nerdtree'
	Plugin 'scrooloose/nerdcommenter'
	Plugin 'Shougo/neocomplcache.vim'
	Plugin 'c9s/perlomni.vim'
    Plugin 'terryma/vim-multiple-cursors'

	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required
	" To ignore plugin indent changes, instead use:
	"filetype plugin on
	"
	" Brief help
	" :PluginList       - lists configured plugins
	" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
	" :PluginSearch foo - searches for foo; append `!` to refresh local cache
	" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
	"
	" see :h vundle for more details or wiki for FAQ
	" Put your non-Plugin stuff after this line

"}

"NERDTree Plugin Specific Setting
"{
	autocmd vimenter * :NERDTree
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | :NERDTree | endif
    silent! nmap <F2> :NERDTreeToggle<CR>
    silent! map <F3> :NERDTreeFind<CR>

    let g:NERDTreeMapActivateNode="<F3>"
    let g:NERDTreeMapPreview="<F4>"
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"}

"VimAirLine plugin Specific Setting
"{
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'
	function! AccentDemo()
  	let keys = ['a','b','c','d','e','f','g','h']
  	for k in keys
    		call airline#parts#define_text(k, k)
	endfor
  	call airline#parts#define_accent('a', 'red')
  	call airline#parts#define_accent('b', 'green')
  	call airline#parts#define_accent('c', 'blue')
  	call airline#parts#define_accent('d', 'yellow')
  	call airline#parts#define_accent('e', 'orange')
  	call airline#parts#define_accent('f', 'purple')
  	call airline#parts#define_accent('g', 'bold')
  	call airline#parts#define_accent('h', 'italic')
  	let g:airline_section_a = airline#section#create(keys)
	endfunction
	"autocmd VimEnter * call AccentDemo()
"}



"jellybeans plugin Specific Setting
"{
	let g:jellybeans_overrides = {
	\    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
	\              'ctermfg': 'Black', 'ctermbg': 'Yellow',
	\              'attr': 'bold' },
	\    'Comment': { 'guifg': 'cccccc' },
	\    'background': { 'guibg': '000000' , 'ctermbg': 'none', '256ctermbg': 'none' },
	\}
	let g:jellybeans_use_lowcolor_black = 0
	autocmd vimenter * : color jellybeans
"}

"tagbar Plugin Specific Setting
"{
	nmap <F8> :TagbarToggle<CR>
"}

"Auto Complete Specific Setting
"{
	"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" Use neocomplcache.
	let g:neocomplcache_enable_at_startup = 1
	" Use smartcase.
	let g:neocomplcache_enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplcache_min_syntax_length = 3
	let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

	" Enable heavy features.
	" Use camel case completion.
	"let g:neocomplcache_enable_camel_case_completion = 1
	" Use underbar completion.
	"let g:neocomplcache_enable_underbar_completion = 1

	" Define dictionary.
	let g:neocomplcache_dictionary_filetype_lists = {
    		\ 'default' : '',
    		\ 'vimshell' : $HOME.'/.vimshell_hist',
    		\ 'scheme' : $HOME.'/.gosh_completions'
       	 	\ }

	" Define keyword.
	if !exists('g:neocomplcache_keyword_patterns')
    		let g:neocomplcache_keyword_patterns = {}
	endif
	let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplcache#undo_completion()
	inoremap <expr><C-l>     neocomplcache#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
  		return neocomplcache#smart_close_popup() . "\<CR>"
  	" For no inserting <CR> key.
  	"return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplcache#close_popup()
	inoremap <expr><C-e>  neocomplcache#cancel_popup()
	" Close popup by <Space>.
	inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

	" For cursor moving in insert mode(Not recommended)
	"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
	"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
	"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
	"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
	" Or set this.
	"let g:neocomplcache_enable_cursor_hold_i = 1
	" Or set this.
	"let g:neocomplcache_enable_insert_char_pre = 1

	" AutoComplPop like behavior.
	"let g:neocomplcache_enable_auto_select = 1

	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplcache_enable_auto_select = 1
	"let g:neocomplcache_disable_auto_complete = 1
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" Enable heavy omni completion.
	if !exists('g:neocomplcache_force_omni_patterns')
  		let g:neocomplcache_force_omni_patterns = {}
	endif
	let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
	let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

	" For perlomni.vim setting.
	" https://github.com/c9s/perlomni.vim
	let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!

"}

"Shift Tab
"{
    nnoremap <Tab> >>_
    nnoremap <S-Tab> <<_
    inoremap <S-Tab> <C-D>
    vnoremap <Tab> >gv
    vnoremap <S-Tab> <gv
"}

"Ctrl-P: Find the File
"{
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
"}

"Tab Navigation
"{
    map  <C-Tab> :tabn<CR>
    map  <C-S-Tab> :tabp<CR>
    map  <C-n> :tabnew<CR>
"}

"File Handling Shortcut Key
"{
    "Ctrl-S
    "{
        noremap <C-S> :update<CR>
        vnoremap <C-S> <C-C>:update<CR>
        inoremap <C-S> <C-O>:update<CR>
        vmap <C-s> <esc>:w<CR>gv
    "}
    "Undo-Redo
    "{
        inoremap <c-u> <esc>u<CR>gv
    "}
    "Copy and Paste
    "{
        vmap <C-c> "+yi
        vmap <C-x> "+c
        vmap <C-v> c<ESC>"+p
        imap <C-v> <ESC>"+pa
    "}
    "Selection
    "{
        " activate visual mode in normal mode
        nmap <S-Up> V
        nmap <S-Down> V
        " these are mapped in visual mode
        vmap <S-Up> k
        vmap <S-Down> j
        " 
        "   these are mapped in insert mode
        vmap <S-Up> <esc>V<CR>gv 
        "
        " etc...
        " similarly <S-Left>, <S-Right> for v   
    "}
"}

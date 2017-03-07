"------------vUNDLE- SETTING-------------------
set nocompatible              " be iMproved, required
so /home/zohar/.vim/plugins.vim
"--------------------display setting---------------------
nnoremap ,p :e /home/zohar/.vim/plugins.vim<cr>
syntax enable
set number
set cursorline
set t_Co=256
set background=dark
set guioptions-=e
set guioptions-=m
set guioptions-=g
set guioptions-=l
set guioptions-=r
set guioptions-=b
set foldcolumn=1
hi CursorLine cterm=NONE
hi TabLine ctermbg=NONE cterm=NONE ctermfg=grey
hi TabLineFill ctermbg=NONE cterm=NONE ctermfg=NONE
hi foldcolumn ctermbg=NONE
hi LineNr ctermfg=DarkCyan
hi vertsplit cterm=bold
hi NonText ctermfg=DarkCyan
hi Conceal ctermfg=7 ctermbg=6
hi Visual ctermfg=7 ctermbg=6
hi Folded ctermfg=7 ctermbg=NONE
hi CursorColumn ctermfg=7 ctermbg=None
hi SignColumn ctermfg=7 ctermbg=None
"------------grammar setting-----------------"
set autoindent
set cindent
set ts=4
set softtabstop=4
set shiftwidth=4
let mapleader="\<Space>"
set backspace=indent,eol,start
"----------------syntastic setting-----------------
nnoremap <leader>k  :SyntasticCheck<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list =1 
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5
"let g:syntastic_mode_map = { "mode": "active"}
let g:syntastic_cpp_compiler = 'g++'  
let g:syntastic_cpp_compiler_options ='-std=c++11 -stdlib=libc++'
"------------search setting------------------
set hlsearch
set incsearch
nnoremap <leader><space> :nohlsearch<cr>
"------------vinegar setting------------------
let g:netrw_hide=1
"------------ctags setting------------------
nnoremap <leader>f :tag<space>
nnoremap <leader>mt :!ctags -R *<cr> 
"------------ctrlP setting------------------
nnoremap <C-P> :CtrlP<cr>
nnoremap <C-B> :CtrlPBuffer<cr>
nnoremap <C-R> :CtrlPMRU<cr>
let g:ctrlp_show_hidden=1
nnoremap rr <C-R>
"------------split management------------------"
set splitbelow
set splitright
nnoremap j <C-W><C-J> 
nnoremap h <C-W><C-H> 
nnoremap k <C-W><C-K> 
nnoremap l <C-W><C-L> 
nnoremap x <C-W>c
"------------configuration------------------"
inoremap {<cr> {<cr>}<esc>O
nnoremap ; :
nnoremap : ;
set showmatch
set whichwrap=b,s,<,>,[,]
nnoremap <silent> p p`]
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap 1 ^
nnoremap 4 $
inoremap 1 <Esc>^i
inoremap 4 <Esc>$a
nnoremap 2 <C-U>
nnoremap 3 <C-D> 
inoremap 2 <C-[><C-U>
inoremap 3 <C-[><C-D>
nnoremap r <C-^>
nnoremap <C-I> <PageUp>
noremap [ <Esc>
nnoremap dq db
nnoremap de dw
inoremap <C-W> <C-[>diwxi
nnoremap dw  diwx
noremap q <Esc>
set timeoutlen=500
nnoremap q <Esc>
nnoremap Q <Esc>
nnoremap <leader>rec q
noremap [ <Esc>
nnoremap ,v :tabedit $MYVIMRC<cr>
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
nnoremap u ddkP
nnoremap d ddp
vnoremap <CR> G
vnoremap <BS> gg
set noerrorbells visualbell t_vb=
set complete=.
set autowriteall 
set autowrite
"-------------tabs setting--------------"
nnoremap t :tabnew<cr>
nnoremap w :tabp<cr>
nnoremap e :tabn<cr>
nnoremap c :tabclose<cr>
"-------------NerdTree Setting------------"
noremap ` :NERDTreeToggle<cr>
let NERDTreeHijackNetrw=0
"-------------greplace Setting-------------
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'
nnoremap <leader>s :Gsearch<cr>
"--------------------vim-airline---------------------
set laststatus=0
"-------------snipmate Setting-------------
nnoremap ,cpp :tabedit /home/zohar/.vim/bundle/vim-snippets/snippets/cpp.snippets<cr>
nnoremap ,vim :tabedit /home/zohar/.vim/bundle/vim-snippets/snippets/vim.snippets<cr>
nnoremap ,cc :tabedit /home/zohar/.vim/bundle/vim-snippets/snippets/c.snippets<cr>
"--------------------one-key compile&run---------------------
func! CompileGcc()
	exec "w"
	let  compilecmd = "!gcc "
	let compileflag = "-o %< "
	if search("mpi\.h") != 0
		let compilecmd = "!mpicc "
	endif
	if search("glut\.h") != 0
		let compileflag . = " -lglut -lGLU -lGL "
	endif
	if search("cv\.h") != 0
		let compileflag . = " -lcv -lhighgui -lcvaux "
	endif
	if search("omp\.h") != 0
		let compileflag . = " -fopenmp "
	endif
	if search("math\.h") != 0
		let compileflag . = " -lm "
	endif
	exec compilecmd." % ".compileflag." 2>&1 |tee ~/bug"
endfunc
func! CompileGpp()
	exec "w"
	let compilecmd = "!g++ -std=c++11"
	let compileflag = "-o %< "
	if search("mpi\.h") != 0
		let compilecmd = "!mpic++ "
	endif
	if search("glut\.h") != 0
		let compileflag . = " -lglut -lGLU -lGL "
	endif
	if search("cv\.h") != 0
		let compileflag . = " -lcv -lhighgui -lcvaux "
	endif
	if search("omp\.h") != 0
		let compileflag . = " -fopenmp "
	endif
	if search("cmath") != 0
		let compileflag . = " -lm "
	endif
	exec compilecmd." % ".compileflag." 2>&1 |tee ~/bug"
endfunc

func! RunPython()
	exec "!python3 %"." 2>&1 |tee ~/bug"
endfunc
func! CompileJava()
	exec "!javac %"." 2>&1 |tee ~/bug"
endfunc


func! CompileCode()
	exec "w"
	if &filetype == "cpp"
		exec "call CompileGpp()"
	elseif &filetype == "c"
		exec "call CompileGcc()"
	elseif &filetype == "python"
		exec "call RunPython()"
	elseif &filetype == "java"
		exec "call CompileJava()"
	endif
endfunc

func! RunResult()
	exec "w"
	if search("mpi\.h") != 0
		exec "!mpirun -np 4 ./%<"
	elseif &filetype == "cpp"
		exec "! ./%<"
	elseif &filetype == "c"
		exec "! ./%<"
	elseif &filetype == "python"
		exec "call RunPython"
	elseif &filetype == "java"
		exec "!java %<"
	endif
endfunc

noremap 5 :call CompileCode()<CR>
inoremap 5 <ESC>:call CompileCode()<CR>
noremap 6 :call RunResult()<CR>
"--------------------debug---------------------
nnoremap ,b :e ~/bug<CR>
"-------------------copy code to windows---------------------
nnoremap <leader>cp :exec ":w! /mnt/c/linux/".expand("%:t")<CR>



"                __     ___
"  _ __   ___  __\ \   / (_)_ __ ___  _ __ ___
" | '_ \ / _ \/ _ \ \ / /| | '_ ` _ \| '__/ __|
" | | | |  __/ (_) \ V / | | | | | | | | | (__
" |_| |_|\___|\___/ \_/  |_|_| |_| |_|_|  \___|
"

let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins                                    				 	 '
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'                       " Parentheses, brackets, quotes, XML tags, and more
Plug 'junegunn/goyo.vim'                        " Distraction free writing in vim
Plug 'PotatoesMaster/i3-vim-syntax'             " Vim plugin for i3 wm syntax
Plug 'lukesmithxyz/vimling'                     " Luke's vim helpers
Plug 'vimwiki/vimwiki'                          " Create a personal wiki from vim
Plug 'bling/vim-airline'                        " Lean & mean status/tabline for vim
Plug 'tpope/vim-commentary'                     " Comment things out
Plug 'kovetskiy/sxhkd-vim'                      " Vim plugin that allows use of vim as a file picker
Plug 'preservim/nerdtree'                       " File browser in vim
Plug 'jreybert/vimagit'                         " git handler for vim
Plug 'vim-airline/vim-airline-themes'           " Themes for airline
Plug 'python-mode/python-mode'                  " Python mode (docs, refactor, lints...)
Plug 'scrooloose/syntastic'                     " Syntax checking plugin for Vim
Plug 'Lokaltog/powerline'                       " Powerline fonts plugin
Plug 'jiangmiao/auto-pairs'                     " Auto-pair brackets
Plug 'tmhedberg/SimpylFold'                     " Code Folding
Plug 'nathanaelkane/vim-indent-guides'          " Indentation guides
Plug 'mitsuhiko/vim-sparkup'                    " Sparkup(XML/jinja/htlm-django/etc.) support
Plug 'Rykka/riv.vim'                            " ReStructuredText plugin
Plug 'airblade/vim-gitgutter'                   " Shows line changes when working in git
Plug 'kien/ctrlp.vim'                           " Fast transitions on project files
Plug 'terryma/vim-multiple-cursors'             " Add multiple cursors for chaging text on many lines.
Plug 'dhruvasagar/vim-table-mode'               " Tables for vim
Plug 'pangloss/vim-javascript'                  " Syntax highlighting for JavaScript.
Plug 'sheerun/vim-polyglot'                     " Syntax highlighting for 100 languages
Plug 'mattn/emmet-vim'                          " HTML support for vim
Plug 'alvan/vim-closetag'                       " Close HTML Tags
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion
Plug 'zxqfl/tabnine-vim'                        "Tabnine ML Autocomple
Plug 'Yggdroot/indentLine'                      " Indentation Guides
Plug 'ap/vim-css-color'                         " Color previewing in Vim
Plug 'easymotion/vim-easymotion'                " Easymotion, easily move in lines
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " Markdown preview

call plug#end()

set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus

" Indents word-wrapped lines as much as the 'parent' line
set breakindent

" Ensures word-wrap does not split words
set formatoptions=1
set lbr

" Buffers in NeoVim
map <leader>nb :bNext<CR>
map <leader>fb :bfirst<CR>
map <leader>lb :blast<CR>

" Tabs in NeoVim
map <leader>ot :tabnew<CR>
map <leader>n :tabnext<CR>
map <leader>nt :tabnext<CR>
map <leader>p :tabprevious<CR>
map <leader>pt :tabprevious<CR>
map <leader>ft :tabfirst<CR>
map <leader>lt :tablast<CR>
map <leader>ct :tabclose<CR>
map <leader>tf :tabfind<CR>

" lf
  map <leader>lf :lf<CR>

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber

" Enable autocompletion:
	set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" mattn/emmet-vim
	let g:user_emmet_leader_key='<C-m>' " Ctrl+m+,

" vim-indentation-guides settings:
	set ts=2 sw=2 et

" vimling:
	nm <leader>d :call ToggleDeadKeys()<CR>
	imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader>i :call ToggleIPA()<CR>
	imap <leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader>q :call ToggleProse()<CR>

" airline settings:
	" let g:airline_theme='bubblegum'
	" let g:airline_theme='gruvbox'
	let g:airline_theme='angr'
	" let g:airline_theme='deus'
	" let g:airline_theme='distinguished'
	" let g:airline_theme='badwolf'
	let g:airline#extensions#tabline#enabled=1
	let g:airline#extensions#tabline#formatter='unique_tail'
	let g:airline_powerline_fonts=1

" python executables for different plugins
	let g:pymode_python='python3'
	let g:syntastic_python_python_exec='python3'

" rope
	let g:pymode_rope=0
	let g:pymode_rope_completion=0
	let g:pymode_rope_complete_on_dot=0
	let g:pymode_rope_auto_project=0
	let g:pymode_rope_enable_autoimport=0
	let g:pymode_rope_autoimport_generate=0
	let g:pymode_rope_guess_project=0

" documentation
	let g:pymode_doc=0
	let g:pymode_doc_bind='K'

" lints
	let g:pymode_lint=0

" virtualenv
	let g:pymode_virtualenv=1

" breakpoints
	let g:pymode_breakpoint=1
	let g:pymode_breakpoint_key='<leader>b'

" syntax highlight
	let g:pymode_syntax=1
	let g:pymode_syntax_slow_sync=1
	let g:pymode_syntax_all=1
	let g:pymode_syntax_print_as_function=g:pymode_syntax_all
	let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
	let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
	let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
	let g:pymode_syntax_highlight_self=g:pymode_syntax_all
	let g:pymode_syntax_indent_errors=g:pymode_syntax_all
	let g:pymode_syntax_string_formatting=g:pymode_syntax_all
	let g:pymode_syntax_space_errors=g:pymode_syntax_all
	let g:pymode_syntax_string_format=g:pymode_syntax_all
	let g:pymode_syntax_string_templates=g:pymode_syntax_all
	let g:pymode_syntax_doctests=g:pymode_syntax_all
	let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
	let g:pymode_syntax_builtin_types=g:pymode_syntax_all
	let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
	let g:pymode_syntax_docstrings=g:pymode_syntax_all

" highlight 'long' lines (>= 80 symbols) in python files
	augroup vimrc_autocmds
	    autocmd!
	    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
	    autocmd FileType python,rst,c,cpp match Excess /\%131v.*/
	    " autocmd FileType python,rst,c,cpp set nowrap
	    autocmd FileType python,rst,c,cpp set colorcolumn=130
	augroup END

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=5
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'
let g:syntastic_python_checkers=['flake8', 'pydocstyle', 'python']

" COC Settings
  let g:coc_global_extensions = [
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-jedi',
    \ 'coc-tabnine',
    \ 'coc-sh',
    \ 'coc-tsserver',
    \ 'coc-texlab',
    \ 'coc-markdownlint',
    \ 'coc-phpls',
    \ ]

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Navigating with guides
	inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	map <leader><leader> <Esc>/<++><Enter>"_c4l

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
"  let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	let g:vimwiki_list = [{'path': '~/doc/wiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writting
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Have dwmblocks automatically recompile and run when you edit the file
autocmd BufWritePost */dwmblocks/config.h !sudo make install && { killall -q dwmblocks;setsid dwmblocks & }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"				      HTML					 '
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 	autocmd FileType html inoremap ,/ <!-- <++> --><Esc>3b
 	autocmd FileType html inoremap ,x <Enter><Space><Esc>a
 	autocmd FileType html inoremap ,z <Enter><Space><Enter><Esc>kla<Space>
	autocmd FileType html inoremap ,a <a<Space>target="<++>"<Space>href="<++>"><++></a><++><Esc>7b
	autocmd FileType html inoremap ,ab <abbr<Space>title=""><++></abbr><Space><++><Esc>14hi
	autocmd FileType html inoremap ,ar <article><Enter><Space><++><Enter></article><Enter><++><Esc>6ba
	autocmd FileType html inoremap ,b <b></b><Esc>2ba
	autocmd FileType html inoremap ,br <br><++><Esc>4ha
	autocmd FileType html inoremap ,bu <button type="<++>" name="<++>"><++></button><Esc>6b
	autocmd FileType html inoremap ,cl class=""<Esc>1i
	autocmd FileType html inoremap ,di <div><Enter><Space><++><Enter></div><Enter><++><Esc>6bi
	autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><Enter><++><Esc>2ka<Tab><Tab>
	autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,em <em></em><Space><++><Esc>FeT>i
	autocmd FileType html inoremap ,fm <form name="<++>" class="<++>" action="<++>" method="<++>"><++><Enter><++><Enter></form><Enter><++><Esc>14b
	autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
	autocmd FileType html inoremap ,hr <hr><Enter><++><Esc>a
	autocmd FileType html inoremap ,head <header><Enter><Space><++><Enter></header><Enter><++><Esc>6ba
	autocmd FileType html inoremap ,i <i></i><Esc>2ba
	autocmd FileType html inoremap ,id id=""<Esc>1i
	autocmd FileType html inoremap ,im <img src="<++>" alt="<++>"><++><Esc>5b
	autocmd FileType html inoremap ,in <input type="<++>" name="<++>" value="<++>" placeholder="<++>" required><++><Esc>11b
 	autocmd FileType html inoremap ,lab <label for="<++>" form"<++>"><++></label><++><Esc>7b
	autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
	autocmd FileType html inoremap ,lk <link rel="<++>" type="<++>" href="<++>"><++><Esc>7b
	autocmd FileType html inoremap ,lkcs <link rel="stylesheet" type="text/css" href="<++>"><++><Esc>13b
	autocmd FileType html inoremap ,ma <main><Enter><Space><++><Enter></main><Enter><++><Esc>6ba
	autocmd FileType html inoremap ,nav <nav><Enter><Space><++><Enter></nav><Enter><++><Esc>6ba
	autocmd FileType html inoremap ,ol <ol type=""><Enter><li></li><Enter></ol><Enter><++><Esc>2k3w5ha
	autocmd FileType html inoremap ,op <Esc>o<option value="<++>"><++></option><Esc>F>3b
	autocmd FileType html inoremap ,p <p></p><Enter><++><Esc>ki
	autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
	autocmd FileType html inoremap ,sc <script type="text/javascript"></script><Enter><++><Esc>4bla
	autocmd FileType html inoremap ,se <script type="text/javascript"> src="" charset="uft-8"></script><Enter><++><Esc>10b1la
	autocmd FileType html inoremap ,sec <section><Enter><Space><++><Enter></section><Enter><++><Esc>6ba
	autocmd FileType html inoremap ,sel <select class="<++>" name="<++>"><++><Enter><++><Enter></select><Enter><++><Esc>10b
	autocmd FileType html inoremap ,sp <span></span><++><Esc>3bi
	autocmd FileType html inoremap ,st <style type="text/css"><Enter><Tab><Tab><++><Enter></style><Enter><++><Esc>3k3l
	autocmd FileType html inoremap ,str <strong><++></strong><++><Esc>3ba
	autocmd FileType html inoremap ,ta <textarea name="<++>" rows="<++>" cols="<++>" placeholder="<++>"><++></textarea><Enter><++><Esc>12b
	autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
	autocmd FileType html inoremap ,tbd <tbody><Enter><++><Enter></tbody><Enter><++><Esc>6b
	autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
	autocmd FileType html inoremap ,tft <tfoot><Enter><++><Enter></tfoot><Enter><++><Esc>6b
	autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
	autocmd FileType html inoremap ,thd <thead><Enter><++><Enter></thead><Enter><++><Esc>6b
	autocmd FileType html inoremap ,tr <tr><Enter><++><Enter></tr><Enter><++><Esc>6b
	autocmd FileType html inoremap ,ul <ul><Enter><Space><li></li><Enter></ul><Enter><++><Esc>2k3la
	autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
	autocmd FileType html inoremap ,1 <h1></h1><Enter><++><Esc>ka
	autocmd FileType html inoremap ,2 <h2></h2><Enter><++><Esc>ka
	autocmd FileType html inoremap ,3 <h3></h3><Enter><++><Esc>ka
	autocmd FileType html inoremap ,4 <h4></h4><Enter><++><Esc>ka
	autocmd FileType html inoremap ,5 <h5></h5><Enter><++><Esc>ka
	autocmd FileType html inoremap ,6 <h6></h6><Enter><++><Esc>ka
	autocmd FileType html inoremap ,lo Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<++><Esc>79b

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"				      CSS					 '
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
	autocmd FileType css inoremap ,c1 h1<Tab>{<Enter><Backspace><++><Enter>}<Enter><Enter><++><Esc>6bi
	autocmd FileType css inoremap ,c2 h2<Tab>{<Enter><Backspace><++><Enter>}<Enter><Enter><++><Esc>6bi
	autocmd FileType css inoremap ,c3 h3<Tab>{<Enter><Backspace><++><Enter>}<Enter><Enter><++><Esc>6bi
	autocmd FileType css inoremap ,c4 h4<Tab>{<Enter><Backspace><++><Enter>}<Enter><Enter><++><Esc>6bi
	autocmd FileType css inoremap ,c5 h5<Tab>{<Enter><Backspace><++><Enter>}<Enter><Enter><++><Esc>6bi
	autocmd FileType css inoremap ,c6 h6<Tab>{<Enter><Backspace><++><Enter>}<Enter><Enter><++><Esc>6bi
	autocmd FileType css inoremap ,cp p<Tab>{<Enter><Backspace><++><Enter>}<Enter><Enter><++><Esc>6bi
	autocmd FileType css inoremap ,dec  <++><Tab>{<Enter><Backspace><++><Enter>}<Enter><Enter><++><Esc>6bi
	autocmd FileType css inoremap ,ccl .<++><Tab>{<Enter><Backspace><++><Enter>}<Enter><Enter><++><Esc>6ba
	autocmd FileType css inoremap ,cid #<++><Tab>{<Enter><Backspace><++><Enter>}<Enter><Enter><++><Esc>6ba

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"				    MARKDOWN					 '
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	" autocmd Filetype markdown,rmd inoremap ,/ <!-- <++> --><Esc>0
	" autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	" autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
	" autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	" autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	" autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	" autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	" autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	" autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	" autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	" autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
	" autocmd Filetype markdown,rmd inoremap ,4 ####<Space><Enter><++><Esc>kA
	" autocmd Filetype markdown,rmd inoremap ,5 #####<Space><Enter><++><Esc>kA
	" autocmd Filetype markdown,rmd inoremap ,6 ######<Space><Enter><++><Esc>kA
	" autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
	" autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	" autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
	" autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

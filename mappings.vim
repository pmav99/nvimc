" Modeline and notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

" Moving around {
  " Easier moving in tabs and windows
  nnoremap <C-J> <C-W>j<C-W>_
  nnoremap <C-K> <C-W>k<C-W>_
  nnoremap <C-L> <C-W>l<C-W>_
  nnoremap <C-H> <C-W>h<C-W>_
  " When moving stay in the middle of the window.
  nnoremap g; g;zz
  nnoremap g, g,zz
  nnoremap <c-o> <c-o>zz
  " It's 2012.
  noremap j gj
  noremap k gk
  noremap gj j
  noremap gk k
" Moving around }

" Insert empty line above or below while staying in normal mode
nnoremap <leader>o :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <leader>O :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

"Split line (sister of [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing
"nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Clipboard {
  noremap <leader>y "*y
  noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
  noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>
  vnoremap <leader>y "*ygv
  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$
" Clipboard }

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h

" Some helpers to edit mode : http://vimcasts.org/e/14
" %% : Expands directory of the current file to the command line
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Swap ; and :  Convenient.
" Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :

" Save file (works in greek layout too!)
"inoremap <leader>w <c-o>:w<CR>
"inoremap <leader>ς <c-o>:w<CR>
"nnoremap <leader>w :w
"nnoremap <leader>ς :w
"vnoremap <leader>w <esc>:w<CR>gv
"vnoremap <leader>ς <esc>:w<CR>gv

" map F1 (help) to esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <leader>u :syntax sync fromstart<cr>:redraw!<cr>         " Redraw screen

"nnoremap <Leader>= <C-w>=        " Adjust viewports to the same size


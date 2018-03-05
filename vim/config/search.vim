" Find the next match as we type the search
set incsearch
" Highlight searches by default
set hlsearch
" Ignore case
set ignorecase
" Override 'ignorecase' option if the search contains upper case characters.
set smartcase

" Clear search
map <silent><Leader>/ :nohls<CR>

" Search for selected text, forwards or backwards.
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Highlight word at cursor without changing position
map <silent> <Leader>h :
  \:let view=winsaveview()<CR>
  \*
  \:call winrestview(view)<CR>
vmap <silent> <Leader>h :
  \:<C-U>let view=winsaveview()<CR>
  \gv*
  \:<C-U>call winrestview(view)<CR>

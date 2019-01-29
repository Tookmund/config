set background=dark

" Show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Tabs are 4 spaces
set ts=4
set sw=4

set colorcolumn=80

set nohlsearch

set spelllang=en_us

set clipboard=unnamedplus

" Show status line
set laststatus=2
set background=dark
colorscheme solarized

syntax on

" Json
set conceallevel=0

" Path
set path+=**

set noerrorbells

set backupdir=~/.cache
set directory=~/.cache
set mouse=a

set shell=/bin/bash

set nowrap
set encoding=utf-8
set number relativenumber " set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set pastetoggle=<F2>

set ai "Auto indent
" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
" Handle bracket
inoremap {<CR> {<CR>}<Esc>O<TAB>
" indentation mapping
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" better search and replace for
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Faster exit and write
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Search while tyging
set incsearch

" Turn on the WiLd menu
set wildmenu

" tryhard mode no arrow for you!
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'itchyny/lightline.vim'

Plugin 'ericcurtin/CurtineIncSw.vim'
map <leader>c :call CurtineIncSw()<CR>

Plugin 'davidhalter/jedi-vim'
autocmd FileType python let g:jedi#auto_initialization = 1
autocmd FileType python let g:jedi#auto_vim_configuration = 1
autocmd FileType python let g:jedi#use_tabs_not_buffers = 1
autocmd FileType python let g:jedi#use_splits_not_buffers = "left"
autocmd FileType python setlocal completeopt-=preview

Plugin 'scrooloose/nerdtree'
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\~$', '^\.git', '\.swp$', '\.DS_Store$']
let NERDTreeShowHidden=1
nmap <leader>nt :NERDTreeToggle<cr>

Plugin 'L9'

Plugin 'mileszs/ack.vim'

Plugin 'Raimondi/delimitMate'

Plugin 'Kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'

Plugin 'xuhdev/vim-latex-live-preview'
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'mupdf'

Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
" let g:cpp_class_decl_highlight = 1

Plugin 'majutsushi/tagbar'
nmap <leader>tb :TagbarToggle<CR>

Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>f :YcmCompleter FixIt<CR>
map <leader>t :YcmCompleter GetType<CR>
map <leader>d :YcmCompleter GetDoc<CR>
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
let g:ycm_semantic_triggers = {}
" let g:ycm_semantic_triggers.php =
" \ ['->', '::', '(', 'use ', 'namespace ', '\']

Plugin 'tpope/vim-surround'

call vundle#end()

" asm config
autocmd FileType asm set ft=nasm

"Tab settings
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" build tags
map <leader>mt :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" cscope settings
if has('cscope')
  " add cscope file auto 
  if filereadable("cscope.out")
      cs add cscope.out
  endif

  set cscopeverbose

  nmap <C-[>h :cs help<CR>
  nmap <C-[>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-[>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-[>a :cs find a <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-[>d :cs find d <C-R>=expand("<cword>")<CR><CR>	
endif

" Fish cpp
autocmd Filetype c,cpp setlocal comments^=:///

" File browsing
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_listtyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()

" templates
nnoremap ,pyh :-1read $HOME/.vim/templates/python_header.txt<CR>3jwf>a
nnoremap ,cpph :-1read $HOME/.vim/templates/cpp_header.txt<CR>3jwf>a

" Add line empty line
nmap ]<Space> m`o<Esc>``
nmap [<Space> m`O<Esc>``


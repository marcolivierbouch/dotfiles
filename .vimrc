" Show status line
set rtp+=~/.local/lib/python3.6/site-packages/powerline/bindings/vim/
set laststatus=2

" Json
set conceallevel=0

set path+=**

set noerrorbells

" set noswapfile
" set nowb
set backupdir=~/.cache
set directory=~/.cache
set mouse=a

set ai "Auto indent

set nowrap
set encoding=utf-8
set number relativenumber " set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set pastetoggle=<F2>

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

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
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Raimondi/delimitMate'
Plugin 'Kien/ctrlp.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'ddrscott/vim-side-search'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'majutsushi/tagbar'
Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'elzr/vim-json'
Bundle 'Valloric/YouCompleteMe'

call vundle#end()

filetype plugin indent on

" latex settings
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'mupdf'

" Json config
let g:vim_json_syntax_conceal = 0

" asm config
autocmd FileType asm set ft=nasm

" jedi python
autocmd FileType python let g:jedi#auto_initialization = 1
autocmd FileType python let g:jedi#auto_vim_configuration = 1
autocmd FileType python let g:jedi#use_tabs_not_buffers = 1
autocmd FileType python let g:jedi#use_splits_not_buffers = "left"
autocmd FileType python setlocal completeopt-=preview

"Tab settings
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
set omnifunc=syntaxcomplete#Complete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"
" monokai
" let g:monokai_term_italic = 1
" let g:monokai_gui_italic = 1

" CTRLP settings
let g:ctrlp_working_path_mode = 'ra'

" NERDtree settings
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\~$', '^\.git', '\.swp$', '\.DS_Store$']
let NERDTreeShowHidden=1
nmap <leader>nt :NERDTreeToggle<cr>
" Tagbar
nmap <leader>tb :TagbarToggle<CR>

" NERD comments settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" C++ Sw
map <leader>s :call CurtineIncSw()<CR>

"http://vim.wikia.com/wiki/STL_help_using_tags_-_C%2B%2B_Standard_Template_Library

" Cpp highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1


let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.php =
\ ['->', '::', '(', 'use ', 'namespace ', '\']

" Angular ts
autocmd BufNewFile,BufRead *.ts set ft=typescript
autocmd BufNewFile,BufRead *.*.ts set ft=typescript

autocmd BufNewFile,BufRead *.ts set tabstop=2
autocmd BufNewFile,BufRead *.*.ts set shiftwidth=2
" Gif config
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Fish cpp
autocmd Filetype c,cpp setlocal comments^=:///

" Clang format config
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" colorscheme settings
" set termguicolors
set t_Co=16
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

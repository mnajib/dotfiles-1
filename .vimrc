" Hannu Hartikainen's init.vim / .vimrc.
" Rewritten (greatly simplified) in 2017.
"
" QUICK START:
"   :PlugUpdate | PlugUpgrade

" defaults I like
set softtabstop=4 shiftwidth=4 expandtab autoindent
set mouse=a

" interactive :substitute
if exists('+inccommand')
    set inccommand=nosplit
endif

" load Code::Stats API keys from a file excluded from git
runtime _secrets.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"
" Use vim-plug; see https://github.com/junegunn/vim-plug .
" Note: symlink ~/.config/nvim -> ~/.vim for NeoVim

call plug#begin('~/.vim/plugged')

" basic UI
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'         " Note: fzf should be installed globally
Plug 'vim-airline/vim-airline'

" language support
Plug 'sheerun/vim-polyglot'     " pretty much every language

" note-keeping: vimwiki
Plug 'vimwiki/vimwiki'

" code-stats-vim
"Plug '~/dev/code-stats-vim'    " local instance
Plug 'https://gitlab.com/code-stats/code-stats-vim.git'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN CONFIGS

""" fzf.vim
nmap <c-p> :Files<CR>
nmap <c-h> :Helptags<CR>
nmap <c-f> :Lines<CR>
nmap <c-b> :Buffers<CR>


""" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype', '%{CodeStatsXp()}'])


""" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM KEYBINDS
" inspired by https://amp.rs
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
nmap <Space> :Files<CR>
nmap Q :bdelete<CR>
" TODO: clever-f or even easymotion, once i get used to these

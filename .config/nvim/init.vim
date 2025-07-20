set number
set relativenumber
set tabstop=4
set background=dark
set splitbelow

autocmd VimEnter * NvimTreeOpen
autocmd VimEnter * wincmd p
autocmd BufEnter * if winnr('$') == 1 && &filetype == 'NvimTree' | quit | endif

syntax on
filetype on
filetype plugin indent on

call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mbbill/undotree'
Plug 'vimlab/split-term.vim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'

call plug#end()

lua << EOF
vim.opt.colorcolumn = nil

vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])

vim.api.nvim_set_hl(0, 'Normal',      { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu',       { bg = 'none' })

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "ruby", "rust", "kotlin", "nasm", "lucy" },
  highlight = { enable = true },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.c3 = {
  install_info = {
    url = "https://github.com/c3lang/tree-sitter-c3",
    files = {"src/parser.c", "src/scanner.c"},
    branch = "main",
  },
}

parser_config.lucy = {
  install_info = {
    url = "https://github.com/lucy-language/tree-sitter-lucy",
    files = { "src/parser.c" },
    branch = "master"
  },
  filetype = "lc"
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 50,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF

autocmd FileType asm        setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType c3         setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType c          setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType html       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType vim        setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType typescript setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType lc         setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

autocmd BufRead,BufNewFile *.c3,*.c3i,*.c3t set filetype=c3
autocmd BufRead,BufNewFile *.lc             set filetype=lc

inoremap jj <Esc>

nnoremap <Up>    <Nop>
nnoremap <Left>  <Nop>
nnoremap <Right> <Nop>
nnoremap <Down>  <Nop>

vnoremap <Up>    <Nop>
vnoremap <Left>  <Nop>
vnoremap <Right> <Nop>
vnoremap <Down>  <Nop>

noremap <silent> <C-b> :NvimTreeToggle<CR>
noremap <silent> <C-j> :16Term<CR>

noremap <silent> <C-f> :Telescope live_grep<CR>

colorscheme catppuccin

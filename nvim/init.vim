call plug#begin('~/.local/share/nvim/site')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'voldikss/vim-floaterm'
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lsp'
Plug 'morhetz/gruvbox'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
call plug#end()

set mouse=a
set clipboard=unnamedplus
set encoding=utf-8
set number
set relativenumber
set ruler
syntax on
colo gruvbox
set tabstop=4
set shiftwidth=4
set expandtab
let mapleader=" "

" Previous / next buffer / floaterm
noremap <silent> <leader>bp :bprevious<CR>
noremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <F7> :FloatermNew <CR>


" Airline
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#fnamemod = ':t'
	let g:airline_detect_modified = 1
	let g:airline_detect_paste = 1
	let g:airline_detect_crypt = 1
	let g:airline_theme = 'base16'
	let g:airline_powerline_fonts = 1
	let g:airline_symbols_ascii = 1
	let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'


" enable clangd, treesitter and nvim-cmp
lua << EOF
    -- lsp
    local nvim_lsp = require'lspconfig'
    nvim_lsp.clangd.setup {
	}
    -- treesitter
    require'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all"
      ensure_installed = { "c", "cpp" },
    
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
    
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,
    
      -- List of parsers to ignore installing (for "all")
      ignore_install = { "javascript" },
    
    highlight = {
      -- `false` will disable the whole extension
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    }
    -- cmp
    -- Add additional capabilities supported by nvim-cmp
    local cmp = require'cmp'

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' }, -- For vsnip users.
        }, {
          { name = 'buffer' }, }),

          mapping = cmp.config.mapping({

            ["<C-k>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
              elseif has_words_before() then
                cmp.complete()
              else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
              end
            end, { "i", "s" }),

            ["<C-j>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
              elseif has_words_before() then
                cmp.complete()
              else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
              end
            end, { "i", "s" }),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          })
      })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require('lspconfig')
    -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
    local servers = { 'clangd' }
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
      }
    end
EOF

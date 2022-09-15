local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

if vim.g.vscode then
else
  Plug 'jparise/vim-graphql' -- Graphql highlighting
  Plug ('styled-components/vim-styled-components', { branch = 'main' }) -- Styled components highlighting
  Plug 'ianks/vim-tsx' -- TSX support
  Plug 'Quramy/vim-js-pretty-template' -- highlights graphql and html in template strings

  -- LSP
  Plug 'neovim/nvim-lspconfig' -- required for the below plugins like prettier
  Plug 'jose-elias-alvarez/null-ls.nvim' -- base plugin for other plugins to use LSP
  Plug 'MunifTanjim/prettier.nvim' -- prettier support

  Plug ('nvim-treesitter/nvim-treesitter', {["do"]= ':TSUpdate'}) -- helps plugins do syntax tree highlighting
  Plug 'kyazdani42/nvim-web-devicons' -- devicons have colours now
  Plug 'nvim-lua/plenary.nvim' -- required for telescope
  Plug ('nvim-telescope/telescope.nvim', { tag= '0.1.0' }) -- fuzzy finder

  Plug 'scrooloose/nerdtree' -- Nerdtree

  Plug 'nvim-lualine/lualine.nvim' -- cool thing at the bottom of the screen
end
-- SYNTAX
Plug 'tpope/vim-surround' -- S surrounds stuff
Plug 'tpope/vim-repeat' -- . works better
Plug 'tpope/vim-commentary' -- use gc to comment blocks
Plug 'tpope/vim-abolish' -- better search and replace

-- NAVIGATION
Plug 'christoomey/vim-tmux-navigator' -- tmux and vim play nicely together

Plug 'svermeulen/vim-easyclip' -- better clipboard

-- OTHER
Plug 'tpope/vim-fugitive' -- git support, basically only used to get :Gcd
Plug 'godlygeek/tabular' -- tab multiple lines

-- THEMES
Plug 'crusoexia/vim-monokai'
vim.call('plug#end')

if not vim.g.vscode then
  local null_ls = require("null-ls")

  null_ls.setup({
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

        -- format on save
        vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
      end

      if client.server_capabilities.documentRangeFormattingProvider then
        vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
      end
    end,
  })
  local prettier = require("prettier")

  prettier.setup({
    ["null-ls"] = {
      condition = function()
        return prettier.config_exists({
          -- if `true`, checks `package.json` for `"prettier"` key
          check_package_json = false,
        })
      end,
      runtime_condition = function(params)
        -- return false to skip running prettier
        return true
      end,
      timeout = 5000,
    },
    bin = 'prettier', -- or `'prettierd'` (v0.22+)

    filetypes = {
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
    },
  })

  -- LUALINE
  require('lualine').setup()

  -- LSP
  local status, nvim_lsp = pcall(require, "lspconfig")
  if (not status) then return end

  local protocol = require('vim.lsp.protocol')

  local on_attach = function(client, bufnr)
    -- format on save
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("Format", { clear = true }),
        buffer = bufnr,
        callback = function() vim.lsp.buf.formatting_seq_sync() end
      })
    end
  end

  -- TypeScript ( first run npm i -g typescript-language-server )
  nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
  }
end

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  -- lua functions that many plugins use
  use("nvim-lua/plenary.nvim")

  use("bluz71/vim-nightfly-guicolors")

  -- tmux & split window navigation
  use("christoomey/vim-tmux-navigator")

  -- maximizes and restores current window
  use("szw/vim-maximizer")

  -- essential plugins
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")

  -- commenting with gc
  use("numToStr/Comment.nvim")

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- icons
  use("kyazdani42/nvim-web-devicons")

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- autocompletion
  use("hrsh7th/nvim-cmp")                             -- completion plugin
  use("hrsh7th/cmp-buffer")                           -- source for text in buffer
  use("hrsh7th/cmp-path")                             -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip")                             -- snippet engine
  use("saadparwaiz1/cmp_luasnip")                     -- for autocompletion
  use("rafamadriz/friendly-snippets")                 -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim")                      -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim")            -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig")                        -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp")                         -- for autocompletion
  use({ "glepnir/lspsaga.nvim", branch = "main" })    -- enhanced LSP UI
  use("onsails/lspkind.nvim")                         -- vs-code like icons for autocompletion

  -- treesitter for syntax highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  -- fuxxy finding
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...

  -- git integration
  use("lewis6991/gitsigns.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)

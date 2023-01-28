local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
opt.clipboard = "unnamedplus" 
opt.mouse = "a"
opt.nu = true
opt.timeoutlen = 1000
opt.termguicolors = true
opt.title = true
opt.autochdir = true
g.mapleader = ' '

require('packer').startup(function(use)
 use 'wbthomason/packer.nvim'
 use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
 }
  use {'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use { "folke/which-key.nvim" }
  use { "github/copilot.vim" }
  use { 'pechorin/any-jump.vim' } 
end)

vim.api.nvim_set_keymap('n', '<Leader>b', '<cmd>:Buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>c', '<cmd>:e $MYVIMRC<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', '<cmd>:source $MYVIMRC<CR>', { noremap = true, silent = true })

-- Search (find) alternative with Telescope
vim.keymap.set("n", "<leader>fb", function () require('telescope.builtin').buffers(telescope_theme) end, default_opt)
vim.keymap.set("n", "<leader>fc", function () require('telescope.builtin').commands(telescope_theme) end, default_opt)
vim.keymap.set("n", "<leader>ff", function () require('telescope.builtin').find_files(telescope_theme) end, default_opt)
vim.keymap.set("n", "<leader>fg", function () require('telescope.builtin').git_files(telescope_theme) end, default_opt)

vim.keymap.set("v", "<leader>es", ":'<,'>sort<CR>", default_opt)


opt.completeopt="menu,menuone,noselect"

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<TAB>",
      scope_incremental = "<CR>",
      node_decremental = "<S-TAB>",
    },
  },
  indent = {
    enable = true
  }
}

-- opt.foldmethod="expr"
-- opt.foldexpr="nvim_treesitter#foldexpr()"


require("which-key").setup {
	timeoutlen=0
}

-- set the colorscheme to morning
vim.cmd('colorscheme morning')

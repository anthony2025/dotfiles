-- requires nvim --version >= 0.5.0
-- to init run :PackerSync or :PackerInstall

-- bootstrap packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command('packadd packer.nvim')
end

-- install plugins
require('packer').startup(
	function(use)
		use 'wbthomason/packer.nvim'
		use 'christoomey/vim-tmux-navigator'
		use 'terryma/vim-multiple-cursors'
		use 'AndrewRadev/splitjoin.vim'
		use 'kosayoda/nvim-lightbulb'
		use 'tpope/vim-afterimage'
		use 'sunjon/shade.nvim'
		use 'justinmk/vim-sneak'
		use 'RRethy/vim-illuminate'
		use 'marko-cerovac/material.nvim'
		use 'famiu/bufdelete.nvim'
		use 'onsails/lspkind-nvim'
		use 'folke/lsp-colors.nvim'
		use 'RRethy/nvim-base16'
		use 'rafamadriz/neon'
		use 'jubnzv/virtual-types.nvim'
		use 'airblade/vim-rooter'
		use 'gennaro-tedesco/nvim-peekup'
		use 'edluffy/specs.nvim'
		use 'norcalli/nvim-colorizer.lua'
		use 'lambdalisue/suda.vim'
		use 'akinsho/nvim-bufferline.lua'
		use 'kyazdani42/nvim-tree.lua'
		use 'lukas-reineke/indent-blankline.nvim'
		use 'matze/vim-move'
		use 'mboughaba/vim-lessmess'
		use {
			'glepnir/dashboard-nvim',
			requires = { 
				'junegunn/fzf',
				'junegunn/fzf.vim',
			}
		}
		use { 
			'TimUntersberger/neogit', 
			requires = 'nvim-lua/plenary.nvim',
		}
		use {
			'glepnir/galaxyline.nvim',
			branch = 'main',
			config = require'eviline',
			requires = {'kyazdani42/nvim-web-devicons', opt = true}
		}
		use {
		    "vhyrro/neorg",
		    config = function()
			require('neorg').setup {
			    load = {
				["core.defaults"] = {}, -- Load all the default modules
				["core.norg.concealer"] = {}, -- Allows for use of icons
				["core.norg.dirman"] = { -- Manage your directories with Neorg
				    config = {
					workspaces = {
					    my_workspace = "~/neorg"
					}
				    }
				}
			    },

			}
		    end,
		}

		use {
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate'
	        }
		use {
			'terrortylor/nvim-comment',
			config = function() require('nvim_comment').setup() end,
		}
		use {
			'jghauser/mkdir.nvim',
			config = function() require('mkdir') end,
		}
		use {
			'kristijanhusak/orgmode.nvim',
			config = function() require('orgmode').setup{} end,
		}
		use {
			'scalameta/nvim-metals', 
			branch = 'next',
		}
		use {
			'folke/trouble.nvim',
			config = function() require("trouble").setup{} end,
		}
	end 
)

-- set theme
vim.g.material_style = "darker"
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = true
vim.g.material_contrast = true
vim.g.material_borders = true
vim.g.material_disable_background = false
vim.opt.background = "dark"

vim.opt.guifont = "FiraCode Nerd Font" .. ':h' .. "15"
require('material').set()

-- start screen
vim.g.dashboard_default_executive = 'fzf'

-- buffer bar
vim.opt.termguicolors = true
require("bufferline").setup()

-- file explorer
vim.g.nvim_tree_gitignore = 1 
vim.g.nvim_tree_auto_close = 1 
vim.g.nvim_tree_follow = 1 
vim.g.nvim_tree_indent_markers = 1 
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_add_trailing = 1 
vim.g.nvim_tree_lsp_diagnostics = 1 
vim.g.nvim_tree_disable_window_picker = 1 
vim.g.nvim_tree_update_cwd = 1 
vim.opt.hidden = true

-- magit for nvim
require('neogit').setup()

-- keybindings
opts = { silent = true, noremap = true }
vim.api.nvim_set_keymap('n', '<F3>', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<F5>', ':Dashboard<CR>', opts)

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', opts)

vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', opts)

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)

vim.cmd([[
  nnoremap <silent> <C-Up>    :resize +2<CR>
  nnoremap <silent> <C-Down>  :resize -2<CR>
  nnoremap <silent> <C-Right> :vertical resize -2<CR>
  nnoremap <silent> <C-Left>  :vertical resize +2<CR>
]])

-- global settings
vim.opt.mouse = 'a'
vim.opt.updatetime = 200
vim.opt.timeoutlen = 500
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.colorcolumn = '120'

vim.opt.smartindent = true
vim.opt.copyindent = true
vim.opt.preserveindent = true

vim.opt.swapfile = false
vim.opt.undofile = false
vim.opt.undofile = false
vim.opt.clipboard = 'unnamedplus'

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = false

vim.opt.list = true
vim.g.mapleader = '<SPACE>'

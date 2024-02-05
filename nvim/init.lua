-- # General NeoVim Config
vim.wo.number = true
vim.wo.numberwidth = 4
vim.wo.wrap = false

-- # Package Manager
require('packer').startup(function(use)
	-- packer (main package manager)
	use 'wbthomason/packer.nvim'
 
	-- mason (LSP Package Manager)
	use { 
		'williamboman/mason.nvim',
		run = ":MasonUpdate" -- :MasonUpdate updates the registry contents
	}
	 
	-- alpa-nvim (Pretty Home Pages)
	use { 
		'goolord/alpha-nvim',
		requires = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
			end
	}
	 
	-- nvim-cmp (auto-completion)
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'	
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'	
	use 'hrsh7th/nvim-cmp'
 
	-- gitgutter (nvim git stuff)
	use 'airblade/vim-gitgutter'
 
	-- lualine (status message bar on the bottom of the editor)
	use { 
		'nvim-lualine/lualine.nvim',
		requires = {'nvim-tree/nvim-web-devicons', opt = true}

	}

	-- nvim-visual-multi (allows multiple cursors)
	use 'mg979/vim-visual-multi'

	-- nvim-tree.lua (file explorer)
	use 'nvim-tree/nvim-tree.lua'

	-- telescope (fancy find function for getting around files (among maaaany other things))
	-- REQUIRES RIPGREP https://github.com/BurntSushi/ripgrep
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- fzf (finding files in telescope)
	use { 
		'nvim-telescope/telescope-fzf-native.nvim', 
		-- required for windows
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
		-- potentially required option for linux
		-- run = 'make'
	}
	
	-- onedark (current theme)
	use 'navarasu/onedark.nvim'
	
	-- vim-markdown (markdown syntax highlighting and more)
	use {
		'preservim/vim-markdown',
		requires = 'godlygeek/tabular'
	}

	
end)

-- # Package Setup
-- ## Mason
require("mason").setup()

-- ## nvim-cmp
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
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- commented out until needed

--require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--	capabilities = capabilities
--}

-- ## lualine
require('lualine').setup()

-- ## nvim-tree
require('nvim-tree').setup()

-- ## onedark
require('onedark').load()


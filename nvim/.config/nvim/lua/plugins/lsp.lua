return {
	{
  		'neovim/nvim-lspconfig',
  		dependencies = {
			'saghen/blink.cmp',
			{ 'mason-org/mason.nvim', opts = {}}
		},

  		-- example using `opts` for defining servers
  		--opts = {
    	--	servers = {
      	--		lua_ls = {}
    	--	}
  		--},


  		config = function()
    		local blink = require("blink.cmp")
    		local capabilities = blink.get_lsp_capabilities()

    		vim.lsp.config('lua_ls', {
      			capabilities = capabilities,
      			settings = {
        			Lua = {
          				diagnostics = { globals = { "vim" } },
          				workspace = {
            				library = vim.api.nvim_get_runtime_file("", true),
            				checkThirdParty = false,
          				},
          				completion = {
            				callSnippet = "Replace",
          				},
        			},
      			},
    		})

			vim.lsp.enable({'lua_ls'})

			vim.lsp.config('clangd', {
				capabilities = capabilities,
				filetypes = { "c", "cpp" },
				root_markers = { "compile_commands.json", ".git" },
				
				on_init = function(client, init_result)
    				if init_result.offsetEncoding then
      					client.offset_encoding = init_result.offsetEncoding
    				end
  				end,
  				
				on_attach = function(client, bufnr)
    				vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdSwitchSourceHeader', function()
      					switch_source_header(bufnr, client)
    				end, { desc = 'Switch between source/header' })

    				vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdShowSymbolInfo', function()
      					symbol_info(bufnr, client)
    				end, { desc = 'Show symbol info' })
  				end,
			})

			vim.lsp.enable({'clangd'})
  		end,

	},
  	{
    	"folke/lazydev.nvim",
    	ft = "lua", -- only load on lua files
    	opts = {
      		library = {
        		-- See the configuration section for more details
        		-- Load luvit types when the `vim.uv` word is found
        		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
      		},
    	},
	},
	{
		'saghen/blink.cmp',
  		dependencies = { 'rafamadriz/friendly-snippets' },

  		opts = {
    		keymap = { preset = 'default' },

    		appearance = {
      			nerd_font_variant = 'mono'
    		},

    		completion = { documentation = { auto_show = true } },

    		sources = {
      			default = { 'lsp', 'path', 'snippets', 'buffer' },
    		},

    		fuzzy = { implementation = "lua" }
  		},
	}
}

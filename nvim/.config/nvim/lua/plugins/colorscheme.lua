return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
  		opts = {
    		transparent = true,
    		styles = {
      			sidebars = "transparent",
      			floats = "transparent",
    		},
  		},
		config = function(_, opts)
			local tokyonight = require("tokyonight")
			tokyonight.setup(opts)
			tokyonight.load()
		end,
	},
}


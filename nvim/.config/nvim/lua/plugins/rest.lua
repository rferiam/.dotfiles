return {
	"rest-nvim/rest.nvim",
	ft = "http",
	dependencies = {
		{
			"vhyrro/luarocks.nvim",
			priority = 1000,
			config = true,
		},
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		result = {
			split = {
				stay_in_current_window_after_split = false,
			},
		},
	},
	config = function(_, opts)
		require("rest-nvim").setup(opts)
		require("telescope").load_extension("rest")

		vim.keymap.set(
			"n",
			"<localleader>re",
			require("telescope").extensions.rest.select_env,
			{ desc = "Select environment file" }
		)
		vim.keymap.set("n", "<localleader>rr", "<cmd>Rest run<cr>", { desc = "Run request under the cursor" })
		vim.keymap.set("n", "<localleader>rl", "<cmd>Rest run last<cr>", { desc = "Re-run latest request" })
	end,
}

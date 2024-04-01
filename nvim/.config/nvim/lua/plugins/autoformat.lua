-- Autoformat
return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			bash = { "shfmt" },
			lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			toml = { "prettierd" },
			markdown = { "prettierd" },
			scss = { "prettierd" },
			-- Conform can also run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			-- You can use a sub-list to tell conform to run *until* a formatter
			-- is found.
			-- javascript = { { "prettierd", "prettier" } },
		},
	},
}

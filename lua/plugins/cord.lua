-- discord plugins c:\users\username\appdata\local\nvim\plugins\cord.lua
return {
	"vyfor/cord.nvim",
	lazy = false,
	config = function()
		require("cord").setup({
			log_level = "warn",
			text = {
				title = "Neovim",
				subtitle = function()
					local ft = vim.bo.filetype
					local bufname = vim.fn.expand("%:t")
					if ft == "neo-tree" then
						return "Browsing Files"
					elseif ft == "alpha" or ft == "dashboard" then
						return "Welcome Screen"
					elseif bufname == "" then
						return "Ready for action!"
					else
						local line = vim.fn.line(".")
						local lines = vim.fn.line("$")
						return string.format("%s | Line %d of %d", bufname, line, lines)
					end
				end,
			},
			assets = {
				large_image = "nvim_logo",
				large_text = "Neovim Editor",
			},
		})

		-- Event agar presence tetap update ketika buffer berubah/aktif
		vim.api.nvim_create_autocmd({
			"BufEnter",
			"BufWinEnter",
			"BufLeave",
			"CursorMoved",
			"WinEnter",
			"WinLeave",
			"FileType",
		}, {
			callback = function() end,
		})
	end,
}

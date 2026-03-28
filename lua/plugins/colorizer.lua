-- plugins/colorizer.lua
-- configuration for html css coloring

return {
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile" }, -- lazy-load
		config = function()
			require("colorizer").setup(
				{ "html", "css", "scss", "less", "javascript" }, -- filetypes
				{
					RGB = true, -- #RGB
					RRGGBB = true, -- #RRGGBB
					names = true, -- "red"
					RRGGBBAA = true, -- #RRGGBBAA
					css = true, -- enable parsing css strings like "color: #fff"
					css_fn = true, -- enable parsing css functions like rgba()
					tailwind = true, -- parse tailwind classes if needed
					mode = "background", -- show as background color; use "foreground" to set text color
				}
			)

			-- optional: commands to toggle or attach
			vim.cmd([[
        command! ColorizerToggle lua require("colorizer").toggle()
        command! ColorizerAttachBuffer lua require("colorizer").attach_to_buffer(0)
      ]])
		end,
	},
}

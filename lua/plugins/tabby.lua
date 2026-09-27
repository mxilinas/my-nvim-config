local theme = {
	current = {
		fg = "#cad3f5",
		style = "bold",
		bg = "#35373b",
	},
	not_current = {
		fg = "#5b6078",
		bg = "#35373b",
	},
	fill = {
		bg = "#35373b",
	},
}

return {
	"nanozuki/tabby.nvim",
	---@type TabbyConfig
	config = function()
		require("tabby.tabline").set(function(line)
			return {
				line.tabs().foreach(function(tab)
					local hl = tab.is_current() and theme.current or theme.not_current
					return {
						line.sep(" ", hl, theme.fill),
						tab.name(),
						line.sep(" ", hl, theme.fill),
						hl = hl,
					}
				end),
				line.spacer(),
				line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
					local hl = win.is_current() and theme.current or theme.not_current

					return {
						line.sep(" ", hl, theme.fill),
						win.buf_name(),
						line.sep(" ", hl, theme.fill),
						hl = hl,
					}
				end),
				hl = theme.fill,
			}
		end)
	end,
}

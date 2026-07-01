return {
	"rcarriga/nvim-notify",
	opts = {
		render = "compact",
		minimum_width = 10,
		timeout = 2000,
		fps = 60,
	},
	config = function(_, opts)
		local notify = require("notify")
		notify.setup(opts)
	end,
}

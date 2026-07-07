return {
	"rcarriga/nvim-notify",
	opts = {
		timeout = 1000,
		fps = 60,
	},
	config = function(_, opts)
		local notify = require("notify")
		notify.setup(opts)
	end,
}

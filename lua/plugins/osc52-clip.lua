return {
	"ojroques/nvim-osc52",
	config = function()
		require("osc52").setup()

		-- Helper: copy function for OSC52
		local function copy(lines, _)
			require("osc52").copy(table.concat(lines, "\n"))
		end

		-- Use system clipboard via OSC52
		vim.g.clipboard = {
			name = "osc52",
			copy = {
				["+"] = copy,
				["*"] = copy,
			},
			paste = {
				["+"] = function()
					return vim.fn.getreg("+")
				end,
				["*"] = function()
					return vim.fn.getreg("*")
				end,
			},
		}

		-- Optional: set + register as default clipboard
		vim.opt.clipboard = "unnamedplus"
	end,
}

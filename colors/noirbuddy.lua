require("noirbuddy").setup({
	preset = "slate",
})


local show_selection_count = require("user.functions").show_selection_count
local show_macro_recording = require("user.functions").show_macro_recording
local noirbuddy_lualine = require("noirbuddy.plugins.lualine")
local components = require("lvim.core.lualine.components")

local sections = {
	lualine_a = { "mode" },
	lualine_b = { "branch", "diff" },
	lualine_c = { { "filename", path = 1 } },
	lualine_x = { components.lsp, "diagnostics", { "filetype", colored = false }, "encoding" },
	lualine_y = {
		"progress",
		{
			show_selection_count,
			cond = function()
				return vim.fn.mode():find("[vv]") ~= nil
			end,
		},
		show_macro_recording,
	},
	lualine_z = { "location" },
}

lvim.builtin.lualine.options.theme = noirbuddy_lualine.theme
lvim.builtin.lualine.sections = sections
lvim.builtin.lualine.inactive_sections = noirbuddy_lualine.inactive_sections

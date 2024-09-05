return {
	{
		'theprimeagen/harpoon',
		branch = 'harpoon2',
		requires = { {"nvim-lua/plenary.nvim"} },

		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
			vim.keymap.set({"n"}, "<leader>h", function() harpoon.ui:toggle_quick_menu((harpoon:list()), { border = "rounded", title_pos = "center" }) end)


			vim.keymap.set({"n", "i"}, "<A-1>", function() harpoon:list():select(1) end)
			vim.keymap.set({"n", "i"}, "<A-2>", function() harpoon:list():select(2) end)
			vim.keymap.set({"n", "i"}, "<A-3>", function() harpoon:list():select(3) end)
			vim.keymap.set({"n", "i"}, "<A-4>", function() harpoon:list():select(4) end)

		end,
	},
	{
		'mbbill/undotree',

		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
}

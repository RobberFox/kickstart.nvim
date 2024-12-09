-- require("config.helper_function")
-- local t = vim.opt.nrformats:get()
-- print(tprint(t))

-- `neo-tree` - disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("main") -- vanilla nvim configuration
-- `custom/` is for plugins that I configure in a separate file, then refer to them in the plugin spec

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugin" },
	},
	-- Configure any other settings here. See the documentation for more details.
	install = { colorscheme = { "tokyonight-night" } },
	checker = { enabled = false }, -- automatically check for plugin updates
})

require("langmapper").automapping({ global = true, buffer = true })

-- vim.api.nvim_set_hl(0, '@text.code', {bg = '#000FFF'})

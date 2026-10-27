local Terminal = require("toggleterm.terminal").Terminal

local M = {}

local function on_open(term)
	vim.cmd("startinsert!")
	if term and term.window and vim.api.nvim_win_is_valid(term.window) then
		vim.wo[term.window].winhighlight = "WinSeparator:WinSeparator,FloatBorder:WinSeparator"
	end
end

local terminals = {
	bottom = Terminal:new({
		cmd = vim.o.shell,
		direction = "horizontal",
		hidden = true,
		close_on_exit = false,
		count = 21,
		size = 15,
		on_open = on_open,
	}),
	float = Terminal:new({
		cmd = vim.o.shell,
		direction = "float",
		hidden = true,
		close_on_exit = false,
		count = 22,
		float_opts = {
			border = "rounded",
			width = function()
				return math.floor(vim.o.columns * 0.9)
			end,
			height = function()
				return math.floor(vim.o.lines * 0.82)
			end,
		},
		on_open = on_open,
	}),
	right = Terminal:new({
		cmd = vim.o.shell,
		direction = "vertical",
		hidden = true,
		close_on_exit = false,
		count = 23,
		size = function()
			return math.floor(vim.o.columns * 0.4)
		end,
		on_open = on_open,
	}),
}

function M.toggle_bottom()
	terminals.bottom:toggle()
end

function M.toggle_float()
	terminals.float:toggle()
end

function M.toggle_right()
	terminals.right:toggle()
end

function M.setup_keymaps()
	local map = vim.keymap.set

	map("n", "<leader>tb", M.toggle_bottom, { desc = "Terminal bottom" })
	map("n", "<leader>tt", M.toggle_float, { desc = "Terminal floating" })
	map("n", "<leader>tr", M.toggle_right, { desc = "Terminal right" })

	map("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Terminal normal mode" })
	map("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Terminal focus left" })
	map("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Terminal focus down" })
	map("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Terminal focus up" })
	map("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Terminal focus right" })

	map("n", "<leader>t1", M.toggle_bottom, { desc = "Terminal 1 bottom" })
	map("n", "<leader>t2", M.toggle_float, { desc = "Terminal 2 floating" })
	map("n", "<leader>t3", M.toggle_right, { desc = "Terminal 3 right" })
end

return M

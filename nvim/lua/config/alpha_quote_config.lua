local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

math.randomseed(os.time())

local quotes = {
	{ "The best way to predict the future is to create it.", "Peter Drucker" },
	{ "Talk is cheap. Show me the code.", "Linus Torvalds" },
	{ "Programs must be written for people to read, and only incidentally for machines to execute.", "Harold Abelson" },
	{
		"Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.",
		"John F. Woods",
	},
	{ "Measure twice, cut once.", "Old Carpenter's Maxim" },
	{ "If you can't explain it simply, you don't understand it well enough.", "Albert Einstein" },
	{
		"The most effective debugging tool is still careful thought, coupled with judiciously placed print statements.",
		"Brian Kernighan",
	},
	{ "Simplicity is prerequisite for reliability.", "Edsger W. Dijkstra" },
	{ "Premature optimization is the root of all evil (or at least most of it) in programming.", "Donald Knuth" },
}

local function get_random_quote()
	local index = math.random(#quotes)
	local quote_data = quotes[index]
	local quote, author = quote_data[1], quote_data[2]
	return string.format('"%s"\n— %s', quote, author)
end

local function custom_footer()
	return {
		{
			type = "text",
			val = get_random_quote(),
			opts = { position = "center", hl = "Comment" },
		},
	}
end

dashboard.config.buttons = {
	dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
	dashboard.button("n", "  New File", ":ene<CR>"),
	dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),
	dashboard.button("r", "  Restore Session", [[<Cmd>lua require('persistence').load()<CR>]]),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.config.header = {
	{
		type = "text",
		val = table.concat({
			"   ___            ",
			"  / _ \\ ___  __ _ ",
			" | | | / __|/ _` |",
			" | |_| \\__ \\ (_| |",
			"  \\___/|___/\\__,_|",
			"                  ",
		}, "\n"),
		opts = { position = "center", hl = "Identifier" },
	},
	{ type = "padding", val = 1 },
	{
		type = "text",
		val = string.format(
			"  Neovim v%s",
			vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
		),
		opts = { position = "center", hl = "Comment" },
	},
}

dashboard.config.layout = {
	{ type = "group", val = dashboard.config.header, opts = { position = "center" } },
	{ type = "padding", val = 2 },
	{ type = "group", val = dashboard.config.buttons },
	{ type = "padding", val = 2 },
	{ type = "group", val = custom_footer() },
}

alpha.setup(dashboard.config)

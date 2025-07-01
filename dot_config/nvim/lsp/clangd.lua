return {
	cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
	filetypes = { "c", "cpp" },
	root_markers = { ".git" },
	settings = {
		init_options = {
			fallbackFlags = { "-std=c++17" },
		},
	},
}

return {
	-- You install pyright but the executable is other
	cmd = { "pyright-langserver", "--stdio" },
	root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
	filetypes = { "python" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				reportMissingTypeStubs = true,
			},
		},
	},
}

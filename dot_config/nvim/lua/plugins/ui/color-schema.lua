return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[
  if has('termguicolors')
    set termguicolors
  endif
  set background=light
  let g:gruvbox_material_background = 'medium'
  let g:gruvbox_material_better_performance = 1
  colorscheme gruvbox-material
]])
	end,
}

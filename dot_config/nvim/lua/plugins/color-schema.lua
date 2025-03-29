return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[
  if has('termguicolors')
    set termguicolors
  endif
  set background=dark
  let g:gruvbox_material_background = 'medium'
  let g:gruvbox_material_enable_bold = 1
  let g:gruvbox_material_better_performance = 1
  colorscheme gruvbox-material
]])
	end,
}

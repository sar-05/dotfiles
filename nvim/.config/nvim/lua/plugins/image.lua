return {
	"3rd/image.nvim",
	build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
	opts = {
		processor = "magick_cli",
	},
	integrations = {
		markdown = {
			resolve_image_path = function(document_path, image_path, fallback)
				return "~/Documents/wiki/images/"
			end,
		}
	}
}

--    https://github.com/MeanderingProgrammer/render-markdown.nvim
-- render-markdown.nvim is a plugin that renders markdown files in a buffer with a focus on readability and aesthetics.

local vim = vim
require("render-markdown").setup({

	heading = {
		-- Turn on / off heading icon & background rendering
		enabled = false,
		-- Turn on / off any sign column related rendering
		sign = false,
		-- Determines how the icon fills the available space:
		--  inline: underlying '#'s are concealed resulting in a left aligned icon
		--  overlay: result is left padded with spaces to hide any additional '#'
		position = "overlay",
		-- Replaces '#+' of 'atx_h._marker'
		-- The number of '#' in the heading determines the 'level'
		-- The 'level' is used to index into the array using a cycle
		-- icons = { "󰼏 ", "󰎨 " },
		icons = { "I ", "II ", "III ", "IV ", "V ", "VI " },
		-- Added to the sign column if enabled
		-- The 'level' is used to index into the array using a cycle
		signs = { "󰫎 " },
		-- Width of the heading background:
		--  block: width of the heading text
		--  full: full width of the window
		width = "full",
		-- Amount of padding to add to the left of headings
		left_pad = 0,
		-- Amount of padding to add to the right of headings when width is 'block'
		right_pad = 0,
		-- Minimum width to use for headings when width is 'block'
		min_width = 0,
		-- Determins if a border is added above and below headings
		border = false,
		-- Highlight the start of the border using the foreground highlight
		border_prefix = false,
		-- Used above heading for border
		above = "▄",
		-- Used below heading for border
		below = "▀",
		-- The 'level' is used to index into the array using a clamp
		-- Highlight for the heading icon and extends through the entire line
		backgrounds = {
			"RenderMarkdownH1Bg",
			"RenderMarkdownH2Bg",
			"RenderMarkdownH3Bg",
			"RenderMarkdownH4Bg",
			"RenderMarkdownH5Bg",
			"RenderMarkdownH6Bg",
		},
		-- The 'level' is used to index into the array using a clamp
		-- Highlight for the heading and sign icons
		foregrounds = {
			"RenderMarkdownH1",
			"RenderMarkdownH2",
			"RenderMarkdownH3",
			"RenderMarkdownH4",
			"RenderMarkdownH5",
			"RenderMarkdownH6",
		},
	},

	link = {
		-- Turn on / off inline link icon rendering
		enabled = true,
		-- Inlined with 'image' elements
		image = "󰥶 ",
		-- Fallback icon for 'inline_link' elements
		-- hyperlink = '󰌹 ',
		hyperlink = "",
		-- Applies to the fallback inlined icon
		highlight = "RenderMarkdownLink",
		-- Define custom destination patterns so icons can quickly inform you of what a link
		-- contains. Applies to 'inline_link' and wikilink nodes.
		-- Can specify as many additional values as you like following the 'web' pattern below
		--   The key in this case 'web' is for healthcheck and to allow users to change its values
		--   'pattern': Matched against the destination text see :h lua-pattern
		--   'icon': Gets inlined before the link text
		--   'highlight': Highlight for the 'icon'
		custom = {
			web = { pattern = "^http[s]?://", icon = "󰖟 ", highlight = "RenderMarkdownLink" },
			pdf = { pattern = ".pdf", icon = " ", highlight = "RenderMarkdownLink" },
		},
	},
})

return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    'rafamadriz/friendly-snippets',
    'folke/lazydev.nvim',
    'ellisonleao/gruvbox.nvim',
  },
  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  -- config = function()
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      use_nvim_cmp_as_default = true, --Set when theme doesn't support blink.cmp
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', "lazydev" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      }
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" },
  --Extended config to set custom highlights if gruvbox theme applied
  config = function(_, opts)
    local colorscheme = vim.g.colors_name
    if colorscheme:match("^gruvbox") then
      -- Access gruvbox's color palette
      local colors = require("gruvbox").palette

      -- Define your highlights using the palette
      vim.api.nvim_set_hl(0, 'BlinkCmpMenu', {
        bg = 'NONE',       -- Transparent background
        fg = colors.light1 -- Gruvbox's light1 color
      })

      vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', {
        bg = 'NONE',
        fg = colors.gray -- Gruvbox's gray for borders
      })

      vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', {
        bg = colors.dark2, -- Slight background for selection
        fg = colors.light0 -- Brighter text for selected item
      })
    end
    -- Setup blink.cmp
    require('blink-cmp').setup(opts)
  end
}

return {
  -- https://github.com/vimwiki/vimwiki
  'vimwiki/vimwiki',
  event = 'BufEnter *.md', -- Load when opening markdown files
  ft = 'vimwiki',          -- Also load for vimwiki filetype
  keys = {
    { '<leader>ww',         '<Plug>VimwikiIndex',           desc = 'Open wiki index' },
    { '<leader>wt',         '<Plug>VimwikiTabIndex' },
    { '<leader>ws',         '<Plug>VimwikiUISelect' },
    { '<leader>wi',         '<Plug>VimwikiDiaryIndex' },
    { '<leader>w<leader>w', '<Plug>VimwikiMakeDiaryNote' },
    { '<leader>w<leader>t', '<Plug>VimwikiTabMakeDiaryNote' }
  },
  config = function()
    -- Configure vimwiki before the plugin loads
    vim.g.vimwiki_list = {
      {
        path = '~/Documents/vimwiki/',           -- Where your wiki files will be stored
        syntax = 'markdown',                     -- Use markdown syntax instead of vimwiki syntax
        ext = '.md',                             -- File extension for wiki files
        path_html = '~/Documents/vimwiki_html/', -- Where HTML files will be generated
        custom_wiki2html = 'vimwiki_markdown',   -- Use markdown converter
        template_path = '~/vimwiki/templates/',  -- Optional: custom HTML templates
        template_default = 'default',            -- Default template name
        template_ext = '.tpl'                    -- Template file extension
      }
    }
    -- Additional vimwiki settings
    vim.g.vimwiki_global_ext = 0        -- Don't treat all .md files as vimwiki
    vim.g.vimwiki_markdown_link_ext = 1 -- Add .md extension to markdown links
    vim.g.vimwiki_hl_headers = 1        -- Highlight headers with different colors
  end
}

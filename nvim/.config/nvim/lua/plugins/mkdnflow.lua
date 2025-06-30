return {
  'jakewvincent/mkdnflow.nvim',
  config = function()
    require('mkdnflow').setup({
      perspective = { --Allows to set an index.md and vimwiki like behaviour
        priority = 'root',
        root_tell = 'index.md'
      },
      links = {
        transform_explicit = function(text)
          text = text:gsub(" ", "-")
          text = text:lower()
          return (text)
        end
      }
    })
  end
}

return {
  'jakewvincent/mkdnflow.nvim',
  config = function()
    require('mkdnflow').setup({
      perspective = { --Allows to set an index.md and vimwiki like behaviour
        priority = 'root',
        root_tell = 'index.md'
      }
    })
  end
}

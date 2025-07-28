return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  config = function()
    require('ufo').setup({
      provider_selector = function(bufnr, filetpye, buftype)
        return { 'lsp', 'indent' }
      end
    })
  end
}

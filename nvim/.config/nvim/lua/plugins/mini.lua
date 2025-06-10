return{
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.pairs').setup() --Autopairs
    require('mini.icons').setup() --Icon provider
    require('mini.move').setup() --Move any selection in any direction
    require('mini.surround').setup() --Surround Actions
  end
}

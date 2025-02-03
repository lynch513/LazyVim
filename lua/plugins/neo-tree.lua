return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      close_if_last_window = false,
      filesystem = {
        window = {
          mappings = {
            -- disable fuzzy finder
            ["/"] = "noop",
          },
        },
      },
    })
  end,
}

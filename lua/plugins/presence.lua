return {
  -- Discord Rich Presence
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    opts = {
      -- your config goes here
      text = {
        title = "Cord",
        subtitle = "Neovim config",
      },
    },
  },
}

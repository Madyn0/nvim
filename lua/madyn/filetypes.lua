vim.filetype.add({
  extension = {
    h = "c",
    jbuilder = "ruby",
  },

  pattern = {
    [".*/hypr/.*%.conf"] = "hyprlang",
    [".*/rofi/.*%.rasi"] = "rasi",
  },
})

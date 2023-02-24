local setup, nvimicon = pcall(require, "nvim-web-devicons")
if not setup then
  return
end

nvimicon.setup({
  -- We need to override some of the kotlin icons, as of 09.02.23, the icon is not supported
  override = {
    kt = {
      icon = "",
      color = "#7F52FF",
      cterm_color = "99",
      name = "Kotlin"
    },
    kts = {
      icon = "",
      color = "#7F52FF",
      cterm_color = "99",
      name = "KotlinScript"
    }
  };
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true;
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
})
